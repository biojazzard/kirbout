# by Alfredo Llanos
VERSION=1.1.0
DATE=$(shell date)

# CONFIG
LESS_COMPRESSOR ?= `which lessc`
UGLIFY_JS ?= `which uglifyjs`
WATCHR ?= `which watchr`

# Bower Since 1.2.0 Moved original components to /src
CMP=./src/

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

#RAF Related paths
RAF_SRC=raf-coffeescript/src/
RAF_BUILD=raf-coffeescript/js/
RAF_NAMESPACE=raf.

HR = "--------------------------"

style:
	clear
	@echo "\n${HR} Building Kirbout Styles ${HR}"
	# recess ./src/less/theme.kinout.less --compile > ./css/theme.kinout.css
	# recess ./src/less/theme.kinout.less --compress > ./css/theme.kinout.min.css
	# recess ./src/less/kinout.less --compile > ./css/kinout-1.0.css
	# recess ./src/less/kinout.less --compress > ./css/kinout-1.0.min.css
	recess ./src/less/kirbout.less --compile > ./css/style.css
	recess ./src/less/kirbout.less --compress > ./css/style.min.css
	# cat ./css/kinout-1.0.min.css ./css/theme.kinout.min.css > ./css/style.min.css
	@echo "\n${HR} Building Styles ${HR}\n"

script:
	clear
	@echo "\n${HR} Building Scripts ${HR}"
	coffee --output ./js/ --compile ./src/js.script.coffee
	cat ${CMP}${QUO_BUILD}quojs.max.js ${CMP}${RAF_BUILD}Raf.js ${CMP}${KINOUT_BUILD}kinout.max.js ./js/js.script.js > ./js/script.js
	uglifyjs -nc ./js/script.js > ./js/script.min.js
	@echo "\n${HR} Building Styles ${HR}\n"

kin-less:
	clear
	@echo "\n${HR} Building Kinout Styles ${HR}"
	recess ./src/less/kinout.less --compile > ./css/kinout-1.0.css
	recess ./src/less/kinout.less --compress > ./css/kinout-1.0.min.css
	@echo "\n${HR} Building Kinout Styles ${HR}"

kin-js:
	@echo "\n${HR} KinOut JS COMPILER w/ Uglify ${HR}"
	coffee --compile --output ${CMP}${KINOUT_BUILD} ${CMP}${KINOUT_SRC}
	# OK Compilation to split files
	cat ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Constants.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Element.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Events.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Router.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Step.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}Url.js ${CMP}${KINOUT_BUILD}${KINOUT_NAMESPACE}View.js > ${CMP}${KINOUT_BUILD}kinout.max.js
	uglifyjs -nc ${CMP}${KINOUT_BUILD}kinout.max.js > ${CMP}${KINOUT_BUILD}kinout.min.js
	@echo "\n${HR} KinOut JS COMPILER w/ Uglify ${HR}"

watch:
	clear
	@echo "\n${HR} Watching Kinout Styles ${HR}"
	watchr -e "watch('src/less/.*\.less') { system 'make style' }"

quo-js:
	clear
	@echo "\n${HR} QuoJS COMPILER w/ Uglify ${HR}"
	# OK Compilation to split files
	coffee --compile --output ${CMP}${QUO_BUILD} ${CMP}${QUO_SRC}
	cat ${CMP}${QUO_BUILD}${QUO_NAMESPACE}js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}core.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}element.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}environment.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}output.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}query.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}style.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}ajax.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}events.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}events.manager.js ${CMP}${QUO_BUILD}${QUO_NAMESPACE}events.gestures.js > ${CMP}${QUO_BUILD}quojs.max.js
	uglifyjs -nc ${CMP}${QUO_BUILD}quojs.max.js > ${CMP}${QUO_BUILD}quojs.min.js
	@echo "\n${HR} QuoJS COMPILER w/ Uglify ${HR}"

raf-js:
	clear
	@echo "\n${HR} RAF COMPILER w/ Uglify ${HR}"
	# OK Compilation to split files
	coffee --output ${CMP}${RAF_BUILD} --compile ${CMP}${RAF_SRC}Raf.coffee
	uglifyjs -nc ${CMP}${RAF_BUILD}Raf.js > ${CMP}${RAF_BUILD}Raf.min.js
	@echo "\n${HR} RAF COMPILER w/ Uglify ${HR}"

