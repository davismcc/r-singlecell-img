## install script for R pkgs
source("https://bioconductor.org/biocLite.R")

library(BiocInstaller) # shouldn't be necessary
biocLite()

sc_pkgs <- c(
  "beachmat",
  "Canopy",
  "destiny",
  "edgeR",
  "GO.db",
  "goseq",
  "irlba",
  "limma",
  "MultiAssayExperiment",
  "org.Hs.eg.db",
  "org.Mm.eg.db",
  "Rtsne",
  "scater",
  "scran",
  "slalom",
  "snpStats",
  "VariantAnnotation",
  "vcfR"
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

suppressWarnings(BiocInstaller::biocValid(fix=TRUE, ask=FALSE))

