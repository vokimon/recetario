#!/bin/bash

categories=$(for a in */; do echo $(basename $a); done | grep -v images)
for category in $categories; do
	cat > $category/00_section_$category.md <<EOF
\\newpage
# $(echo $category | sed 's/./\u&/')

$( [ -f images/$category.jpg ] && echo "\\portadaCategoria{images/$category.jpg}" )
\\newpage
EOF
done

cat > 00_section_otros.md <<EOF
\\newpage
# Otros
\\newpage
EOF

pandoc --toc --toc-depth=2 metadata.yaml README  */*md *md -o recetario.pdf

