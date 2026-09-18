/**
 * PRISMA-PW — Employee Form Helper Scripts (Create & Edit)
 * STIKes Panti Waluya Malang
 */

document.addEventListener('DOMContentLoaded', () => {
    // ── Toggle Dosen Academic Section ──
    const employeeTypeSelect = document.getElementById('employeeTypeSelect');
    const dosenAcademicSection = document.getElementById('dosenAcademicSection');

    function toggleDosenFields() {
        if (employeeTypeSelect && dosenAcademicSection) {
            dosenAcademicSection.style.display = (employeeTypeSelect.value === 'dosen') ? 'block' : 'none';
        }
    }

    if (employeeTypeSelect) {
        employeeTypeSelect.addEventListener('change', toggleDosenFields);
        toggleDosenFields();
    }

    // ── Photo Upload Preview ──
    const photoInput = document.getElementById('photoInput');
    const photoPreview = document.getElementById('photoPreview');
    const photoPreviewImg = document.getElementById('photoPreviewImg');

    if (photoInput) {
        photoInput.addEventListener('change', function (e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (ev) {
                    if (photoPreview) {
                        photoPreview.style.display = 'none';
                    }
                    if (photoPreviewImg) {
                        photoPreviewImg.src = ev.target.result;
                        photoPreviewImg.classList.remove('d-none');
                    }
                };
                reader.readAsDataURL(file);
            }
        });
    }
});
