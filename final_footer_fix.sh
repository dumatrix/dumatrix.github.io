#!/bin/bash

echo "Applying final footer fix using Flexbox..."

# =====================================================
# 1. Completely rewrite footer in ALL HTML files
# =====================================================
python3 << 'PYEOF'
import re

files = ['index.html', 'bsc-math.html', 'msc-math.html', 'phd.html', 'about.html', 'contact.html']

footer_html = '''<footer>
    <div class="footer-container">
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
        content = re.sub(r'<footer>.*?</footer>', footer_html, content, flags=re.S)
        with open(filename, 'w') as f:
            f.write(content)
        print(f"✅ Fixed footer HTML in {filename}")
    except Exception as e:
        print(f"⚠️ Skipping {filename}: {e}")
PYEOF

# =====================================================
# 2. Rewrite the ENTIRE footer CSS with Flexbox
# =====================================================
python3 << 'PYEOF'
with open('style.css', 'r') as f:
    css = f.read()

# Remove old footer CSS
import re
css = re.sub(r'/\* Professional Footer Grid \*/.*?/\* Adjust existing footer', '/* Professional Footer Grid */', css, flags=re.S)

# Remove any existing .footer-grid, .footer-col, .footer-bottom from previous attempts
css = re.sub(r'\.footer-grid\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+h3\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+p\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+ul\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+ul\s+li\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+ul\s+li\s+a\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-social\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-bottom\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-bottom\s+p\s*\{[^}]*\}', '', css)

# Add new Flexbox footer CSS at the end
new_footer_css = '''
/* ===== PROFESSIONAL FOOTER (FLEXBOX) ===== */
footer {
  background-color: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
  padding: 30px 0 0 0;
  margin-top: 40px;
}

.footer-container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 30px;
  max-width: 1000px;
  margin: 0 auto;
  padding: 0 20px 20px 20px;
  text-align: left;
}

.footer-col {
  flex: 1;
  min-width: 200px;
}

.footer-col h3 {
  color: var(--text-heading);
  font-size: 1.1rem;
  margin-bottom: 12px;
  font-weight: 600;
}

.footer-col p {
  color: var(--text-secondary);
  font-size: 0.9rem;
  line-height: 1.5;
}

.footer-col ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-col ul li {
  margin-bottom: 8px;
}

.footer-col ul li a {
  color: var(--text-secondary) !important;
  text-decoration: none !important;
  font-size: 0.9rem;
  display: inline-block;
}

.footer-col ul li a:hover {
  color: var(--accent) !important;
}

.footer-bottom {
  border-top: 1px solid var(--border-color);
  padding: 15px 20px;
  text-align: center;
  color: var(--text-secondary);
  font-size: 0.85rem;
  margin-top: 10px;
}

/* Mobile: Stack columns vertically */
@media (max-width: 768px) {
  .footer-container {
    flex-direction: column;
    text-align: center;
    align-items: center;
    gap: 20px;
  }
  .footer-col {
    width: 100%;
  }
}
'''

css += new_footer_css

with open('style.css', 'w') as f:
    f.write(css)

print("✅ CSS fixed with Flexbox footer")
PYEOF

# =====================================================
# 3. Commit and push
# =====================================================
git add .
git commit -m "Final footer fix: switched to Flexbox for reliable 3-column layout"
git push origin main

echo "✅ Done! Hard refresh your browser (Ctrl+Shift+R) to see the fixed footer."
