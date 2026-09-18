/**
 * PRISMA-PW — Dashboard Charts Script
 * STIKes Panti Waluya Malang
 */

document.addEventListener('DOMContentLoaded', () => {
    // ── Status Kepegawaian Chart ──
    const statusEl = document.getElementById('statusChart');
    if (statusEl && window.Chart) {
        try {
            const labels = JSON.parse(statusEl.dataset.labels || '[]');
            const values = JSON.parse(statusEl.dataset.values || '[]');
            new Chart(statusEl.getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: labels,
                    datasets: [{
                        data: values,
                        backgroundColor: ['#10b981', '#3b82f6', '#8b5cf6', '#f59e0b'],
                        borderWidth: 0,
                        hoverOffset: 6
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                font: { size: 12 },
                                boxWidth: 14,
                                padding: 12
                            }
                        }
                    }
                }
            });
        } catch (e) {
            console.error('Error initializing status chart', e);
        }
    }

    // ── Jenis Kelamin Chart ──
    const genderEl = document.getElementById('genderChart');
    if (genderEl && window.Chart) {
        try {
            const male = parseInt(genderEl.dataset.male || '0', 10);
            const female = parseInt(genderEl.dataset.female || '0', 10);
            new Chart(genderEl.getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: ['Laki-laki', 'Perempuan'],
                    datasets: [{
                        data: [male, female],
                        backgroundColor: ['#3b82f6', '#ec4899'],
                        borderWidth: 0,
                        hoverOffset: 6
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                font: { size: 12 },
                                boxWidth: 14,
                                padding: 12
                            }
                        }
                    }
                }
            });
        } catch (e) {
            console.error('Error initializing gender chart', e);
        }
    }
});
