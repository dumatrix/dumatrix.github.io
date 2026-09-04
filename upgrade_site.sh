#!/bin/bash

echo "Starting website upgrades..."

# =====================================================
# 1. CREATE CUSTOM 404 PAGE
# =====================================================
cat > 404.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found | DU Matrix</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div style="text-align: center; padding: 100px 20px;">
        <h1 style="font-size: 4rem; color: var(--accent);">404</h1>
        <p>Oops! This page doesn't exist.</p>
        <a href="index.html" class="btn">Go Home</a>
    </div>
</body>
</html>
HTML
echo "✅ Created 404.html"

# =====================================================
# 2 & 3. ADD PRECONNECT & OG TAGS TO ALL HTML FILES
# =====================================================
python3 << 'PYEOF'
import re

files = ['index.html', 'bsc-math.html', 'msc-math.html', 'phd.html', 'about.html', 'contact.html']

for filename in files:
    try:
        with open(filename, 'r') as f:
            content = f.read()
        
        # Add preconnect for Google Fonts if not present
        if 'preconnect' not in content:
            content = content.replace(
                '<link href="https://fonts.googleapis.com',
                '<link rel="preconnect" href="https://fonts.googleapis.com">\n    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>\n    <link href="https://fonts.googleapis.com'
            )
        
        # Add OG meta tags to all files for consistency
        og_tags = '''    <meta property="og:title" content="DU Matrix">
    <meta property="og:description" content="Academic resources and Mathematics study material.">
    <meta property="og:image" content="https://dumatrix.github.io/DU_Matrix%20no%20Bg.png">
    <meta property="og:url" content="https://dumatrix.github.io/">
'''
        if 'og:title' not in content:
            content = re.sub(r'(<title>.*?</title>)', r'\1\n' + og_tags, content)
        
        with open(filename, 'w') as f:
            f.write(content)
        print(f"✅ Updated {filename}")
    except Exception as e:
        print(f"⚠️ Skipping {filename}: {e}")
PYEOF

# =====================================================
# 10. ADD SMOOTH PAGE FADE-IN TO CSS
# =====================================================
cat >> style.css << 'CSS'

/* Smooth page fade-in */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}
main {
    animation: fadeIn 0.5s ease-out;
}
CSS
echo "✅ Added smooth page fade-in"

# =====================================================
# 4, 5, 6. UPDATE SCRIPT.JS (Debounce, Shortcut, Year)
# =====================================================
cat > script.js << 'JS'
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
JS
echo "✅ Updated script.js with debounce, keyboard shortcut, dynamic year"

# =====================================================
# COMMIT AND PUSH
# =====================================================
git add .
git commit -m "Added: 404 page, OG tags, preconnect, search debounce, keyboard shortcut, dynamic year, fade-in animation"
git push origin main

echo "🎉 All upgrades applied and pushed to GitHub!"
