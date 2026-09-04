#!/bin/bash

# ---- INDEX.HTML ----
cat > index.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DU Matrix | Home</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation">
                <span></span><span></span><span></span>
            </button>
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
            </div>
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
                <label for="homeName">Your Name</label>
                <input type="text" id="homeName" name="name" required>
                <label for="homeEmail">Your Email</label>
                <input type="email" id="homeEmail" name="email" required>
                <label for="homeMessage">Message</label>
                <textarea id="homeMessage" name="message" rows="4" required></textarea>
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

# ---- BSC-MATH.HTML ----
cat > bsc-math.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B.Sc. Math | DU Matrix</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation">
                <span></span><span></span><span></span>
            </button>
            <a href="index.html" class="logo">
                <img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;">
                <span>DU Matrix</span>
            </a>
            <div class="nav-links" id="navLinks">
                <button class="close-btn" id="closeBtn" aria-label="Close Menu">&times;</button>
                <a href="index.html">Home</a>
                <a href="bsc-math.html" class="active">B.Sc. Math</a>
                <a href="msc-math.html">M.Sc. Math</a>
                <a href="phd.html">Ph.D Math</a>
                <a href="about.html">About</a>
                <a href="contact.html">Contact</a>
            </div>
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
                <label for="reqNameBSc">Your Name</label>
                <input type="text" id="reqNameBSc" name="name" required>
                <label for="reqEmailBSc">Your Email</label>
                <input type="email" id="reqEmailBSc" name="email" required>
                <label for="reqMessageBSc">Topic / Subject and details</label>
                <textarea id="reqMessageBSc" name="message" rows="4" required></textarea>
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

