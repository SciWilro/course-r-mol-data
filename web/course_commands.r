## Getting help
help(rep) # Help for particular function (package must be loaded)
?rep # Help for particular function (package must be loaded)
??ANOVA # Search for the term within all installed packages
help.search("analysis of variance") # Search for the phrase within all installed packages - return list of hits sorted according to type and package (i.e. package::function)
install.packages("sos") # More comprehensive search from packages
library(sos)
findFn("DAPC") # Search for function name

## Set working directory
setwd("/home/vojta/dokumenty/fakulta/vyuka/r_mol_data/examples/") # Create YOUR OWN empty directory and modify the path accordingly!
getwd() # Verifies where we are
dir() # Lists files and folders on the disk
ls() # Lists currently available R objects

## Basic operations
x <- c(5, 6, 7, 8, 9) # Creates vector (see also ?rep)
x # Print "x" content
c() # Is generic function to concatenate objects into new one
length(x) # Length of the object - for matrices and DF use dim()
str(x) # Information about structure of the object
mode(x) # Gets type of storage mode of the object
class(x) # Shows class of the object
x[2] # Shows second element of the object
x <- x[-5] # Removes fifth element
x
y <- matrix(data=5:20, nrow=4, ncol=4) # Creates a matrix
is.matrix(y) # Is it matrix? Try is.<TAB><TAB> TAB key shows available functions and objects starting by typed text
y # Prints the matrix
y[,2] # Prints second column
y[3,] # Prints third row
y[4,3] # Prints element from fourth row and third column
x <- y[2,] # Replaces "x" by second row of "y" (no warning) - R doesn't ask neither notifies when overwriting objects! Be careful!
x
rm(x) # Deletes x
y[,1:3] # Prints first through third column of the matrix
y[3,] <- rep(x=20, each=4) # Replaces third line by value of 20
y
y[y==20] <- 10 # If value of y's element is 20, replace it by 10
y
summary(y) # Basic statistics - according to columns
colnames(y) <- c("A", "B", "C", "D") # Set column names - Objects and functions are without quotation marks; files, text with
colnames(y) # Prints column names, use rownames() in same way
y[,"C"] # Prints column C (R is case sensitive!)
t(y) # Transposes the matrix
y <- as.data.frame(y) # Turns into DF (see other functions as.*)
y[y==17] <- "NA" # Removes values of 17
y
y$B # Gets variable B of data frame y ($ works similarly in S3 objects)
save(list=ls(), file="test.RData") # Saves all objects during the work
load("test.RData") # Loads saved R environment with all objects
# When loading saved project, you have to load again libraries and scripts (see further), data objects are restored
rm(y)

## Get information about object classes
getClassDef("genind") # Or select any other class name

## Packages and repositories
# Set repositories
#  We will need extra repositories. For Bioconductor keep same version as is version of your R installation (3.3 in this case).
options(repos=c("http://cran.at.r-project.org", "http://r-forge.r-project.org/", "http://www.rforge.net/", "https://bioconductor.statistik.tu-dortmund.de/packages/3.3/bioc", "https://bioconductor.statistik.tu-dortmund.de/packages/3.3/data/annotation", "https://bioconductor.statistik.tu-dortmund.de/packages/3.3/data/experiment", "https://bioconductor.statistik.tu-dortmund.de/packages/3.3/extra"))
getOption("repos") # Shows actual repositories
# Install packages
# Installation of multiple packages may sometimes fail - install then packages in smaller groups or one by one
install.packages(pkgs=c("BiocGenerics", "Biostrings", "Geneland", "IRanges", "MASS", "PBSmapping", "ParallelStructure", "RandomFields", "RandomFieldsUtils", "RgoogleMaps", "Rmpi", "S4Vectors", "TeachingDemos", "XML", "XVector", "ade4", "adegenet", "adephylo", "akima", "ape", "brew", "caper", "colorspace", "combinat", "corrplot", "diveRsity", "fields", "geiger", "ggplot2", "gplots", "hierfstat", "lattice", "mapdata", "mapproj", "maps", "maptools", "muscle", "mvtnorm", "nlme", "pegas", "permute", "phangorn", "phylobase", "phytools", "picante", "plotrix", "polysat", "poppr", "rworldmap", "seqinr", "shiny", "sos", "sp", "spdep", "spam", "vegan"), repos=getOption("repos"), dependencies=TRUE)

# Install packages without setting the repositories
# If repositories are not set (for any reason), it is possible to install in several steps packages from main repository and from another sources
install.packages(pkgs=c("Geneland", "MASS", "PBSmapping", "RandomFields", "RandomFieldsUtils", "RgoogleMaps", "Rmpi", "TeachingDemos", "XML", "ade4", "adegenet", "adephylo", "akima", "ape", "brew", "caper", "colorspace", "combinat", "corrplot", "diveRsity", "fields", "geiger", "ggplot2", "gplots", "hierfstat", "lattice", "mapdata", "mapproj", "maps", "maptools", "mvtnorm", "nlme", "pegas", "permute", "phangorn", "phylobase", "phytools", "picante", "plotrix", "polysat", "poppr", "rworldmap", "seqinr", "shiny", "sos", "sp", "spdep", "spam", "vegan"), dependencies=TRUE)

# Install package phyloch not available in any repository
# If not done already, install required packages first
install.packages(pkgs=c("ape", "colorspace", "XML"), dependencies=TRUE)
# It is possible to specify direct path (local or web URL) to package source
install.packages(pkgs="http://www.christophheibl.de/phyloch_1.5-3.tar.gz", repos=NULL, type="source")

# We will load packages by library(package) one by one when needed and plugins\ldots
# Update packages
update.packages(repos=getOption("repos"))

# Standard installation
install.pacakges(c("adegenet", "poppr", "phytools"))
update.packages() # Update packages

# Installation from custom repository
install.packages("ParallelStructure", repos="http://R-Forge.R-project.org")
?install.packages # See help for details

## Bioconductor

# Bioconductor - if https fails, use http
source("https://bioconductor.org/biocLite.R")
# Get help how to use it
?biocLite
# Install package(s)
biocLite(c("Biostrings", "seqinr"))
# Install Bioconductor packages used during the course
biocLite(pkgs=c("BiocGenerics", "Biostrings", "IRanges", "S4Vectors", "XVector", "muscle"))
biocLite() # Update Bioconductor packages
# Upgrades installed Bioconductor packages to new R release (e.g. from 3.2 to 3.3)
biocLite("BiocUpgrade")

## Libraries for population - genetic analysis

# Load needed libraries
library(ape)
library(ade4)
library(adegenet)
library(pegas)
library(poppr)
library(vegan)

## Data

# Load training data
hauss.loci <- read.loci("https://trapa.cz/sites/default/rcourse/haussknechtii_ssrs.txt", header=TRUE, loci.sep="\t", allele.sep="/", col.pop=2, col.loci=3:14, row.names=1)
# Data control
hauss.loci
print(hauss.loci, details=TRUE)

# Conversion of loci to genind - used for many analysis
hauss.genind <- loci2genind(hauss.loci)
# See population names
pop(hauss.genind)
hauss.genind$pop

# Convert corrected genind to loci
hauss.loci.cor <- genind2loci(hauss.genind)

# Read coordinates
hauss.coord <- read.csv("https://trapa.cz/sites/default/rcourse/haussknechtii_coordinates.csv", header=TRUE, sep="\t", quote="", dec=".", row.names=1)
hauss.coord

# Add coordinates - note identification of slots within object
hauss.genind$other$xy <- hauss.coord
# See result
hauss.genind$other$xy
hauss.genind

# Conversion to genpop - for population-level analysis
hauss.genpop <- genind2genpop(hauss.genind, process.other=TRUE)
# See result
hauss.genpop

# Removes missing data - see ?missingno for types of dealing with them
hauss.genind.cor <- missingno(pop=hauss.genind, type="mean", cutoff=0.1, quiet=FALSE) # Use with caution! It modifies original data!
# Convert corrected genind to loci
hauss.loci.cor <- genind2loci(hauss.genind.cor)

# Writes loci file to the disk
write.loci(hauss.loci.cor, file="hauss.loci.cor.txt", loci.sep="\t", allele.sep="/")

# Read datasets from various software
read.genalex() # poppr - reads *.csv file
read.fstat() # adegenet - reads *.dat files, only haploid/diploid data
read.genetix() # adegenet - reads *.gtx files, only haploid/diploid data
read.genepop() # adegenet - reads *.gen files, only haploid/diploid data
read.structure() # adegenet - reads *.str files, only haploid/diploid data

# Import of triploid (polyploid) microsattelites
tarax3n.table <- read.table("https://trapa.cz/sites/default/rcourse/tarax3n.txt", header=TRUE, sep="\t", quote="", row.names=1)
# Check the data
tarax3n.table
class(tarax3n.table)
dim(tarax3n.table)

tarax3n.genind <- df2genind(X=tarax3n.table[,1:6], sep="/", ncode=3, pop=tarax3n.table[["pop"]], ploidy=3, type="codom")
# See resulting genind object
tarax3n.genind
summary(tarax3n.genind)

# Import of AFLP data
amara.aflp <- read.table(file="https://trapa.cz/sites/default/rcourse/amara_aflp.txt", header=TRUE, sep="\t", quote="")
amara.aflp
dim(amara.aflp)
class(amara.aflp) # Must be matrix or data frame
# Populations - just one column with population names for all inds
amara.pop <- read.table(file="https://trapa.cz/sites/default/rcourse/amara_pop.txt", header=TRUE, sep="\t", quote="")
amara.pop
dim(amara.pop)
# Create genind object - ind.names and loc.names are taken from X
aflp.genind <- df2genind(X=amara.aflp, sep="", ind.names=NULL, loc.names=NULL, pop=amara.pop[,1], type="PA")
indNames(aflp.genind) <- amara.aflp[,1] # Add individual names
aflp.genind
summary(amara.aflp)

# Some useful functions for data manipulations
genind2df() # adegenet - export into data frame
genind2genalex() # poppr - export for genalex
splitcombine() # poppr - edits population hierarchy
popsub() # poppr - extracts only selected population(s)
clonecorrect() # poppr - corrects for clones
informloci() # poppr - removes uninformative loci
seppop() # adegenet - separates populations from genind or genlight object
seploc() # adegenet - splits genind, genpop or genlight by markers
# seppop and seploc return lists of objects - for further analysis
# read manual pages (?...) of the functions before usage

# Reading FASTA (reads also another formats, see ?read.dna), sequences of flu viruses from various years
usflu.dna <- read.dna(file="http://adegenet.r-forge.r-project.org/files/usflu.fasta", format="fasta")
# Check the object
class(usflu.dna)
usflu.dna
# Another possibility (only for FASTA alignments, same result):
usflu.dna2 <- fasta2DNAbin(file="http://adegenet.r-forge.r-project.org/files/usflu.fasta") # Normally keeps only SNP - see ?fasta2DNAbin
# Check the object
class(usflu.dna)
usflu.dna2
as.character(usflu.dna2)[1:5,1:10]
dim(usflu.dna2) # Does it have correct size?
# Read anotations
usflu.annot <- read.csv("http://adegenet.r-forge.r-project.org/files/usflu.annot.csv", header=TRUE, row.names=1)
head(usflu.annot)
# Convert DNAbin to genind - only polymorphic loci are retained
usflu.genind <- DNAbin2genind(x=usflu.dna, pop=usflu.annot[["year"]])
# read.fasta() from seqinr package reads DNA or AA in FASTA format - returns a list (DNAbin is for us now better choice)
usflu.dna3 <- seqinr::read.fasta(file="http://adegenet.r-forge.r-project.org/files/usflu.fasta", seqtype="DNA")
class(usflu.dna3)
length(usfl.dna3) # How many sequences we have in the list
usflu.dna3
# Convert into DNAbin class (technically, DNAbin is a list)
class(usflu.dna3) <- "DNAbin"

