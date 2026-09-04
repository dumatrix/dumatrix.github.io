#!/bin/bash

echo "Creating optimized DU Matrix website files..."

# ---------------------------
# index.html
# ---------------------------
cat > index.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DU Matrix | Home</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <meta name="description" content="Academic resources and Mathematics study material for Delhi University students.">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation"><span></span><span></span><span></span></button>
            <a href="index.html" class="logo">
                <img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;">
                <span>DU Matrix</span>
            </a>
            <div class="nav-links" id="navLinks">
                <button class="close-btn" id="closeBtn" aria-label="Close Menu">&times;</button>
                <a href="index.html" class="active">Home</a>
                <a href="bsc-math.html">B.Sc. Math</a>
                <a href="msc-math.html">M.Sc. Math</a>
                <a href="phd.html">Ph.D Math</a>
                <a href="about.html">About</a>
                <a href="contact.html">Contact</a>
                <div class="search-container">
                    <span class="search-icon">🔍</span>
                    <input type="text" id="searchInput" class="search-input" placeholder="Search notes...">
                    <div id="searchResults" class="search-results"></div>
                </div>
            </div>
            <button id="themeToggle" class="theme-toggle" aria-label="Toggle theme">🌙</button>
            <div class="nav-overlay" id="navOverlay"></div>
        </nav>
    </header>

    <main class="container">
        <nav class="breadcrumb"><a href="index.html">Home</a></nav>

        <section class="hero">
            <h1>Welcome to DU Matrix</h1>
            <p class="hero-sub">Your one-stop hub for Mathematics study material</p>
            <div class="hero-cta">
                <a href="bsc-math.html" class="btn btn-primary">📖 B.Sc. Notes</a>
                <a href="msc-math.html" class="btn btn-secondary">🎓 M.Sc. Notes</a>
                <a href="phd.html" class="btn btn-outline">🔬 Ph.D Resources</a>
            </div>
        </section>

        <section class="cards-grid">
            <div class="card"><h2>B.Sc. Math</h2><p>Undergraduate course notes and subject materials.</p><a href="bsc-math.html" class="btn">View Subjects</a></div>
            <div class="card"><h2>M.Sc. Math</h2><p>Postgraduate course notes and resources.</p><a href="msc-math.html" class="btn">View Subjects</a></div>
            <div class="card"><h2>Ph.D Math</h2><p>Research notes and advanced topics.</p><a href="phd.html" class="btn">View Ph.D Math</a></div>
        </section>

        <section class="form-section">
            <h2>📩 Send us a quick message</h2>
            <p>We'll get back to you as soon as possible.</p>
            <form id="homeContactForm" class="inline-form">
                <input type="text" id="homeName" placeholder="Your Name" required>
                <input type="email" id="homeEmail" placeholder="Your Email" required>
                <textarea id="homeMessage" rows="4" placeholder="Message" required></textarea>
                <button type="submit" class="btn">Send Message</button>
                <div id="homeFormStatus" class="form-status"></div>
            </form>
        </section>
    </main>

    <footer><div class="container"><p>&copy; DU Matrix. All rights reserved. | Updated: 25 Aug 2026</p></div></footer>
    <button id="scrollTopBtn" class="scroll-top">↑</button>

    <script src="script.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('homeContactForm');
        const status = document.getElementById('homeFormStatus');
        const scriptURL = 'https://script.google.com/macros/s/AKfycbxADJYnyatKzZKadcZBG10PDP8m52ImM2yMIr4pKhssbwTVg7XYck3R-8tWigdklNMXIg/exec';
        if (form) {
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                status.textContent = 'Sending...';
                status.style.color = '#8b949e';
                const formData = {
                    name: document.getElementById('homeName').value.trim(),
                    email: document.getElementById('homeEmail').value.trim(),
                    message: document.getElementById('homeMessage').value.trim()
                };
                fetch(scriptURL, { method: 'POST', mode: 'no-cors', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(formData) })
                .then(() => { status.textContent = '✅ Message sent!'; status.style.color = '#2ea043'; form.reset(); })
                .catch(() => { status.textContent = '❌ Failed. Please try again.'; status.style.color = '#f85149'; });
            });
        }
    });
    </script>
</body>
</html>
HTML

