# Mapping News Deserts in Denmark

A geospatial analysis of local news coverage across Danish municipalities, with Region Syddanmark as a proof-of-concept study area.

This repository accompanies the project report **"Mapping News Deserts in Denmark: A Geospatial Analysis of Local News Coverage Across Municipalities"** and contains the code and (most) data used to produce the report's findings.


```
.
├── analyse_v2.ipynb               # Main analysis notebook — reproduces every number in the report
├── analyse_v2_executed.ipynb      # Same notebook with cell outputs already rendered
├── downloadSTAT.ipynb             # Population data fetch from Statistics Denmark Statbank
├── downloadSOCIO-4.ipynb          # Socioeconomic data fetch (income, education, voter turnout)
├── news_desert_coding_template.xlsx           # Empty coding template (codebook)
├── news_desert_coding_template_prefilled.xlsx # Filled-in coding template (60 newspaper-municipality rows)
├── dk_municipalities.csv          # Municipality reference (kode, name, region, population)
├── socioeconomic_data.csv         # Income / education / turnout per municipality
├── municipality_scores.csv        # Per-capita coverage scores (all 98 municipalities)
├── syddanmark_scores.csv          # Per-capita coverage scores (23-municipality study area)
├── folk1a_population.csv          # Raw population pull from Statbank
├── *.png                          # Figures used in the report
├── news_deserts_corrected.tex     # LaTeX source for the report
├── references.bib                 # BibTeX bibliography
└── .gitignore

## Reproducing the analysis

1. Clone this repo.
2. Download `kommuner.geojson` (Danish municipality polygons, EPSG:4326) from [Dataforsyningen](https://dataforsyningen.dk/data/3901) and place it in the repo root.
3. Install dependencies:
   ```
   pip install pandas geopandas libpysal esda scipy matplotlib openpyxl jupyter
   ```
4. Open `analyse_v2.ipynb` in Jupyter and run all cells. The notebook reproduces every number in §4 of the report (mean coverage 0.621, KNN-4 Moran's *I* = 0.098, Spearman correlations with income / education / turnout, and the LISA classification of Svendborg as a Low-High outlier).

The download notebooks (`downloadSTAT.ipynb`, `downloadSOCIO-4.ipynb`) are included to document how the population and socioeconomic data were retrieved from Statistics Denmark's Statbank API. They do not need to be re-run — the resulting CSVs are already in the repo.

## Data sources

- **Newspaper-municipality mapping**: manually constructed from MediaVejviseren and the Danish Ministry of Culture's media-support register; see `news_desert_coding_template_prefilled.xlsx`.
- **Population**: Statistics Denmark, table BY1 / FOLK1A (2026K1).
- **Mean disposable income**: Statistics Denmark, table INDKP101 (2024, INDKOMSTTYPE = 100, ENHED = 116).
- **Higher-education share**: Statistics Denmark, table HFUDD10 (2019, levels H60 + H70).
- **Voter turnout**: Statistics Denmark, table KVRES (KV21, November 2021).
- **Municipality polygons**: Dataforsyningen, `kommuner.geojson` (not committed).
