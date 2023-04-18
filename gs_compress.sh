#!/bin/bash
# OWD 2023

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

        if [[ $? -eq 0 ]]; then
                echo -e "$arg\t$(du -h "$arg" | cut -f1) ->" \
                        "$(du -h "$TMP_NAME" | cut -f1)"
                mv "$TMP_NAME" "$arg"
        fi
done

