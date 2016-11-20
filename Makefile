#INPUT_FILES != ls ../Ornithology-Cata/00001/*.jpg | head -100
INPUT_FILES != ls ../Ornithology-Cata/*/*.jpg
TEXT_FILES = $(subst jpg,txt,$(INPUT_FILES))
SPLIT_FILES = $(subst jpg,lines,$(INPUT_FILES))
ALREADY_SPLIT_FILES != ls ../Ornithology-Cata/*/*.lines

all: $(TEXT_FILES) $(SPLIT_FILES) \
  catalog.tsv

INPUT_LES != ls ../*/*.jpg | head -90000
TEXT_LES = $(subst jpg,txt,$(INPUT_LES))
SPLIT_LES = $(subst jpg,lines,$(INPUT_LES))

foo: $(TEXT_LES) $(SPLIT_LES) \

#%.txt: %.jpg tesseract.config
%.txt: %.jpg
	tesseract $< $* tesseract.config

%.lines: %.txt bin/divide.awk
	bin/divide.awk $< >$@

catalog.tsv: bin/combine.py $(SPLIT_FILES)
	$^ >$@

diagnostic: $(ALREADY_SPLIT_FILES)
	cut -b1-2 $^ | sort | uniq -c >$@

#tesseract 01/00001_1a.jpg stdout
#tesseract --print-parameters tesseract.config | grep dawg
