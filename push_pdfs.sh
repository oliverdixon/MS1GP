#!/bin/bash
# OWD 2023

# Copy newer PDFs, as defined by EXPORT_FILES, to the web instance. The
# complicated network of permissions on the York network makes symlinks outside
# of ~/web intractable, so we just copy the entire file.

DEST_DIR="${HOME}/web/ms1_export/"
GIT_ROOT="$(git rev-parse --show-toplevel)/"
EXPORT_FILES=(
        ${GIT_ROOT}presentation/presentation.pdf
        ${GIT_ROOT}presentation/speaker_notes/notes.pdf
        ${GIT_ROOT}report/report.pdf
        ${GIT_ROOT}proposal/proposal.pdf
)

if [[ ! -d $DEST_DIR ]]; then
        echo -e "The destination directory doesn't exist! Are you on a sane" \
                "York networked filesystem?\nDEST_DIR=\"$DEST_DIR\""
        exit 1
fi

# I don't want to uniformly preprocess files with GhostScript here, since it can
# be counterproductive or ineffective on some files (e.g. Beamer presentations).
# We'll leave it up to the user to supply the correctly optimised files for
# uploading!

for file in ${EXPORT_FILES[@]}; do
        destfile="${DEST_DIR}$(basename "$file")"

        [[ ! -f $destfile || $file -nt $destfile ]] &&
                cp -v "$file" "$destfile"
done
