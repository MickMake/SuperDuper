VERSION=1.0.1
DIR=mickmake-samd
JSON="package_mickmake_index.json"

all: build

build: 
	@echo ----------------------------------------------------------
	@./build.sh $(DIR) $(VERSION) $(JSON)

clean:
	@echo ----------------------------------------------------------
	@echo Cleaning up
	-$(RM) $(DIR).tar.bz2

.phony: build clean
