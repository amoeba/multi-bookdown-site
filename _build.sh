#!/bin/sh

set -e

export TOP=$(pwd)

# Build all books in the books subdir
for book in $(ls books)
do
    echo "Building book in '$book'"
    cd "books/$book"
    Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
    cd "$TOP"
done

# Build the main site
cd "$TOP"
cd "site"
Rscript -e "blogdown::build_site()"
