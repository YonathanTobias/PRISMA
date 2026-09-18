<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — {{ $sys_settings['app_name'] ?? 'PRISMA-PW' }}</title>
    <link rel="icon" type="image/png" href="{{ asset('images/logo-stikes.png') }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom Auth CSS -->
    <link rel="stylesheet" href="{{ asset('css/auth.css') }}">
</head>
<body>
<div class="login-card">
    <div class="login-header">
        <img src="{{ asset('images/logo-stikes.png') }}" alt="Logo STIKes" style="width: 72px; height: 72px; object-fit: contain; margin-bottom: 12px; background: #fff; border-radius: 12px; padding: 6px; box-shadow: 0 4px 12px rgba(0,0,0,.1);">
        <h1>{{ $sys_settings['app_name'] ?? 'PRISMA-PW' }}</h1>
        <p>{{ $sys_settings['institution_name'] ?? 'STIKes Panti Waluya Malang' }}</p>
    </div>
    <div class="login-body">
        <h2 style="font-size:18px;font-weight:700;color:#0f172a;margin-bottom:6px">Selamat Datang</h2>
        <p style="font-size:13px;color:#6b7280;margin-bottom:24px">{{ $sys_settings['app_description'] ?? 'Portal Informasi Sumber Daya Manusia Panti Waluya' }}</p>

        @if($errors->any())
        <div class="alert alert-danger d-flex align-items-center gap-2 py-2 px-3 mb-4" style="font-size:13px;border-radius:10px">
            <i class="bi bi-exclamation-triangle-fill"></i>
            {{ $errors->first() }}
        </div>
        @endif

        <form method="POST" action="{{ route('login') }}">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="email">Alamat Email</label>
                <div class="input-icon">
                    <i class="bi bi-envelope"></i>
                    <input id="email" type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                        value="{{ old('email') }}" placeholder="nama@domain.com" required autofocus>
                </div>
            </div>
            <div class="mb-4">
                <label class="form-label" for="password">Password</label>
                <div class="input-icon">
                    <i class="bi bi-lock"></i>
                    <input id="password" type="password" name="password" class="form-control" placeholder="••••••••" required>
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-between mb-4">
                <div class="form-check mb-0">
                    <input class="form-check-input" type="checkbox" name="remember" id="remember">
                    <label class="form-check-label" for="remember" style="font-size:13px">Ingat saya</label>
                </div>
            </div>
            <button type="submit" class="btn btn-login w-100">
                <i class="bi bi-box-arrow-in-right me-2"></i>Masuk ke Sistem
            </button>
        </form>
    </div>
    <div class="login-footer">
        &copy; {{ date('Y') }} {{ $sys_settings['app_name'] ?? 'PRISMA-PW' }} — Sistem Internal HRD. Hak akses dibatasi.
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
