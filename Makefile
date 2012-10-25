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
QUO_BUILD=build/
QUO_NAMESPACE=quo.

COMPILER=vendor/google-compiler/compiler.jar
LUNGO_SOURCES=./js/
BUILDPATH=../package/
MINIFIED="min"
PACKED="packed"

#KINOUT Related paths
KINOUT_SRC=Kinout/src/
KINOUT_BUILD=build/
KINOUT_NAMESPACE=Kinout.

HR = ###############___________________###################

style:
	@echo "\n${HR}"
	@echo "Building Styles ..."
	@echo "${HR}\n"
	recess ./src/less/theme.kinout.less --compile > ./css/theme.kinout.css
	recess ./src/less/theme.kinout.less --compress > ./css/theme.kinout.min.css
	recess ./src/less/kinout.less --compile > ./css/kinout-1.0.css
	recess ./src/less/kinout.less --compress > ./css/kinout-1.0.min.css
	cat ./css/kinout-1.0.min.css ./css/theme.kinout.min.css assets/javascript/rainbow/themes/blackboard.css > ./css/style.min.css

script:
	@echo "\n${HR}"
	@echo "Building JavaScript ..."
	@echo "${HR}\n"
	cat assets/javascript/QuoJS.js assets/javascript/raf.js assets/javascript/kinout-1.0.js assets/javascript/rainbow/rainbow.min.js assets/javascript/rainbow/language/generic.js > ./js/script.js
	uglifyjs -nc ./js/script.js > ./js/script.min.js

kinout:
	@echo "\n${HR}"
	@echo "Building Kinout ..."
	@echo "${HR}\n"
	recess ./src/less/kinout.less --compile > ./css/kinout-1.0.css
	recess ./src/less/kinout.less --compress > ./css/kinout-1.0.min.css

watch:
	@echo "\n${HR}"
	@echo "Watching Kinout ..."
	@echo "${HR}\n"
	watchr -e "watch('less/.*\.less') { system 'make style' }"

quo:
	@echo "========= START ============ QUOJS COMPILER w/ Uglify ============================"

	cat ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}core.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}element.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}environment.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}output.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}query.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}style.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}ajax.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}events.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}events.manager.js ${CMP}${QUO_SRC}${QUO_BUILD}${QUO_NAMESPACE}events.gestures.js > ./js/quo.js
	uglifyjs -nc ./js/quo.js > ./js/quo.min.js

	@echo "============================ QUOJS COMPILER w/ Uglify =========== END ============"

kinout:
	@echo "========= START ============ KinOut COMPILER w/ Uglify ============================"

	#cat ${CMP}${KINOUT_SRC}${KINOUT_BUILD}${KINOUT_NAMESPACE}core.js > ./js/kinout.js
	#uglifyjs -nc ./js/kinout.js > ./js/kinout.min.js

	@echo "============================ KinOut COMPILER w/ Uglify =========== END ============"

