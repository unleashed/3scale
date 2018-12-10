MYREPO_BASE=quay.io/unleashed
MYREPO_NAME=$(MYREPO_BASE)/3scale
THREESCALE_RELEASE=2.4.0

.PHONY: apisonator
apisonator:
	$(MAKE) -C apisonator/openshift NAME=$(MYREPO_NAME) RELEASE=${THREESCALE_RELEASE} release-min

.PHONY: porta
porta:
	$(MAKE) -C porta/openshift/system NAME=$(MYREPO_NAME) VERSION=porta-${THREESCALE_RELEASE} build
