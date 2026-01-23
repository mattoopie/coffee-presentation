#!/bin/bash

OUTPUT_FILE="final-dist/index.html"
mkdir -p final-dist

cat <<EOF > "$OUTPUT_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Presentation Index</title>
    <style>body { font-family: sans-serif; padding: 2rem; line-height: 1.6; }</style>
</head>
<body>
    <h1>Presentations</h1>
    <nav><ul>
EOF

for name in "$@"; do
    # Capitalize first letter for display
    display_name="$(tr '[:lower:]' '[:upper:]' <<< "${name:0:1}")${name:1}"
    echo "      <li><a href=\"/$name/\">$display_name</a></li>" >> "$OUTPUT_FILE"
done

cat <<EOF >> "$OUTPUT_FILE"
    </ul></nav>
</body>
</html>
EOF
