#!/bin/bash

echo "Restoring original simple footer..."

# =====================================================
# 1. Replace the footer in ALL HTML files with simple version
# =====================================================
python3 << 'PYEOF'
import re

files = ['index.html', 'bsc-math.html', 'msc-math.html', 'phd.html', 'about.html', 'contact.html']

# Original simple footer
footer_html = '''<footer>
    <div class="container">
        <p>&copy; DU Matrix. All rights reserved. | Updated: 25 Aug 2026</p>
    </div>
</footer>'''

for filename in files:
    try:
        with open(filename, 'r') as f:
            content = f.read()
        # Replace everything between <footer> and </footer> with simple footer
        content = re.sub(r'<footer>.*?</footer>', footer_html, content, flags=re.S)
        with open(filename, 'w') as f:
            f.write(content)
        print(f"✅ Restored footer in {filename}")
    except Exception as e:
        print(f"⚠️ Skipping {filename}: {e}")
PYEOF

# =====================================================
# 2. Remove ALL footer-related CSS from style.css
# =====================================================
python3 << 'PYEOF'
import re

with open('style.css', 'r') as f:
    css = f.read()

# Remove everything from the footer comment block to end of file (if it's at end)
# Find where the footer CSS starts (look for the comment we added)
start = css.find('/* ===== PROFESSIONAL FOOTER')
if start != -1:
    # Remove from that comment to end of file (or to next comment)
    css = css[:start].rstrip() + '\n'

# Also remove any orphaned footer-grid/footer-col/footer-container/footer-bottom rules
css = re.sub(r'\.footer-container\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+h3\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+p\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+ul\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+ul\s+li\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-col\s+ul\s+li\s+a\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-social\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-bottom\s*\{[^}]*\}', '', css)
css = re.sub(r'\.footer-bottom\s+p\s*\{[^}]*\}', '', css)
# Remove any leftover media queries for footer
css = re.sub(r'@media \(max-width: 768px\) \{\s*\.footer-container\s*\{[^}]*\}\s*\.footer-col\s*\{[^}]*\}\s*\}', '', css, flags=re.S)

with open('style.css', 'w') as f:
    f.write(css)

print("✅ Removed footer CSS")
PYEOF

# =====================================================
# 3. Commit and push
# =====================================================
git add .
git commit -m "Restored original simple footer"
git push origin main

echo "✅ Done! Your original simple footer is back. Hard refresh (Ctrl+Shift+R) to see it."
