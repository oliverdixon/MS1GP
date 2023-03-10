#!/bin/bash
# OWD 2023

# Moves all the LaTeX temporary files, as defined by .gitignore patterns, to a
# directory called '.tex_trash/' in the git root. Local directory structures
# (w.r.t the git root) of slated files are mirrored in the trash directory. PDF
# documents are not slated.

GIT_ROOT="$(git rev-parse --show-toplevel)/"
TRASH_DIR="$GIT_ROOT.tex_trash/"
TRASH_FILES="$(git ls-files -io --directory --full-name --exclude-standard | \
        grep -v -e '^\..*' -v -e '\.pdf$')"

# Create the required directory structure.
xargs -r dirname <<< "$TRASH_FILES" | uniq | while read dir; do
        mkdir -pv "$TRASH_DIR$dir"
done

# Move the files to the correct destination in $TRASH_DIR.
while read file; do
        [ ! -z "$file" ] && mv -v "$GIT_ROOT$file" "$TRASH_DIR$file"
done <<< "$TRASH_FILES"

