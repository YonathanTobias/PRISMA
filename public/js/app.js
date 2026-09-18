/**
 * PRISMA-PW — Main Application Scripts
 * STIKes Panti Waluya Malang
 */

document.addEventListener('DOMContentLoaded', () => {
    // ── Mobile Sidebar Toggle ──
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.getElementById('sidebar');

    if (sidebarToggle && sidebar) {
        sidebarToggle.addEventListener('click', (e) => {
            e.stopPropagation();
            sidebar.classList.toggle('show');
        });

        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', (e) => {
            if (window.innerWidth < 992 && sidebar.classList.contains('show')) {
                if (!sidebar.contains(e.target) && !sidebarToggle.contains(e.target)) {
                    sidebar.classList.remove('show');
                }
            }
        });
    }

    // ── Auto-dismiss Alerts after 5 seconds ──
    setTimeout(() => {
        document.querySelectorAll('.alert-dismissible').forEach((el) => {
            if (window.bootstrap && bootstrap.Alert) {
                bootstrap.Alert.getOrCreateInstance(el)?.close();
            }
        });
    }, 5000);
});
