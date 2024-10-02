

build:
	bash contrib/build-pdf.sh

test:
	docker run --rm \
           --volume "$$(pwd):/data" \
           --user $$(id -u):$$(id -g) \
           pandoc/extra contrib/example.md -o contrib/example.pdf --template eisvogel --listings



           #!/bin/bash

           # Trova tutti i file .md nella cartella archive e li converte in PDF
           find archive -name "*.md" | while read -r file; do
               # Esegui il container Docker con pandoc per ogni file trovato
               pdf=$(dirname "$file")/$(basename "$file" .md).pdf
               html=$(dirname "$file")/$(basename "$file" .md).html
                  echo $file $pdf

                docker run --rm \
                   --volume "$(pwd):/data" \
                   --user "$(id -u):$(id -g)" \
                   pandoc/extra "$file" -o "$pdf" \
                   --template eisvogel --listings

             pandoc $file -o $html

               echo "Convertito: $file in $(dirname "$file")/$(basename "$file" .md).pdf"
           done
