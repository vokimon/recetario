#!/bin/bash

categories=$(for a in */; do echo $(basename $a); done | grep -v images)
for category in $categories; do
	cat > $category/00_section_$category.md <<EOF
\\newpage
# $(echo $category | sed 's/./\u&/')

$( [ -f images/$category.png ] && echo "\\portadaCategoria{images/$category.png}"  )

\\newpage
EOF
done


pandoc --toc --toc-depth=2 metadata.yaml README  */*md -o recetario.pdf

