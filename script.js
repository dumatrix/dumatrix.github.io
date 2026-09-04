document.addEventListener("DOMContentLoaded", () => {
    // Mobile drawer
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

    // Search toggle (icon opens search box)
    const searchToggle = document.getElementById("searchToggle");
    const searchBox = document.querySelector(".search-box");
    if (searchToggle && searchBox) {
        searchToggle.addEventListener("click", (e) => {
            e.stopPropagation();
            searchBox.classList.toggle("hidden");
            if (!searchBox.classList.contains("hidden")) {
                document.getElementById("searchInput").focus();
            }
        });

        // Close when clicking outside
        document.addEventListener("click", (e) => {
            if (!e.target.closest(".search-container") && !searchBox.classList.contains("hidden")) {
                searchBox.classList.add("hidden");
            }
        });
    }

    // Scroll to top
    const scrollTopBtn = document.getElementById("scrollTopBtn");
    if (scrollTopBtn) {
        window.addEventListener("scroll", () => {
            if (window.scrollY > 300) {
                scrollTopBtn.classList.add("visible");
            } else {
                scrollTopBtn.classList.remove("visible");
            }
        });
        scrollTopBtn.addEventListener("click", () => {
            window.scrollTo({ top: 0, behavior: "smooth" });
        });
    }

    // Search functionality
    const searchData = [
        { title: "Calculus & Real Analysis", description: "Limits, continuity, multivariable calculus", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Linear Algebra", description: "Vector spaces, matrices, eigenvalues", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Abstract Algebra", description: "Groups, rings, fields", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Differential Equations", description: "ODE, PDE", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Numerical Methods", description: "Root finding, interpolation", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Mechanics", description: "Statics, dynamics", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Field Theory", description: "Complete notes", url: "msc-math.html", badge: "M.Sc." },
        { title: "Real Analysis", description: "Lecture notes", url: "msc-math.html", badge: "M.Sc." },
        { title: "Abstract Algebra", description: "Group theory, ring theory", url: "msc-math.html", badge: "M.Sc." },
        { title: "Topology", description: "Point-set topology", url: "msc-math.html", badge: "M.Sc." },
        { title: "Advanced Algebra", description: "Galois theory", url: "phd.html", badge: "Ph.D" },
        { title: "Functional Analysis", description: "Banach spaces, operators", url: "phd.html", badge: "Ph.D" },
        { title: "Research Methodology", description: "Paper writing", url: "phd.html", badge: "Ph.D" },
        { title: "Home", description: "Main page", url: "index.html", badge: "Home" },
        { title: "About", description: "About DU Matrix", url: "about.html", badge: "Info" },
        { title: "Contact", description: "Get in touch", url: "contact.html", badge: "Info" }
    ];

    const searchInput = document.getElementById("searchInput");
    const searchResults = document.getElementById("searchResults");

    if (searchInput && searchResults) {
        if (typeof Fuse === "undefined") {
            const fuseScript = document.createElement("script");
            fuseScript.src = "https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js";
            fuseScript.onload = () => initSearch();
            document.head.appendChild(fuseScript);
        } else {
            initSearch();
        }

        function initSearch() {
            const fuse = new Fuse(searchData, { keys: ["title", "description"], threshold: 0.3, includeScore: true });

            searchInput.addEventListener("input", function() {
                const query = this.value.trim();
                if (query.length < 2) {
                    searchResults.innerHTML = "";
                    return;
                }
                const results = fuse.search(query);
                let html = "";
                results.slice(0, 8).forEach(({ item }) => {
                    html += `<a href="${item.url}" class="search-result-item"><div>${item.title} <span class="badge">${item.badge}</span></div></a>`;
                });
                searchResults.innerHTML = html;
            });
        }
    }
});