# ---- MSC-MATH.HTML ----
cat > msc-math.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>M.Sc. Math | DU Matrix</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation">
                <span></span><span></span><span></span>
            </button>
            <a href="index.html" class="logo">
                <img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;">
                <span>DU Matrix</span>
            </a>
            <div class="nav-links" id="navLinks">
                <button class="close-btn" id="closeBtn" aria-label="Close Menu">&times;</button>
                <a href="index.html">Home</a>
                <a href="bsc-math.html">B.Sc. Math</a>
                <a href="msc-math.html" class="active">M.Sc. Math</a>
                <a href="phd.html">Ph.D Math</a>
                <a href="about.html">About</a>
                <a href="contact.html">Contact</a>
            </div>
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
    </header>

    <main class="container">
        <nav class="breadcrumb"><a href="index.html">Home</a> <span>/</span> M.Sc. Math</nav>
        <section class="page-header"><h1>M.Sc. Math Notes</h1><p>Subject study materials.</p></section>
        <section class="cards-grid">
            <div class="card"><h2>Field Theory</h2><p class="card-update">📅 Updated: 25 Aug 2026</p><p>Complete notes and solved problems.</p><a href="https://mega.nz/file/tnIGCBiR#8q-n-6fLBFrbM5m6pzRH73NpDfWMYKuRN1LP-jF72vo" class="btn" target="_blank" rel="noopener noreferrer">📥 Download Notes</a><span class="badge">Available</span></div>
            <div class="card"><h2>Real Analysis</h2><p class="card-update">📅 Updated: 22 Aug 2026</p><p>Lecture notes and reference material.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Coming Soon</span></div>
        </section>
        <section class="form-section">
            <h2>📚 Can't find the notes you need?</h2><p>Fill out the form below – we'll try our best to locate them for you.</p>
            <form id="requestFormMSc" class="inline-form">
                <label for="reqNameMSc">Your Name</label>
                <input type="text" id="reqNameMSc" name="name" required>
                <label for="reqEmailMSc">Your Email</label>
                <input type="email" id="reqEmailMSc" name="email" required>
                <label for="reqMessageMSc">Topic / Subject and details</label>
                <textarea id="reqMessageMSc" name="message" rows="4" required></textarea>
                <button type="submit" class="btn">Send Request</button>
                <div id="statusMSc" class="form-status"></div>
            </form>
        </section>
    </main>
    <footer><div class="container"><p>&copy; DU Matrix. All rights reserved. | Updated: 25 Aug 2026</p></div></footer>
    <button id="scrollTopBtn" class="scroll-top">↑</button>
    <script src="script.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('requestFormMSc');
        const status = document.getElementById('statusMSc');
        const scriptURL = 'https://script.google.com/macros/s/AKfycbxADJYnyatKzZKadcZBG10PDP8m52ImM2yMIr4pKhssbwTVg7XYck3R-8tWigdklNMXIg/exec';
        if (form) {
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                status.textContent = 'Sending...'; status.style.color = '#8b949e';
                const formData = { name: document.getElementById('reqNameMSc').value.trim(), email: document.getElementById('reqEmailMSc').value.trim(), message: document.getElementById('reqMessageMSc').value.trim() };
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

# ---- PHD.HTML ----
cat > phd.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PhD Mathematics | DU Matrix</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation">
                <span></span><span></span><span></span>
            </button>
            <a href="index.html" class="logo">
                <img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;">
                <span>DU Matrix</span>
            </a>
            <div class="nav-links" id="navLinks">
                <button class="close-btn" id="closeBtn" aria-label="Close Menu">&times;</button>
                <a href="index.html">Home</a>
                <a href="bsc-math.html">B.Sc. Math</a>
                <a href="msc-math.html">M.Sc. Math</a>
                <a href="phd.html" class="active">Ph.D Math</a>
                <a href="about.html">About</a>
                <a href="contact.html">Contact</a>
            </div>
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
    </header>

    <main class="container">
        <nav class="breadcrumb"><a href="index.html">Home</a> <span>/</span> Ph.D Math</nav>
        <section class="page-header"><h1>PhD Mathematics Resources</h1><p>Advanced study materials, research topics, and coursework notes.</p></section>
        <section class="cards-grid">
            <div class="card"><h2>Advanced Algebra</h2><p class="card-update">📅 Updated: 20 Aug 2026</p><p>Galois theory, module theory, commutative algebra.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Available</span></div>
            <div class="card"><h2>Functional Analysis</h2><p class="card-update">📅 Updated: 18 Aug 2026</p><p>Banach spaces, Hilbert spaces, operator theory.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Available</span></div>
            <div class="card"><h2>Topology</h2><p class="card-update">📅 Updated: 15 Aug 2026</p><p>Point-set topology, algebraic topology.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Available</span></div>
            <div class="card"><h2>Research Methodology</h2><p class="card-update">📅 Updated: 10 Aug 2026</p><p>Paper writing, LaTeX, research tools.</p><a href="https://drive.google.com/your-link" class="btn" target="_blank" rel="noopener noreferrer">📥 Download</a><span class="badge">Coming Soon</span></div>
        </section>
        <section class="form-section">
            <h2>📚 Can't find the notes you need?</h2><p>Fill out the form below – we'll try our best to locate them for you.</p>
            <form id="requestFormPhD" class="inline-form">
                <label for="reqNamePhD">Your Name</label>
                <input type="text" id="reqNamePhD" name="name" required>
                <label for="reqEmailPhD">Your Email</label>
                <input type="email" id="reqEmailPhD" name="email" required>
                <label for="reqMessagePhD">Topic / Subject and details</label>
                <textarea id="reqMessagePhD" name="message" rows="4" required></textarea>
                <button type="submit" class="btn">Send Request</button>
                <div id="statusPhD" class="form-status"></div>
            </form>
        </section>
    </main>
    <footer><div class="container"><p>&copy; DU Matrix. All rights reserved. | Updated: 25 Aug 2026</p></div></footer>
    <button id="scrollTopBtn" class="scroll-top">↑</button>
    <script src="script.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('requestFormPhD');
        const status = document.getElementById('statusPhD');
        const scriptURL = 'https://script.google.com/macros/s/AKfycbxADJYnyatKzZKadcZBG10PDP8m52ImM2yMIr4pKhssbwTVg7XYck3R-8tWigdklNMXIg/exec';
        if (form) {
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                status.textContent = 'Sending...'; status.style.color = '#8b949e';
                const formData = { name: document.getElementById('reqNamePhD').value.trim(), email: document.getElementById('reqEmailPhD').value.trim(), message: document.getElementById('reqMessagePhD').value.trim() };
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

# ---- ABOUT.HTML ----
cat > about.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About | DU Matrix</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation">
                <span></span><span></span><span></span>
            </button>
            <a href="index.html" class="logo">
                <img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;">
                <span>DU Matrix</span>
            </a>
            <div class="nav-links" id="navLinks">
                <button class="close-btn" id="closeBtn" aria-label="Close Menu">&times;</button>
                <a href="index.html">Home</a>
                <a href="bsc-math.html">B.Sc. Math</a>
                <a href="msc-math.html">M.Sc. Math</a>
                <a href="phd.html">Ph.D Math</a>
                <a href="about.html" class="active">About</a>
                <a href="contact.html">Contact</a>
            </div>
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
    </header>

    <main class="container">
        <nav class="breadcrumb"><a href="index.html">Home</a> <span>/</span> About</nav>
        <section class="page-header"><h1>About DU Matrix</h1><p>A fun passion project built by a curious Delhi University student.</p></section>
        <section class="cards-grid">
            <div class="card"><h2>The Story</h2><p>DU Matrix was built by a curious Delhi University student driven by a passion for exploring new concepts, learning web development, and creating helpful tools. Built purely for fun, this site serves as a central hub for academic learning.</p></div>
            <div class="card"><h2>What You Can Do Here</h2><p>You can easily browse, read, and download curated lecture notes, study materials, and subject resources for B.Sc., M.Sc. Math, and PhD research topics—all in one clean, distraction-free environment.</p></div>
            <div class="card"><h2>Share Your Ideas</h2><p>Since this project is continuously evolving, your feedback is super valuable! Have suggestions for new topics, features, or improvements? Feel free to share your ideas on what we should add next.</p><span class="badge">Ideas & Feedback Welcome</span></div>
        </section>
        <section class="form-section">
            <h2>💬 Have a suggestion or question?</h2><p>We'd love to hear your ideas – drop us a message below.</p>
            <form id="suggestionForm" class="inline-form">
                <label for="sugName">Your Name</label>
                <input type="text" id="sugName" name="name" required>
                <label for="sugEmail">Your Email</label>
                <input type="email" id="sugEmail" name="email" required>
                <label for="sugMessage">Your message / suggestion</label>
                <textarea id="sugMessage" name="message" rows="4" required></textarea>
                <button type="submit" class="btn">Send Message</button>
                <div id="statusSug" class="form-status"></div>
            </form>
        </section>
    </main>
    <footer><div class="container"><p>&copy; DU Matrix. All rights reserved. | Updated: 25 Aug 2026</p></div></footer>
    <button id="scrollTopBtn" class="scroll-top">↑</button>
    <script src="script.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('suggestionForm');
        const status = document.getElementById('statusSug');
        const scriptURL = 'https://script.google.com/macros/s/AKfycbxADJYnyatKzZKadcZBG10PDP8m52ImM2yMIr4pKhssbwTVg7XYck3R-8tWigdklNMXIg/exec';
        if (form) {
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                status.textContent = 'Sending...'; status.style.color = '#8b949e';
                const formData = { name: document.getElementById('sugName').value.trim(), email: document.getElementById('sugEmail').value.trim(), message: document.getElementById('sugMessage').value.trim() };
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

# ---- CONTACT.HTML ----
cat > contact.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact | DU Matrix</title>
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav class="container">
            <button class="menu-toggle" id="menuToggle" aria-label="Toggle Navigation">
                <span></span><span></span><span></span>
            </button>
            <a href="index.html" class="logo">
                <img src="DU_Matrix no Bg.png" alt="DU Matrix Logo" loading="lazy" style="height: 45px; width: auto; object-fit: contain; display: block;">
                <span>DU Matrix</span>
            </a>
            <div class="nav-links" id="navLinks">
                <button class="close-btn" id="closeBtn" aria-label="Close Menu">&times;</button>
                <a href="index.html">Home</a>
                <a href="bsc-math.html">B.Sc. Math</a>
                <a href="msc-math.html">M.Sc. Math</a>
                <a href="phd.html">Ph.D Math</a>
                <a href="about.html">About</a>
                <a href="contact.html" class="active">Contact</a>
            </div>
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
    </header>

    <main class="container">
        <nav class="breadcrumb"><a href="index.html">Home</a> <span>/</span> Contact</nav>
        <section class="page-header"><h1>Contact Us</h1><p>We'd love to hear from you! Fill out the form below or reach us via social channels.</p></section>
        <section class="cards-grid" style="grid-template-columns: 1fr; max-width: 600px; margin: 0 auto 30px;">
            <div class="card">
                <form id="contactForm" class="inline-form">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" name="name" required>
                    <label for="email">Your Email</label>
                    <input type="email" id="email" name="email" required>
                    <label for="message">Message</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                    <button type="submit" class="btn">Send Message</button>
                    <div id="formStatus" class="form-status"></div>
                </form>
            </div>
        </section>
        <section class="cards-grid">
            <div class="card"><h2>📧 Gmail</h2><p><a href="mailto:dumatrix.du@gmail.com" style="color: #58a6ff; text-decoration: none;">dumatrix.du@gmail.com</a></p><span class="badge">Email</span></div>
            <div class="card"><h2>🧵 Reddit</h2><p><a href="https://www.reddit.com/r/du_matrix" target="_blank" rel="noopener noreferrer" style="color: #58a6ff; text-decoration: none;">r/du_matrix</a></p><span class="badge">Subreddit</span></div>
            <div class="card"><h2>📸 Instagram</h2><p><a href="https://www.instagram.com/du_matrix/" target="_blank" rel="noopener noreferrer" style="color: #58a6ff; text-decoration: none;">@du_matrix</a></p><span class="badge">Instagram</span></div>
        </section>
    </main>
    <footer><div class="container"><p>&copy; DU Matrix. All rights reserved. | Updated: 25 Aug 2026</p></div></footer>
    <button id="scrollTopBtn" class="scroll-top">↑</button>
    <script src="script.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('contactForm');
        const status = document.getElementById('formStatus');
        const scriptURL = 'https://script.google.com/macros/s/AKfycbxADJYnyatKzZKadcZBG10PDP8m52ImM2yMIr4pKhssbwTVg7XYck3R-8tWigdklNMXIg/exec';
        if (form) {
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                status.textContent = 'Sending...'; status.style.color = '#8b949e';
                const formData = { name: document.getElementById('name').value.trim(), email: document.getElementById('email').value.trim(), message: document.getElementById('message').value.trim() };
                fetch(scriptURL, { method: 'POST', mode: 'no-cors', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(formData) })
                .then(() => { status.textContent = '✅ Message sent successfully!'; status.style.color = '#2ea043'; form.reset(); })
                .catch(() => { status.textContent = '❌ Failed. Please try again.'; status.style.color = '#f85149'; });
            });
        }
    });
    </script>
