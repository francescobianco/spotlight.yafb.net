

build:
	bash contrib/build-pdf.sh

test:
	docker run --rm \
           --volume "$$(pwd):/data" \
           --user $$(id -u):$$(id -g) \
           pandoc/extra contrib/example.md -o contrib/example.pdf --template eisvogel --listings