#!/bin/bash

categories=$(for a in */; do echo $(basename $a); done | grep -v images)
for category in $categories; do
	Category=$(echo $category | sed 's/./\u&/')
	cat > $category/00_cover.md <<EOF
# $Category

$( [ -f images/$category.png ] && echo "\\portadaCategoria{images/$category.png}"  )

\\newpage
EOF
done


pandoc --toc --toc-depth=2 -H header.tex metadata.yaml README.md  */*md TODO -s -o recetario.pdf


