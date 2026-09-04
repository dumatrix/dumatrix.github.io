#!/bin/bash

# 1. Fix HTML structure using Python
python3 << 'PYEOF'
import re

files = ['index.html', 'bsc-math.html', 'msc-math.html', 'phd.html', 'about.html', 'contact.html']

for filename in files:
    try:
        with open(filename, 'r') as f:
            content = f.read()

        # Extract existing nav links content (to keep your links intact)
        match = re.search(r'<div class="nav-links" id="navLinks">(.*?)</div>', content, re.S)
        nav_links = match.group(1) if match else ""

        # Build new header with 3 sections: Left (Menu + Links), Center (Logo), Right (Search)
        new_header = f'''<header>
            <nav class="container">
                <div class="nav-left">
                    <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation">
                        <span></span><span></span><span></span>
                    </button>
                    <div class="nav-links" id="navLinks">
                        {nav_links}
                    </div>
                </div>
                <a href="index.html" class="logo">
                    <img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;">
                    <span>DU Matrix</span>
                </a>
                <div class="nav-right">
                    <div class="search-container">
                        <button id="searchToggle" class="search-toggle" aria-label="Open Search">🔍</button>
                        <div class="search-box hidden">
                            <input type="text" id="searchInput" class="search-input" placeholder="Search notes...">
                            <div id="searchResults" class="search-results"></div>
                        </div>
                    </div>
                </div>
                <div class="nav-overlay" id="navOverlay"></div>
            </nav>
        </header>'''

        # Replace header block
        content = re.sub(r'<header>.*?</header>', new_header, content, flags=re.S)

        with open(filename, 'w') as f:
            f.write(content)
        print(f"Fixed header in {filename}")
    except Exception as e:
        print(f"Skipping {filename}: {e}")
PYEOF

# 2. Update CSS (Fix the Grid layout so Logo is centered and no overlap)
cat > style.css << 'CSS'
:root {
  --bg-primary: #0d1117;
  --bg-secondary: #161b22;
  --bg-card: #161b22;
  --text-primary: #c9d1d9;
  --text-secondary: #8b949e;
  --text-heading: #f0f6fc;
  --border-color: #30363d;
  --accent: #58a6ff;
  --btn-bg: #238636;
  --btn-hover: #2ea043;
  --badge-bg: #21262d;
  --badge-border: #30363d;
  --shadow: rgba(0, 0, 0, 0.5);
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: "Playfair Display", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  line-height: 1.6;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 0 20px;
  width: 100%;
}

header {
  background-color: var(--bg-secondary);
  border-bottom: 1px solid var(--border-color);
  padding: 14px 0;
  position: sticky;
  top: 0;
  z-index: 100;
  transition: background-color 0.3s ease, border-color 0.3s ease;
}

/* CRITICAL FIX: Use CSS Grid to prevent overlap */
nav {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  gap: 15px;
}

/* Left Section: Hamburger + Nav Links */
.nav-left {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 10px;
}

/* Center Section: Logo perfectly centered */
.logo {
  font-size: 1.3rem;
  font-weight: bold;
  color: var(--accent);
  text-decoration: none;
  white-space: nowrap;
  display: flex;
  align-items: center;
  gap: 8px;
  justify-self: center;
}

/* Right Section: Search Icon */
.nav-right {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 10px;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 20px;
}

.nav-links a {
  color: var(--text-secondary);
  text-decoration: none;
  font-weight: 500;
  white-space: nowrap;
  transition: color 0.2s ease;
}

.nav-links a:hover, .nav-links a.active {
  color: var(--accent);
}

