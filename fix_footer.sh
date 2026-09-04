#!/bin/bash

echo "Fixing footer layout..."

# Force specific grid columns for desktop and mobile
cat >> style.css << 'CSS'

/* Force Desktop 3-column Footer */
@media (min-width: 769px) {
    .footer-grid {
        grid-template-columns: repeat(3, 1fr) !important;
        text-align: left;
    }
    .footer-bottom {
        text-align: center !important;
    }
}

/* Force Mobile 1-column Footer */
@media (max-width: 768px) {
    .footer-grid {
        grid-template-columns: 1fr !important;
        text-align: center;
    }
}

/* Fix purple default link colors in footer */
.footer-col ul li a {
    color: var(--text-secondary) !important;
    text-decoration: none !important;
}
.footer-col ul li a:hover {
    color: var(--accent) !important;
}
CSS

# Ensure HTML structure has the footer-grid wrapper
python3 << 'PYEOF'
import re
files = ['index.html', 'bsc-math.html', 'msc-math.html', 'phd.html', 'about.html', 'contact.html']
for f in files:
    try:
        content = open(f).read()
        if 'footer-grid' not in content:
            # Insert footer-grid div if missing
            content = content.replace('<footer>', '<footer><div class="footer-grid">')
            content = content.replace('</footer>', '</div></footer>')
            open(f, 'w').write(content)
            print(f"Fixed structure in {f}")
        else:
            print(f"Structure ok in {f}")
    except Exception as e:
        print(f"Skipped {f}: {e}")
PYEOF

git add .
git commit -m "Fixed footer layout for desktop and mobile"
git push origin main

echo "✅ Done! Refresh your site (Hard refresh: Ctrl+Shift+R) to see the 3-column footer on desktop."
