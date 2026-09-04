#!/bin/bash

echo "Adding sticky header smooth scroll and professional 3-column footer..."

# =====================================================
# 1. UPDATE STYLE.CSS (Add smooth scroll + footer styles)
# =====================================================
cat >> style.css << 'CSS'

/* Smooth Scroll */
html {
  scroll-behavior: smooth;
}

/* Professional Footer Grid */
footer {
  background-color: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
  padding: 30px 0 10px 0;
  margin-top: 40px;
}

.footer-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 30px;
  max-width: 1000px;
  margin: 0 auto;
  padding: 0 20px 20px 20px;
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
}

.footer-col ul li {
  margin-bottom: 8px;
}

.footer-col ul li a {
  color: var(--text-secondary);
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.2s;
}

.footer-col ul li a:hover {
  color: var(--accent);
}

.footer-social {
  display: flex;
  gap: 12px;
  margin-top: 15px;
}

.footer-social a {
  color: var(--text-secondary);
  font-size: 1.3rem;
  text-decoration: none;
  transition: color 0.2s;
}

.footer-social a:hover {
  color: var(--accent);
}

.footer-bottom {
  text-align: center;
  border-top: 1px solid var(--border-color);
  padding-top: 15px;
  margin-top: 20px;
  color: var(--text-secondary);
  font-size: 0.85rem;
}

/* Adjust existing footer p style (remove old single-line) */
footer > .container {
  display: none; /* Hide old simple footer */
}
CSS

# =====================================================
# 2. UPDATE ALL HTML FILES WITH NEW FOOTER
# =====================================================
python3 << 'PYEOF'
import re

files = ['index.html', 'bsc-math.html', 'msc-math.html', 'phd.html', 'about.html', 'contact.html']

# Standard footer HTML to insert (common for all pages)
footer_html = '''
<footer>
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
</footer>
'''

for filename in files:
    try:
        with open(filename, 'r') as f:
            content = f.read()

        # Replace the old footer (everything from <footer> to </footer>) with new one
        new_content = re.sub(r'<footer>.*?</footer>', footer_html, content, flags=re.S)

        # Add smooth scroll (if not already there)
        if 'scroll-behavior: smooth' not in new_content:
            new_content = new_content.replace('</head>', '<style>html { scroll-behavior: smooth; }</style></head>', 1)

        with open(filename, 'w') as f:
            f.write(new_content)
        print(f"Updated footer in {filename}")
    except Exception as e:
        print(f"Error processing {filename}: {e}")
PYEOF

# =====================================================
# 3. ENSURE DYNAMIC YEAR IN SCRIPT.JS
# =====================================================
if ! grep -q "footer-bottom" script.js; then
cat >> script.js << 'JS'

// Dynamic year in footer
document.addEventListener("DOMContentLoaded", function() {
    const yearSpan = document.getElementById("year");
    if (yearSpan) {
        yearSpan.textContent = new Date().getFullYear();
    }
});
JS
fi

# =====================================================
# 4. COMMIT AND PUSH
# =====================================================
git add .
git commit -m "Added sticky header smooth scroll and professional 3-column footer"
git push origin main

echo "✅ Done! Your site now has smooth scrolling and a professional footer."
