## ----------------------------------------------------------------------
## The purpose of this Makefile is to simplify common development tasks.
## ----------------------------------------------------------------------
##
## Usage:
##   - make run            : Run the game
##   - make love           : Build distributable .love file
##   - make deploy         : Deploy to gh-pages
##   - make help           : Show available commands and descriptions
##

PROG = $(shell basename `git rev-parse --show-toplevel`)

.PHONY:run
run:
	love src .

.PHONY:love
love:
	cd src && zip -9 -r ${PROG}.love .

.PHONY:deploy
deploy:
	bash deploy.sh

.PHONY:help
help:
	@sed -ne '/@sed/!s/##//p' $(MAKEFILE_LIST)