## install script for R pkgs
install.packages("BiocManager")

sc_pkgs <- c(
  "Canopy",
  "destiny",
  "edgeR",
  "GenomicRanges",
  "irlba",
  "latex2exp",
  "limma",
  "MultiAssayExperiment",
  "org.Hs.eg.db",
  "org.Mm.eg.db",
  "neutralitytestr",
  "pcaMethods",
  "RCurl",
  "Rtsne",
  "scater",
  "scran",
  "slalom",
  "variancePartition",
  "vcfR"
)

pkgs <- c(sc_pkgs)

ap.db <- available.packages(contrib.url(BiocManager::repositories()))
ap <- rownames(ap.db)
pkgs_to_install <- pkgs[pkgs %in% ap]

# do not reinstall packages that are already installed in the image
ip.db <- installed.packages()
ip <- rownames(ip.db)
pkgs_to_install <- pkgs_to_install[!(pkgs_to_install %in% ip)]

BiocManager::install(pkgs_to_install)

devtools::install_github("PMBio/cardelino")

## just in case there were warnings, we want to see them
## without having to scroll up:
warnings()

if (!is.null(warnings()))
{
  w <- capture.output(warnings())
  if (length(grep("is not available|had non-zero exit status", w)))
    quit("no", 1L)
}
