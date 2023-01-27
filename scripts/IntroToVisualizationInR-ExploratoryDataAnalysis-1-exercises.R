#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## INTROTOVISUALIZATIONINR/EXPLORATORYDATAANALYSIS/INTROTOVISUALIZATIONINR EXPLORATORYDATAANALYSIS 1 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise ####

# =================================================-



#### Please refer to module 1 of IntroToVisualizationInR-ExploratoryDataAnalysis for Tasks 1-2

#### Task 1 ####



# Define the directory if you haven't already.

# Read the fast_food_data.csv into a dataset named "fast_food_data". 

# Set both the header and stringsAsFactors as equal to TRUE. 

# Subset the data set to be named "fast_food_subset" and include columns 3, 5, 6, 10, 11. 

# Then rename those columns "type", "calories","totfat","carbs", & "sugars".



# Result: 


path = box::file()
main_dir = dirname(path)
data_dir = paste0(main_dir, "/data/rawdata")
plot_dir = paste0(main_dir, "/plots")
fast_food_data = read.csv(file = file.path(data_dir,"fast_food_Data.csv"), #<- provide file path
                                   header = TRUE,            #<- if file has header set to TRUE
                                   stringsAsFactors = TRUE)
ffcols = c(3,5,6,10,11)
ffcols

fast_food_subset = fast_food_data[ffcols]
head(fast_food_subset)
str(fast_food_subset)
view(fast_food_subset)
colnames(fast_food_subset) = c("type", "calories","totfat", "carbs", "sugars")
head(fast_food_subset)




#================================================-



#### Task 2 ####



# Create a correlation matrix using the columns: calories, totfat, carbs and sugars from the `fast_food_sub` dataset.



# Result: 


ffcor = cor(fast_food_subset[, 2:5])
view(ffcor)


libary(tidyverse)
# Create a dataset named `fast_food_num`, which consists of only the numeric variables from fast_food_subset.
# Then retrieve the number of columns from `fast_food_num` and store it in the variable `num_col`.
# Sample `num_col` number of colors from `colors` and store it in `color_sam`. 
# Make sure to set the seed to 2 before sampling.
# What four colors did sample choose?

# Result: 
?sapply
fast_food_num = fast_food_subset[sapply(fast_food_subset,is.numeric)]
fast_food_num
num_col= ncol(fast_food_num)
set.seed(1)
  color_sam = sample(colors(),
                     num_col)
color_sam  
boxplot(fast_food_num, col=color_sam)



par(
  mfrow = c(2,2))
  hist(fast_food_num$calories,
       xlab = "calories",
       col = color_sam[1],
       main = "Caloriesdist"
       )
  hist(fast_food_num$totfat,
       xlab = "fat",
       col = color_sam[2],
       main = "fat dist"
  )
  hist(fast_food_num$carbs,
       xlab = "carbs",
       col = color_sam[3],
       main = "carb dist"
  )
  hist(fast_food_num$sugars,
       xlab = "sugar",
       col = color_sam[4]
  )

par(mfrow =c(1,1))
    plot(
      fast_food_num$totfat,
      fast_food_num$carbs,
      xlab = "Fat",
      ylab= "carbs",
      main = "fat vs carbs",
      pch = 17,
      cex = 1,
      col = "salmon2"
      )
    
pairs(fast_food_num[,1:4],
      pch = 19,
      col = sample(colors(), 1))