# Importing DNA sequences from GeneBank - according to sequence ID, data from http://www.ncbi.nlm.nih.gov/popset/608602125
meles.dna <- read.GenBank(c("KJ161355.1", "KJ161354.1", "KJ161353.1", "KJ161352.1", "KJ161351.1", "KJ161350.1", "KJ161349.1", "KJ161348.1", "KJ161347.1", "KJ161346.1", "KJ161345.1", "KJ161344.1", "KJ161343.1", "KJ161342.1", "KJ161341.1", "KJ161340.1", "KJ161339.1", "KJ161338.1", "KJ161337.1", "KJ161336.1", "KJ161335.1", "KJ161334.1", "KJ161333.1", "KJ161332.1", "KJ161331.1", "KJ161330.1", "KJ161329.1", "KJ161328.1"))
meles.dna
class(meles.dna)
# Converts DNAbin to genind - extracts SNP - for large datasets can be computationally very intensive
meles.genind <- DNAbin2genind(meles.dna)

# Query on-line sequence databases
library(seqinr)
choosebank() # Genetic banks available for seqinr
choosebank("embl") # Choose some bank
# Query selected database - there are much possibilities
?query # See how to construct the query
nothofagus <- query(listname="nothofagus", query="SP=Nothofagus AND K=rbcl", verbose=TRUE)
# See the sequences information
nothofagus$req
# Get the sequences as a list
nothofagus.sequences <- getSequence(nothofagus$req)
# See sequences
nothofagus.sequences
# Get annotations
nothofagus.annot <- getAnnot(nothofagus$req)
nothofagus.annot
# Close the bank when work is over
closebank()
# Convert sequences from a list to DNAbin (functions as.DNAbin*)
nothofagus.dna <- as.DNAbin.list(nothofagus.sequences)
nothofagus.dna # See it

# Checking SNPs
# Position of polymorphism within alignment - snpposi.plot() requires input data in form of matrix
snpposi.plot(x=as.matrix(meles.dna), codon=FALSE)
# Position of polymorphism within alignment - differentiating codons
snpposi.plot(as.matrix(meles.dna))
# When converting to genind object, only polymorphic loci are kept - threshold for polymorphism can be arbitrary
meles.genind <- DNAbin2genind(x=meles.dna, polyThres=0.01)
# Test of random distribution of SNP
snpposi.test(x=as.matrix(meles.dna))

# Importing SNP
read.PLINK(file="PLINKfile", ...)
?readPLINK # See it for available options
# Extract SNP from FASTA alignment
usflu.genlight <- fasta2genlight(file="http://adegenet.r-forge.r-project.org/files/usflu.fasta", quiet=FALSE, saveNbAlleles=TRUE)
# If it crashes (on Windows), try add parameter "parallel=FALSE"
# Function has several options to speed up reading
?fasta2genlight
# Convert genlight to genind (usually not necessary)
genind <- df2genind(as.data.frame(genlight)) # Check settings!
# Resulting data matrix might be slightly different than when using DNAbin2genind - depends on used settings

## Check sequences
# Nucleotide diversity
pegas::nuc.div(x=meles.dna)
# Base frequencies
ape::base.freq(x=meles.dna)
# GC content
ape::GC.content(x=meles.dna)
# umber of times dimer/trimer/etc oligomers occur in a sequence
seqinr::count(seq=meles.dna[["KJ161328.1"]], wordsize=3)
# View sequences - all must be of the same length
image(x=usflu.dna, c("a", "t", "c" ,"g", "n"), col=rainbow(5))
# Function "image" requires as input matrix, so that sequences must be of same length
image(x=as.matrix(meles.dna), c("a", "t", "c" ,"g", "n"), col=rainbow(5))
# Direct function to display the sequences
image.DNAbin(x=usflu.dna)
image.DNAbin(x=as.matrix(meles.dna))

## Exporting data
# Convert genind into DF using genind2df()
hauss.df <- genind2df(x=hauss.genind, pop=NULL, sep="/", usepop=TRUE, oneColPerAll=FALSE)
write.table(x=hauss.df, file="haussdata.txt", quote=FALSE, sep="\t", na="NA", dec=".", row.names=TRUE, col.names=TRUE)
# Export of DNA sequences into FASTA format
write.dna(x=usflu.dna, file="usflu.fasta", format="fasta", append=FALSE, nbcol=6)
seqinr::write.fasta(sequences=meles.dna, names=names(meles.dna), file.out="meles.fasta", open="w")
# Export DNA sequnces as NEXUS
write.nexus.data(x=meles.dna, file="meles.nexus", format="dna")
# Export trees (objects of class phylo)
write.tree(phy=hauss.nj.bruvo, file="haussknechtii.nwk") # Writes tree(s) in NEWICK format
write.nexus(hauss.nj.bruvo, file="haussknechtii.nexus") # Writes tree(s) in NEXUS format

## Descriptive statistics

# Get summary - names and sizes of populations, heterozygosity, some info about loci
hauss.summ <- summary(hauss.genind)
# Plot expected vs. observed heterozygosity - it looks like big difference
plot(x=hauss.summ$Hexp, y=hauss.summ$Hobs, main="Observed vs expected heterozygosity", xlab="Expected heterozygosity", ylab="Observed heterozygosity")
abline(0, 1, col="red")
# T-test of difference between observed and expected heterozygosity - strongly significant
t.test(x=hauss.summ$Hexp, y=hauss.summ$Hobs, paired=TRUE, var.equal=TRUE)
# Bartlett's K-squared of difference between observed and expected heterozygosity - not significant
bartlett.test(list(hauss.summ$Hexp,hauss.summ$Hobs))
# Create pane with some information
par(mfrow=c(2,2)) # Divide graphical devices into 4 smaller spaces
# Plot alleles number vs. population sizes
plot(x=hauss.summ$n.by.pop, y=hauss.summ$pop.nall, xlab="Populations sample size", ylab="Number of alleles", main="Alleles numbers and sample sizes", col="red", pch=20)
# Add text description to the point
text(x=hauss.summ$n.by.pop, y=hauss.summ$pop.nall, lab=names(hauss.summ$n.by.pop), cex=1.5)
# Barplots of various data
barplot(height=hauss.summ$loc.n.all, ylab="Number of alleles", main="Number of alleles per locus", las=3)
barplot(height=hauss.summ$Hexp-hauss.summ$Hobs, main="Heterozygosity: expected-observed", ylab="Hexp - Hobs", las=3)
barplot(height=hauss.summ[["n.by.pop"]], main="Sample sizes per population", ylab="Number of genotypes", las=3)
dev.off() # Closes graphical device - otherwise following graphs would still be divided into 4 parts

# poppr returns various population statistics for populations - png() will produce set of figures for each population
png(filename="poppr_%03d.png", width=720, height=720, bg="white") # Output figures will be saved to the disk
poppr(dat=hauss.genind, total=TRUE, sample=1000, method=4, missing="geno", cutoff=0.15, quiet=FALSE, clonecorrect=FALSE, hist=TRUE, minsamp=1, legend=TRUE)
dev.off() # Closes graphical device - needed after use of functions like png(), svg(), pdf(), ... to write the file(s) to the disk
# Pop - Population name (Note that “Total” also means “Pooled”)
# N - Number of individuals observed
# MLG - Number of multilocus genotypes (MLG) observed
# eMLG - The number of expected MLG at the smallest sample size ≥ 10 based on rarefaction.
# SE - Standard error based on eMLG
# H - Shannon-Wiener Index of MLG diversity
# G - Stoddart and Taylor’s Index of MLG diversity
# Hexp - Nei’s 1978 genotypic diversity (corrected for sample size), or Expected Heterozygosity
# E.5 - Evenness, E5
# Ia - The index of association, IA
# rbarD - The standardized index of association

# Departure from HWE
# According to loci
hauss.hwe.test <- hw.test(x=hauss.loci, B=1000)
hauss.hwe.test
# According to populations
# Separate genind object into list of genind objects for individual populations
hauss.pops <- seppop(hauss.genind)
hauss.pops
# Convert genind back to loci (list of loci objects according to populations)
hauss.pops.loci <- lapply(X=hauss.pops, FUN=genind2loci)
# Calculate the results per populations
lapply(X=hauss.pops.loci, FUN=hw.test, B=1000)

# FST
# Fit, Fst and Fis for each locus
# For Fst, fstat and theta.msat the loci object must contain population column
Fst(x=hauss.loci, pop=1)
# multilocus estimators of variance components and F-statistics, alternative to Fst
library(hierfstat)
fstat(x=hauss.genind, pop=NULL, fstonly=FALSE)
# Nei's pairwise Fst between all pairs of populations. Difference in res.type="dist"/"matrix" is only in format of output
pairwise.fst(x=hauss.genind, pop=NULL, res.type="matrix")

# Estimates of population theta according to Kimmel et al. 1998
theta.msat(hauss.loci)

## Multi locus genotypes
# Total number of MLGs (simple value)
mlg(gid=hauss.genind, quiet=FALSE)
# MLGs shared among populations (a list)
mlg.crosspop(gid=hauss.genind, df=TRUE, quiet=FALSE)
# Detailed view on distribution of MLGs into populations (table and/or plot)
mlg.table(gid=hauss.genind, bar=TRUE, total=TRUE, quiet=FALSE)
# Which individual belong to which vector (two ways of display)
mlg.vector(hauss.genind)
mlg.id(hauss.genind)

## Inbreeding
# Load training data
data(microbov)
# Separate populations of Salers cattle
microbov.pops <- seppop(microbov)[["Salers"]]
# Calculate the inbreeding
?inbreeding # Check for more settings
microbov.inbr <- inbreeding(x=microbov.pops, N=100)
# Prepare population means for plotting
microbov.bar <- sapply(X=microbov.inbr, FUN=mean)
# Plot it
hist(x=microbov.bar, col="firebrick", main="Average inbreeding in Salers cattles")

## Genetic distances

# See ?dist.gene for details about methods of this distance constructions
hauss.dist.g <- dist.gene(x=hauss.genind@tab, method="pairwise")

# Euclidean distance for individuals (plain ordinary distance matrix)
hauss.dist <- dist(x=hauss.genind, method="euclidean", diag=TRUE, upper=TRUE)
hauss.dist

# Nei's distance (not Euclidean) for populations (other methods are available, see ?dist.genpop)
hauss.dist.pop <- dist.genpop(x=hauss.genpop, method=1, diag=TRUE, upper=TRUE)
# Test if it is Euclidean
is.euclid(hauss.dist.pop, plot=TRUE, print=TRUE, tol=1e-10)
# Turns to be Euclidean
hauss.dist.pop <- cailliez(distmat=hauss.dist.pop, print=FALSE, tol=1e-07, cor.zero=TRUE)
# Test if it is Euclidean
is.euclid(hauss.dist.pop, plot=TRUE, print=TRUE, tol=1e-10)
# Show it
hauss.dist.pop

# Bruvo's distances weighting SSRs repeats - take care about replen parameter - requires repetition length for every SSRs locus
hauss.dist.bruvo <- bruvo.dist(pop=hauss.genind, replen=rep(2, 12), loss=TRUE)
# Test if it is Euclidean
is.euclid(hauss.dist.bruvo, plot=TRUE, print=TRUE, tol=1e-10)
# Turn to be Euclidean
hauss.dist.bruvo <- cailliez(distmat=hauss.dist.bruvo, print=FALSE, tol=1e-07, cor.zero=TRUE)
# Test if it is Euclidean
is.euclid(hauss.dist.bruvo, plot=TRUE, print=TRUE, tol=1e-10)
# Show it
hauss.dist.bruvo

# Nei's distance (not Euclidean) for individuals (other methods are available, see ?nei.dist from poppr package)
hauss.dist.nei <- poppr::nei.dist(x=hauss.genind, warning=TRUE)
is.euclid(hauss.dist.nei, plot=TRUE, print=TRUE, tol=1e-10) # It has so much NAs, so it it impossible to check it and convert into Euclidean distance
# Show it
hauss.dist.nei

# Dissimilarity matrix returns a distance reflecting the number of allelic differences between two individuals
hauss.dist.diss <- diss.dist(x=hauss.genind, percent=FALSE, mat=TRUE)
hauss.dist.diss

