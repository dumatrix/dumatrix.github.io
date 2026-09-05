#!/bin/bash

echo "Fixing form alignment across all pages..."

# Update CSS to left-align the form section and heading
python3 << 'PYEOF'
import re

with open('style.css', 'r') as f:
    css = f.read()

# Force .form-section to be left-aligned
css = re.sub(r'\.form-section\s*\{[^}]*\}', '.form-section {\n  margin-top: 50px;\n  border-top: 1px solid #30363d;\n  padding-top: 30px;\n  text-align: left;\n}', css, flags=re.S)

# Force .inline-form to be left-aligned (no centered margin)
css = re.sub(r'\.inline-form\s*\{[^}]*\}', '.inline-form {\n  max-width: 600px;\n  margin: 0 0;\n  display: flex;\n  flex-direction: column;\n  gap: 12px;\n  background: var(--bg-card);\n  padding: 25px;\n  border-radius: 8px;\n  border: 1px solid var(--border-color);\n  text-align: left;\n}', css, flags=re.S)

# Remove any leftover float/margin rules that might mess up alignment
css = re.sub(r'\.form-section\s+h2\s*\{[^}]*\}', '.form-section h2 {\n  color: var(--text-heading);\n  margin-bottom: 8px;\n}', css, flags=re.S)
css = re.sub(r'\.form-section\s+p\s*\{[^}]*\}', '.form-section p {\n  color: var(--text-secondary);\n  margin-bottom: 25px;\n}', css, flags=re.S)

# Add margin-left to the section to match the container's padding
css += '\n/* Ensure form section aligns with container */\n.form-section {\n  padding-left: 0 !important;\n  padding-right: 0 !important;\n}\n'

with open('style.css', 'w') as f:
    f.write(css)

print("✅ Updated CSS for left-aligned forms")
PYEOF

git add .
git commit -m "Fixed form alignment: heading and forms now left-aligned"
git push origin main

echo "✅ Done! Hard refresh (Ctrl+Shift+R) to see the changes."
