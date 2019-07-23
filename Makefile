.SILENT:
.PHONY: 

SRC = $(wildcard raw/*.MP4)
OUT =$(subst .MP4,.mov,$(subst raw/,prores/,$(SRC)))

all: $(OUT)
	echo $(SRC)

prores/%.mov: raw/%.MP4
	mkdir -p backup
	mkdir -p backup/raw
	cp $< backup/$<
	mkdir -p prores
	ffmpeg -i $< -vcodec prores -profile 3 $@

clear: 
	rm -rf prores

