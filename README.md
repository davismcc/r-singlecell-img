# r-singlecell-img
Build a docker image with latest R and packages single-cell data analysis.

This image is available from: [davismcc/r-singlecell-img](https://hub.docker.com/r/davismcc/nf-hipsci-endo)

This repo defines an installatin of the latest version of R bootstrapping the davismcc/r-tidybioc-img (and rocker/verse and bioconductor/release_core2) docker images.

This repo adds the following packages (if not already installed in the bootstrapped images):

* beachmat
* Canopy
* cardelino
* clusterExperiment
* DESeq2
* destiny
* DiagrammeR
* edgeR
* GO.db
* goseq
* limma
* MAST
* monocle
* MultiAssayExperiment
* org.Hs.eg.db
* org.Mm.eg.db
* pcaMethods
* preprocessCore
* Rsamtools
* Rsubread
* Rtsne
* RUVseq
* SC3
* scater
* scfind
* scmap
* scone
* scran
* Seurat
* slalom
* snpStats
* sva
* TSCAN
* tximport
* variancePartition
* vcfR
* zinbwave
