modules := $(shell find . -type d -maxdepth 1 \( -name "npm-app*" \))
version := $(shell git describe --abbrev=0 --tags)

.PHONY: version
version: $(modules)
	@for module in $(modules); do \
		cd $$module ; npm version $(version); cd ../; \
	done

.PHONY: publish
version: $(modules)
	@for module in $(modules); do \
		cd $$module ; npm publish --access public; cd ../; \
	done

.PHONY: semantic-release
version: $(modules)
	@for module in $(modules); do \
		cd $$module ; npx semantic-release; cd ../; \
	done	

.PHONY: build
version: $(modules)
	@for module in $(modules); do \
		cd $$module ; npm ci; cd ../; \
	done