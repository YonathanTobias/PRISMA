/**
 * SIMPEG - Simple Batch Document Upload
 */

document.addEventListener('DOMContentLoaded', function () {
    const batchInput = document.getElementById('batchFilesInput');
    const batchDropzone = document.getElementById('batchDropzone');
    const batchTableContainer = document.getElementById('batchTableContainer');
    const batchTableBody = document.getElementById('batchTableBody');
    const batchSubmitBtn = document.getElementById('batchSubmitBtn');
    const batchCountBadge = document.getElementById('batchCountBadge');

    if (!batchInput || !batchDropzone) return;

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
            const isDuplicate = selectedFiles.some(f => f.file.name === file.name && f.file.size === file.size);
            if (!isDuplicate) {
                selectedFiles.push({
                    id: 'file_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9),
                    file: file,
                    name: cleanFileName(file.name)
                });
            }
        }

        renderTable();
    }

    function cleanFileName(filename) {
        let name = filename.replace(/\.[^/.]+$/, "");
        name = name.replace(/[_-]+/g, " ").trim();
        return name;
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
        batchCountBadge.textContent = selectedFiles.length + ' File Siap Diupload';
        batchTableBody.innerHTML = '';

        selectedFiles.forEach((item, index) => {
            const tr = document.createElement('tr');
            tr.style.fontSize = '13px';
            tr.id = item.id;

            tr.innerHTML = `
                <td class="align-middle text-center text-muted" style="width: 40px;">
                    ${index + 1}
                </td>
                <td class="align-middle" style="width: 40%;">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-file-earmark-pdf-fill text-danger fs-5 me-2"></i>
                        <div class="text-truncate" style="max-width: 280px;" title="${item.file.name}">
                            <div class="fw-semibold text-dark text-truncate">${item.file.name}</div>
                            <span class="badge bg-light text-secondary border" style="font-size: 10.5px;">${formatFileSize(item.file.size)}</span>
                        </div>
                    </div>
                </td>
                <td class="align-middle" style="width: 50%;">
                    <input type="text" class="form-control form-control-sm doc-name-input" value="${item.name}" placeholder="Nama Dokumen" data-id="${item.id}" required>
                </td>
                <td class="align-middle text-center" style="width: 10%;">
                    <button type="button" class="btn btn-sm btn-outline-danger py-1 px-2 remove-row-btn" data-id="${item.id}" title="Hapus dari daftar">
                        <i class="bi bi-trash"></i>
                    </button>
                </td>
            `;

            batchTableBody.appendChild(tr);
        });

        document.querySelectorAll('.doc-name-input').forEach(input => {
            input.addEventListener('input', (e) => {
                const id = e.target.getAttribute('data-id');
                const found = selectedFiles.find(f => f.id === id);
                if (found) found.name = e.target.value;
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
                formData.append(`documents[${idx}][type]`, 'dokumen');
            });

            // Loading state
            batchSubmitBtn.disabled = true;
            batchSubmitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status"></span>Mengunggah Dokumen...';

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
