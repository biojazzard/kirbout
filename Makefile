# by Alfredo Llanos
VERSION=1.1.0
DATE=$(shell date)

# CONFIG
LESS_COMPRESSOR ?= `which lessc`
UGLIFY_JS ?= `which uglifyjs`
WATCHR ?= `which watchr`

#Bower
CMP=./components/

#QUO Related paths
QUO_SRC=QuoJS/src/
QUO_BUILD=QuoJS/js/
QUO_NAMESPACE=quo.

COMPILER=vendor/google-compiler/compiler.jar
LUNGO_SOURCES=./js/
BUILDPATH=../package/
MINIFIED="min"
PACKED="packed"

#KINOUT Related paths
KINOUT_SRC=Kinout/src/
KINOUT_BUILD=Kinout/js/
KINOUT_NAMESPACE=Kinout.

HR = ###############___________________###################

style:
	clear
	@echo "\n${HR}"
	@echo "Building Styles ..."
	@echo "${HR}\n"
	recess ./src/less/theme.kinout.less --compile > ./css/theme.kinout.css
	recess ./src/less/theme.kinout.less --compress > ./css/theme.kinout.min.css
	recess ./src/less/kinout.less --compile > ./css/kinout-1.0.css
	recess ./src/less/kinout.less --compress > ./css/kinout-1.0.min.css
	cat ./css/kinout-1.0.min.css ./css/theme.kinout.min.css assets/javascript/rainbow/themes/blackboard.css > ./css/style.min.css

script:
	clear
	@echo "\n${HR}"
	@echo "Building JavaScript ..."
	@echo "${HR}\n"
	# cat ${CMP}${QUO_BUILD}quojs.max.js assets/javascript/raf.js ${CMP}${KINOUT_BUILD}kinout.max.js assets/javascript/rainbow/rainbow.min.js assets/javascript/rainbow/language/generic.js ./src/js/js.script.js > ./js/script.js
	cat ${CMP}${QUO_BUILD}quojs.max.js ./src/js/raf.js ${CMP}${KINOUT_BUILD}kinout.max.js assets/javascript/rainbow/rainbow.min.js assets/javascript/rainbow/language/generic.js ./src/js/js.script.js > ./js/script.js
	uglifyjs -nc ./js/script.js > ./js/script.min.js

kin-less:
	clear
	@echo "\n${HR}"
	@echo "Building Kinout ..."
	@echo "${HR}\n"
	recess ./src/less/kinout.less --compile > ./css/kinout-1.0.css
	recess ./src/less/kinout.less --compress > ./css/kinout-1.0.min.css

kin-js:
	@echo "========= START ============ KinOut COMPILER w/ Uglify ============================"
	coffee --compile --output ${CMP}${KINOUT_BUILD} ${CMP}${KINOUT_SRC}
	# OK Compilation to split files
	cat ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Constants.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Element.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Events.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Router.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Step.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Url.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}View.js > ${CMP}${KINOUT_BUILD}kinout.max.js
	uglifyjs -nc ${CMP}${KINOUT_BUILD}kinout.max.js > ${CMP}${KINOUT_BUILD}kinout.min.js
	@echo "============================ KinOut COMPILER w/ Uglify =========== END ============"

watch:
	clear
	@echo "\n${HR}"
	@echo "Watching Kinout ..."
	@echo "${HR}\n"
	watchr -e "watch('less/.*\.less') { system 'make style' }"

quo-js:
	clear
	@echo "========= START ============ QUOJS COMPILER w/ Uglify ============================"
	# OK Compilation to split files
	coffee --compile --output ${CMP}${QUO_BUILD} ${CMP}${QUO_SRC}
	cat ${CMP}${QUO_BUILD}${QUO_NAMESPACE}js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}core.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}element.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}environment.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}output.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}query.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}style.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}ajax.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}events.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}events.manager.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}events.gestures.js > ${CMP}${QUO_BUILD}quojs.max.js
	uglifyjs -nc ${CMP}${QUO_BUILD}quojs.max.js > ${CMP}${QUO_BUILD}quojs.min.js
	@echo "============================ QUOJS COMPILER w/ Uglify =========== END ============"

raf-js:
	clear
	@echo "========= START ============ RAF COMPILER w/ Uglify ============================"
	# OK Compilation to split files
	# coffee --compile ./js/raf.js ./src/raf.coffee
	coffee --output ./src/js/ --compile ./src/Raf.coffee
	uglifyjs -nc ./src/js/Raf.js > ./src/js/Raf.min.js
	@echo "============================ RAF COMPILER w/ Uglify =========== END ============"

