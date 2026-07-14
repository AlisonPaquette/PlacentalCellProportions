library(readr)
library(dplyr)
library(data.table)
library(org.Hs.eg.db)
library(limma)
library(edgeR)
load("candle_20200226.Rdata")
load("gapps_20210107.Rdata")

candlebatches <- batches
annot$ENSEMBL <- as.character(annot$ENSEMBL)
annot$ENTREZID <- mapIds(org.Hs.eg.db, annot$ENSEMBL, "ENTREZID","ENSEMBL")
protcode <- c("protein_coding","polymorphic_pseudogene", "lncRNA",
              grep("IG_[A-Z]_gene", names(table(annot$BIOTYPE)), value = TRUE),
              grep("TR_[A-Z]_gene", names(table(annot$BIOTYPE)), value = TRUE))
protind <- annot$BIOTYPE %in% protcode


## get counts and annotation and put in a DGEList
candlects <- candle_lengthScaledTPM$counts
candlects <- candlects[protind,]
annot <- annot[protind,]

gappscts <- gapps_lengthScaledTPM$counts
gappscts <- gappscts[protind,]
all_counts = cbind(candlects, gappscts)
ncol(all_counts)

rownames(all_counts) <- annot$SYMBOL

alldg_full <- DGEList(all_counts, genes = annot)
# We retained 14,033 genes with mean log2 counts-per-million greater than 0 across samples
keep <- rowMeans(cpm(alldg_full, log = TRUE)) > 0
alldg_full <- alldg_full[keep, , keep.lib.sizes = FALSE]


# Load single-cell reference
ref <- data.table::fread("GSE182381_reference_sample.txt", sep = "\t")

# Keep only genes shared between the bulk data and reference (12,799 genes)
genes_keep <- intersect(rownames(alldg_full), ref$GeneSymbol)

alldg_full <- alldg_full[genes_keep, , keep.lib.sizes = FALSE]

ref <- ref %>%
  filter(GeneSymbol %in% genes_keep)

# Save filtered mixture (bulk) counts
all_pathways <- alldg_full$counts %>%
  as.data.frame() %>%
  tibble::rownames_to_column("GeneSym")

write_tsv(all_pathways, "all_pathways.txt")

# Save filtered single cell reference
# Use write.table to preserve duplicate column names for the single cell reference
write.table(
  ref,
  "kyle_ref_filtered.txt",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)