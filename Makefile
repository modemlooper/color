PHPUNIT=./vendor/bin/phpunit
 
.PHONY: all
# Default target when just running 'make'
all: analyze test

vendor: composer.json composer.lock
	composer install

build/logs:
	mkdir -p build/logs

$(PHPUNIT): vendor

#
#  T E S T S
#
.PHONY: test test-unit

test: test-unit

test-unit: $(PHPUNIT) vendor build/logs
	$(PHPUNIT) --coverage-text

#
#  A N A L Y S I S
#

.PHONY: analyze validate

analyze: validate

validate:
	composer validate --strict
