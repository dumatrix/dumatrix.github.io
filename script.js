document.addEventListener("DOMContentLoaded", () => {
    const menuToggle = document.getElementById("menuToggle");
    const closeBtn = document.getElementById("closeBtn");
    const navLinks = document.getElementById("navLinks");
    const navOverlay = document.getElementById("navOverlay");

    function openMenu() {
        navLinks?.classList.add("open");
        navOverlay?.classList.add("open");
        document.body.style.overflow = "hidden";
    }

    function closeMenu() {
        navLinks?.classList.remove("open");
        navOverlay?.classList.remove("open");
        document.body.style.overflow = "";
    }

    if (menuToggle) menuToggle.addEventListener("click", openMenu);
    if (closeBtn) closeBtn.addEventListener("click", closeMenu);
    if (navOverlay) navOverlay.addEventListener("click", closeMenu);

    const isMobile = window.innerWidth <= 768;
    const hasVisited = localStorage.getItem("du_matrix_visited");
    if (isMobile && !hasVisited) {
        setTimeout(() => {
            openMenu();
            localStorage.setItem("du_matrix_visited", "true");
        }, 400);
    }
});
