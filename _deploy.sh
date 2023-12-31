#!/bin/sh

#  git clone -b gh-pages git@github.com:gaospecial/SynComMethods.git --depth 1 book-output

set -e

cd book-output

ls | xargs rm -rf
git ls-files --deleted -z | xargs -0 git rm

cp -r ../_book/* ./
git add --all *
git commit -m "Update the book" || true
git reset $(git commit-tree HEAD^{tree} -m "Update the book")
git push -f -q origin gh-pages
