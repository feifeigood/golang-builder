REPOSITORY := feifeigood
NAME       := golang-builder
VARIANTS   ?= base main
VERSION    ?= 1.17

all: build

build:
	@./build.sh "$(VERSION)" "$(VARIANTS)"

tag:
	docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-base" "$(REPOSITORY)/$(NAME):base"
	docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-main" "$(REPOSITORY)/$(NAME):latest"
	docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-main" "$(REPOSITORY)/$(NAME):main"
	docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-main" "$(REPOSITORY)/$(NAME):arm"
	docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-main" "$(REPOSITORY)/$(NAME):powerpc"
	docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-main" "$(REPOSITORY)/$(NAME):mips"
	docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-main" "$(REPOSITORY)/$(NAME):s390x"

push:
	docker push -a "$(REPOSITORY)/$(NAME)"

.PHONY: all build tag push