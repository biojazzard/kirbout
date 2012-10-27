# by Alfredo Llanos
VERSION=1.1.0
DATE=$(shell date)

HR = "--------------------------"

build:
	clear
	@echo ${HR}RAF COMPILER w/ Uglify${HR}
	coffee --output ./js/ --compile ./src/Raf.coffee
	uglifyjs -nc ./js/Raf.js > ./js/Raf.min.js
	@echo ${HR}RAF COMPILER w/ Uglify${HR}

