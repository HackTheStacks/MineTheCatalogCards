# MineTheCatalogCards

The presentation is available at https://docs.google.com/presentation/d/1ZYIRsSaRAdm22DAZs9Z1OrCzC9yxe_z5J99md7rfOeg/edit?usp=sharing

Prerequisites: For this software to run, you must have tesseract, GNU make, Python, and awk installed. tesseract can be installed 
on Ubuntu by running `sudo apt-get install tesseract-ocr`. I believe that the others come installed on a base Ubuntu system.

The central part of this repo is a Makefile. When properly set up, you can build the catalog, and all of the intermediate files 
simply by running `make` from this directory. If some things change, running make will update those things affected by that 
change. You can also run multiple jobs in parallel by running, for instance four at a time, with `make -j4`

The filenames of the card images must be returned by the `ls` command at the top of the Makefile. It should give the way to get to 
the image files from the current directory. Note that `*` means all files or directories in the given directory, and `*.jpg` means 
all files ending in '.jpg'. You can have this return a subset of the images to get results for that subset only (which is useful 
for doing quick test runs).

The results are stored in catalog.tsv. This is a Tab-separated-values file, since there were many quote and comma characters in 
the OCR output, but no tabs.

The diagnostic file prints the success of the divide.awk script at finding the various parts of the card. The lines with a colon 
count fields that were found, the lines with an X count fields that were not found. Just because the script thinks that it found a 
field doesn't mean that it's right. In particular, the Name field is just the beginning of the card, so NX represents times that 
the script thought it found some other field before the name, which is almost certainly a mistake.

tesseract has a large number of options, of which I tried only a few. It can also be trained to recognize a new font or language 
that it has not been programmed with.
