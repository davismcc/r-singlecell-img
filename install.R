## install script for R pkgs
source("https://bioconductor.org/biocLite.R")

library(BiocInstaller) # shouldn't be necessary
biocLite()

sc_pkgs <- c(
  "beachmat",
  "Canopy",
  "clusterExperiment",
  "DESeq2",
  "destiny",
  "DiagrammeR",
  "edgeR",
  "GO.db",
  "goseq",
  "limma",
  "MAST",
  "monocle",
  "MultiAssayExperiment",
  "org.Hs.eg.db",
  "org.Mm.eg.db",
  "pcaMethods",
  "preprocessCore",
  "Rsamtools",
  "Rsubread",
  "Rtsne",
  "RUVseq",
  "SC3",
  "scater",
  "scfind",
  "scmap",
  "scone",
  "scran",
  "Seurat",
  "slalom",
  "snpStats",
  "sva",
  "TSCAN",
  "tximport",
  "variancePartition",
  "vcfR",
  "zinbwave"
)

pkgs <- c(sc_pkgs)

ap.db <- available.packages(contrib.url(biocinstallRepos()))
ap <- rownames(ap.db)
pkgs_to_install <- pkgs[pkgs %in% ap]

# do not reinstall packages that are already installed in the image
ip.db <- installed.packages()
ip <- rownames(ip.db)
pkgs_to_install <- pkgs_to_install[!(pkgs_to_install %in% ip)]

biocLite(pkgs_to_install)

devtools::install_github("davismcc/cardelino")
# devtools::install_github("kieranrcampbell/ouija")
# devtools::install_github(c("hemberg-lab/scRNA.seq.funcs",
#                            "Vivianstats/scImpute",
#                            "theislab/kBET",
#                            "JustinaZ/pcaReduce",
#                            "tallulandrews/M3Drop",
#                            "jw156605/SLICER"))

## just in case there were warnings, we want to see them
## without having to scroll up:
warnings()

if (!is.null(warnings()))
{
  w <- capture.output(warnings())
  if (length(grep("is not available|had non-zero exit status", w)))
    quit("no", 1L)
}

suppressWarnings(BiocInstaller::biocValid(fix=TRUE, ask=FALSE))

