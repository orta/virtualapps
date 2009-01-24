#!/bin/bash

# TextMate Project variables. Add to the tmproject vars to use the default compile scripts.
# TM_FLEX_FILE_SPECS 	src/virtualapps.mxml
# TM_FLEX_OUTPUT 		deploy/virtualapps.swf

# Not sure why but this doesn't work when used in an AS3 project (docs suggest it should)
#	-load-config="build/virtualapps-config.xml" \

echo "<h2>virtualapps Custom Compile</h2>";
echo "<code> Started @ `date "+%H:%M:%S"`</code><br />";

"$TM_FLEX_PATH/bin/mxmlc" \
	-sp+="$TM_AS3_LIB_PATH" \
	-file-specs="src/OS.as" \
	-o="deploy/virtualapps.swf" 2>&1 | "$TM_BUNDLE_SUPPORT/bin/parse_mxmlc_out.rb";

if [ "$?" == "0" ]
	then
	open "deploy/virtualapps.html";
fi