# Import custom distance matrix
MyDistance <- read.csv("distances.txt", header=TRUE, sep="\t", dec=".", row.names=1)
MyDistance <- as.dist(MyDistance)
class(MyDistance)
is.euclid(MyDistance, plot=TRUE, print=TRUE, tol = 1e-10)
dim(MyDistance)
MyDistance
MyDistance <- cailliez(MyDistance, print=TRUE, tol = 1e-10, cor.zero=TRUE)
is.euclid(MyDistance, plot=TRUE, print=TRUE, tol = 1e-10)
MyDistance

# DNA distances - there are various models available
?dist.dna
usflu.dist <- dist.dna(x=usflu.dna, model="TN93")
usflu.dist
class(usflu.dist)
dim(as.matrix(usflu.dist))
meles.dist <- dist.dna(x=meles.dna, model="F81")
meles.dist
class(meles.dist)
dim(as.matrix(meles.dist))

# Pairwise genetic distances for each data block (genlight objects with whole genome data) - sensitive to missing data
usflu.dists <- lapply(X=usflu.genlight, FUN=function(DDD) dist(as.matrix(DDD)))
class(usflu.dists)
names(usflu.dists)
class(usflu.dists[[1]])
usflu.distr <- Reduce(f="+", x=usflu.dists)
class(usflu.distr)
usflu.distr
# It is possible to use just basic dist function on whole genlight object (might require a lot of RAM)
usflu.distg <- dist(as.matrix(usflu.genlight))

# Visualize pairwise genetic similarities
# table.paint() requires data frame, dist can't be directly converted to DF
table.paint(df=as.data.frame(as.matrix(usflu.dist)), cleg=0, clabel.row=0.5, clabel.col=0.5)
# Same visualization, coloured
# heatmap() reorders values
heatmap(x=as.matrix(usflu.dist), Rowv=NA, Colv=NA, symm=TRUE)
# Another possibility is to use function corrplot() from package corrplot

## Heatmaps
# Based on various distances
heatmap(as.matrix(hauss.dist), symm=TRUE, labRow=rownames(as.matrix(hauss.dist.bruvo)), labCol=colnames(as.matrix(hauss.dist.bruvo))) # hauss.dist doesn't contain names of individuals - we have to add them here
heatmap(as.matrix(hauss.dist.pop), symm=TRUE)
heatmap(as.matrix(hauss.dist.bruvo), symm=TRUE)
heatmap(as.matrix(hauss.dist.diss), symm=TRUE)

## Hierarchical clustering
# According to distance used - see ?hclust for available methods
plot(hclust(d=hauss.dist, method="complete"))
plot(hclust(d=hauss.dist.pop, method="complete"))
plot(hclust(d=hauss.dist.bruvo, method="complete"))

## UPGMA
# Calculate it
# Saving as phylo object (and not hclust) gives more possibilities for further plotting and manipulations
usflu.upgma <- as.phylo(hclust(d=usflu.dist, method="average"))
plot.phylo(x=usflu.upgma, cex=0.75)
title("UPGMA tree")
# Test quality - tests correlation of original distance in the matrix and reconstructed distance from hclust object
plot(x=as.vector(usflu.dist), y=as.vector(as.dist(cophenetic(usflu.upgma))), xlab="Original pairwise distances", ylab="Pairwise distances on the tree", main="Is UPGMA appropriate?", pch=20, col=transp(col="black", alpha=0.1), cex=2)
abline(lm(as.vector(as.dist(cophenetic(usflu.upgma)))~as.vector(usflu.dist)), col="red")

## AMOVA
# From package pegas (doesn't directly show percentage of variance)
hauss.pop <- hauss.genind$pop
hauss.amova <- pegas::amova(hauss.dist~hauss.pop, data=NULL, nperm=1000, is.squared=TRUE)
hauss.amova
# Another possibility is poppr.amova - for more complicated hierarchy - see ?poppr.amova

## MSN based on Bruvo's distance
bruvo.msn(gid=hauss.genind, replen=rep(2, 12), loss=TRUE, palette=rainbow, vertex.label="inds", gscale=TRUE, wscale=TRUE, showplot=TRUE)
?bruvo.msn

## NJ

# Calculates the tree (try with various distances)
hauss.nj <- nj(hauss.dist)

# Test tree quality - plot original vs. reconstructed distance
plot(as.vector(hauss.dist), as.vector(as.dist(cophenetic(hauss.nj))), xlab="Original distance", ylab="Reconstructed distance")
abline(lm(as.vector(hauss.dist) ~ as.vector(as.dist(cophenetic(hauss.nj)))), col="red")
summary(lm(as.vector(hauss.dist) ~ as.vector(as.dist(cophenetic(hauss.nj))))) # Prints summary text

# Plot a basic tree - see ?plot.phylo for details
plot.phylo(x=hauss.nj, type="phylogram")
plot.phylo(x=hauss.nj, type="cladogram", edge.width=2)
plot.phylo(x=hauss.nj, type="fan", edge.width=2, edge.lty=2)
plot.phylo(x=hauss.nj, type="radial", edge.color="red", edge.width=2, edge.lty=3, cex=2)

# Bootstrap

# boot.phylo() resamples all columns - remove population column first
hauss.loci.nopop <- hauss.loci
hauss.loci.nopop[["population"]] <- NULL
hauss.boot <- boot.phylo(phy=hauss.nj, x=hauss.loci.nopop, FUN=function(XXX) nj(dist(loci2genind(XXX))), B=1000)
# boot.phylo returns NUMBER of replicates - NO PERCENTAGE
# Plot the tree
plot.phylo(x=hauss.nj, type="unrooted", main="Neighbour-Joining tree")
# Labels for nodes - bootstrap - see ?nodelabels for graphical settings
nodelabels(text=round(hauss.boot/10))

# Another bootstrap possibility
?aboot # See details...
??plot.phylo

# Plot a nice tree with colored tips
plot.phylo(x=hauss.nj, type="unrooted", show.tip=FALSE, lwd=3, main="Neighbour-Joining tree")
# Labels for nodes - bootstrap - see ?nodelabels for graphical settings
nodelabels(text=round(hauss.boot/10))
# Coloured labels - creates vector of colors according to population information in genind object
nj.rainbow <- colorRampPalette(rainbow(length(levels(pop(hauss.genind)))))
# Colored tips
tiplabels(text=indNames(hauss.genind), bg=fac2col(x=hauss.genind$pop, col.pal=nj.rainbow))

# Plot BW tree with tip symbols and legend
plot.phylo(x=hauss.nj, type="cladogram", show.tip=FALSE, lwd=3, main="Neighbour-Joining tree")
# Add axis with distances
axisPhylo()
# From node labels let's remove unneeded frame
nodelabels(text=round(hauss.boot/10), frame="none", bg="white")
# As tip label we use only symbols - see ?points for graphical details
tiplabels(frame="none", pch=rep(x=0:4, times=c(13, 17,  2,  6,  9)), lwd=2, cex=2)
# Plot a legend explainindg symbols
legend(x="topleft", legend=c("He", "Oh", "Pr", "Ne", "Sk"), border="black", pch=0:4, pt.lwd=2, pt.cex=2, bty="o", bg="lightgrey", box.lwd=2, cex=1.2, title="Populations")

# Bruvo's distance - NJ
# hauss.nj.bruvo <- bruvo.boot(pop=hauss.genind, replen=rep(2, 12), sample=1000, tree="nj", showtree=TRUE, cutoff=1, quiet=FALSE)
# plot.phylo(x=hauss.nj.bruvo, type="unrooted", show.tip=FALSE, lwd=3, main="Neighbor-Joining tree.")
# # bruvo.boot() writes all needed information into resulting object, so there is no need for external bootstrap function
# nodelabels(hauss.nj.bruvo[["node.labels"]]) # Note you can call node labels from phylo object as phylo$node.labels or phylo[["node.labels"]]
# tiplabels(hauss.nj.bruvo[["tip.label"]], bg=fac2col(x=hauss.genind$pop, col.pal=nj.rainbow))

# Bruvo's distance - UPGMA
# hauss.upgma <- bruvo.boot(pop=hauss.genind, replen=rep(2, 12), sample=1000, tree="upgma", showtree=TRUE, cutoff=1, quiet=FALSE)
# plot.phylo(hauss.upgma, type="unrooted", show.tip=FALSE, lwd=3, main="UPGMA tree")
# nodelabels(hauss.upgma[["node.labels"]])
# tiplabels(hauss.upgma[["tip.label"]], bg=fac2col(x=hauss.genind@pop, col.pal=nj.rainbow))

# Populations
hauss.nj.pop <- nj(hauss.dist.pop)
# Bootstrap - source() loads external scripts (boot.phylo doesn't work for population trees)
source("https://trapa.cz/sites/default/rcourse/boot_phylo_nj_pop.r")
hauss.boot.pop <- boot.phylo.nj.pop(hauss.nj.pop, hauss.genind, 1000)
# Plot a tree
plot(hauss.nj.pop, type="radial", cex=1.2, lwd=3, main="Neighbor-Joining tree of populations")
# Labels - bootstrap
nodelabels(round(hauss.boot.pop/10), frame="none")
print.phylo(hauss.nj.pop)

# Make a tree based on DNA sequences
usflu.tree <- nj(X=usflu.dist)
# Plot it
plot.phylo(x=usflu.tree, type="unrooted", show.tip=FALSE)
title("Unrooted NJ tree")
# Coloured tips
usflu.pal <- colorRampPalette(topo.colors(length(levels(as.factor(usflu.annot$year)))))
# Tip labels
tiplabels(text=usflu.annot$year, bg=num2col(usflu.annot$year, col.pal=usflu.pal), cex=0.75)
# Legend - describing years - pretty() automatically shows best values from given range, num2col() selects colours from colour scale
legend(x="bottomright", fill=num2col(x=pretty(x=1993:2008, n=8), col.pal=usflu.pal), leg=pretty(x=1993:2008, n=8), ncol=1)

# Root the tree - "outgroup" is name of accession (in quotation marks) or number (position within phy object)
usflu.tree.rooted <- root(phy=usflu.tree, outgroup=1)
# Plot it
plot.phylo(x=usflu.tree.rooted, show.tip=FALSE, edge.width=2)
title("Rooted NJ tree")
# Labeling of tips
tiplabels(text=usflu.annot$year, bg=transp(num2col(x=usflu.annot$year, col.pal=usflu.pal), alpha=0.7), cex=0.75, fg="transparent")
# Add axis with phylogenetic distance
axisPhylo()
# Legend - describing years - pretty() automatically shows best values from given range, num2col() selects colours from colour scale
legend(x="topright", fill=num2col(x=pretty(x=1993:2008, n=8), col.pal=usflu.pal), leg=pretty(x=1993:2008, n=8), ncol=1)

# Bootstrap rooted tree
# Calculate it
usflu.boot <- boot.phylo(phy=usflu.tree.rooted, x=usflu.dna, FUN=function(EEE) root(nj(dist.dna(EEE, model="TN93")), outgroup=1), B=1000)
# Plot the tree
plot.phylo(x=usflu.tree.rooted, show.tip=FALSE, edge.width=2)
title("NJ tree + bootstrap values")
tiplabels(frame="none", pch=20, col=transp(num2col(x=usflu.annot$year, col.pal=usflu.pal), alpha=0.7), cex=3.5, fg="transparent")
axisPhylo()
# Legend - describing years - pretty() automatically shows best values from given range, num2col() selects colours from colour scale
legend(x="topright", fill=num2col(x=pretty(x=1993:2008, n=8), col.pal=usflu.pal), leg=pretty(x=1993:2008, n=8), ncol=1)
# Plots bootstrap support - note usflu.boot contains raw numbers - transform it into percent
nodelabels(text=round(usflu.boot/10), cex=0.75)

