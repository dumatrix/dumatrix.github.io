document.addEventListener("DOMContentLoaded", () => {
    // ---------- MOBILE DRAWER ----------
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

    // Auto-open on first mobile visit
    const isMobile = window.innerWidth <= 768;
    const hasVisited = localStorage.getItem("du_matrix_visited");
    if (isMobile && !hasVisited) {
        setTimeout(() => {
            openMenu();
            localStorage.setItem("du_matrix_visited", "true");
        }, 400);
    }

    // ---------- THEME TOGGLE (Header button) ----------
    const themeToggle = document.getElementById("themeToggle");
    const htmlElement = document.documentElement;

    const storedTheme = localStorage.getItem("theme");
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;

    if (storedTheme) {
        htmlElement.setAttribute("data-theme", storedTheme);
    } else if (prefersDark) {
        htmlElement.setAttribute("data-theme", "dark");
        localStorage.setItem("theme", "dark");
    } else {
        htmlElement.setAttribute("data-theme", "light");
        localStorage.setItem("theme", "light");
    }

    function updateToggleIcon() {
        if (themeToggle) {
            const currentTheme = htmlElement.getAttribute("data-theme");
            themeToggle.textContent = currentTheme === "dark" ? "🌙" : "☀️";
        }
    }

    if (themeToggle) {
        themeToggle.addEventListener("click", () => {
            const currentTheme = htmlElement.getAttribute("data-theme");
            const newTheme = currentTheme === "dark" ? "light" : "dark";
            htmlElement.setAttribute("data-theme", newTheme);
            localStorage.setItem("theme", newTheme);
            updateToggleIcon();
        });
    }
    updateToggleIcon();

    // ---------- SEARCH ----------
    // Search index: all subjects from B.Sc., M.Sc., PhD
    const searchData = [
        // B.Sc.
        { title: "Calculus & Real Analysis", description: "Limits, continuity, multivariable calculus, real sequences", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Linear & Abstract Algebra", description: "Vector spaces, matrices, group theory, ring theory", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Differential Equations", description: "Ordinary and partial differential equations with applications", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Mechanics & Numerical Methods", description: "Statics, dynamics, and numerical computing algorithms", url: "bsc-math.html", badge: "B.Sc." },
        // M.Sc.
        { title: "Field Theory", description: "Complete notes and solved problems", url: "msc-math.html", badge: "M.Sc." },
        { title: "Real Analysis", description: "Lecture notes and reference material", url: "msc-math.html", badge: "M.Sc." },
        { title: "Abstract Algebra", description: "Group theory and ring theory notes", url: "msc-math.html", badge: "M.Sc." },
        { title: "Topology", description: "Point-set and general topology", url: "msc-math.html", badge: "M.Sc." },
        // PhD
        { title: "Advanced Algebra & Field Theory", description: "Galois theory, module theory, commutative algebra", url: "phd.html", badge: "PhD" },
        { title: "Functional Analysis", description: "Banach spaces, Hilbert spaces, operator theory", url: "phd.html", badge: "PhD" },
        { title: "Research & Seminars", description: "Research notes, paper summaries, talk slides", url: "phd.html", badge: "PhD" },
        { title: "Comprehensive Exams", description: "Syllabi, qualifying exam topics, past papers", url: "phd.html", badge: "PhD" },
        // Also include home and about (optional)
        { title: "Home", description: "DU Matrix main page", url: "index.html", badge: "Home" },
        { title: "About", description: "About this project", url: "about.html", badge: "Info" },
        { title: "Contact", description: "Contact us", url: "contact.html", badge: "Info" },
    ];

    const searchInput = document.getElementById("searchInput");
    const searchResults = document.getElementById("searchResults");

    if (searchInput && searchResults) {
        // Load Fuse.js from CDN (if not already loaded)
        if (typeof Fuse === "undefined") {
            const fuseScript = document.createElement("script");
            fuseScript.src = "https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js";
            fuseScript.onload = () => initSearch();
            document.head.appendChild(fuseScript);
        } else {
            initSearch();
        }

        function initSearch() {
            const fuse = new Fuse(searchData, {
                keys: ["title", "description"],
                threshold: 0.3,
                includeScore: true,
            });

            searchInput.addEventListener("input", function() {
                const query = this.value.trim();
                if (query.length < 2) {
                    searchResults.classList.remove("active");
                    return;
                }
                const results = fuse.search(query);
                renderResults(results);
            });

            // Hide results when clicking outside
            document.addEventListener("click", function(e) {
                if (!e.target.closest(".search-container")) {
                    searchResults.classList.remove("active");
                }
            });

            function renderResults(results) {
                if (results.length === 0) {
                    searchResults.innerHTML = `<div class="search-result-item" style="color: var(--text-secondary); cursor: default;">No results found</div>`;
                    searchResults.classList.add("active");
                    return;
                }
                let html = "";
                results.slice(0, 8).forEach(({ item }) => {
                    html += `
                        <a href="${item.url}" class="search-result-item">
                            <div class="result-title">${item.title} <span class="result-badge">${item.badge}</span></div>
                            <div class="result-desc">${item.description}</div>
                        </a>
                    `;
                });
                searchResults.innerHTML = html;
                searchResults.classList.add("active");
            }
        }
    }
});
