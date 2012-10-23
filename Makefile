# by Alfredo Llanos
VERSION=1.1.0
DATE=$(shell date)

# CONFIG
LESS_COMPRESSOR ?= `which lessc`
UGLIFY_JS ?= `which uglifyjs`
WATCHR ?= `which watchr`

style:
	@echo "\n${HR}"
	@echo "Building Styles ..."
	@echo "${HR}\n"
	recess ./src/less/theme.kinout.less --compile > ./css/theme.kinout.css
	recess ./src/less/theme.kinout.less --compress > ./css/theme.kinout.min.css
	cat ./css/kinout-1.0.css ./css/theme.kinout.min.css ./css/theme.kinout.css assets/javascript/rainbow/themes/blackboard.css > ./css/style.min.css

script:
	@echo "\n${HR}"
	@echo "Building JavaScript ..."
	@echo "${HR}\n"
	cat assets/javascript/QuoJS.js assets/javascript/raf.js assets/javascript/kinout-1.0.js assets/javascript/rainbow/rainbow.min.js assets/javascript/rainbow/language/generic.js > ./js/script.js
	uglifyjs -nc ./js/script.js > ./js/script.min.js

