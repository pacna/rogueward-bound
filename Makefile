## ----------------------------------------------------------------------
## The purpose of this Makefile is to simplify common development tasks.
## ----------------------------------------------------------------------
##
## Usage:
##   - make run          : Run the game
##   - make help         : Show available commands and descriptions
##

.PHONY:run
run:
	love src .


.PHONY:help
help:
	@sed -ne '/@sed/!s/##//p' $(MAKEFILE_LIST)