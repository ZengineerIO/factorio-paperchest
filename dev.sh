#!/bin/sh

modname="paperchest"

if [ ! "${FACTORIOPATH}" ]; then
    echo "no factorio path found"
    exit 1
fi

if [ ! -d "${FACTORIOPATH}/mods" ]; then
    mkdir -v "${FACTORIOPATH}/mods"
fi

modversion=$(grep '"version"' "${modname}/info.json"| cut -d ":" -f2 | sed 's/[", ]//g')

ln -sfv "${PWD}/${modname}" "${FACTORIOPATH}/mods/${modname}_${modversion}"