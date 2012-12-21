#!/bin/bash

# uncompress pdf file
pdftk INPUT_FILE output OUTPUT_FILE uncompress

# concat multiple files with page selection
pdftk A=INPUT1.pdf B=INPUT2.pdf cat A B2-4 output $@

