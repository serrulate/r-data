#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOVISUALIZATIONINR/EXPLORATORYDATAANALYSIS/INTROTOVISUALIZATIONINR EXPLORATORYDATAANALYSIS 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 13: Directory settings  ####

install.packages(box)
# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(path)
install.packages(tidyverse)
library(tidyverse)
#=================================================-
#### Slide 14: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data/rawdata")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 15: Loading CMP dataset for EDA  ####

# Read CSV file called "ChemicalManufacturingProcess.csv"
CMP = read.csv(file = file.path(data_dir,"ChemicalManufacturingProcess.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors


#=================================================-
#### Slide 17: Subsetting data (cont'd)  ####

# Let's make a vector of column indices we would like to save.
column_ids = c(1:4,  #<- concatenate a range of ids
               14:16)#<- with another a range of ids
column_ids

# Let's save the subset into a new variable.
CMP_subset = CMP[ , column_ids]
str(CMP_subset)
CMP_subset
summary(CMP)
glimpse(CMP)
#=================================================-
#### Slide 18: Correlations between variables  ####

# Compute a correlation matrix of first 4
# variables using `cor` function.

CMP_cor = cor((CMP_subset))
view(CMP_cor)
#=================================================-
#### Slide 20: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
