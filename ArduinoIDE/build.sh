#!/bin/bash
#
# Really quick hack to update the SHA256 in the JSON file.

DIR="$1"
JSON="$2"
TARBALL="${DIR}.tar.bz2"
TEMPLATE="${JSON}.template";

if [ "$JSON" == "" ]
then
	echo "# Error missing args: build.sh <dir> <json>"
	exit 1
fi

echo "# Generate tarball: $TARBALL"
tar jcf $TARBALL $DIR

SHA="`shasum -a 256 $TARBALL`"
IFS=' ' read -r -a SHA_ARRAY <<< "$SHA"
SHA="SHA-256:${SHA_ARRAY[0]}"

if [ "$SHA" == "" ]
then
	echo "Can't read file: $TARBALL"
	exit 1
fi

echo "# Update $JSON with $SHA"
jq '.packages[0].platforms[0].checksum="'$SHA'"' < $TEMPLATE > $JSON

exit 0

__DATA__
if [ "$?" == "0" ]
then
	perl -p -e 'BEGIN{use Env(qw(SHA))} s/"SHA-256:%%SHA%%"/"SHA-256:$gsSHA"/' ${gsJSON}.template > ${gsJSON}
else
fi

