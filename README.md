# r-singlecell-img
Build a docker image with latest R and packages single-cell data analysis.

This image is available from: [davismcc/r-singlecell-img](https://hub.docker.com/r/davismcc/r-singlecell-img)

This repo defines an installatin of the latest version of R bootstrapping the davismcc/r-tidybioc-img (and rocker/verse and bioconductor/release_core2) docker images.

This repo adds the following packages (if not already installed in the bootstrapped images):

* beachmat
* Canopy
* cardelino
* destiny
* edgeR
* limma
* MultiAssayExperiment
* org.Hs.eg.db
* org.Mm.eg.db
* pcaMethods
* Rtsne
* scater
* scran
* slalom
* vcfR
