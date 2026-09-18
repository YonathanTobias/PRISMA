/**
 * SIMPEG - Smart Batch Document Upload & Auto-Detection
 */

document.addEventListener('DOMContentLoaded', function () {
    const batchInput = document.getElementById('batchFilesInput');
    const batchDropzone = document.getElementById('batchDropzone');
    const batchTableContainer = document.getElementById('batchTableContainer');
    const batchTableBody = document.getElementById('batchTableBody');
    const batchSubmitBtn = document.getElementById('batchSubmitBtn');
    const batchCountBadge = document.getElementById('batchCountBadge');
    const batchDocTypesData = document.getElementById('batchDocTypesData');

    if (!batchInput || !batchDropzone) return;

    let availableTypes = [];
    if (batchDocTypesData) {
        try {
            availableTypes = JSON.parse(batchDocTypesData.textContent);
        } catch (e) {
            console.error('Error parsing doc types', e);
        }
    }

    let selectedFiles = [];

    // Drag and Drop listeners
    ['dragenter', 'dragover'].forEach(eventName => {
        batchDropzone.addEventListener(eventName, (e) => {
            e.preventDefault();
            e.stopPropagation();
            batchDropzone.classList.add('border-primary', 'bg-primary-subtle');
        });
    });

    ['dragleave', 'drop'].forEach(eventName => {
        batchDropzone.addEventListener(eventName, (e) => {
            e.preventDefault();
            e.stopPropagation();
            batchDropzone.classList.remove('border-primary', 'bg-primary-subtle');
        });
    });

    batchDropzone.addEventListener('drop', (e) => {
        const dt = e.dataTransfer;
        const files = dt.files;
        handleFiles(files);
    });

    batchInput.addEventListener('change', (e) => {
        handleFiles(e.target.files);
    });

    function handleFiles(files) {
        if (!files || files.length === 0) return;

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            // Prevent duplicates by filename and size
            const isDuplicate = selectedFiles.some(f => f.file.name === file.name && f.file.size === file.size);
            if (!isDuplicate) {
                const detected = detectDocumentType(file.name);
                selectedFiles.push({
                    id: 'file_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9),
                    file: file,
                    name: cleanFileName(file.name),
                    type: detected.code,
                    confidence: detected.confidence
                });
            }
        }

        renderTable();
    }

    function cleanFileName(filename) {
        // Remove extension
        let name = filename.replace(/\.[^/.]+$/, "");
        // Replace underscores and multiple dashes with spaces
        name = name.replace(/[_-]+/g, " ").trim();
        return name;
    }

    function detectDocumentType(filename) {
        const lower = filename.toLowerCase();

        // Rules array: { pattern: RegExp or substrings, code: string }
        const rules = [
            { patterns: ['ktp', 'e-ktp', 'identitas'], code: 'ktp' },
            { patterns: ['kartu keluarga', ' kk ', 'kk_', '-kk', 'kk.'], code: 'kk' },
            { patterns: ['npwp', 'pajak'], code: 'npwp' },
            { patterns: ['bpjs', 'askes', 'ketenagakerjaan', 'kesehatan'], code: 'bpjs' },
            { patterns: ['pekerti'], code: 'pekerti' },
            { patterns: ['applied approach', ' aa ', 'aa_', '-aa', 'sertifikat_aa'], code: 'aa' },
            { patterns: ['serdos', 'sertifikat pendidik', 'sertifikasi dosen'], code: 'serdos' },
            { patterns: ['str', 'tanda registrasi', 'surat registrasi'], code: 'str' },
            { patterns: ['sip', 'izin praktik', 'surat izin'], code: 'sip' },
            { patterns: ['inpassing', 'inpasing'], code: 'inpassing' },
            { patterns: ['transkrip', 'transcript', 'daftar nilai'], code: 'transkrip' },
            { patterns: ['ijazah', 'diploma', 'sarjana', 'magister', 'doktor', 's1', 's2', 's3', 'd3', 'd4'], code: 'ijazah' },
            { patterns: ['sk', 'surat keputusan', 'pengangkatan', 'tetap', 'kontrak_kerja', 'spk'], code: 'sk' },
            { patterns: ['cv', 'curriculum vitae', 'resume', 'riwayat hidup'], code: 'cv' }
        ];

        for (const rule of rules) {
            for (const pattern of rule.patterns) {
                if (lower.includes(pattern)) {
                    // Check if code exists in availableTypes
                    const found = availableTypes.find(t => t.code === rule.code);
                    if (found) {
                        return { code: rule.code, confidence: 'high' };
                    }
                }
            }
        }

        // Default to first available or 'lainnya'
        const defaultType = availableTypes.find(t => t.code === 'lainnya') || availableTypes[0] || { code: 'lainnya' };
        return { code: defaultType.code, confidence: 'low' };
    }

    function formatFileSize(bytes) {
        if (bytes >= 1048576) {
            return (bytes / 1048576).toFixed(2) + ' MB';
        }
        return (bytes / 1024).toFixed(1) + ' KB';
    }

    function renderTable() {
        if (selectedFiles.length === 0) {
            batchTableContainer.classList.add('d-none');
            batchSubmitBtn.disabled = true;
            batchCountBadge.textContent = '0 File';
            batchTableBody.innerHTML = '';
            return;
        }

        batchTableContainer.classList.remove('d-none');
        batchSubmitBtn.disabled = false;
        batchCountBadge.textContent = selectedFiles.length + ' File Siap';
        batchTableBody.innerHTML = '';

        selectedFiles.forEach((item, index) => {
            const tr = document.createElement('tr');
            tr.style.fontSize = '13px';
            tr.id = item.id;

            // Generate Select options
            let selectOptions = '';
            availableTypes.forEach(t => {
                const selected = t.code === item.type ? 'selected' : '';
                selectOptions += `<option value="${t.code}" ${selected}>${t.name}</option>`;
            });

            tr.innerHTML = `
                <td class="align-middle text-center text-muted" style="width: 30px;">
                    ${index + 1}
                </td>
                <td class="align-middle" style="width: 28%;">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-file-earmark-pdf-fill text-danger fs-5 me-2"></i>
                        <div class="text-truncate" style="max-width: 200px;" title="${item.file.name}">
                            <div class="fw-semibold text-dark text-truncate">${item.file.name}</div>
                            <span class="badge bg-light text-secondary border" style="font-size: 10.5px;">${formatFileSize(item.file.size)}</span>
                        </div>
                    </div>
                </td>
                <td class="align-middle" style="width: 34%;">
                    <input type="text" class="form-control form-control-sm doc-name-input" value="${item.name}" placeholder="Nama Dokumen" data-id="${item.id}" required>
                </td>
                <td class="align-middle" style="width: 30%;">
                    <div class="input-group input-group-sm">
                        <select class="form-select doc-type-select" data-id="${item.id}" required>
                            ${selectOptions}
                        </select>
                        ${item.confidence === 'high' ? '<span class="input-group-text bg-success-subtle text-success border-success-subtle" title="Terdeteksi Otomatis"><i class="bi bi-magic"></i></span>' : ''}
                    </div>
                </td>
                <td class="align-middle text-center" style="width: 8%;">
                    <button type="button" class="btn btn-sm btn-outline-danger py-1 px-2 remove-row-btn" data-id="${item.id}" title="Hapus dari daftar">
                        <i class="bi bi-trash"></i>
                    </button>
                </td>
            `;

            batchTableBody.appendChild(tr);
        });

        // Add event listeners for dynamic row inputs
        document.querySelectorAll('.doc-name-input').forEach(input => {
            input.addEventListener('input', (e) => {
                const id = e.target.getAttribute('data-id');
                const found = selectedFiles.find(f => f.id === id);
                if (found) found.name = e.target.value;
            });
        });

        document.querySelectorAll('.doc-type-select').forEach(select => {
            select.addEventListener('change', (e) => {
                const id = e.target.getAttribute('data-id');
                const found = selectedFiles.find(f => f.id === id);
                if (found) {
                    found.type = e.target.value;
                    found.confidence = 'manual';
                }
            });
        });

        document.querySelectorAll('.remove-row-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.getAttribute('data-id');
                selectedFiles = selectedFiles.filter(f => f.id !== id);
                renderTable();
            });
        });
    }

    // Form Submission Handling
    const batchForm = document.getElementById('batchUploadForm');
    if (batchForm) {
        batchForm.addEventListener('submit', function (e) {
            e.preventDefault();

            if (selectedFiles.length === 0) {
                alert('Silakan pilih setidaknya satu file.');
                return;
            }

            const formData = new FormData();
            const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || 
                              document.querySelector('input[name="_token"]')?.value;

            if (csrfToken) {
                formData.append('_token', csrfToken);
            }

            selectedFiles.forEach((item, idx) => {
                formData.append(`documents[${idx}][file]`, item.file);
                formData.append(`documents[${idx}][name]`, item.name);
                formData.append(`documents[${idx}][type]`, item.type);
            });

            // Loading state
            batchSubmitBtn.disabled = true;
            batchSubmitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status"></span>Mengunggah & Mengompres Dokumen...';

            fetch(batchForm.action, {
                method: 'POST',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'Accept': 'application/json'
                },
                body: formData
            })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                    return;
                }
                return response.json();
            })
            .then(data => {
                if (data && data.success) {
                    window.location.reload();
                } else if (data && data.message) {
                    alert('Gagal mengunggah: ' + data.message);
                    batchSubmitBtn.disabled = false;
                    batchSubmitBtn.innerHTML = '<i class="bi bi-cloud-upload me-1"></i>Simpan Semua Dokumen';
                } else {
                    window.location.reload();
                }
            })
            .catch(error => {
                console.error('Upload error:', error);
                window.location.reload();
            });
        });
    }
});
