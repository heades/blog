#!/bin/sh

OTT_FLAGS="-tex_wrap false -tex_show_meta false -picky_multiple_parses false"

OTTPrefix="syntax"
TexFileName=$INPUTFILE
OTTFileName=$OTTPrefix
OTTPath="/Users/heades/website/blog/metatheorem/markdown/ct-notes/Universal-Properties"
OTTFile="$OTTPath/$OTTFileName.ott"
OTTGen="$OTTFileName-inc.tex"
OTTOutputFile="$TexFileName-ottput.tex"

ott $OTT_FLAGS -i $OTTFile -o $OTTGen -tex_filter "$TexFileName.tex" $OTTOutputFile -tex_name_prefix $OTTPrefix
echo "**ott $OTT_FLAGS -i $OTTFile -o $OTTGen -tex_filter $TexFileName.tex $OTTOutputFile -tex_name_prefix $OTTPrefix"
cat $OTTOutputFile
mv $OTTOutputFile "$TexFileName.tex"
