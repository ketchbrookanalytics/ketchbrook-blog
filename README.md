# Ketchbrook Analytics Blog

Repository behind Ketchbrook Analytics' blog: <https://blog.ketchbrookanalytics.com>

## Updating the Blog

If you create a new [post](posts/) or edit an existing post, perform the following steps to update the website:

1. Update [devcontainer.json](.devcontainer/devcontainer.json) with any new dependencies used (e.g., new R packages)
1. Run `quarto render` from a local terminal
    + Optionally, preview your changes with `quarto preview posts/<post_directory>/<post_file>.qmd`
1. Commit and push changes to GitHub
    + This will kick off the GitHub Action to re-render the site

