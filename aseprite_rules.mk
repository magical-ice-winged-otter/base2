# porytiles files are run through porytiles, which is a tool that converts raw png layers to genuine tilesets

AUTO_GEN_TARGETS += $(patsubst %/porytiles-data,%/metatiles.bin,$(shell find data/tilesets/ -type d -name 'porytiles-data'))

%/metatiles.bin: %/porytiles-data %/porytiles-data/top.png %/porytiles-data/middle.png %/porytiles-data/bottom.png
	porytiles compile-primary -disable-attribute-generation -o $(dir $@) $< ./include/constants/metatile_behaviors.h
