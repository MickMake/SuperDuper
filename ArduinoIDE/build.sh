#!/bin/bash
#
# Really quick hack to update the SHA256 in the JSON file.

DIR="$1"
VERSION="$2"
JSON="$3"
TARBALL="${DIR}-${VERSION}.tar.bz2"
TEMPLATE="${JSON}.template";

if [ "$JSON" == "" ]
then
	echo "# Error missing args: build.sh <dir> <json>"
	exit 1
fi

echo "# Generate tarball: $TARBALL"
tar jcf $TARBALL $DIR
SIZE="`gfind $TARBALL -maxdepth 0 -printf '%s'`"

SHA="`shasum -a 256 $TARBALL`"
IFS=' ' read -r -a SHA_ARRAY <<< "$SHA"
SHA="SHA-256:${SHA_ARRAY[0]}"

if [ "$SHA" == "" ]
then
	echo "Can't read file: $TARBALL"
	exit 1
fi

URL="https://github.com/MickMake/SuperDuper/raw/master/ArduinoIDE/${TARBALL}"

echo "# Update $JSON with:
version		: $VERSION
url		: $URL
archiveFileName	: $TARBALL
size		: $SIZE
checksum	: $SHA
"

jq '.packages[0].platforms[0].checksum="'$SHA'" | .packages[0].platforms[0].size="'$SIZE'" | .packages[0].platforms[0].url="'${URL}'" | .packages[0].platforms[0].archiveFileName="'${TARBALL}'" | .packages[0].platforms[0].version="'${VERSION}'"' < $TEMPLATE > $JSON

exit 0