# ---------------------------
# bsc-math.html
# ---------------------------
cat > bsc-math.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B.Sc. Math | DU Matrix</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation"><span></span><span></span><span></span></button>
            <a href="index.html" class="logo"><img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;"><span>DU Matrix</span></a>
            <div class="nav-links" id="navLinks">
                <button class="close-btn" id="closeBtn" aria-label="Close Menu">&times;</button>
                <a href="index.html">Home</a>
                <a href="bsc-math.html" class="active">B.Sc. Math</a>
                <a href="msc-math.html">M.Sc. Math</a>
                <a href="phd.html">Ph.D Math</a>
                <a href="about.html">About</a>
                <a href="contact.html">Contact</a>
                <div class="search-container"><span class="search-icon">🔍</span><input type="text" id="searchInput" class="search-input" placeholder="Search notes..."><div id="searchResults" class="search-results"></div></div>
            </div>
            <button id="themeToggle" class="theme-toggle" aria-label="Toggle theme">🌙</button>
            <div class="nav-overlay" id="navOverlay"></div>
        </nav>
    </header>
    <main class="container">
        <nav class="breadcrumb"><a href="index.html">Home</a> <span>/</span> B.Sc. Math</nav>
        <section class="page-header"><h1>B.Sc. Math Notes</h1><p>Undergraduate subject study materials and notes.</p></section>
        <section class="cards-grid">
            <div class="card"><h2>Calculus & Real Analysis</h2><p class="card-update">📅 Updated: 20 Aug 2026</p><p>Limits, continuity, multivariable calculus, sequences & series.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Available</span></div>
            <div class="card"><h2>Linear Algebra</h2><p class="card-update">📅 Updated: 18 Aug 2026</p><p>Vector spaces, matrices, eigenvalues, determinants.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Available</span></div>
            <div class="card"><h2>Abstract Algebra</h2><p class="card-update">📅 Updated: 15 Aug 2026</p><p>Group theory, ring theory, fields.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Available</span></div>
            <div class="card"><h2>Differential Equations</h2><p class="card-update">📅 Updated: 10 Aug 2026</p><p>ODE & PDE with applications.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Coming Soon</span></div>
            <div class="card"><h2>Numerical Methods</h2><p class="card-update">📅 Updated: 5 Aug 2026</p><p>Root finding, interpolation, numerical integration.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Coming Soon</span></div>
            <div class="card"><h2>Mechanics</h2><p class="card-update">📅 Updated: 1 Aug 2026</p><p>Statics, dynamics, fluid mechanics.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Coming Soon</span></div>
        </section>
        <section class="form-section">
            <h2>📚 Can't find the notes you need?</h2><p>Fill out the form below – we'll try our best to locate them for you.</p>
            <form id="requestFormBSc" class="inline-form">
                <input type="text" id="reqNameBSc" placeholder="Your Name" required>
                <input type="email" id="reqEmailBSc" placeholder="Your Email" required>
                <textarea id="reqMessageBSc" rows="4" placeholder="Topic / Subject and details" required></textarea>
                <button type="submit" class="btn">Send Request</button>
                <div id="statusBSc" class="form-status"></div>
            </form>
        </section>
    </main>
    <footer><div class="container"><p>&copy; DU Matrix. All rights reserved. | Updated: 25 Aug 2026</p></div></footer>
    <button id="scrollTopBtn" class="scroll-top">↑</button>
    <script src="script.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('requestFormBSc');
        const status = document.getElementById('statusBSc');
        const scriptURL = 'https://script.google.com/macros/s/AKfycbxADJYnyatKzZKadcZBG10PDP8m52ImM2yMIr4pKhssbwTVg7XYck3R-8tWigdklNMXIg/exec';
        if (form) {
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                status.textContent = 'Sending...'; status.style.color = '#8b949e';
                const formData = { name: document.getElementById('reqNameBSc').value.trim(), email: document.getElementById('reqEmailBSc').value.trim(), message: document.getElementById('reqMessageBSc').value.trim() };
                fetch(scriptURL, { method: 'POST', mode: 'no-cors', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(formData) })
                .then(() => { status.textContent = '✅ Request sent!'; status.style.color = '#2ea043'; form.reset(); })
                .catch(() => { status.textContent = '❌ Failed. Please try again.'; status.style.color = '#f85149'; });
            });
        }
    });
    </script>
</body>
</html>
HTML

# ... (repeat for msc-math, phd, about, contact similarly)