</body>
</html>
HTML

# ---- STYLE.CSS ----
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

nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  font-size: 1.3rem;
  font-weight: bold;
  color: var(--accent);
  text-decoration: none;
  white-space: nowrap;
  display: flex;
  align-items: center;
  gap: 8px;
}

.menu-toggle {
  display: none;
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

.close-btn {
  display: none;
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

.nav-links a:hover,
.nav-links a.active {
  color: var(--accent);
}

.nav-right {
  display: flex;
  align-items: center;
  gap: 10px;
}

/* Search Toggle */
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

/* Nav overlay (for mobile drawer) */
.nav-overlay {
  display: none;
}

/* Forms - Stacked */
.inline-form {
  max-width: 600px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 12px;
  background: var(--bg-card);
  padding: 25px;
  border-radius: 8px;
  border: 1px solid var(--border-color);
}

.inline-form label {
  color: var(--text-heading);
  font-weight: 500;
  margin-bottom: -5px; /* tighter gap */
}

.inline-form input,
.inline-form textarea {
  width: 100%;
  padding: 10px;
  background: var(--bg-primary);
  border: 1px solid var(--border-color);
  border-radius: 6px;
  color: var(--text-primary);
  font-size: 1rem;
  box-sizing: border-box;
  font-family: inherit;
}

.inline-form input:focus,
.inline-form textarea:focus {
  outline: none;
  border-color: var(--accent);
}

.form-status {
  text-align: center;
  margin-top: 8px;
  display: none;
}

/* Other styles */
.breadcrumb {
  font-size: 0.85rem;
  color: var(--text-secondary);
  margin-bottom: 15px;
  padding: 8px 0;
}
.breadcrumb a { color: var(--accent); text-decoration: none; }
.breadcrumb span { margin: 0 6px; }

.hero {
  text-align: center;
  padding: 60px 20px;
  background: linear-gradient(135deg, var(--bg-card) 0%, var(--bg-secondary) 100%);
  border-radius: 12px;
  margin-bottom: 40px;
  border: 1px solid var(--border-color);
}
.hero h1 { font-size: 2.2rem; color: var(--text-heading); margin-bottom: 8px; }
.hero-sub { font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 25px; }
.hero-cta { display: flex; justify-content: center; gap: 15px; flex-wrap: wrap; }
.btn-primary { background: var(--btn-bg); color: #fff; }
.btn-secondary { background: var(--bg-primary); border: 1px solid var(--accent); color: var(--accent); }
.btn-outline { background: transparent; border: 1px solid var(--border-color); color: var(--text-primary); }

.btn {
  display: inline-block;
  background-color: var(--btn-bg);
  color: #ffffff;
  padding: 8px 16px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 600;
  font-size: 0.85rem;
  align-self: flex-start;
  transition: background 0.2s, transform 0.15s;
  cursor: pointer;
  border: none;
}
.btn:hover { background-color: var(--btn-hover); transform: translateY(-2px); }

.cards-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 20px; margin-top: 10px; }
.card { background-color: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; padding: 22px; display: flex; flex-direction: column; transition: transform 0.2s, border-color 0.2s; }
.card:hover { transform: translateY(-4px); border-color: var(--accent); }
.card h2 { font-size: 1.2rem; color: var(--text-heading); margin-bottom: 8px; }
.card p { color: var(--text-secondary); margin-bottom: 16px; font-size: 0.9rem; }
.card-update { font-size: 0.75rem !important; color: var(--text-secondary) !important; margin: 4px 0 8px 0 !important; opacity: 0.8; }
.badge { display: inline-block; background-color: var(--badge-bg); color: var(--text-secondary); border: 1px solid var(--badge-border); padding: 5px 14px; border-radius: 20px; font-size: 0.8rem; align-self: flex-start; margin-top: 4px; }

footer { background-color: var(--bg-secondary); border-top: 1px solid var(--border-color); padding: 18px 0; text-align: center; color: var(--text-secondary); font-size: 0.85rem; margin-top: 30px; }
.scroll-top { position: fixed; bottom: 25px; right: 25px; background: var(--accent); color: #fff; border: none; border-radius: 50%; width: 40px; height: 40px; font-size: 1.2rem; cursor: pointer; display: none; z-index: 999; }
.scroll-top.visible { display: block; }

@media (max-width: 768px) {
  .menu-toggle { display: flex; }
  .nav-links {
    position: fixed; top: 0; left: 0; width: 260px; height: 100vh;
    background-color: var(--bg-secondary); border-right: 1px solid var(--border-color);
    flex-direction: column; align-items: flex-start; padding: 65px 25px 25px 25px;
    gap: 22px; transform: translateX(-100%); transition: transform 0.3s ease-in-out;
    z-index: 1001; box-shadow: 4px 0 15px var(--shadow); overflow-y: auto;
  }
  .nav-links.open { transform: translateX(0); }
  .close-btn { display: block; position: absolute; top: 15px; right: 18px; background: none; border: none; color: var(--text-secondary); font-size: 1.8rem; cursor: pointer; line-height: 1; }
  .nav-overlay { display: block; position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(0,0,0,0.65); opacity: 0; pointer-events: none; transition: opacity 0.3s ease-in-out; z-index: 1000; }
  .nav-overlay.open { opacity: 1; pointer-events: auto; }
  .search-box { position: fixed; top: 60px; right: 20px; width: calc(100% - 40px); max-width: 300px; }
  .cards-grid { grid-template-columns: 1fr; }
}
CSS

# ---- SCRIPT.JS ----
cat > script.js << 'JS'
document.addEventListener("DOMContentLoaded", () => {
    // Mobile Drawer
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

    // Scroll to Top
    const scrollTopBtn = document.getElementById("scrollTopBtn");
    if (scrollTopBtn) {
        window.addEventListener("scroll", () => scrollTopBtn.classList.toggle("visible", window.scrollY > 300));
        scrollTopBtn.addEventListener("click", () => window.scrollTo({ top: 0, behavior: "smooth" }));
    }

    // Search Index
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
            const s = document.createElement("script");
            s.src = "https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js";
            s.onload = initSearch;
            document.head.appendChild(s);
        } else initSearch();

        function initSearch() {
            const fuse = new Fuse(searchData, { keys: ["title", "description"], threshold: 0.3, includeScore: true });
            searchInput.addEventListener("input", function () {
                const query = this.value.trim();
                if (query.length < 2) { searchResults.innerHTML = ""; return; }
                let html = "";
                fuse.search(query).slice(0, 8).forEach(({ item }) => {
                    html += `<a href="${item.url}" class="search-result-item"><div><strong>${item.title}</strong> <span class="badge">${item.badge}</span></div></a>`;
                });
                searchResults.innerHTML = html;
            });
        }
    }
});
JS

# Add .nojekyll
touch .nojekyll

# Git push
git add .
git commit -m "Restored original layout with search toggle icon and stacked forms"
git push origin main

echo "✅ Done! Website restored to original look with search icon and fixed forms."
