#!/bin/bash

echo "Removing duplicate footer and fixing layout..."

# =====================================================
# 1. Rewrite the footer in ALL HTML files (Removes duplicates)
# =====================================================
python3 << 'PYEOF'
import re

files = ['index.html', 'bsc-math.html', 'msc-math.html', 'phd.html', 'about.html', 'contact.html']

# This is the single clean footer you will have
footer_html = '''<footer>
    <div class="footer-grid">
        <div class="footer-col">
            <h3>About DU Matrix</h3>
            <p>A family of learning. Providing free academic resources for Delhi University students.</p>
        </div>
        <div class="footer-col">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="bsc-math.html">B.Sc. Math</a></li>
                <li><a href="msc-math.html">M.Sc. Math</a></li>
                <li><a href="phd.html">Ph.D Math</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h3>Contact & Social</h3>
            <ul>
                <li><a href="mailto:dumatrix.du@gmail.com">📧 Email</a></li>
                <li><a href="https://www.reddit.com/r/du_matrix" target="_blank">🧵 Reddit</a></li>
                <li><a href="https://www.instagram.com/du_matrix/" target="_blank">📸 Instagram</a></li>
            </ul>
            <div class="footer-social">
                <a href="mailto:dumatrix.du@gmail.com" aria-label="Email">📧</a>
                <a href="https://www.reddit.com/r/du_matrix" target="_blank" aria-label="Reddit">🧵</a>
                <a href="https://www.instagram.com/du_matrix/" target="_blank" aria-label="Instagram">📸</a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; DU Matrix. All rights reserved. | Updated: <span id="year"></span></p>
    </div>
</footer>'''

for filename in files:
    try:
        with open(filename, 'r') as f:
            content = f.read()
        
        # Replace everything between <footer> and </footer> with the single clean footer
        content = re.sub(r'<footer>.*?</footer>', footer_html, content, flags=re.S)
        
        with open(filename, 'w') as f:
            f.write(content)
        print(f"✅ Fixed footer in {filename}")
    except Exception as e:
        print(f"⚠️ Skipping {filename}: {e}")
PYEOF

# =====================================================
# 2. Force correct CSS layout for the footer
# =====================================================
cat >> style.css << 'CSS'

/* FORCED CLEAN FOOTER RESET */
.footer-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr) !important;
    gap: 30px;
    max-width: 1000px;
    margin: 0 auto !important;
    padding: 30px 20px !important;
    text-align: left !important;
    width: 100%;
}

.footer-col ul {
    list-style: none;
    padding: 0;
}

.footer-col ul li {
    margin-bottom: 8px;
}

.footer-col ul li a {
    color: var(--text-secondary) !important;
    text-decoration: none !important;
    font-size: 0.9rem;
}

.footer-col ul li a:hover {
    color: var(--accent) !important;
}

.footer-bottom {
    text-align: center !important;
    border-top: 1px solid var(--border-color);
    padding: 15px !important;
    color: var(--text-secondary);
    font-size: 0.85rem;
}

@media (max-width: 768px) {
    .footer-grid {
        grid-template-columns: 1fr !important;
        text-align: center !important;
    }
}
CSS

# =====================================================
# 3. Commit and push
# =====================================================
git add .
git commit -m "Removed duplicate footer, fixed 3-column layout"
git push origin main

echo "✅ Done! Duplicate removed. Hard refresh (Ctrl+Shift+R) to see the clean single footer."