# Collapse branches with low bootstrap support
usflu.tree.usflu.na.density <- usflu.tree.rooted
# Determine branches with low support - note BS values are in raw numbers - use desired percentage with respect to number of bootstraps
usflu.tocollapse <- match(x=which(usflu.boot < 700)+length(usflu.tree.rooted$tip.label), table=usflu.tree.usflu.na.density$edge[,2])
# Set length of bad branches to zero
usflu.tree.usflu.na.density$edge.length[usflu.tocollapse] <- 0
# Create new tree
usflu.tree.collapsed <- di2multi(phy=usflu.tree.usflu.na.density, tol=0.00001)
# Plot the consensus tree
plot.phylo(x=usflu.tree.collapsed, show.tip=FALSE, edge.width=2)
title("NJ tree after collapsing weak nodes")
tiplabels(text=usflu.annot$year, bg=transp(num2col(x=usflu.annot$year, col.pal=usflu.pal), alpha=0.7), cex=0.5, fg="transparent")
axisPhylo()
legend(x="topright", fill=num2col(x=pretty(x=1993:2008, n=8), col.pal=usflu.pal), leg=pretty(x=1993:2008, n=8), ncol=1)

## Replacements of NJ
# Usage is same as nj() Check
?njs
?bionj
?bionjs
?NJ
?UNJ
?fastme

## PCoA

# Calculate it - based on various distance matrix
hauss.pcoa <- dudi.pco(d=dist(x=scaleGen(x=hauss.genind, center=TRUE, scale=FALSE, truenames=TRUE), method="euclidean"), scannf=FALSE, nf=3)
# Basic display
s.label(dfxy=hauss.pcoa$li, clabel=0.75)
# To plot different axes use for example "...dfxy=hauss.pcoa$li[c(2, 3)]..."
# Add kernel density
s.kde2d(dfxy=hauss.pcoa$li, cpoint=0, add.plot=TRUE)
# Adds histogram of Eigenvalues
add.scatter.eig(w=hauss.pcoa$eig, nf=3, xax=1, yax=2, posi="bottomleft", sub="Eigenvalues")

# Colored display according to populations
hauss.pcoa.col <- rainbow(length(levels(pop(hauss.genind)))) # Creates vector of colors according to populations
s.class(dfxy=hauss.pcoa$li, fac=pop(hauss.genind), col=hauss.pcoa.col)
add.scatter.eig(w=hauss.pcoa$eig, nf=3, xax=1, yax=2, posi="bottomleft", sub="Eigenvalues")
title("Principal Coordinates Analysis") # Adds title to the graph

# Based on Bruvo's distance
hauss.pcoa.bruvo <- dudi.pco(d=bruvo.dist(pop=hauss.genind, replen=rep(2, 12)), scannf=FALSE, nf=3)
s.class(dfxy=hauss.pcoa.bruvo$li, fac=pop(hauss.genind), col=hauss.pcoa.col)
add.scatter.eig(hauss.pcoa.bruvo$eig, posi="bottomright", 3, 1, 2)
# Another possibility for colored plot (see ?colorplot for details)
colorplot(xy=hauss.pcoa$li[c(1, 2)], X=hauss.pcoa$li, transp=TRUE, cex=3, xlab="PC 1", ylab="PC 2")
title(main="PCoA, axes 1 and 3")
abline(v=0, h=0, col="grey", lty=2)

## Clustering analysis

# Graphical web interface for DAPC
adegenetServer("DAPC")

## K-find
# Bayesian K-means clustering
# Retain all informative PC (here about 35). According to second graph select best K (here 2 or 3).
hauss.kfind <- find.clusters(x=hauss.genind, stat="BIC", choose.n.clust=TRUE, max.n.clust=10, n.iter=100000, n.start=100, scale=FALSE, truenames=TRUE)
# See results as text
table(pop(hauss.genind), hauss.kfind$grp)
hauss.kfind
# Graph showing table of original and inferred populations and assignment of individuals
table.value(df=table(pop(hauss.genind), hauss.kfind$grp), col.lab=paste("Inferred\ncluster", 1:length(hauss.kfind$size)), grid=TRUE)
# For K=3 - note parameters n.pca and n.clust - we just rerun the analysis and when results are stable, no problem here
hauss.kfind3 <- find.clusters(x=hauss.genind, n.pca=35, n.clust=3, stat="BIC", choose.n.clust=FALSE, max.n.clust=10, n.iter=100000, n.start=100, scale=FALSE, truenames=TRUE)
# See results as text
table(pop(hauss.genind), hauss.kfind3$grp)
hauss.kfind3
# Graph showing table of original and inferred populations and assignment of individuals
table.value(df=table(pop(hauss.genind), hauss.kfind3$grp), col.lab=paste("Inferred\ncluster", 1:length(hauss.kfind3$size)), grid=TRUE)

## DAPC
# K=2
# Create DAPC
# Number of informative PC (Here 15, adegenet recommends < N/3). Select number of informative DA (here 1 - only one is available - it won't produce PCA graph).
hauss.dapc <- dapc(x=hauss.genind, pop=hauss.kfind$grp, center=TRUE, scale=FALSE, var.contrib=TRUE, pca.info=TRUE, truenames=TRUE)
# Information
hauss.dapc
# Density functions
scatter(x=hauss.dapc, xax=1, yax=1, main="DAPC", bg="white", solid=0.5, leg=TRUE, txt.leg=c("Group 1", "Group 2"), posi.leg="topright")
# Assignment of individuals to clusters
assignplot(x=hauss.dapc)
# Structure-like plot
compoplot(x=hauss.dapc, xlab="Individuals", leg=FALSE)
# Loadingplot - alleles the most adding to separation of individuals
loadingplot(x=hauss.dapc$var.contr)
# alfa-score - according to number of PC axis
optim.a.score(x=hauss.dapc)

# K=3
# Create DAPC
# Number of informative PC (Here 15, adegenet recommends < N/3). Select number of informative DA (here 2).
hauss.dapc3 <- dapc(x=hauss.genind, pop=hauss.kfind3$grp, center=TRUE, scale=FALSE, var.contrib=TRUE, pca.info=TRUE, truenames=TRUE)
# Information
hauss.dapc
# A la PCA graph
scatter(x=hauss.dapc3, main="DAPC, Taraxacum haussknechtii", bg="white", cex=3, clab=0, col=rainbow(3), posi.da="bottomleft", scree.pca=TRUE, posi.pca="bottomright", leg=TRUE, txt.leg=c("Group 1", "Group 2", "Group 3"), posi.leg="topleft")
# Same in BW
scatter(x=hauss.dapc3, main="DAPC, Taraxacum haussknechtii", bg="white", pch=c(15:17), cell=0, cstar=0, solid=1, cex=2.5, clab=0, col=grey.colors(3, start=0, end=0.8, gamma=2, alpha=0), posi.da="bottomleft", scree.pca=TRUE, posi.pca="bottomright", leg=TRUE, txt.leg=c("Group 1", "Group 2", "Group 3"), posi.leg="topleft")
# Density functions - only for first axis here!
scatter(x=hauss.dapc3, xax=1, yax=1, main="DAPC", bg="white", solid=0.5, leg=TRUE, txt.leg=c("Group 1", "Group 2", "Group 3"), posi.leg="topleft")
# Assignment of individuals to clusters
assignplot(hauss.dapc3)
# Structure-like plot
compoplot(hauss.dapc3, xlab="Individuals", leg=FALSE)
# Loadingplot - alleles the most adding to separation of individuals
loadingplot(hauss.dapc3$var.contr)
# alfa-score - according to number of PC axis
optim.a.score(hauss.dapc3)

## SNP

# Plot of missing data (white) and number of 2nd alleles
glPlot(x=usflu.genlight, legend=TRUE, posi="topleft")
# Sum of the number of second allele in each SNP
usflu.freq <- glSum(usflu.genlight)
# Plot distribution of (second) allele frequencies
hist(x=usflu.freq, proba=TRUE, col="gold", xlab="Allele frequencies", main="Distribution of (second) allele frequencies")
lines(x=density(usflu.freq)$x, y=density(usflu.freq)$y*1.5, col="red", lwd=3 )
# Mean number of second allele in each SNP
usflu.mean <- glMean(usflu.genlight)
usflu.mean <- c(usflu.mean, 1-usflu.mean)
# Plot distribution of allele frequencies - play with parameters to get nice image
hist(x=usflu.mean, proba=TRUE, col="darkseagreen3", xlab="Allele frequencies", main="Distribution of allele frequencies", nclass=20)
lines(x=density(usflu.mean, bw=0.05)$x, y=density(usflu.mean, bw=0.05)$y*2, lwd=3)

# Number of missing values in each locus
usflu.na.density <- density(glNA(usflu.genlight), bw=10) # Play with bw parameter to get optimal image
# Set range of xlim parameter from 0 to the length of original alignment
plot(x=usflu.na.density, type="n", xlab="Position in the alignment", main="Location of the missing values (NA)", xlim=c(0, 1701))
polygon(c(usflu.na.density$x, rev(usflu.na.density$x)), c(usflu.na.density$y, rep(0, length(usflu.na.density$x))), col=transp("blue", alpha=0.3))
points(glNA(usflu.genlight), rep(0, nLoc(usflu.genlight)), pch="|", cex=2, col="blue")

# PCA - select number of retained PC axes, about 10 here
usflu.pca <- glPca(x=usflu.genlight, center=TRUE, scale=FALSE, loadings=TRUE)
# Plot PCA
scatter.glPca(x=usflu.pca, posi="bottomright")
title("PCA of the US influenza data")
# Coloured plot
colorplot(usflu.pca$scores, usflu.pca$scores, transp=TRUE, cex=4)
title("PCA of the US influenza data")
abline(h=0, v=0, col="grey")
add.scatter.eig(usflu.pca$eig[1:40], 2, 1, 2, posi="topright", inset=0.05, ratio=0.3)
# Calculate phylogenetic tree
usflu.tree.genlight <- nj(dist(as.matrix(usflu.genlight)))
# Plot coloured phylogenetic tree
plot.phylo(x=usflu.tree.genlight, typ="fan", show.tip=FALSE)
tiplabels(pch=20, col=num2col(usflu.annot[["year"]], col.pal=usflu.pal), cex=4)
title("NJ tree of the US influenza data")

## Moran's I
# Load required library
library(spdep)
# Creates connection network
hauss.connectivity <- chooseCN(xy=hauss.genind$other$xy, type=5, d1=0, d2=1, plot.nb=TRUE, result.type="listw", edit.nb=FALSE)
hauss.connectivity
# Test of Moran's I for 1st PCoA axis
moran.test(x=hauss.pcoa$li[,1], listw=hauss.connectivity, alternative="greater", randomisation=TRUE)
hauss.pcoa1.mctest <- moran.mc(x=hauss.pcoa$li[,1], listw=hauss.connectivity, alternative="greater", nsim=1000)
hauss.pcoa1.mctest
plot(hauss.pcoa1.mctest)
moran.plot(x=hauss.pcoa$li[,1], listw=hauss.connectivity)
# Test of Moran's I for 2nd PCoA axis
moran.test(x=hauss.pcoa$li[,2], listw=hauss.connectivity, alternative="greater", randomisation=TRUE)
hauss.pcoa2.mctest <- moran.mc(x=hauss.pcoa$li[,2], listw=hauss.connectivity, alternative="greater", nsim=1000)
hauss.pcoa2.mctest
plot(hauss.pcoa2.mctest)
moran.plot(x=hauss.pcoa[["li"]][,2], listw=hauss.connectivity)

## sPCA

# Calculates sPCA - here is only 1 positive and 3 negative factors
hauss.spca <- spca(obj=hauss.genind, cn=hauss.connectivity, scale=TRUE, scannf=TRUE)
# Plot eigenvalues of sPCA - gobal vs. local structure
barplot(height=hauss.spca$eig, main="Eigenvalues of sPCA", col=spectral(length(hauss.spca[["eig"]])))
legend("topright", fill=spectral(2), leg=c("Global structures", "Local structures")) # Add legend
abline(h=0,col="grey") # Add line showing zero
# Information about sPCA
print.spca(hauss.spca)
# Summary of sPCA results
summary.spca(hauss.spca)
# Shows connectivity network, 3 different scores, barplot of eigenvalues and eigenvalues decomposition
plot.spca(hauss.spca)
# Display of scores in color canals (two analogous variants)
colorplot.spca(hauss.spca, cex=4)
title("sPCA - colorplot of PC 1 and 2 (lagged scores)", line=1, cex=1.5)
colorplot(x=hauss.genind$other$xy, hauss.spca$ls, axes=1:ncol(hauss.spca$li), cex=4)
title("sPCA - colorplot of PC 1 and 2 (lagged scores)", line=1, cex=1.5)
# Spatial and variance components of the eigenvalues
screeplot.spca(x=hauss.spca, main=NULL)

