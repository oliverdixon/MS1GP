#!/bin/bash
# OWD 2023

# Copy newer PDFs, as defined by EXPORT_FILES, to the web instance. The
# complicated network of permissions on the York networks make symlinks
# outside of ~/web intractable, so we just copy the entire file.

DEST_DIR="${HOME}/web/ms1_export/"
GIT_ROOT="$(git rev-parse --show-toplevel)/"
EXPORT_FILES=(
        ${GIT_ROOT}presentation/presentation.pdf
        ${GIT_ROOT}presentation/speaker_notes/notes.pdf
        ${GIT_ROOT}report/report.pdf
        ${GIT_ROOT}proposal/proposal.pdf
)

for file in ${EXPORT_FILES[@]}; do
        destfile="${DEST_DIR}$(basename "$file")"

        [[ ! -f "$destfile" || "$file" -nt "$destfile" ]] &&
                cp -v "$file" "$destfile"
done

