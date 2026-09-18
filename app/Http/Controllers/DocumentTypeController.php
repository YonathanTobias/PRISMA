<?php

namespace App\Http\Controllers;

use App\Models\DocumentType;
use App\Models\EmployeeDocument;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class DocumentTypeController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'code'        => 'nullable|string|max:50|unique:document_types,code',
            'description' => 'nullable|string|max:500',
        ]);

        if (empty($validated['code'])) {
            $validated['code'] = DocumentType::generateCode($validated['name']);
        } else {
            $validated['code'] = Str::slug($validated['code'], '_');
        }

        DocumentType::create([
            'name'        => $validated['name'],
            'code'        => $validated['code'],
            'description' => $validated['description'] ?? null,
            'is_active'   => true,
        ]);

        return back()->with('success', 'Tipe dokumen baru berhasil ditambahkan.');
    }

    public function update(Request $request, DocumentType $documentType)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'code'        => 'required|string|max:50|unique:document_types,code,' . $documentType->id,
            'description' => 'nullable|string|max:500',
            'is_active'   => 'nullable|boolean',
        ]);

        $validated['code'] = Str::slug($validated['code'], '_');
        $validated['is_active'] = $request->has('is_active') ? $request->boolean('is_active') : true;

        $documentType->update($validated);

        return back()->with('success', 'Tipe dokumen berhasil diperbarui.');
    }

    public function destroy(DocumentType $documentType)
    {
        $count = EmployeeDocument::where('type', $documentType->code)->count();
        if ($count > 0) {
            return back()->with('error', "Tipe dokumen '{$documentType->name}' tidak dapat dihapus karena sedang digunakan oleh {$count} berkas pegawai. Anda dapat menonaktifkannya jika tidak ingin digunakan lagi.");
        }

        $documentType->delete();

        return back()->with('success', 'Tipe dokumen berhasil dihapus.');
    }
}