# Map of genetic clines
library(akima) # This library is needed for some manipulation with coordinates
hauss.spca.temp <- interp(other(hauss.genind)$xy[,1], other(hauss.genind)$xy[,2], hauss.spca$ls[,1], xo=seq(min(other(hauss.genind)$xy[,1]), max(other(hauss.genind)$xy[,1]), le=200), yo=seq(min(other(hauss.genind)$xy[,2]), max(other(hauss.genind)$xy[,2]), le=200), duplicate="median")
# For 1st axis
image(x=hauss.spca.temp, col=spectral(100))
s.value(dfxy=hauss.genind$other$xy, z=hauss.pcoa$li[,1], add.p=TRUE, csize=0.5, sub="PCoA - first PC", csub=2, possub="topleft")
# For 2nd axis
image(x=hauss.spca.temp, col=spectral(100))
s.value(dfxy=hauss.genind$other$xy, z=hauss.pcoa[["li"]][,2], add.p=TRUE, csize=0.5, sub="PCoA - second PC", csub=2, possub="topleft")
# Interpolated lagged score on a map
hauss.spca.annot <- function() {
    title("sPCA - interpolated map of individual scores")
    points(other(hauss.genind)$xy[,1], other(hauss.genind)$xy[,2])
  }
filled.contour(hauss.spca.temp, color.pal=colorRampPalette(lightseasun(100)), pch=20, nlevels=100, key.title=title("Lagged\nscore 1"), plot.title=hauss.spca.annot())

# Loading plots - which alleles contribute the most?
hauss.spca.loadings <- hauss.spca$c1[,1]^2
names(hauss.spca.loadings) <- rownames(hauss.spca$c1)
loadingplot(x=hauss.spca.loadings, xlab="Alleles", ylab="Weight of the alleles", main="Contribution of alleles to the first sPCA axis")
boxplot(formula=hauss.spca.loadings~hauss.genind$loc.fac, las=3, ylab="Contribution", xlab="Marker", main="Contribution by markers into the first global score", col="grey")

## Monmonier - genetic boundaries
# It requires every point to have unique coordinates (one can use jitter() or difference in scale of meters). Example here is on population level, which is not ideal.
# Calculates Monmonier's function (for threshold use 'd')
hauss.monmonier <- monmonier(xy=hauss.genpop$other$xy, dist=dist(hauss.genpop$tab), cn=chooseCN(hauss.genpop$other$xy, ask=FALSE, type=2, plot.nb=FALSE, edit.nb=FALSE), nrun=1)
coords.monmonier(hauss.monmonier) # See result as text
# Plot genetic boundaries
plot.monmonier(hauss.monmonier, add.arrows=FALSE, bwd=10, sub="Monmonier plot", csub=2)
points(hauss.genpop$other$xy, cex=2.5, pch=20, col="red")
text(x=hauss.genpop$other$xy$lon, y=hauss.genpop$other$xy$lat, labels=popNames(hauss.genpop), cex=3)
legend("bottomright", leg="Genetic boundaries\namong populations")

## Mantel test - isolation by distance
# Geographical distance
hauss.gdist <- dist(x=hauss.genind$other$xy, method="euclidean", diag=TRUE, upper=TRUE)
# Mantel test
hauss.mantel <- mantel.randtest(m1=hauss.dist, m2=hauss.gdist, nrepet=1000)
hauss.mantel # See text output
plot(hauss.mantel, nclass=30)
# Libraries required by mantel.correlog:
library(permute)
library(lattice)
library(vegan)
# Different implementation of Mantel test testing distance classes
hauss.mantel.cor <- mantel.correlog(D.eco=hauss.dist, D.geo=hauss.gdist, XY=NULL, n.class=0, break.pts=NULL, cutoff=FALSE, r.type="pearson", nperm=1000, mult="holm", progressive=TRUE)
# See results for respective classes
hauss.mantel.cor
summary(hauss.mantel.cor)
# Plot it
plot(hauss.mantel.cor)

## Geneland
# Haploid and diploid codominant markers (microsattelites or SNPs)
# Load needed libraries
library(PBSmapping)
library(RandomFields)
library(fields)
library(spam)
library(grid)
library(maps)
library(tcltk)
library(Geneland)
# Graphical interface available for Geneland - we will use only command line
Geneland.GUI()
# Loading and conversions of coordinates - Geneland requires specific coordinate space
hauss.geneland.coord <- as.matrix(hauss.coord) # hauss.cord is DF, we need just plain matrix
colnames(hauss.geneland.coord) <- c("X", "Y")
attr(hauss.geneland.coord, "projection") <- "LL"
attr(hauss.geneland.coord, "zone") <- NA
hauss.geneland.coord.utm <- convUL(hauss.geneland.coord)
dim(hauss.geneland.coord)
hauss.geneland.coord
dim(hauss.geneland.coord.utm)
hauss.geneland.coord.utm # Final coordinates
# Load data (only haploid or diploid data are supported) - only plain table with alleles
hauss.geneland.data <- read.table(file="https://trapa.cz/sites/default/rcourse/haussknechtii_geneland.txt", na.string="-999", header=FALSE, sep="\t")
dim(hauss.geneland.data)
hauss.geneland.data
# Set number of independent runs
hauss.geneland.nrun <- 5
# Set length of burnin chain
hauss.geneland.burnin <- 100
# Set maximal K (number of populations)
hauss.geneland.maxpop <- 10
# FOR loop will run several independent runs and produce output maps of genetic clusters - outputs are written into subdirectory within geneland directory
for (hauss.geneland.irun in 1:hauss.geneland.nrun) {
  hauss.geneland.path.mcmc <- paste("geneland/", hauss.geneland.irun, "/", sep="") # paste is good especially for joining several text chains into one
  # On Windows, remove following line and create subdirectories from 1 to max K manually (creating subdirs in Windows is complicated)
  system(paste("mkdir ", hauss.geneland.path.mcmc)) # Creates subdirectory
  # Inferrence - MCMC chain - see ?MCMC for details
  MCMC(coordinates=hauss.geneland.coord.utm, geno.dip.codom=hauss.geneland.data, path.mcmc=hauss.geneland.path.mcmc, delta.coord=0.001, varnpop=TRUE, npopmin=1, npopmax=hauss.geneland.maxpop, nit=10000, thinning=10, freq.model="Uncorrelated", spatial=TRUE)
  # Post-process chains
  PostProcessChain(coordinates=hauss.geneland.coord.utm, path.mcmc=hauss.geneland.path.mcmc, nxdom=500, nydom=500, burnin=hauss.geneland.burnin)
  # Output
  # Simulated number of populations
  Plotnpop(path.mcmc=hauss.geneland.path.mcmc, printit=TRUE, file=paste(hauss.geneland.path.mcmc, "/geneland-number_of_clusters.pdf", sep=""), format="pdf", burnin=hauss.geneland.burnin)
  dev.off() # We must close graphical device manually
  # Map of estimated population membership
  PosteriorMode(coordinates=hauss.geneland.coord.utm, path.mcmc=hauss.geneland.path.mcmc, printit=TRUE, format="pdf", file=paste(hauss.geneland.path.mcmc,"/geneland-map.pdf", sep=""))
  dev.off() # We must close graphical device manually
  }
# Prepare list to record values of Fst for all runs
hauss.geneland.fstat <- list()
# Estimate Fst
for (hauss.geneland.irun in 1:hauss.geneland.nrun) {
  hauss.geneland.path.mcmc <- paste("geneland/", hauss.geneland.irun, "/", sep="")
  # F-statistics - Fis and Fst
  hauss.geneland.fstat[[hauss.geneland.irun]] <- Fstat.output(coordinates=hauss.geneland.coord.utm, genotypes=hauss.geneland.data, burnin=hauss.geneland.burnin, ploidy=2, path.mcmc=hauss.geneland.path.mcmc)
  }
  # Print Fst output
  hauss.geneland.fstat
# MCMC inference under the admixture model
for (hauss.geneland.irun in 1:hauss.geneland.nrun) {
  hauss.geneland.path.mcmc <- paste("geneland/", hauss.geneland.irun, "/", sep="")
  hauss.geneland.path.mcmc.adm <- paste(hauss.geneland.path.mcmc, "admixture", "/", sep="")
  # On Windows, remove following line of code and create in each result directory (from 1 to max K) new subdirectory "admixture" (creating subdirs in Windows is complicated)
  system(paste("mkdir ", hauss.geneland.path.mcmc.adm))
  HZ(coordinates=hauss.geneland.coord.utm, geno.dip.codom=hauss.geneland.data, path.mcmc.noadm=hauss.geneland.path.mcmc, nit=10000, thinning=10, path.mcmc.adm=hauss.geneland.path.mcmc.adm)
  }
# Produce maps of respective inferred clusters  
for (hauss.geneland.irun in 1:hauss.geneland.nrun) {
  hauss.geneland.path.mcmc <- paste("geneland/", hauss.geneland.irun, "/", sep="")
  # Maps - tesselations
  PlotTessellation(coordinates=hauss.geneland.coord.utm, path.mcmc=hauss.geneland.path.mcmc, printit=TRUE, path=hauss.geneland.path.mcmc)
  for (hauss.geneland.irun.img in 1:hauss.geneland.maxpop) { dev.off() } # We must close graphical device manually
  }
# Calculate average posterior probability
hauss.geneland.lpd <- rep(NA, hauss.geneland.nrun)
for (hauss.geneland.irun in 1:hauss.geneland.nrun) {
  hauss.geneland.path.mcmc <- paste("geneland/", hauss.geneland.irun, "/", sep="")
  hauss.geneland.path.lpd <- paste(hauss.geneland.path.mcmc,"log.posterior.density.txt",sep="")
  hauss.geneland.lpd[hauss.geneland.irun] <- mean(scan(hauss.geneland.path.lpd)[-(1:hauss.geneland.burnin)])
  }
# Sorts runs according to decreasing posterior probability - the first one is the best
order(hauss.geneland.lpd, decreasing=TRUE)
hauss.geneland.lpd

## Maps

# Load libraries
library(sp)
library(rworldmap) # Basic world maps
library(TeachingDemos) # To be able to move text little bit
library(RgoogleMaps) # Google and OpenStreetMaps
# Plot basic map with state boundaries within selected range
plot(x=getMap(resolution="high"), xlim=c(19, 24), ylim=c(39, 44), asp=1, lwd=1.5)
box() # Add frame around the map
# Plot location points
points(x=hauss.genpop@other$xy[["lon"]], y=hauss.genpop@other$xy[["lat"]], pch=15:19, col="red", cex=4)
# Add text descriptions for points. Text is aside and with background
shadowtext(x=hauss.genpop@other$xy[["lon"]], y=hauss.genpop@other$xy[["lat"]], labels=as.vector(popNames(hauss.genind)), col="black", bg="white", theta=seq(pi/4, 2*pi, length.out=8), r=0.15, pos=c(1, 3, 2, 4, 4), offset=0.75, cex=1.5)
# Insert legend
legend(x="topright", inset=1/50, legend=c("He", "Oh", "Pr", "Ne", "Sk"), col="red", border="black", pch=15:19, pt.cex=2, bty="o", bg="lightgrey", box.lwd=1.5, cex=1.5, title="Populations")

# Google map is produced into a file. Parametr markers contain data frame with coordinates and possibly with another information
hauss.gmap <- GetMap(center=c(lat=41, lon=21), size=c(640, 640), destfile="gmap.png", zoom=8, markers=hauss.coord, maptype="terrain")
# Plot saved map
PlotOnStaticMap(MyMap=hauss.gmap)
?PlotOnStaticMap # See all options

