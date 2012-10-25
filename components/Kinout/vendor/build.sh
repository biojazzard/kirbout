#!/bin/bash
VERSION="1.0"

#define paths
COMPILER=google-compiler/compiler.jar
KINOUT_SOURCES=../src/build
KINOUT_STYLESHEETS=../stylesheets/css/
KINOUT_NAMESPACE=Kinout.
BUILDPATH=../build/

#script
clear
echo -e "\033[0m"
echo ============================ KINOUT COMPILER ============================
## Files to compile
FILES_TO_COMPILE=""
FILES_TO_JOIN=""

#JavaScripts
DIR=$KINOUT_SOURCES$KINOUT_NAMESPACE
echo -e "\033[0m  [DIR]: "$KINOUT_SOURCES"\033[33m"
FILES=(js Constants.js Element.js Events.js Router.js Step.js Url.js View.js)
for file in "${FILES[@]}"
do
    echo "     - "$KINOUT_NAMESPACE$file
    FILES_TO_COMPILE=$FILES_TO_COMPILE" --js "$KINOUT_SOURCES/$KINOUT_NAMESPACE$file
done

#create build dir
echo -e "\033[0m     - [CREATE]: "$BUILDPATH"\033[0m"
mkdir $BUILDPATH

echo -e "\033[0m     - [BUILD]: "$BUILDPATH"\033[0m"
#MINIFIED Version
java -jar $COMPILER $FILES_TO_COMPILE --js_output_file $BUILDPATH//kinout-$VERSION.js
echo -e "\033[32m          - kinout-"$VERSION.js"\033[0m"


#Stylesheets
FILES_TO_COMPRESS=""
echo -e "\033[0m  [DIR]: "$KINOUT_STYLESHEETS"\033[33m"
FILES=(reset layout media widgets)
for file in "${FILES[@]}"
do
    echo "    - Compressing "$KINOUT_STYLESHEETS$file".css ..."
    FILES_TO_COMPRESS=$FILES_TO_COMPRESS" "$KINOUT_STYLESHEETS$file".css"
done
echo -e "\033[0m    - [BUILD]: "$BUILDPATH"\033[0m"
cat $FILES_TO_COMPRESS > $BUILDPATH/kinout-$VERSION.css
echo -e "\033[32m          - kinout-"$VERSION.css"\033[0m"
echo -e "\033[0m"============================ /KINOUT COMPILER ============================