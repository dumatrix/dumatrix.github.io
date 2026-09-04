document.addEventListener("DOMContentLoaded", () => {
    // Drawer
    const menuToggle = document.getElementById("menuToggle");
    const closeBtn = document.getElementById("closeBtn");
    const navLinks = document.getElementById("navLinks");
    const navOverlay = document.getElementById("navOverlay");

    function openMenu() { navLinks?.classList.add("open"); navOverlay?.classList.add("open"); document.body.style.overflow = "hidden"; }
    function closeMenu() { navLinks?.classList.remove("open"); navOverlay?.classList.remove("open"); document.body.style.overflow = ""; }
    if (menuToggle) menuToggle.addEventListener("click", openMenu);
    if (closeBtn) closeBtn.addEventListener("click", closeMenu);
    if (navOverlay) navOverlay.addEventListener("click", closeMenu);

    // Search Toggle
    const searchToggle = document.getElementById("searchToggle");
    const searchBox = document.querySelector(".search-box");
    if (searchToggle && searchBox) {
        searchToggle.addEventListener("click", (e) => {
            e.stopPropagation();
            searchBox.classList.toggle("hidden");
            if (!searchBox.classList.contains("hidden")) document.getElementById("searchInput").focus();
        });
        document.addEventListener("click", (e) => {
            if (!e.target.closest(".search-container") && !searchBox.classList.contains("hidden")) searchBox.classList.add("hidden");
        });
    }

    // Scroll Top
    const scrollTopBtn = document.getElementById("scrollTopBtn");
    if (scrollTopBtn) {
        window.addEventListener("scroll", () => scrollTopBtn.classList.toggle("visible", window.scrollY > 300));
        scrollTopBtn.addEventListener("click", () => window.scrollTo({ top: 0, behavior: "smooth" }));
    }

    // Search Data
    const searchData = [
        { title: "Calculus", desc: "Limits, continuity", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Linear Algebra", desc: "Vectors, matrices", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Abstract Algebra", desc: "Groups, rings", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Field Theory", desc: "Notes", url: "msc-math.html", badge: "M.Sc." },
        { title: "Advanced Algebra", desc: "Galois", url: "phd.html", badge: "Ph.D" },
        { title: "Functional Analysis", desc: "Banach", url: "phd.html", badge: "Ph.D" }
    ];
    const input = document.getElementById("searchInput");
    const results = document.getElementById("searchResults");
    if (input && results) {
        if (typeof Fuse === "undefined") {
            const s = document.createElement("script"); s.src = "https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"; s.onload = initSearch; document.head.appendChild(s);
        } else initSearch();
        function initSearch() {
            const fuse = new Fuse(searchData, { keys: ["title", "desc"], threshold: 0.3 });
            input.addEventListener("input", function () {
                if (this.value.trim().length < 2) { results.innerHTML = ""; return; }
                let html = "";
                fuse.search(this.value.trim()).slice(0, 5).forEach(({ item }) => {
                    html += `<a href="${item.url}" class="search-result-item"><div>${item.title} <span class="badge">${item.badge}</span></div></a>`;
                });
                results.innerHTML = html;
            });
        }
    }
});
