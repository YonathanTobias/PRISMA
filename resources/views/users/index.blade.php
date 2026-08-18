@extends('layouts.app')
@section('title', 'Manajemen User')
@section('page-title', 'Manajemen Pengguna Sistem')

@section('content')
<div class="d-flex align-items-center justify-content-between mb-4">
    <div>
        <h4 class="mb-1 fw-bold" style="color:#0f172a">Manajemen Akun Pengguna</h4>
        <p class="text-muted mb-0" style="font-size:13px">Pengelolaan akun tim HRD dan Admin IT (Role-Based Access Control)</p>
    </div>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
        <i class="bi bi-person-plus-fill me-2"></i>Tambah Akun
    </button>
</div>

<div class="card">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Nama Pengguna</th>
                        <th>Email</th>
                        <th>Role Access</th>
                        <th>Status Akun</th>
                        <th>Dibuat Tanggal</th>
                        <th style="width:120px">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($users as $user)
                    <tr style="font-size:13px">
                        <td>
                            <div class="fw-medium">{{ $user->name }}</div>
                            @if($user->id === auth()->id())
                            <span class="badge bg-info" style="font-size:10px">Akun Anda</span>
                            @endif
                        </td>
                        <td>{{ $user->email }}</td>
                        <td>
                            @if($user->isAdminIT())
                            <span class="badge bg-danger"><i class="bi bi-shield-lock-fill me-1"></i>Admin IT</span>
                            @else
                            <span class="badge bg-primary"><i class="bi bi-people-fill me-1"></i>Tim HRD</span>
                            @endif
                        </td>
                        <td>
                            @if($user->is_active)
                            <span class="badge bg-success">Aktif</span>
                            @else
                            <span class="badge bg-secondary">Non-Aktif</span>
                            @endif
                        </td>
                        <td>{{ $user->created_at->format('d M Y') }}</td>
                        <td>
                            <div class="d-flex gap-1">
                                <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editUserModal{{ $user->id }}">
                                    <i class="bi bi-pencil"></i>
                                </button>
                                @if($user->id !== auth()->id())
                                <form method="POST" action="{{ route('users.destroy', $user) }}" onsubmit="return confirm('Hapus akun ini?')">
                                    @csrf @method('DELETE')
                                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                                </form>
                                @endif
                            </div>
                        </td>
                    </tr>

                    {{-- Edit User Modal --}}
                    <div class="modal fade" id="editUserModal{{ $user->id }}" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header"><h5 class="modal-title">Edit Akun Pengguna</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
                                <form method="POST" action="{{ route('users.update', $user) }}">
                                    @csrf @method('PUT')
                                    <div class="modal-body row g-3">
                                        <div class="col-12">
                                            <label class="form-label fw-semibold" style="font-size:13px">Nama Lengkap</label>
                                            <input type="text" name="name" class="form-control" value="{{ $user->name }}" required>
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label fw-semibold" style="font-size:13px">Email</label>
                                            <input type="email" name="email" class="form-control" value="{{ $user->email }}" required>
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label fw-semibold" style="font-size:13px">Role Access</label>
                                            <select name="role" class="form-select" required>
                                                <option value="hrd" {{ $user->role === 'hrd' ? 'selected' : '' }}>Tim HRD</option>
                                                <option value="admin_it" {{ $user->role === 'admin_it' ? 'selected' : '' }}>Admin IT</option>
                                            </select>
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label fw-semibold" style="font-size:13px">Password Baru (Opsional)</label>
                                            <input type="password" name="password" class="form-control" placeholder="Kosongkan jika tidak diubah">
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label fw-semibold" style="font-size:13px">Konfirmasi Password Baru</label>
                                            <input type="password" name="password_confirmation" class="form-control" placeholder="Ulangi password baru">
                                        </div>
                                        <div class="col-12">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="is_active" value="1" id="isActiveUser{{ $user->id }}" {{ $user->is_active ? 'checked' : '' }}>
                                                <label class="form-check-label fw-semibold" for="isActiveUser{{ $user->id }}" style="font-size:13px">Akun Aktif</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-primary">Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

{{-- Add User Modal --}}
<div class="modal fade" id="addUserModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Tambah Akun Pengguna Baru</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="POST" action="{{ route('users.store') }}">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Lengkap</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Email</label>
                        <input type="email" name="email" class="form-control" placeholder="nama@domain.com" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Role Access</label>
                        <select name="role" class="form-select" required>
                            <option value="hrd">Tim HRD</option>
                            <option value="admin_it">Admin IT</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Konfirmasi Password</label>
                        <input type="password" name="password_confirmation" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Buat Akun</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
