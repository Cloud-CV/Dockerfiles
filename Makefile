# Test building the Dockerfiles changed.
test:
	@./scripts/test.sh

# Test all the Dockerfiles in the repository.
testall:
	@./scripts/test-all.sh

.PHONY: test testall