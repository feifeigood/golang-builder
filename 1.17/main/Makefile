include ../Makefile.COMMON

build:
	@echo ">> building $(REPOSITORY)/$(NAME):$(VERSION)-$(DIRNAME)$(SUFFIX)"
	@docker build -t "$(REPOSITORY)/$(NAME):$(VERSION)-$(DIRNAME)$(SUFFIX)" --build-arg MYCLOUD_OSX_SDK_URL=${MYCLOUD_OSX_SDK_URL} .
	@docker tag "$(REPOSITORY)/$(NAME):$(VERSION)-$(DIRNAME)$(SUFFIX)" "$(REPOSITORY)/$(NAME):$(VERSION)-$(DIRNAME)"
	@docker save -o "$(IMAGE_DIR)/$(IMAGE_FILE)-$(VERSION)-$(DIRNAME)" "$(IMAGE):$(VERSION)-$(DIRNAME)"