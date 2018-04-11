VERSION=1.0.0
DIR=mickmake-samd-$(VERSION)
JSON="package_mickmake_index.json"

all: build

build: 
	@echo ----------------------------------------------------------
	@./build.sh $(DIR) $(JSON)

clean:
	@echo ----------------------------------------------------------
	@echo Cleaning up
	-$(RM) $(TARBALL)

.phony: build clean
