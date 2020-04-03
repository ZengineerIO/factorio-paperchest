#!/bin/sh

[[ ! $1 ]] && exit

# copy the whole folder
cp -r paperchest "paperchest_$1"

# update version number in info.json
cat paperchest/info.json | sed "s/\"version\": \"[0-9].[0-9].[0-9]\"/\"version\": \"$1\"/" > "paperchest_$1/info.json" 

# add the new changes to changelog.txt
cat changes.txt > "paperchest_$1/changelog.txt" && cat paperchest/changelog.txt >> "paperchest_$1/changelog.txt"

# copy both files back to source folder
cp -f "paperchest_$1/info.json" paperchest/info.json
cp -f "paperchest_$1/changelog.txt" paperchest/changelog.txt

# zip it! -m -> move (delete original)
zip -0 -m -r "paperchest_$1.zip" "./paperchest_$1/"