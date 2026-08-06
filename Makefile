.PHONY: build test clean

build:
	bash scripts/build.sh

test:
	bash scripts/test.sh

clean:
	rm -rf dist