# Plot on OpenStreeMap - server is commonly overloaded and doesn't respond correctly
GetOsmMap(lonR=c(18, 24), latR=c(39, 44), scale=200000, destfile="osmmap.png", format="png", RETURNIMAGE=TRUE, GRAYSCALE=FALSE, NEWMAP=TRUE, verbose=1)

library(maps) # Various maping tools (plotting, ...)
library(mapdata) # More detailed maps, but political boundaries often outdatet, see http://cran.r-project.org/web/packages/mapdata/
library(mapproj) # Converts latitude/longitude into projected coordinates
# Plot a map, check parameters, among others projection and ?mapproject for its details
map(database="worldHires", boundary=TRUE, interior=TRUE, fill=TRUE, col="lightgrey", plot=TRUE, xlim=c(16, 27), ylim=c(37, 46))
# If you'd use projection, use - mapproject() to convert also coordinates! See ?mapproject for details
points(x=hauss.genpop@other$xy[["lon"]], y=hauss.genpop@other$xy[["lat"]], pch=15:19, col="red", cex=3)

# Plotting on SHP files
library(maptools)
# Load SHP file
# Data from http://download.geofabrik.de/europe/macedonia.html
# Directory has to contain also respective DBF and SHX files (same name, only different extension)
# Get from http://trapa.cz/sites/default/rcourse/macedonia.zip
# There are several functions readShape* - select appropriate according to data stored in respective SHP file
macedonia_building <- readShapeLines(fn="macedonia_buildings.shp")
plot(macedonia_building)
macedonia_landuse <- readShapeLines(fn="macedonia_landuse.shp")
plot(macedonia_landuse)
macedonia_natural <- readShapeLines(fn="macedonia_natural.shp")
plot(macedonia_natural)
macedonia_railways <- readShapeLines(fn="macedonia_railways.shp")
plot(macedonia_railways)
macedonia_roads <- readShapeLines(fn="macedonia_roads.shp")
plot(macedonia_roads)
macedonia_waterways <- readShapeLines(fn="macedonia_waterways.shp")
plot(macedonia_waterways)
# Plot all layers into single image
plot(macedonia_building)
plot(macedonia_landuse, add=TRUE, col="darkgreen", fill=TRUE)
plot(macedonia_natural, add=TRUE, col="green", fill=TRUE)
plot(macedonia_railways, add=TRUE, col="brown", lty="dotted")
plot(macedonia_roads, add=TRUE, col="orange")
plot(macedonia_waterways, add=TRUE, col="blue", lwd=2)
# Add sampling points
points(x=hauss.genpop@other$xy[["lon"]], y=hauss.genpop@other$xy[["lat"]], pch=15:19, col="red", cex=4)
# Add description of psampling points
shadowtext(x=hauss.genpop@other$xy[["lon"]], y=hauss.genpop@other$xy[["lat"]], labels=as.vector(popNames(hauss.genind)), col="black", bg="white", theta=seq(pi/4, 2*pi, length.out=8), r=0.15, pos=c(1, 3, 2, 4, 4), offset=0.75, cex=1.5)
# Add legend
legend(x="topright", inset=1/50, legend=c("He", "Oh", "Pr", "Ne", "Sk"), col="red", border="black", pch=15:19, pt.cex=2, bty="o", bg="lightgrey", box.lwd=1.5, cex=1.5, title="Populations")

## Structure

# Inspiration: http://www.molecularecologist.com/913/09/using-r-to-run-parallel-analyses-of-population-genetic-data-in-structure-parallelstructure/
# Install ParallelStructure, see https://r-forge.r-project.org/R/?group_id=1636 and http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0070651
# get input data from https://trapa.cz/sites/default/rcourse/hauss_stru.in and joblist https://trapa.cz/sites/default/rcourse/joblist.txt
# Set working directory
setwd("~/dokumenty/fakulta/vyuka/r_mol_data/examples/structure/")
getwd()
# Load ParallelStructure package
library(ParallelStructure)
# See manual for the R package and Structure http://pritchardlab.stanford.edu/structure.html
?parallel_structure
# Run Structure
parallel_structure(joblist="joblist.txt", n_cpu=7, structure_path="~/bin/", infile="hauss_stru.in", outpath="results/", numinds=47, numloci=12, plot_output=1, label=1, popdata=1, popflag=1, phenotypes=0, markernames=1, mapdist=0, onerowperind=0, phaseinfo=0, extracol=0, missing=-9, ploidy=2, usepopinfo=0, revert_convert=1, printqhat=1, locdata=0, recessivealleles=0, phased=0, noadmix=0, linkage=0, locprior=0, inferalpha=1)

# When running on Windows, parallel support may be missing - install Rmpi library required by ParallelStructure for parallelisation on Windows
install.packages("Rmpi")
library(Rmpi)
# Instead of parallel_structure() use MPI_structure() with same arguments
MPI_structure(...) # Same arguments as on previous slide
# If this fails, look for some UNIX machine...

# Postprocess results with Structure sum R script by Dorothee Ehrich
source("https://trapa.cz/sites/default/rcourse/structure-sum-2011.r")
# Create new directory with result files results_job_*_f and set working directory accordingly
setwd("/home/vojta/dokumenty/fakulta/vyuka/r_mol_data/examples/structure/structure_sum/")
dir()
# Prepare file list_k.txt containing on each line K and name of output "_f" file - get it from https://trapa.cz/sites/default/rcourse/list_k.txt
# See documentation for details. Functions take as an argument list_k file and number of populations
Structure.table("list_k.txt", 5)
Structure.simil("list_k.txt", 5)
Structure.deltaK("list_k.txt", 5)
graphics.off() # Close graphics
Structure.cluster("list_k.txt", 5)
# Reordering ("alignment") of runs to get same clusters in same columns (prepare respective list_k files - one for each K)
Structure.order("list_k_02.txt", 5)
Structure.order("list_k_03.txt", 5)
Structure.order("list_k_04.txt", 5)
Structure.order("list_k_05.txt", 5)
Structure.order("list_k_06.txt", 5)
Structure.order("list_k_07.txt", 5)
# Continue with CLUMPP and distruct
# Details: https://trapa.cz/en/structure-r-linux

## Multiple sequence alignment

# Libraries 
library(colorspace)
library(XML)
library(phyloch) # Alignment with mafft, you can also try package ips
# Requires mafft binary on specific location - might be needed to copy it or make symlink
# read ?mafft and mafft's documentation
meles.mafft <- mafft(x=meles.dna, method="localpair", maxiterate=100, path="/usr/bin/mafft") # Change "path" to fit your path to mafft!
meles.mafft
class(meles.mafft)
# Multiple sequence alignments using clustal, muscle and t-coffee are available in package ape
# read ?clustal and documentation of Clustal and Muscle to set correct parameters
meles.clustal <- ape::clustal(x=meles.dna, pw.gapopen=10, pw.gapext=0.1, gapopen=10, gapext=0.2, exec="/usr/bin/clustalw2", quiet=FALSE, original.ordering=TRUE) # Change "exec" to fit your path to clustal!
meles.muscle <- ape::muscle(x=meles.dna, exec="muscle", quiet=FALSE, original.ordering=TRUE) # Change "exec" to fit your path to muscle!
meles.muscle
class(meles.muscle)
# Plot the alignment - you can select which bases to plot and/or modify colours
image(x=meles.muscle, c("a", "t", "c" ,"g", "n"), col=rainbow(5))
# Add grey dotted grid
grid(nx=ncol(meles.muscle), ny=nrow(meles.muscle), col="lightgrey")
# Remove gaps from alignment - destroy it
meles.nogaps <- del.gaps(meles.muscle) # See ?del.gaps for details!

# Cleaning the alignment
# Shortcut for plotting alignment
image.DNAbin(x=meles.mafft)
# Display aligned sequences with gaps
image.DNAbin(x=usflu.dna)
# Delete all columns containing any gap
library(ips)
usflu.dna.ng <- deleteGaps(x=usflu.dna, nmax=0)
# See of settings of "nmax" value - threshold for gap deletion
?deleteGaps # "nmax=0" deletes all columns with any gap
# Do not confuse with function delete.gaps() from phyloch package
# Display the result
image.DNAbin(x=usflu.dna.ng)
# Delete positions in alignment containing only missing data/N
?deleteEmptyCells # See help page for details

## Tree manipulations

# Read trees in NEWICK format - single or multiple tree(s)
oxalis.trees <- read.tree("https://trapa.cz/sites/default/rcourse/oxalis.nwk")
summary(oxalis.trees)
length(oxalis.trees)
names(oxalis.trees)
# Export trees in NEWICK format
write.tree(phy=oxalis.trees, file="trees.nwk")

# Drop a tip from multiPhylo
plot.multiPhylo(x=oxalis.trees)
oxalis.trees.drop <- lapply(X=oxalis.trees, FUN=drop.tip, "TaxaOut")
class(oxalis.trees.drop) <- "multiPhylo"
plot.multiPhylo(x=oxalis.trees.drop)

# Drop a tip
plot.phylo(hauss.nj)
hauss.nj.drop <- drop.tip(phy=hauss.nj, tip=47)
plot.phylo(hauss.nj.drop)

# Interactively extract tree
# Plot source tree
plot.phylo(hauss.nj)
# See node labels (numbers) - needed for some tasks
nodelabels()
# Select clade to extract by clicking on it
hauss.nj.extracted <- extract.clade(phy=hauss.nj, interactive=TRUE)
# See new extracted tree
plot.phylo(hauss.nj.extracted)
# Non-interactively extract tree
hauss.nj.extracted <- extract.clade(phy=hauss.nj, node=60, interactive=FALSE)
# See new extracted tree
plot.phylo(hauss.nj.extracted)

# Drop "extinct" tips - those who don't reach end the tree
# tolerance is respective to the used metrics
plot.phylo(hauss.nj)
axisPhylo()
hauss.nj.fossil <- drop.fossil(phy=hauss.nj, tol=0.4)
plot.phylo(hauss.nj.fossil)

# Bind two trees into one
hauss.nj.bind <- bind.tree(x=hauss.nj.fossil, y=hauss.nj.extracted, where="root", position=0, interactive=FALSE)
plot.phylo(hauss.nj.bind)
# Bind two trees interactively
# Plot tree receiving the new one
plot.phylo(hauss.nj.fossil)
# Select where to bind new tree to
hauss.nj.bind <- bind.tree(x=hauss.nj.fossil, y=hauss.nj.extracted, interactive=TRUE)
plot.phylo(hauss.nj.bind)

# Rotate tree
plot.phylo(hauss.nj)
nodelabels()
hauss.nj.rotated <- rotate(phy=hauss.nj, node="70")
plot.phylo(hauss.nj.rotated)

# Ladderize the tree
plot.phylo(hauss.nj)
hauss.nj.ladderized <- ladderize(hauss.nj)
plot.phylo(hauss.nj.ladderized)

# Root the tree
plot.phylo(hauss.nj)
print.phylo(hauss.nj)
hauss.nj.rooted <- root(phy=hauss.nj, outgroup=10)
print.phylo(hauss.nj.rooted)
plot.phylo(hauss.nj.rooted)
# Root the tree interactive
plot.phylo(hauss.nj)
hauss.nj.rooted <- root(phy=hauss.nj, interactive=TRUE)
plot.phylo(hauss.nj.rooted)
# unroot the tree
unroot()
# Check if it is rooted
is.rooted()

# Check if the tree is ultrametric - is variance of distances of all tips to node 0? It is required for some analysis
is.ultrametric()
# Make tree ultrametric
chronos()
?chronos # Check it for mode how to calculate the lengths

# Compute branch lengths for trees withou branch lengths
compute.brlen()
?compute.brlen # Check it for mode how to calculate the lengths

# Computes the branch lengths of a tree giving its branching times (aka node ages or heights)
compute.brtime()
?compute.brtime # Check it for mode how to calculate the lengths

## Topographical distances among trees

library(gplots)
library(corrplot)
library(phytools)

# Prepare matrix for distances
oxalis.trees.d <- matrix(nrow=length(oxalis.trees), ncol=length(oxalis.trees))

