<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeDocument;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DocumentController extends Controller
{
    public function store(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'type'         => 'required|in:ktp,npwp,bpjs_kesehatan,bpjs_ketenagakerjaan,ijazah,kontrak_kerja,sk_jabatan,foto,lainnya',
            'name'         => 'required|string|max:255',
            'file'         => 'required|file|max:10240',
            'issued_date'  => 'nullable|date',
            'expiry_date'  => 'nullable|date',
            'notes'        => 'nullable|string',
        ]);

        $file = $request->file('file');
        $path = $file->store('employees/documents/' . $employee->id, 'public');

        EmployeeDocument::create([
            'employee_id' => $employee->id,
            'type'        => $validated['type'],
            'name'        => $validated['name'],
            'file_path'   => $path,
            'file_name'   => $file->getClientOriginalName(),
            'file_size'   => number_format($file->getSize() / 1024, 2) . ' KB',
            'file_type'   => $file->getMimeType(),
            'issued_date' => $validated['issued_date'] ?? null,
            'expiry_date' => $validated['expiry_date'] ?? null,
            'notes'       => $validated['notes'] ?? null,
        ]);

        return back()->with('success', 'Dokumen berhasil diunggah.');
    }

    public function download(EmployeeDocument $document)
    {
        if (!Storage::disk('public')->exists($document->file_path)) {
            abort(404, 'File tidak ditemukan.');
        }

        return Storage::disk('public')->download($document->file_path, $document->file_name);
    }

    public function preview(EmployeeDocument $document)
    {
        if (!Storage::disk('public')->exists($document->file_path)) {
            abort(404, 'File tidak ditemukan.');
        }

        $filePath = Storage::disk('public')->path($document->file_path);
        return response()->file($filePath, [
            'Content-Type' => $document->file_type ?? 'application/pdf',
        ]);
    }

    public function destroy(EmployeeDocument $document)
    {
        Storage::disk('public')->delete($document->file_path);
        $employeeId = $document->employee_id;
        $document->delete();

        return back()->with('success', 'Dokumen berhasil dihapus.');
    }
}
