# multi-bookdown-site

A proof of concept for integrating [Blogdown](https://github.com/rstudio/blogdown) and [Bookdown](https://bookdown.org) in a somewhat coherent manner.

**This README is mainly intended to explain all of the weird hacks I did to get this set up.**

## Oustanding Issues

- Books don't link back to main site
- Header in nav bar isn't quite in vertical alignment with the nav links
- Site isn't fully responsive but it works well enough

## How this works

Not everything is integrated nicely together so there are some folder organization conventions that need to be maintained for things to work.
Changes to these conventions will require updating multiple pieces.

- The root of the repository is a pretty standard [Blogdown](https://github.com/rstudio/blogdown) (See: Hugo) site.
- It's served using GitHub Pages but Travis CI does the task of pushing the prepared site content from the `master` to `gh-pages` branch.
- A root-level `DESCRIPTION` file is present to trick Travis CI into running
- [Bookdown](https://bookdown.org) books are stored in `/books` as subfolders within
- The books are built on Travis CI and moved into the site's `public` directory by Travis CI running `./build_and_merge.sh` during the job.


### Adding a new Workshop

Add a new subfolder into `./content/trainings/{your-training-name}`, replacing `{your-training-name}` with a short title for the training and place an `index.md` in that folder with the content that should appear.

### Adding a new Book (Material)

- Add a new Bookdown book into `./books/`.
- Manually add a link to `./content/materials.md`