/* Mobile styles */
@media (max-width: 768px) {
  nav {
    grid-template-columns: auto 1fr auto;
  }
  .logo {
    font-size: 1.1rem;
  }
  .logo img {
    height: 35px !important;
  }
  .menu-toggle {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    width: 26px;
    height: 18px;
    background: transparent;
    border: none;
    cursor: pointer;
    padding: 0;
  }
  .menu-toggle span {
    width: 100%;
    height: 2.5px;
    background-color: var(--accent);
    border-radius: 2px;
  }
  .nav-links {
    position: fixed;
    top: 0;
    left: 0;
    width: 260px;
    height: 100vh;
    background-color: var(--bg-secondary);
    border-right: 1px solid var(--border-color);
    flex-direction: column;
    align-items: flex-start;
    padding: 65px 25px 25px 25px;
    gap: 22px;
    transform: translateX(-100%);
    transition: transform 0.3s ease-in-out;
    z-index: 1001;
    box-shadow: 4px 0 15px var(--shadow);
    overflow-y: auto;
  }
  .nav-links.open {
    transform: translateX(0);
  }
  .close-btn {
    display: block;
    position: absolute;
    top: 15px;
    right: 18px;
    background: none;
    border: none;
    color: var(--text-secondary);
    font-size: 1.8rem;
    cursor: pointer;
    line-height: 1;
  }
  .close-btn:hover {
    color: var(--text-heading);
  }
  .nav-overlay {
    display: block;
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(0, 0, 0, 0.65);
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.3s ease-in-out;
    z-index: 1000;
  }
  .nav-overlay.open {
    opacity: 1;
    pointer-events: auto;
  }
}

/* Search Box Toggle */
.search-toggle {
  background: transparent;
  border: none;
  cursor: pointer;
  font-size: 1.3rem;
  color: var(--text-secondary);
  padding: 4px;
  transition: color 0.2s;
}
.search-toggle:hover {
  color: var(--accent);
}
.search-box {
  position: absolute;
  top: 100%;
  right: 0;
  background: var(--bg-secondary);
  border: 1px solid var(--border-color);
  border-radius: 8px;
  padding: 10px;
  width: 300px;
  box-shadow: 0 8px 24px var(--shadow);
  z-index: 1001;
}
.search-box.hidden {
  display: none;
}
.search-input {
  width: 100%;
  background: var(--bg-primary);
  border: 1px solid var(--border-color);
  border-radius: 6px;
  padding: 8px 12px;
  color: var(--text-primary);
  font-size: 0.9rem;
}
.search-input:focus {
  outline: none;
  border-color: var(--accent);
}
.search-results {
  margin-top: 8px;
  max-height: 200px;
  overflow-y: auto;
}
.search-result-item {
  padding: 8px;
  display: block;
  color: var(--text-primary);
  text-decoration: none;
  border-bottom: 1px solid var(--border-color);
}
.search-result-item:hover {
  background: var(--bg-primary);
}

/* Cards & Buttons (Preserved) */
.btn { display: inline-block; background-color: var(--btn-bg); color: #fff; padding: 8px 16px; border-radius: 6px; text-decoration: none; font-weight: 600; font-size: 0.85rem; transition: background 0.2s; cursor: pointer; border: none; }
.btn:hover { background-color: var(--btn-hover); }
.cards-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 20px; margin-top: 10px; }
.card { background-color: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; padding: 22px; display: flex; flex-direction: column; transition: transform 0.2s, border-color 0.2s; }
.card:hover { transform: translateY(-4px); border-color: var(--accent); }
.badge { display: inline-block; background-color: var(--badge-bg); color: var(--text-secondary); border: 1px solid var(--badge-border); padding: 5px 14px; border-radius: 20px; font-size: 0.8rem; align-self: flex-start; margin-top: 4px; }
footer { background-color: var(--bg-secondary); border-top: 1px solid var(--border-color); padding: 18px 0; text-align: center; color: var(--text-secondary); font-size: 0.85rem; margin-top: 30px; }
.scroll-top { position: fixed; bottom: 25px; right: 25px; background: var(--accent); color: #fff; border: none; border-radius: 50%; width: 40px; height: 40px; font-size: 1.2rem; cursor: pointer; display: none; z-index: 999; }
.scroll-top.visible { display: block; }
@media (max-width: 600px) { .cards-grid { grid-template-columns: 1fr; } }
CSS

# 3. Update JavaScript (for Drawer & Search)
cat > script.js << 'JS'
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
JS

# 4. Push to GitHub
git add .
git commit -m "Fixed header layout: Logo centered, Nav left, Search right"
git push origin main

echo "✅ Done! Refresh your website - the overlap is fixed and layout is perfect."