# ---------------------------
# style.css (unchanged colors, improved responsiveness)
# ---------------------------
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
[data-theme="light"] {
  --bg-primary: #ffffff;
  --bg-secondary: #f6f8fa;
  --bg-card: #ffffff;
  --text-primary: #24292f;
  --text-secondary: #57606a;
  --text-heading: #1f2328;
  --border-color: #d0d7de;
  --accent: #0969da;
  --btn-bg: #2da44e;
  --btn-hover: #2c974b;
  --badge-bg: #f6f8fa;
  --badge-border: #d0d7de;
  --shadow: rgba(0, 0, 0, 0.1);
}
* { box-sizing: border-box; margin: 0; padding: 0; font-family: "Playfair Display", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
body { background-color: var(--bg-primary); color: var(--text-primary); line-height: 1.6; min-height: 100vh; display: flex; flex-direction: column; transition: background-color 0.3s ease, color 0.3s ease; }
.container { max-width: 1000px; margin: 0 auto; padding: 0 20px; width: 100%; }
header { background-color: var(--bg-secondary); border-bottom: 1px solid var(--border-color); padding: 14px 0; position: sticky; top: 0; z-index: 100; transition: background-color 0.3s ease, border-color 0.3s ease; }
nav { display: flex; justify-content: space-between; align-items: center; }
.logo { font-size: 1.3rem; font-weight: bold; color: var(--accent); text-decoration: none; white-space: nowrap; display: flex; align-items: center; gap: 8px; }
.menu-toggle { display: none; flex-direction: column; justify-content: space-between; width: 26px; height: 18px; background: transparent; border: none; cursor: pointer; padding: 0; }
.menu-toggle span { width: 100%; height: 2.5px; background-color: var(--accent); border-radius: 2px; }
.close-btn { display: none; }
.nav-links { display: flex; align-items: center; gap: 20px; }
.nav-links a { color: var(--text-secondary); text-decoration: none; font-weight: 500; white-space: nowrap; transition: color 0.2s ease; }
.nav-links a:hover, .nav-links a.active { color: var(--accent); }
.theme-toggle { background: transparent; border: none; cursor: pointer; font-size: 1.4rem; padding: 4px 10px; border-radius: 6px; color: var(--text-secondary); transition: background 0.2s, color 0.2s; line-height: 1; }
.theme-toggle:hover { background: var(--border-color); color: var(--text-heading); }
@media (max-width: 768px) {
  .menu-toggle { display: flex; }
  .nav-links { position: fixed; top: 0; left: 0; width: 260px; height: 100vh; background-color: var(--bg-secondary); border-right: 1px solid var(--border-color); flex-direction: column; align-items: flex-start; padding: 65px 25px 25px 25px; gap: 22px; transform: translateX(-100%); transition: transform 0.3s ease-in-out; z-index: 1001; box-shadow: 4px 0 15px var(--shadow); overflow-y: auto; }
  .nav-links.open { transform: translateX(0); }
  .nav-links a { font-size: 1.05rem; width: 100%; padding: 6px 0; border-bottom: 1px solid var(--border-color); }
  .close-btn { display: block; position: absolute; top: 15px; right: 18px; background: none; border: none; color: var(--text-secondary); font-size: 1.8rem; cursor: pointer; line-height: 1; }
  .nav-overlay { display: block; position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(0,0,0,0.65); opacity: 0; pointer-events: none; transition: opacity 0.3s ease-in-out; z-index: 1000; }
  .nav-overlay.open { opacity: 1; pointer-events: auto; }
}
main { flex: 1; padding: 30px 0; }
.hero { text-align: center; padding: 60px 20px; background: linear-gradient(135deg, var(--bg-card) 0%, var(--bg-secondary) 100%); border-radius: 12px; margin-bottom: 40px; border: 1px solid var(--border-color); }
.hero h1 { font-size: 2.2rem; color: var(--text-heading); margin-bottom: 8px; }
.hero-sub { font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 25px; }
.hero-cta { display: flex; justify-content: center; gap: 15px; flex-wrap: wrap; }
.btn-primary { background: var(--btn-bg); color: #fff; }
.btn-secondary { background: var(--bg-primary); border: 1px solid var(--accent); color: var(--accent); }
.btn-outline { background: transparent; border: 1px solid var(--border-color); color: var(--text-primary); }
.btn { display: inline-block; background-color: var(--btn-bg); color: #ffffff; padding: 8px 16px; border-radius: 6px; text-decoration: none; font-weight: 600; font-size: 0.85rem; align-self: flex-start; transition: background 0.2s; }
.btn:hover { background-color: var(--btn-hover); }
.card { background-color: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; padding: 22px; display: flex; flex-direction: column; transition: transform 0.2s, border-color 0.2s, background-color 0.3s ease; }
.card:hover { transform: translateY(-4px); border-color: var(--accent); }
.cards-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 20px; margin-top: 10px; }
.badge { display: inline-block; background-color: var(--badge-bg); color: var(--text-secondary); border: 1px solid var(--badge-border); padding: 5px 14px; border-radius: 20px; font-size: 0.8rem; align-self: flex-start; margin-top: 4px; }
footer { background-color: var(--bg-secondary); border-top: 1px solid var(--border-color); padding: 18px 0; text-align: center; color: var(--text-secondary); font-size: 0.85rem; margin-top: 30px; transition: background-color 0.3s ease, border-color 0.3s ease; }
.breadcrumb { font-size: 0.85rem; color: var(--text-secondary); margin-bottom: 15px; padding: 8px 0; }
.breadcrumb a { color: var(--accent); text-decoration: none; }
.breadcrumb span { margin: 0 6px; color: var(--text-secondary); }
.search-container { position: relative; display: inline-block; }
.search-input { background: var(--bg-primary); border: 1px solid var(--border-color); border-radius: 6px; padding: 6px 12px 6px 32px; color: var(--text-primary); font-size: 0.9rem; width: 160px; transition: width 0.3s ease, border-color 0.2s; }
.search-input:focus { outline: none; border-color: var(--accent); width: 220px; }
.search-icon { position: absolute; left: 8px; top: 50%; transform: translateY(-50%); color: var(--text-secondary); pointer-events: none; font-size: 0.9rem; }
.search-results { position: absolute; top: calc(100% + 8px); left: 0; right: 0; background: var(--bg-secondary); border: 1px solid var(--border-color); border-radius: 8px; max-height: 300px; overflow-y: auto; display: none; z-index: 1000; box-shadow: 0 8px 24px var(--shadow); padding: 4px 0; }
.search-results.active { display: block; }
.search-result-item { padding: 10px 16px; display: block; color: var(--text-primary); text-decoration: none; border-bottom: 1px solid var(--border-color); transition: background 0.15s; }
.search-result-item:hover { background: var(--bg-primary); }
.form-section { margin-top: 50px; border-top: 1px solid #30363d; padding-top: 30px; text-align: center; }
.inline-form { max-width: 600px; margin: 0 auto; display: flex; flex-direction: column; gap: 16px; background: var(--bg-card); padding: 25px; border-radius: 8px; border: 1px solid var(--border-color); }
.inline-form input, .inline-form textarea { width: 100%; padding: 10px; background: var(--bg-primary); border: 1px solid var(--border-color); border-radius: 6px; color: var(--text-primary); font-family: inherit; }
.form-status { text-align: center; margin-top: 8px; display: none; }
.scroll-top { position: fixed; bottom: 25px; right: 25px; background: var(--accent); color: #fff; border: none; border-radius: 50%; width: 40px; height: 40px; font-size: 1.2rem; cursor: pointer; display: none; z-index: 999; box-shadow: 0 4px 15px rgba(0,0,0,0.3); }
.scroll-top.visible { display: block; }
@media (max-width: 600px) { .cards-grid { grid-template-columns: 1fr; } .hero h1 { font-size: 1.8rem; } }
CSS

# ---------------------------
# script.js (with scroll-top, updated search index, drawer)
# ---------------------------
cat > script.js << 'JS'
document.addEventListener("DOMContentLoaded", () => {
    const menuToggle = document.getElementById("menuToggle");
    const closeBtn = document.getElementById("closeBtn");
    const navLinks = document.getElementById("navLinks");
    const navOverlay = document.getElementById("navOverlay");
    function openMenu() { navLinks?.classList.add("open"); navOverlay?.classList.add("open"); document.body.style.overflow = "hidden"; }
    function closeMenu() { navLinks?.classList.remove("open"); navOverlay?.classList.remove("open"); document.body.style.overflow = ""; }
    if (menuToggle) menuToggle.addEventListener("click", openMenu);
    if (closeBtn) closeBtn.addEventListener("click", closeMenu);
    if (navOverlay) navOverlay.addEventListener("click", closeMenu);
    const isMobile = window.innerWidth <= 768;
    const hasVisited = localStorage.getItem("du_matrix_visited");
    if (isMobile && !hasVisited) { setTimeout(() => { openMenu(); localStorage.setItem("du_matrix_visited", "true"); }, 400); }

    // Theme toggle
    const themeToggle = document.getElementById("themeToggle");
    const htmlElement = document.documentElement;
    const storedTheme = localStorage.getItem("theme");
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
    if (storedTheme) htmlElement.setAttribute("data-theme", storedTheme);
    else if (prefersDark) { htmlElement.setAttribute("data-theme", "dark"); localStorage.setItem("theme", "dark"); }
    else { htmlElement.setAttribute("data-theme", "light"); localStorage.setItem("theme", "light"); }
    function updateToggleIcon() { if (themeToggle) themeToggle.textContent = htmlElement.getAttribute("data-theme") === "dark" ? "🌙" : "☀️"; }
    if (themeToggle) themeToggle.addEventListener("click", () => {
        const newTheme = htmlElement.getAttribute("data-theme") === "dark" ? "light" : "dark";
        htmlElement.setAttribute("data-theme", newTheme); localStorage.setItem("theme", newTheme); updateToggleIcon();
    });
    updateToggleIcon();

    // Search
    const searchData = [
        { title: "Calculus & Real Analysis", description: "Limits, continuity, multivariable calculus", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Linear Algebra", description: "Vector spaces, matrices, eigenvalues", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Abstract Algebra", description: "Groups, rings, fields", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Differential Equations", description: "ODE, PDE", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Numerical Methods", description: "Root finding, interpolation", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Mechanics", description: "Statics, dynamics", url: "bsc-math.html", badge: "B.Sc." },
        { title: "Field Theory", description: "Complete notes and solved problems", url: "msc-math.html", badge: "M.Sc." },
        { title: "Real Analysis", description: "Lecture notes", url: "msc-math.html", badge: "M.Sc." },
        { title: "Abstract Algebra", description: "Group theory, ring theory", url: "msc-math.html", badge: "M.Sc." },
        { title: "Topology", description: "Point-set topology", url: "msc-math.html", badge: "M.Sc." },
        { title: "Advanced Algebra", description: "Galois theory, modules", url: "phd.html", badge: "Ph.D" },
        { title: "Functional Analysis", description: "Banach spaces, operators", url: "phd.html", badge: "Ph.D" },
        { title: "Research Methodology", description: "Paper writing, LaTeX", url: "phd.html", badge: "Ph.D" },
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
        } else initSearch();
        function initSearch() {
            const fuse = new Fuse(searchData, { keys: ["title", "description"], threshold: 0.3, includeScore: true });
            searchInput.addEventListener("input", function () {
                const query = this.value.trim();
                if (query.length < 2) { searchResults.classList.remove("active"); return; }
                const results = fuse.search(query);
                renderResults(results);
            });
            document.addEventListener("click", (e) => { if (!e.target.closest(".search-container")) searchResults.classList.remove("active"); });
            function renderResults(results) {
                if (results.length === 0) { searchResults.innerHTML = `<div class="search-result-item" style="color: var(--text-secondary); cursor: default;">No results found</div>`; searchResults.classList.add("active"); return; }
                let html = "";
                results.slice(0, 8).forEach(({ item }) => { html += `<a href="${item.url}" class="search-result-item"><div class="result-title">${item.title} <span class="result-badge">${item.badge}</span></div><div class="result-desc">${item.description}</div></a>`; });
                searchResults.innerHTML = html; searchResults.classList.add("active");
            }
        }
    }

    // Scroll to top button
    const scrollTopBtn = document.getElementById("scrollTopBtn");
    if (scrollTopBtn) {
        window.addEventListener("scroll", () => { if (window.scrollY > 300) scrollTopBtn.classList.add("visible"); else scrollTopBtn.classList.remove("visible"); });
        scrollTopBtn.addEventListener("click", () => window.scrollTo({ top: 0, behavior: "smooth" }));
    }
});
JS

# Add .nojekyll to prevent Jekyll processing
touch .nojekyll

# Git operations
git add .
git commit -m "Optimized website: responsive, smooth animations, improved performance"
git push origin main

echo "✅ Done! Changes pushed to GitHub."
