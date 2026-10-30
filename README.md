The code in this repository is related to the following manuscript. Descriptions of each code document are below. 

Title: Cellular Composition of Placental RNA Sequencing Data and Birth Metrics

Authors: Samantha Lapehn‡, Brennan H. Baker‡, Kyle A. Campbell, Mariana Parenti, James MacDonald, Theo Bammler, Stephen A. McCartney, Emily S. Barrett, Ruby H.N. Nguyen, Bhagwat Prasad, Daniel A. Enquobahrie, Ciara Thoreson, Qi Zhao, Kelly M. Bakulski, Sheela Sathyanarayana, Alison G. Paquette*

‡: Co-first authors, contributed equally.
*: Corresponding Author

Code Documents: 
•	CovariatePreparation.Rmd
o	Organizes and filters covariate and birth metric data for all analyses. 
•	RNAseq_Filtering.R
o	Code filtering bulk data to genes with mean log2 counts-per-million greater than 0, and retaining only genes shared between the bulk data and single cell reference.
•	Cell_Deconvolution.docx
o	Describes options used for the analysis modules “Create Signature Matrix” and “Impute Cell Fractions” via the CIBERSORTx web interface.
N=1009 for BW z-score and Gestational Age 
•	CellProportions_Filtering_Plotting_N1009.Rmd
o	Summarizes, plots, and filters deconvoluted cell proportions for downstream analyses. 
•	Birthweight_ZScore_CellProportions_Models.Rmd
o	Evaluates the association between birthweight z-score and placental cell proportions using bootstrapped compositional regression and beta regression. 
•	GestationalAge_CellProportions_Models.Rmd
o	Evaluates the association between gestational age and placental cell proportions using bootstrapped compositional regression and beta regression. 
•	CellProportions_SummaryForestPlot.Rmd
o	Combines results across outcomes into a summary forest plot
•	CellProportions_FetalSex.Rmd
o	Evaluates differences in cell proportion by fetal sex (N=1009) and creates supplemental boxplot.
N=166 for Placental Efficiency (BW:PW and BWadj) 
•	CellProportions_Filtering_Plotting_N166_PlacentalEfficiency.Rmd
o	Summarizes, plots, and filters deconvoluted cell proportions for downstream analyses. 
•	BWPW_ZScore_CellProportions_Models.Rmd
o	Evaluates the association between BW:PW and placental cell proportions using bootstrapped compositional regression and beta regression. 
•	BWadj_CellProportions_Models.Rmd
o	Evaluates the association between BWadj and placental cell proportions using bootstrapped compositional regression and beta regression. 
N=635 for sPTB  
•	CellProportions_Filtering_Plotting_N635.Rmd
o	Summarizes, plots, and filters deconvoluted cell proportions for downstream analyses. 
•	sPTB_CellProportions_Models.Rmd
o	Evaluates the association between sPTB and placental cell proportions using bootstrapped compositional regression and beta regression. 
BW Z-Score Transcriptome Analysis
•	RNAseq_DataProcessing_Filtering.Rmd
o	This code processes, filters, and normalizes the placental RNAseq data for use in the transcriptome models.
•	BW_ZScore_DifferentialExpressionAnalysis_NoCellProp.Rmd
o	Evaluates the association between birthweight z-score and the placental transcriptome with no adjustment for cell proportions.
•	BW_ZScore_DifferentialExpressionAnalysis_CellPropPCA.Rmd
o	Evaluates the association between birthweight z-score and the placental transcriptome with adjusting for cell proportions principal components.
•	BW_ZScore_DifferentialExpressionAnalysis_withCellProp.Rmd
o	Evaluates the association between birthweight z-score and the placental transcriptome with direct adjustment for cell proportions.
•	BW_ZScore_TranscriptomeAnalysis_ResultsComparison_Plotting.Rmd
o	Compares the results across the three differential expression models and creates summary plots.
<img width="468" height="637" alt="image" src="https://github.com/user-attachments/assets/83d4dc97-abf1-43a2-a677-a4b4183dd838" />
