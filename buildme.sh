#!/bin/bash

categories=$(for a in */;
	do echo $(basename $a);
done |
grep -v "export" | 
grep -v images)
for category in $categories; do
	Category=$(echo $category | sed 's/./\u&/')
	cat > $category/00_cover.md <<EOF
# $Category

$( [ -f images/$category.png ] && echo "\\portadaCategoria{images/$category.png}"  )

EOF
done


# ConTeX
#pandoc --toc --toc-depth=2 -H context-header.tex -t context metadata.yaml README.md  */*md TODO.md CHANGES.md LICENCIA.md -s -o recetario.tex && context recetario.tex --result=recetario-context.pdf

# LaTeX
pandoc --verbose --toc --toc-depth=2 -H header.tex metadata.yaml README.md  */*md TODO.md CHANGES.md LICENCIA.md -s -o recetario.pdf