# Calculate pairwise topographic distances
for (i in 1:length(oxalis.trees)) {
  for (j in i:length(oxalis.trees)) {
    print(c(i,j))
    oxalis.trees.d[i,j] <- dist.topo(oxalis.trees[[i]], oxalis.trees[[j]])
   }
 }

# Basic information about the distance matrix
dim(oxalis.trees.d)
head.matrix(oxalis.trees.d)

# Add names of columns and rows
colnames(oxalis.trees.d) <- names(oxalis.trees)
rownames(oxalis.trees.d) <- names(oxalis.trees)

# Make matrix symetric
oxalis.trees.d[lower.tri(oxalis.trees.d)] <- t(oxalis.trees.d)[lower.tri(oxalis.trees.d)]

# Create heatmaps using heatmap.2 function from gplots package
heatmap.2(x=oxalis.trees.d, Rowv=FALSE, Colv="Rowv", dendrogram="none", symm=TRUE, scale="none", na.rm=TRUE, revC=FALSE, col=rainbow(15), cellnote=oxalis.trees.d, notecex=1, notecol="white", trace="row", linecol="black", labRow=names(oxalis.trees), labCol=names(oxalis.trees), key=TRUE, keysize=2, density.info="density", symkey=FALSE, main="Correlation matrix of topographical distances", xlab=names(oxalis.trees), ylab=names(oxalis.trees))

# Robinsons-Foulds distance
oxalis.trees.d.rf <- multiRF(oxalis.trees)

# Add names of columns and rows
colnames(oxalis.trees.d.rf) <- names(oxalis.trees)
rownames(oxalis.trees.d.rf) <- names(oxalis.trees)

# Create heatmap using corrplot function from corrplot package
corrplot(corr=oxalis.trees.d.rf, method="circle", type="upper", col=rainbow(15), title="Correlation matrix of topographical distances", is.corr=FALSE, diag=FALSE, outline=TRUE, order="alphabet", tl.pos="lt", tl.col="black")
corrplot(corr=oxalis.trees.d.rf, method="number", type="lower", add=TRUE, col=rainbow(15), title="Correlation matrix of topographical distances", is.corr=FALSE, diag=FALSE, outline=FALSE, order="alphabet", tl.pos="ld", cl.pos="n")

## Seeing trees in the forest

# Root all trees
oxalis.trees.rooted <- lapply(X=oxalis.trees, FUN=root, "TaxaOut")
class(oxalis.trees.rooted) <- "multiPhylo"
# Consenus tree (50 % rule)
oxalis.tree.con <- ape::consensus(oxalis.trees.rooted, p=0.5, check.labels=TRUE)
print.phylo(oxalis.tree.con)
# Plot the tree
plot.phylo(oxalis.tree.con, edge.width=2, label.offset=0.3)
axisPhylo(side=1)

# Species tree
# All trees must be ultrametric - chronos scale them
oxalis.trees.ultra <- lapply(X=oxalis.trees.rooted, FUN=chronos, model="correlated")
class(oxalis.trees.ultra) <- "multiPhylo"
# Mean distances
oxalis.tree.sp.mean <- speciesTree(oxalis.trees.ultra, mean)
print.phylo(oxalis.tree.sp.mean)
# Plot the tree
plot.phylo(oxalis.tree.sp.mean, edge.width=2, label.offset=0.01)
edgelabels(text=round(oxalis.tree.sp.mean[["edge.length"]], digits=2), frame="none", col="red", bg="none")
axisPhylo(side=1)

# Parsimony super tree
library(phangorn)
oxalis.tree.sp <- superTree(tree=oxalis.trees.rooted, method="optim.parsimony", rooted=TRUE)
print.phylo(oxalis.tree.sp)
plot.phylo(oxalis.tree.sp, edge.width=2, label.offset=0.01)
axisPhylo(side=1)

# Density tree
densiTree(x=oxalis.trees.ultra, type="cladogram", alpha=0.5, consensus=oxalis.tree.sp.mean, scaleX=TRUE, col=c("black", "green", "blue", "red"), cex=1.5)

# Networks
oxalis.tree.net <- consensusNet(oxalis.trees.rooted, prob=0.25)
plot.networx(x=oxalis.tree.net, planar=FALSE, type="2D", use.edge.length=TRUE, show.tip.label=TRUE, show.edge.label=TRUE, show.node.label=TRUE, show.nodes=TRUE, edge.color="black", tip.color="blue")
plot.networx(x=oxalis.tree.net, planar=FALSE, type="3D", use.edge.length=TRUE, show.tip.label=TRUE, show.edge.label=TRUE, show.node.label=TRUE, show.nodes=TRUE, edge.color="black", tip.color="blue")

# Plot all trees on same scale
kronoviz(x=oxalis.trees.rooted, layout=length(oxalis.trees.rooted), horiz=TRUE)
# Close graphical device to cancel division of plotting device
dev.off()

## Maximum parsimony
# Conversion to phyDat for phangorn
meles.phydat <- as.phyDat(meles.dna)
# Prepare starting tree
meles.tre.ini <- nj(dist.dna(x=meles.dna, model="raw"))
# Parsimony
?parsimony
# Returns maximum parsimony score
parsimony(tree=meles.tre.ini, data=meles.phydat)
# Optimisation - returns maximum parsimony tree
meles.tre.pars <- optim.parsimony(tree=meles.tre.ini, data=meles.phydat)
# Draw a tree
plot.phylo(x=meles.tre.pars, type="cladogram", edge.width=2)
title("Maximum-parsimony tree of Meles")

## Compare two trees

# Compare topology of the species trees - basically outputs TRUE/FALSE
all.equal.phylo(oxalis.tree.sp, oxalis.tree.sp.mean, use.edge.length=FALSE)
?all.equal.phylo # Use to see comparison possibilities
# Plot two trees with connecting lines
# We need 2 column matrix with tip labels
tips.labels <- matrix(data=c(sort(oxalis.tree.sp[["tip.label"]]), sort(oxalis.tree.sp.mean[["tip.label"]])), nrow=length(oxalis.tree.sp[["tip.label"]]), ncol=2)
# Draw a tree - play with graphical parameters and use rotate=TRUE
# to be able to adjust fit manually
cophyloplot(x=ladderize(oxalis.tree.sp), y=ladderize(oxalis.tree.sp.mean),  assoc=tips.labels, use.edge.length=FALSE, space=60, length.line=1, gap=2, type="phylogram", rotate=TRUE, col="red", lwd=1.5, lty=2)
title("Comparing the trees\nParsimony super tree\tSpecies tree")
legend("topleft", legend="Red lines\nconnect tips", text.col="red", cex=0.75, bty="n", x.intersp=-2, y.intersp=-2)

## More about plotting the trees
?plot.phylo # check it for various possibilities what to influence
?par
?points
par(mfrow=c(1, 2)) # Plot two plots in one row
plot.phylo(x=hauss.nj, type="cladogram", use.edge.length=FALSE, direction="rightwards")
plot.phylo(x=hauss.nj, type="cladogram", use.edge.length=FALSE, direction="leftwards")
dev.off() # Close graphical device to cancel par() settings

# Nice tiplabels and higlighted tiplabel
# Load tree in text format
trape <- read.tree(text = "((Homo, Pan), Gorilla);")
# Plot the tree
plot.phylo(x=trape, show.tip.label=FALSE)
# Add colored tip labels
tiplabels(trape[["tip.label"]], bg=c("white", "black", "white"), col=c("black", "white", "black"), cex=2)
# Add colored node labels
nodelabels(text=c("6.4 Ma", "5.4 Ma"), frame="circle", bg="yellow")
# Add scale bar
add.scale.bar()
# Note vectors for tip/nodelabels

## PIC

# Prepare the data
# Body mass of primates
primates.body <- c(4.09434, 3.61092, 2.37024, 2.02815, 1.46968)
# Longevity of primates
primates.longevity <- c(4.74493, 3.3322, 3.3673, 2.89037, 2.30259)
# Add names to the values
names(primates.body) <- names(primates.longevity) <- c("Homo", "Pongo", "Macaca", "Ateles", "Galago")
# Create a tree in Newick format
primates.tree <- read.tree(text="((((Homo:0.21, Pongo:0.21):0.28, Macaca:0.49):0.13, Ateles:0.62):0.38, Galago:1.00);")
plot.phylo(primates.tree)

# PIC - phylogenetically independent contrasts
primates.pic.body <- pic(x=primates.body, phy=primates.tree, scaled=TRUE, var.contrasts=FALSE, rescaled.tree=FALSE)
primates.pic.longevity <- pic(x=primates.longevity, phy=primates.tree, scaled=TRUE, var.contrasts=FALSE, rescaled.tree=FALSE)

# Plot a tree with PIC values
plot.phylo(x=primates.tree, lwd=2, cex=1.5)
nodelabels(round(primates.pic.body, digits=3), adj=c(0, -0.5), frame="none")
nodelabels(round(primates.pic.longevity, digits=3), adj=c(0, 1), frame="none")
add.scale.bar()

# Plot PIC
plot(x=primates.pic.body, y=primates.pic.longevity, pch=16, cex=1.5)
abline(a=0, b=1, lty=2) # x=y line

# Correlation of PIC of body mass and longevity
cor(x=primates.pic.body, y=primates.pic.longevity, method="pearson")
lm(formula=primates.pic.longevity~primates.pic.body)
# Because PICs have expected mean zero - such linear regressions should be done through the origin (i.e. the intercept is set to zero)
lm(formula=primates.pic.longevity~primates.pic.body-1)

# Permutation procedure to test PIC
lmorigin(formula=primates.pic.longevity~primates.pic.body, nperm=1000)

# Intraspecific variation
# PIC - orthonormal contrasts using the method
primates.pic.ortho <- pic.ortho(x=list(cbind(primates.body, jitter(primates.body), jitter(primates.body))[1,], cbind(primates.body, jitter(primates.body), jitter(primates.body))[2,], cbind(primates.body, jitter(primates.body), jitter(primates.body))[3,], cbind(primates.body, jitter(primates.body), jitter(primates.body))[4,], cbind(primates.body, jitter(primates.body), jitter(primates.body))[5,]), phy=primates.tree, var.contrasts=FALSE, intra=FALSE)
primates.pic.ortho
# Explanation of the cbind trick
cbind(primates.body, jitter(primates.body), jitter(primates.body))
cbind(primates.body, jitter(primates.body), jitter(primates.body))[1,]
cbind(primates.body, jitter(primates.body), jitter(primates.body))[2,]
class(cbind(primates.body, jitter(primates.body), jitter(primates.body)))
class(cbind(primates.body, jitter(primates.body), jitter(primates.body))[1,])
# jitter() adds random noise every time, so that the values differ

## Phylogenetic autocorrelation

# Autocorrelation coefficient to quantify whether the distribution of a trait among a set of species is affected or not by their phylogenetic relationships
# In the absence of phylogenetic autocorrelation, the mean expected value of I and its variance are known - it is thus possible to test the null hypothesis of the absence of dependence among observations
# Let's choose weights as wij = 1/dij, where the d’s is the distances measured on the tree - cophenetic() calculates cophenetic distances
primates.weights <- 1/cophenetic(primates.tree) # can be just cophenetic(primates.tree) or some other transformation
# See it
primates.weights
class(primates.weights)
# Set diagonal to 0
diag(primates.weights) <- 0
# Calculate Moran's I
Moran.I(x=primates.body, weight=primates.weights, alternative="greater") # Slighly significant positive phylogenetic correlation among body mass
Moran.I(x=primates.longevity, weight=primates.weights, alternative="greater") # Positive, but non-significant

# Test of Moran's with randomisation procedure
gearymoran(bilis=primates.weights, X=data.frame(primates.body, primates.longevity), nrepet=1000) # Body is significant - nonrandom, longevity not (random)

# Test of Abouheif designed to detect phylogenetic autocorrelation in a quantitative trait - in fact Moran's I test using a particular phylogenetic proximity between tips
library(adephylo)
abouheif.moran(x=cbind(primates.body, primates.longevity), W=primates.weights, method="oriAbouheif", a=1, nrepet=1000, alter="greater")

