#!/bin/bash

# Syntax: ./gs_compress.sh file1, file2, ...
#
# If you're using a legacy version of GhostScript, you may need to pass
# -dNEWPDF=false to forcefully invoke the PostScript parser; early versions of
# the newer C parser were very buggy, and would often strip all hyperlinks and
# indexes from documents.

for arg in "$@"; do
        TMP_NAME="$(dirname "$arg")/tmp-$(date '+%s')-$RANDOM.pdf"

        gs \
                -sDEVICE=pdfwrite \
                -dCompatibilityLevel=1.5 \
                -dNOPAUSE \
                -dQUIET \
                -dBATCH \
                -dPrinted=false \
                -sOutputFile="$TMP_NAME" "$arg"

        [ $? -eq 0 ] && mv "$TMP_NAME" "$arg"
done

