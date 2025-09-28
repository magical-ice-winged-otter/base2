#!/bin/bash

CORE_COUNT=$(nproc)
echo -e "Compiling game, using $CORE_COUNT cores"
make -j $CORE_COUNT -O all >/dev/null 
RESULT=$?

if [ $RESULT -ne 0 ]; then
	echo -e "Failed to compile game"
	exit $RESULT
fi

type mgba >/dev/null 2>/dev/null
RESULT=$?

if [ $RESULT -ne 0 ]; then
	echo -e "Cannot run emulator after build: ensure 'mgba' is in the path."
	exit $RESULT
fi

echo -e "Running emulator with build."
mgba pokeemerald.gba
