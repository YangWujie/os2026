#!/bin/bash

set -e

BASE="${BASE:-}"

rm -rf dist
mkdir -p dist

echo "Generating index.html..."

cat > dist/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Operating System 2026</title>

<style>
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
               Roboto, Helvetica, Arial, sans-serif;
  max-width: 800px;
  margin: 60px auto;
  padding: 0 20px;
  line-height: 1.6;
  color: #333;
}

h1 {
  text-align: center;
  margin-bottom: 40px;
}

.slides {
  list-style: none;
  padding: 0;
}

.slides li {
  margin: 12px 0;
}

.slides a {
  display: block;
  padding: 12px 20px;
  border-radius: 8px;
  background: #f5f5f5;
  color: #333;
  text-decoration: none;
}

.slides a:hover {
  background: #e8e8e8;
}

footer {
  margin-top: 50px;
  text-align: center;
  color: #888;
  font-size: 0.9em;
}
</style>

</head>

<body>

<h1>Operating System 2026</h1>

<ul class="slides">
EOF

for file in [0-9][0-9].md
do
    name="${file%.md}"

    echo "Building $file..."

    if [ -n "$BASE" ]; then
        slide_base="${BASE}/${name}/"
    else
        slide_base="/${name}/"
    fi

    pnpm exec slidev build "$file" \
        --out "dist/$name" \
        --base "$slide_base"

    cat >> dist/index.html <<EOF
<li>
  <a href="./$name/">
    Lecture $name
  </a>
</li>
EOF

done

cat >> dist/index.html <<EOF
</ul>

<footer>
© 2026 Operating System Course
</footer>

</body>
</html>
EOF

echo "Build finished."