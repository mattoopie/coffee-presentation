#!/bin/bash

OUTPUT_FILE="final-dist/index.html"
mkdir -p final-dist

cat <<EOF > "$OUTPUT_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coffee Presentations</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #2f1a05 0%, #513519 50%, #5b4228 100%);
            min-height: 100vh;
            padding: 3rem 1.5rem;
            color: #e4e4e7;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 0.5rem;
            background: linear-gradient(90deg, #835e3f, #d5ad70);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .subtitle {
            text-align: center;
            color: #a1a1aa;
            margin-bottom: 3rem;
            font-size: 1.1rem;
        }
        
        .card-list {
            list-style: none;
            display: grid;
            gap: 1rem;
        }
        
        .card-list li {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            transition: all 0.3s ease;
        }
        
        .card-list li:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(207, 182, 149, 0.5);
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
        }
        
        .card-list a {
            display: flex;
            align-items: center;
            padding: 1.25rem 1.5rem;
            color: #e4e4e7;
            text-decoration: none;
            font-size: 1.15rem;
            font-weight: 500;
        }
        
        .card-list a::before {
            content: '☕';
            margin-right: 1rem;
            font-size: 1.5rem;
        }
        
        .card-list a::after {
            content: '→';
            margin-left: auto;
            opacity: 0;
            transform: translateX(-8px);
            transition: all 0.3s ease;
            color: #CFB695;
        }
        
        .card-list li:hover a::after {
            opacity: 1;
            transform: translateX(0);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Presentations</h1>
        <p class="subtitle">Select a presentation to view</p>
        <nav>
            <ul class="card-list">
EOF

for name in "$@"; do
    # Capitalize first letter for display
    display_name="$(tr '[:lower:]' '[:upper:]' <<< "${name:0:1}")${name:1}"
    echo "                <li><a href=\"/$name/\">$display_name</a></li>" >> "$OUTPUT_FILE"
done

cat <<EOF >> "$OUTPUT_FILE"
            </ul>
        </nav>
    </div>
</body>
</html>
EOF
