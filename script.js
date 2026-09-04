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

    // ---------- SEARCH TOGGLE ----------
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

        document.addEventListener("click", (e) => {
            if (!e.target.closest(".search-container") && !searchBox.classList.contains("hidden")) {
                searchBox.classList.add("hidden");
            }
        });
    }

    // ---------- KEYBOARD SHORTCUT FOR SEARCH (Press "/") ----------
    document.addEventListener("keydown", (e) => {
        if (e.key === "/" && !["INPUT", "TEXTAREA"].includes(document.activeElement.tagName)) {
            e.preventDefault();
            if (searchToggle) {
                searchToggle.click();
                setTimeout(() => document.getElementById("searchInput").focus(), 100);
            }
        }
    });

    // ---------- DYNAMIC COPYRIGHT YEAR ----------
    const year = new Date().getFullYear();
    const footerText = document.querySelector("footer p");
    if (footerText) {
        footerText.innerHTML = `&copy; DU Matrix. All rights reserved. | Updated: ${year}`;
    }

    // ---------- SEARCH DATA & LOGIC (WITH DEBOUNCING) ----------
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
        // Pages
        { title: "Home", description: "DU Matrix main page", url: "index.html", badge: "Home" },
        { title: "About", description: "About this project", url: "about.html", badge: "Info" },
        { title: "Contact", description: "Contact us", url: "contact.html", badge: "Info" },
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
            const fuse = new Fuse(searchData, {
                keys: ["title", "description"],
                threshold: 0.3,
                includeScore: true,
            });

            let debounceTimer;
            searchInput.addEventListener("input", function() {
                clearTimeout(debounceTimer);
                const input = this;
                debounceTimer = setTimeout(() => {
                    const query = input.value.trim();
                    if (query.length < 2) {
                        searchResults.innerHTML = "";
                        return;
                    }
                    const results = fuse.search(query);
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
                }, 200); // 200ms debounce
            });
        }
    }
});

// Dynamic year in footer
document.addEventListener("DOMContentLoaded", function() {
    const yearSpan = document.getElementById("year");
    if (yearSpan) {
        yearSpan.textContent = new Date().getFullYear();
    }
});
