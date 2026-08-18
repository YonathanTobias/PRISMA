<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', $sys_settings['app_name'] ?? 'PRISMA-PW') — {{ $sys_settings['institution_name'] ?? 'STIKes Panti Waluya Malang' }}</title>
    <link rel="icon" type="image/png" href="{{ asset('images/logo-stikes.png') }}">
    <meta name="description" content="{{ $sys_settings['app_name'] ?? 'PRISMA-PW' }} ({{ $sys_settings['app_description'] ?? 'Portal Informasi Sumber Daya Manusia Panti Waluya' }}) {{ $sys_settings['institution_name'] ?? 'STIKes Panti Waluya Malang' }}.">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

    <style>
        :root {
            --sidebar-width: 260px;
            --sidebar-bg: #0f172a;
            --sidebar-hover: #1e293b;
            --accent: #3b82f6;
            --accent-dark: #2563eb;
            --topbar-height: 60px;
        }
        * { font-family: 'Inter', sans-serif; }
        body { background: #f1f5f9; min-height: 100vh; }

        /* ── Sidebar ── */
        #sidebar {
            position: fixed; top: 0; left: 0; bottom: 0;
            width: var(--sidebar-width);
            background: var(--sidebar-bg);
            z-index: 1040;
            overflow-y: auto;
            transition: transform .25s ease;
        }
        #sidebar .sidebar-brand {
            display: flex; align-items: center; gap: 10px;
            padding: 20px 20px 16px;
            border-bottom: 1px solid rgba(255,255,255,.08);
        }
        #sidebar .sidebar-brand .brand-icon {
            width: 38px; height: 38px; border-radius: 10px;
            background: var(--accent); display: flex;
            align-items: center; justify-content: center;
            font-size: 18px; color: #fff; flex-shrink: 0;
        }
        #sidebar .brand-text { color: #fff; font-weight: 700; font-size: 15px; line-height: 1.2; }
        #sidebar .brand-sub  { color: #94a3b8; font-size: 11px; }

        #sidebar .nav-section { padding: 16px 12px 4px; font-size: 10px; font-weight: 600; color: #64748b; text-transform: uppercase; letter-spacing: .06em; }
        #sidebar .nav-link {
            display: flex; align-items: center; gap: 10px;
            padding: 9px 16px; border-radius: 8px; margin: 2px 8px;
            color: #94a3b8; font-size: 13.5px; font-weight: 500;
            text-decoration: none; transition: all .15s;
        }
        #sidebar .nav-link:hover { background: var(--sidebar-hover); color: #e2e8f0; }
        #sidebar .nav-link.active { background: var(--accent); color: #fff; }
        #sidebar .nav-link .bi { font-size: 16px; flex-shrink: 0; }
        #sidebar .sidebar-footer {
            padding: 16px; border-top: 1px solid rgba(255,255,255,.08);
            color: #64748b; font-size: 12px;
        }

        /* ── Topbar ── */
        #topbar {
            position: fixed; top: 0; left: var(--sidebar-width); right: 0;
            height: var(--topbar-height); background: #fff;
            border-bottom: 1px solid #e2e8f0;
            z-index: 1030; display: flex; align-items: center;
            padding: 0 24px; gap: 12px;
        }
        #topbar .topbar-title { font-weight: 600; font-size: 16px; color: #0f172a; flex: 1; }
        .user-badge {
            display: flex; align-items: center; gap: 8px;
            background: #f8fafc; border: 1px solid #e2e8f0;
            border-radius: 50px; padding: 6px 14px 6px 8px; font-size: 13px;
        }
        .user-badge .avatar {
            width: 28px; height: 28px; border-radius: 50%;
            background: var(--accent); color: #fff;
            display: flex; align-items: center; justify-content: center;
            font-size: 12px; font-weight: 700;
        }

        /* ── Main Content ── */
        #main-content {
            margin-left: var(--sidebar-width);
            padding-top: var(--topbar-height);
            min-height: 100vh;
        }
        .page-content { padding: 28px 28px; }

        /* ── Cards ── */
        .card { border: 1px solid #e2e8f0; box-shadow: 0 1px 3px rgba(0,0,0,.05); border-radius: 12px; }
        .card-header { background: #fff; border-bottom: 1px solid #e2e8f0; padding: 16px 20px; border-radius: 12px 12px 0 0 !important; }

        /* ── Stats Cards ── */
        .stat-card {
            border-radius: 12px; padding: 20px;
            display: flex; align-items: center; gap: 16px;
            color: #fff; border: none;
        }
        .stat-card .stat-icon { width: 52px; height: 52px; border-radius: 12px; background: rgba(255,255,255,.2); display: flex; align-items: center; justify-content: center; font-size: 22px; flex-shrink: 0; }
        .stat-card .stat-value { font-size: 28px; font-weight: 700; line-height: 1; }
        .stat-card .stat-label { font-size: 13px; opacity: .85; margin-top: 2px; }

        /* ── Tables ── */
        .table-hover tbody tr:hover { background: #f8fafc; }
        .table th { font-size: 12px; font-weight: 600; text-transform: uppercase; letter-spacing: .04em; color: #64748b; }

        /* ── Badges ── */
        .badge-status { font-size: 11px; padding: 4px 10px; border-radius: 50px; font-weight: 600; }

        /* ── Alert banner ── */
        .alert-expiry { border-left: 4px solid #f59e0b; background: #fffbeb; border-radius: 8px; }

        /* ── Responsive ── */
        @media (max-width: 991px) {
            #sidebar { transform: translateX(-100%); }
            #sidebar.show { transform: translateX(0); }
            #topbar, #main-content { left: 0; margin-left: 0; }
        }

        /* ── Scrollbar ── */
        #sidebar::-webkit-scrollbar { width: 4px; }
        #sidebar::-webkit-scrollbar-track { background: transparent; }
        #sidebar::-webkit-scrollbar-thumb { background: #334155; border-radius: 4px; }

        /* Tab pills custom */
        .nav-pills .nav-link { color: #475569; font-size: 13px; font-weight: 500; }
        .nav-pills .nav-link.active { background: var(--accent); }

        /* Photo circle */
        .emp-photo { width: 90px; height: 90px; border-radius: 50%; object-fit: cover; border: 3px solid #e2e8f0; }
        .emp-photo-sm { width: 36px; height: 36px; border-radius: 50%; object-fit: cover; }
        .emp-initials {
            width: 90px; height: 90px; border-radius: 50%;
            background: var(--accent); color: #fff;
            display: flex; align-items: center; justify-content: center;
            font-size: 28px; font-weight: 700;
        }
        .emp-initials-sm {
            width: 36px; height: 36px; border-radius: 50%;
            background: var(--accent); color: #fff;
            display: flex; align-items: center; justify-content: center;
            font-size: 14px; font-weight: 700; flex-shrink: 0;
        }
    </style>
    @stack('styles')
</head>
<body>

<!-- Sidebar -->
<nav id="sidebar">
    <div class="sidebar-brand">
        <img src="{{ asset('images/logo-stikes.png') }}" alt="Logo STIKes" style="width: 38px; height: 38px; object-fit: contain; flex-shrink: 0; background: #fff; border-radius: 6px; padding: 2px;">
        <div>
            <div class="brand-text">{{ $sys_settings['app_name'] ?? 'PRISMA-PW' }}</div>
            <div class="brand-sub">{{ $sys_settings['institution_name'] ?? 'STIKes Panti Waluya Malang' }}</div>
        </div>
    </div>

    <div class="pt-2">
        <div class="nav-section">Menu Utama</div>
        <a href="{{ route('dashboard') }}" class="nav-link {{ request()->routeIs('dashboard') ? 'active' : '' }}">
            <i class="bi bi-speedometer2"></i> Dashboard
        </a>
        <a href="{{ route('employees.index') }}" class="nav-link {{ request()->routeIs('employees.*') ? 'active' : '' }}">
            <i class="bi bi-person-badge"></i> Pegawai Aktif
        </a>
        <a href="{{ route('resigned.index') }}" class="nav-link {{ request()->routeIs('resigned.*') ? 'active' : '' }}">
            <i class="bi bi-archive"></i> Arsip Resign
        </a>

        <div class="nav-section">Laporan</div>
        <a href="{{ route('reports.index') }}" class="nav-link {{ request()->routeIs('reports.*') ? 'active' : '' }}">
            <i class="bi bi-bar-chart-line"></i> Laporan & Statistik
        </a>

        @if(!auth()->user()->isGuest())
        <div class="nav-section">Pengaturan</div>
        <a href="{{ route('master.index') }}" class="nav-link {{ request()->routeIs('master.*') || request()->routeIs('departments.*') || request()->routeIs('positions.*') ? 'active' : '' }}">
            <i class="bi bi-sliders"></i> Master Data
        </a>
        <a href="{{ route('settings.index') }}" class="nav-link {{ request()->routeIs('settings.*') ? 'active' : '' }}">
            <i class="bi bi-gear"></i> Pengaturan Sistem
        </a>
        @endif
        @if(auth()->user()->isAdminIT())
        <a href="{{ route('users.index') }}" class="nav-link {{ request()->routeIs('users.*') ? 'active' : '' }}">
            <i class="bi bi-shield-person"></i> Manajemen User
        </a>
        @endif
    </div>

    <div class="sidebar-footer mt-auto">
        <div class="d-flex align-items-center gap-2">
            <i class="bi bi-circle-fill text-success" style="font-size:8px"></i>
            <span>v1.0.0 — {{ $sys_settings['app_name'] ?? 'PRISMA-PW' }}</span>
        </div>
    </div>
</nav>

<!-- Topbar -->
<header id="topbar">
    <button class="btn btn-sm btn-light d-lg-none me-2" id="sidebarToggle">
        <i class="bi bi-list fs-5"></i>
    </button>
    <div class="topbar-title">@yield('page-title', 'Dashboard')</div>
    <div class="user-badge">
        <div class="avatar">{{ substr(auth()->user()->name, 0, 1) }}</div>
        <div>
            <div style="font-weight:600;font-size:13px;line-height:1">{{ auth()->user()->name }}</div>
            <div style="font-size:11px;color:#64748b">{{ auth()->user()->role_label }}</div>
        </div>
    </div>
    <form method="POST" action="{{ route('logout') }}" class="mb-0">
        @csrf
        <button type="submit" class="btn btn-sm btn-outline-secondary" title="Logout">
            <i class="bi bi-box-arrow-right"></i>
        </button>
    </form>
</header>

<!-- Main Content -->
<main id="main-content">
    <div class="page-content">

        {{-- Flash Messages --}}
        @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show d-flex align-items-center gap-2 mb-4" role="alert">
            <i class="bi bi-check-circle-fill"></i>
            {{ session('success') }}
            <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert"></button>
        </div>
        @endif
        @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show d-flex align-items-center gap-2 mb-4" role="alert">
            <i class="bi bi-exclamation-triangle-fill"></i>
            {{ session('error') }}
            <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert"></button>
        </div>
        @endif

        @yield('content')
    </div>
</main>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Sidebar toggle (mobile)
    document.getElementById('sidebarToggle')?.addEventListener('click', () => {
        document.getElementById('sidebar').classList.toggle('show');
    });

    // Auto-dismiss alerts
    setTimeout(() => {
        document.querySelectorAll('.alert-dismissible').forEach(el => {
            bootstrap.Alert.getOrCreateInstance(el)?.close();
        });
    }, 5000);
</script>

@stack('scripts')
</body>
</html>
