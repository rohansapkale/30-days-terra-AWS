// Rohan Portfolio - Interactive Scripts

document.addEventListener('DOMContentLoaded', function () {
    // 1. Theme Toggle Functionality
    const themeToggleBtn = document.getElementById('themeToggle');
    const themeIcon = document.getElementById('themeIcon');
    const savedTheme = localStorage.getItem('rohan_theme') || 'dark';

    function setTheme(theme) {
        if (theme === 'light') {
            document.body.classList.remove('dark-theme');
            document.body.classList.add('light-theme');
            if (themeIcon) themeIcon.textContent = '☀️';
        } else {
            document.body.classList.remove('light-theme');
            document.body.classList.add('dark-theme');
            if (themeIcon) themeIcon.textContent = '🌙';
        }
        localStorage.setItem('rohan_theme', theme);
    }

    // Apply saved theme on boot
    setTheme(savedTheme);

    if (themeToggleBtn) {
        themeToggleBtn.addEventListener('click', function () {
            const currentTheme = document.body.classList.contains('light-theme') ? 'light' : 'dark';
            const nextTheme = currentTheme === 'light' ? 'dark' : 'light';
            setTheme(nextTheme);
        });
    }

    // 2. Kudos Counter
    const likeButton = document.getElementById('likeButton');
    const likeCountSpan = document.getElementById('likeCount');
    let kudos = parseInt(localStorage.getItem('rohan_kudos') || '0', 10);

    if (likeCountSpan) {
        likeCountSpan.textContent = kudos;
    }

    if (likeButton) {
        likeButton.addEventListener('click', function () {
            kudos++;
            localStorage.setItem('rohan_kudos', kudos);
            if (likeCountSpan) likeCountSpan.textContent = kudos;

            // Micro-interaction bounce
            likeButton.style.transform = 'scale(0.92)';
            setTimeout(() => {
                likeButton.style.transform = 'scale(1.08)';
                setTimeout(() => {
                    likeButton.style.transform = 'scale(1)';
                }, 120);
            }, 80);

            // Milestone celebration
            if (kudos % 5 === 0) {
                showToast(`🎉 Awesome! ${kudos} Kudos sent to Rohan!`);
            }
        });
    }

    // 3. Copy Email to Clipboard
    const copyEmailBtn = document.getElementById('copyEmailBtn');
    const copyBtnText = document.getElementById('copyBtnText');
    const userEmail = 'rohan.devops@example.com'; // Can be customized

    if (copyEmailBtn) {
        copyEmailBtn.addEventListener('click', function () {
            navigator.clipboard.writeText(userEmail).then(() => {
                showToast('📋 Email copied to clipboard!');
                if (copyBtnText) copyBtnText.textContent = '✅ Copied!';
                setTimeout(() => {
                    if (copyBtnText) copyBtnText.textContent = '📋 Copy Email';
                }, 2500);
            }).catch(() => {
                // Fallback prompt
                prompt('Copy this email:', userEmail);
            });
        });
    }

    // 4. Toast Notification Utility
    function showToast(message) {
        let toast = document.getElementById('toast');
        if (!toast) return;

        toast.textContent = message;
        toast.classList.add('show');

        setTimeout(() => {
            toast.classList.remove('show');
        }, 3200);
    }

    // 5. Smooth Anchor Scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                e.preventDefault();
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // 6. Subtle Scroll Reveal for Cards
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const revealObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    document.querySelectorAll('.stat-card, .skill-category, .project-card, .timeline-item').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.5s cubic-bezier(0.16, 1, 0.3, 1), transform 0.5s cubic-bezier(0.16, 1, 0.3, 1)';
        revealObserver.observe(el);
    });
});