#### Tychele N. Turner, Ph.D.
#### 08/02/2016
##### Deciphering the top strand of Illumina arrays to get SNPs all on the + strand 

Background: All Illumina arrays have a nomenclature referring to the top and bottom strand for each SNP. This nomenclature often confuses people and the full advantage of having genome-wide SNPs is missed out. 

There are important considerations when examining strandedness of a variant. Some name it as +/- (as most sequencing studies do), some as the forward/reverse referring to its orientation in the dbSNP database, and yet others as the top/bottom (Illumina). The Illumina annotation file provides numerous features of each SNP including if it is on the top/bottom strand, if it is on the forward/reverse, the alleles in regards to the former, and the sequence of the top probe. With these considerations in mind I thought that the best way to get the + strand would be to blat each top sequence probe to the respective build of the human genome (for example hg19) and then decipher the correct coding of the alleles using the information provided in the annotation file as well as whether the alleles in my plink files were on the top or forward strand.

If the data you have is on the **forward strand** then the following table can be utilized to get the correct alleles on the positive strand.

| Top strand (+/-); derived from BLAT result | Annotation file has alleles on Top/Bottom | Annotation file has alleles on Forward/Reverse | Decision on whether or not to flip in the genotype file | Decision on whether or not to flip in annotation file (this is for checking your work) |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| + | B | F | Yes | Yes | 
| + | B | R | No | Yes | 
| + | T | F | No | No | 
| + | T | R | Yes | No | 
| - | B | F | No | No | 
| - | B | R | Yes | No | 
| - | T | F | Yes | Yes | 
| - | T | R | No | Yes | 

If the data you have is on the **top strand** then the following table can be utilized to get the correct alleles on the positive strand.

| Top strand (+/-); derived from BLAT result | Annotation file has alleles on Top/Bottom | Decision on whether or not to flip in the genotype file | Decision on whether or not to flip in annotation file (this is for checking your work) | 
| ------------- | ------------- | ------------- | ------------- |
| + | B | No | Yes | 
| + | T | No | No | 
| - | B | Yes | No | 
| - | T | Yes | Yes | 

