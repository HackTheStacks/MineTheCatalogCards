INPUT_FILES != ls ../Ornithology-Cata/*/*.jpg | head -90000
TEXT_FILES = $(subst jpg,txt,$(INPUT_FILES))
SPLIT_FILES = $(subst jpg,lines,$(INPUT_FILES))

all: $(SPLIT_FILES) \
  catalog.tsv

%.txt: %.jpg
	tesseract $< $* tesseract.config

%.lines: %.txt bin/divide.awk
	bin/divide.awk $< >$@

catalog.tsv: bin/combine.py $(SPLIT_FILES)
	$^ >$@

#tesseract 01/00001_1a.jpg stdout
#tesseract --print-parameters tesseract.config | grep dawg