# correlogram can be used to visualize the results of phylogenetic autocorrelative analysis
# Loads training data set
data(carnivora)
# Look at the data
head(carnivora)
# Calculate the correlogram
carnivora.correlogram <- correlogram.formula(formula=SW~Order/SuperFamily/Family/Genus, data=carnivora)
# See results
carnivora.correlogram
# Calculate the correlogram - test for both body masses
carnivora.correlogram2 <- correlogram.formula(formula=SW+FW~Order/SuperFamily/Family/Genus, data=carnivora)
# See results
carnivora.correlogram2
# Plot it
plot.correlogram(x=carnivora.correlogram, legend=TRUE, test.level=0.05, col=c("white", "black"))
# Plot it - test for both body masses
# Two graphs
plot.correlogramList(x=carnivora.correlogram2, lattice=TRUE, legend=TRUE, test.level=0.05)
# Only one graph
plot.correlogramList(x=carnivora.correlogram2, lattice=FALSE, legend=TRUE, test.level=0.05)

## Orthonormal Decomposition - phylogenetic eigenvector regression

# Prepare toy data
# Load MrBayes tree in NEXUS format
apiaceae.tree <- read.nexus("https://trapa.cz/sites/default/rcourse/apiaceae_mrbayes.nexus")
# See it
print.phylo(apiaceae.tree)
plot.phylo(apiaceae.tree)
# Root the tree
apiaceae.tree <- root(apiaceae.tree, "Aralia_elata")
# Remove "_" from taxa names
# plot.phylo() by default omits "_" from tip names
apiaceae.tree$tip.label <- gsub(pattern="_", replacement=" ", x=apiaceae.tree$tip.label)
# Drop outgroup (Aralia and Hydrocotyle)
# Click on last common ancestor of ingroup desired to be kept
plot.phylo(apiaceae.tree)
apiaceae.tree <- extract.clade(apiaceae.tree, interactive=TRUE)
plot.phylo(apiaceae.tree)
# Decomposition of topographical distances (right plot)
library(adephylo)
library(phylobase)
table.phylo4d(x=phylo4d(x=apiaceae.tree, tip.data=treePart(x=apiaceae.tree, result="orthobasis")), treetype="cladogram")
# Generate some random variable
library(geiger)
apiaceae.eco <- sim.char(phy=apiaceae.tree, par=0.1, nsim=1, model="BM")[,,1]
?sim.char # See it for another possibilities to simulate data
# Names for the values
names(apiaceae.eco) <- apiaceae.tree[["tip.label"]]
apiaceae.eco # See it

# significant result - significant phylogenetic inertia (phylogenetic effect) - the tendency for traits to resist evolutionary change despite environmental perturbations
anova(lm(apiaceae.eco ~ as.matrix(orthobasis.phylo(x=apiaceae.tree, method="patristic")[,1:2])))
orthogram(x=apiaceae.eco, tre=apiaceae.tree, nrepet=1000, alter="two-sided")
?orthogram # See another calculation possibilities

## Phylogenetic Generalized Least Squares

# Funkce pro correlation: corBlomberg(), corMartins(), corPagel(), corBrownian() - stejné parametry (kromě hodnoty 'value')
# Fitting an Ornstein-Uhlenbeck Motion model in PGLS
library(nlme)
library(ape)
summary(gls(model=primates.longevity ~ primates.body, data=as.data.frame(cbind(primates.longevity, primates.body)), correlation=corBrownian(value=1, phy=primates.tree)))

# Implementation in caper package
library(caper) # Load needed library
data(shorebird) # Load training data
?shorebird.data
shorebird.pgls <- pgls(formula=shorebird.data[["F.Mass"]] ~ shorebird.data[["Egg.Mass"]], data=comparative.data(phy=shorebird.tree, data=as.data.frame(cbind(shorebird.data[["F.Mass"]], shorebird.data[["Egg.Mass"]], shorebird.data[["Species"]])), names.col=V3, vcv=TRUE))
summary(shorebird.pgls)
plot(shorebird.pgls)
abline(a=0, b=1, col="red")
anova(shorebird.pgls)
AIC(shorebird.pgls)

## Generalized Estimating Equations

# Calculate the model
compar.gee(formula=primates.longevity ~ primates.body, phy=primates.tree)
# or with correlation matrix:
compar.gee(formula=primates.longevity ~ primates.body, corStruct=corMartins(value=1, phy=primates.tree, fixed=TRUE))
# for corStruct there are similar functions corBlomberg, corMartins, corPagel, corBrownian - see manuals for differences

## Phylogenetic Signal

library(picante)
# If Blomberg's values of 1 correspond to a Brownian motion process, which implies some degree of phylogenetic signal or conservatism. K values closer to zero correspond to a random or convergent pattern of evolution, while K values greater than 1 indicate strong phylogenetic signal and conservatism of traits.
# Test for Bloomberg's K statistics
Kcalc(x=apiaceae.eco, phy=apiaceae.tree, checkdata=TRUE)
# Test with permutations
phylosignal(x=apiaceae.eco, phy=apiaceae.tree, reps=1000, checkdata=TRUE)
# sapply performs analysis on list of variables (numeric vectors)
sapply(X=list(body=primates.body, longevity=primates.longevity), FUN=Kcalc, phy=primates.tree, checkdata=FALSE)
sapply(X=list(body=primates.body, longevity=primates.longevity), FUN=phylosignal, phy=primates.tree, reps=1000)
# Alternative to use phylosignal with sapply:
multiPhylosignal(x=as.data.frame(cbind(primates.body, primates.longevity)), phy=primates.tree, reps=1000)
# Note sapply() and multiPhylosignal() return same data, but the matrices are transposed - use t() to transpose one to look like the other:
t(multiPhylosignal(x=as.data.frame(cbind(primates.body, primates.longevity)), phy=primates.tree, reps=1000))

# When there are vectors with standard errors of measurements
library(phytools)
?phylosig # See for details
# Test for phylogenetic signal (here without SE)
phylosig(tree=apiaceae.tree, x=apiaceae.eco, method="K", test=TRUE, nsim=1000)
phylosig(tree=primates.tree, x=primates.body, method="lambda", test=TRUE)
# phylosig() can be used as an alternative to phylosignal() - the functions are similar in basic usage

# Examples of usage of GLS for testing of phylogenetic signal
summary(gls(model=primates.longevity ~ 1, data=as.data.frame (primates.longevity), correlation=corBrownian(value=1, phy=primates.tree)))
summary(pgls(formula=shorebird.data[["M.Mass"]] ~ 1, data=comparative.data(phy=shorebird.tree, data=as.data.frame(cbind(shorebird.data[["M.Mass"]], shorebird.data[["Species"]])), names.col=V2, vcv=TRUE)))

## phylogenetic PCA
library(phylobase) # Library needed to create phylo4d object required by ppca
# Calculate pPCA
primates.ppca <- ppca(x=phylo4d(x=primates.tree, cbind(primates.body, primates.longevity)), method="patristic", a=1, center=TRUE, scale=TRUE, scannf=TRUE, nfposi=1, nfnega=0)
# Print results
print.ppca(primates.ppca)
# See summary information
summary.ppca(primates.ppca)
# See PCA scores for variables on phylogenetic tree
scatter.ppca(primates.ppca)
# See decomposition of pPCA eigenvalues
screeplot.ppca(primates.ppca)
# Plot pPCA results - global vs. local structure, decomposition of pPCA eigenvalues, PCA plot of variables and PCA scores for variables on phylogenetic tree
plot.ppca(primates.ppca)

## Ancestral state reconstruction

# By default performs estimation for continuous characters assuming a Brownian motion model fit by maximum likelihood
# See ?ace for possible settings
primates.body.ace <- ace(x=primates.body, phy=primates.tree, type="continuous", method="REML", corStruct=corBrownian(value=1, phy=primates.tree))
# See result - reconstructions are in $ace - to be plotted on nodes - 1st column are node numbers
primates.body.ace
# Other implementations are available in packages geiger (functions fitContinuousMCMC and fitDiscrete), phangorn and more in ape (MPR)
# Plot it
plot(primates.tree, lwd=2, cex=2)
tiplabels(round(primates.body, digits=3), adj=c(0, -1), frame="none", col="blue", cex=2)
nodelabels(round(primates.body.ace$ace, digits=3), frame="circle", bg="red", cex=1.5)

# More possibilities
plot.phylo(primates.tree, lwd=2, cex=2)
# ML estimation of a continuous trait, can compute confidence interval
nodelabels(fastAnc(tree=primates.tree, x=primates.body))
# ACE for Brownian evolution with directional trend
plot.phylo(primates.tree, lwd=2, cex=2)
nodelabels(anc.trend(tree=primates.tree, x=primates.body, maxit=1000)$ace)
# ACE for Brownian evolution using likelihood
plot.phylo(primates.tree, lwd=2, cex=2)
nodelabels(round(anc.ML(tree=primates.tree, x=primates.body, maxit=1000, model="BM")$ace))
# Bayesian ancestral character estimation (next slide)
plot.phylo(primates.tree, lwd=2, cex=2)
primates.body.ace.bayes <- anc.Bayes(tree=primates.tree, x=primates.body, ngen=1000) # Use more MCMC generations
primates.body.ace.bayes
nodelabels(primates.body.ace.bayes[11,3:6])
# ACE returns long numbers - truncate them by e.g.
# round(x=..., digits=3) # "x" is vector with ACE values
# Another possibility for ancestral character reconstruction
?phangorn::ancestral.pml

# Continuous map
library(phytools)
contMap(tree=primates.tree, x=primates.body)
# Change colors with setMap()
primates.contmap <- setMap(x=contMap(primates.tree, primates.body), colors=c("white", "black"))
plot(primates.contmap)
# See ?par for more settings

## Phenogram

library(adephylo)
table.phylo4d(x=phylo4d(x=primates.tree, tip.data=as.data.frame(cbind(primates.body, primates.longevity))), treetype="cladogram", symbol="circles", scale=FALSE, ratio.tree=0.5)
table.phylo4d(x=phylo4d(x=shorebird.tree, tip.data=shorebird.data), treetype="cladogram", symbol="circles", scale=FALSE, ratio.tree=0.5)
phenogram(tree=primates.tree, x=primates.longevity, fsize=1.2, ftype="i", colors="red", main="Longevity")
fancyTree(tree=primates.tree, type="phenogram95", x=primates.longevity, fsize=1.2, ftype="i", main="95-percentile of longevity")
# 2 characters on 2 axis
phylomorphospace(tree= primates.tree, X=cbind(primates.body, primates.longevity), label="horizontal", lwd=2, fsize=1.5)
# 3D (3rd character is fake here)
# 3 characters it a rotating cube
phylomorphospace3d(tree= primates.tree, X=cbind(primates.body, primates.longevity, abs(primates.body- primates.longevity)), label=TRUE)
# 2 characters on 2 axis
fancyTree(tree=primates.tree, type="scattergram", X=cbind(primates.body, primates.longevity), res=500, ftype="i")
# See manuals for more settings
?fancyTree
?phenogram
?phylomorphospace
?phylomorphospace3d
?contMap
?setMap
?par

## Install pacakges from GitHub

# Needed library
install.packages("devtools")
library(devtools)
dev_mode(on=TRUE)
# Install selected package from GitHub (user/project)
install_github("thibautjombart/adegenet")
# when finished go back to normal version
dev_mode(on=FALSE)

## Loops
# Simplest loop - print value of "i" in each step
for (i in 1:5) { print(i) }
# In every step modify value of variable "X"
X <- 0
for (i in 10:1) { 
  print(i)
  X <- X+i
  print(X)
  }
# Work on each item of a list object
for (L in 1:length(nothofagus.sequences)) {
  print(length(nothofagus.sequences[[L]])) }

## Functions
MyFunction <- function (x, y) {
  # Any commands can be here...
  x + y
  }
# Use as usually:
MyFunction(5, 8)
MyFunction(1, 4)
MyFunction(x=4, y=7)