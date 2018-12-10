MYREPO_BASE=quay.io/unleashed
MYREPO_NAME=$(MYREPO_BASE)/3scale
THREESCALE_RELEASE=2.4.0

.PHONY: apisonator
apisonator:
	$(MAKE) -C apisonator/openshift NAME=$(MYREPO_NAME) RELEASE=${THREESCALE_RELEASE} release-min

.PHONY: porta
porta:
	$(MAKE) -C porta/openshift/system NAME=$(MYREPO_NAME) VERSION=porta-${THREESCALE_RELEASE} build

.PHONY: s2i-openresty
s2i-openresty:
	$(MAKE) -C s2i-openresty TAG=1.13.6.2-1 DOCKER_OPTIONS=--no-cache build build-runtime tag

.PHONY: zync
zync:
	s2i build zync centos/ruby-24-centos7:latest \
		$(MYREPO_NAME):zync-$(THREESCALE_RELEASE)
