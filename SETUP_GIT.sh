#!/bin/bash
# Run this from inside  /Users/marieskau/geospatial\ data\ exam/
# It initialises the git repo, makes 5 logical commits, generates gitlog.txt,
# and prepares everything to push to https://github.com/Marieskau-hub/news-deserts-denmark
#
# Usage:
#   cd "/Users/marieskau/geospatial data exam"
#   bash SETUP_GIT.sh

set -e

echo "==> Cleaning any stale .git directory..."
rm -rf .git

echo "==> git init"
git init -b main
git config user.name  "Marie Skau"
git config user.email "marieskau@icloud.com"

echo "==> Commit 1: scaffolding (README, LICENSE, .gitignore, references.bib)"
git add README.md LICENSE .gitignore references.bib
git commit -m "Initial commit: scaffolding, license, bibliography"

echo "==> Commit 2: data acquisition notebooks"
git add downloadSTAT.ipynb downloadSOCIO-4.ipynb
git commit -m "Add Statbank data-acquisition notebooks (population, income, education, turnout)"

echo "==> Commit 3: coding template + small reference data"
git add news_desert_coding_template.xlsx news_desert_coding_template_prefilled.xlsx \
        dk_municipalities.csv socioeconomic_data.csv folk1a_population.csv \
        municipality_scores.csv syddanmark_scores.csv
git commit -m "Add manual newspaper-municipality coding template and small reference data"

echo "==> Commit 4: analysis notebook + figures"
git add analyse_v2.ipynb analyse_v2_executed.ipynb \
        choropleth_syddanmark.png news_deserts_binary_syd.png \
        moran_scatter_syd.png lisa_clusters_syd.png \
        choropleth_news_coverage.png choropleth_syd.png \
        correlation_scatter_syd.png distribution_syd.png
git commit -m "Add main analysis notebook (Moran's I, LISA, correlations) and figures"

echo "==> Commit 5: report source"
git add news_deserts_corrected.tex
git commit -m "Add report LaTeX source with code-availability link"

echo "==> Connecting to GitHub remote..."
git remote add origin https://github.com/Marieskau-hub/news-deserts-denmark.git

echo "==> Generating gitlog.txt"
git log > gitlog.txt
echo "    gitlog.txt written ($(wc -l < gitlog.txt) lines)"

echo
echo "==============================================================="
echo "  Local repo ready. Final step — push to GitHub:"
echo "    git push -u origin main"
echo "  (you'll be prompted for your GitHub username + a personal"
echo "   access token; if you've never created one, see README below)"
echo "==============================================================="
