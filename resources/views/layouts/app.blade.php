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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom Application CSS -->
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
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
<!-- Custom Application JS -->
<script src="{{ asset('js/app.js') }}"></script>

@stack('scripts')
</body>
</html>
