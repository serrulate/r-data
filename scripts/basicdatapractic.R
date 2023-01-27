path = box::file()
main_dir = dirname(path)
# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data/rawdata")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


CMP = read.csv(file = file.path(data_dir,"/ChemicalManufacturingProcess.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors

column_ids = c(1:4,
               14:16)
CMP_subset = cmp[ , column_ids]
glimpse(CMP_subset)


plot(CMP_subset$Yield,
     type = "l",
     col = "orange",
     main = "Yield"
                    )
summary(CMP_subset)

boxplot(CMP_subset$Yield)
boxplot(CMP_subset$ManufacturingProcess01)
boxplot(CMP_subset$ManufacturingProcess01,
        col = "lavenderblush2")

hist(CMP_subset$Yield)


par(
  mfrow = c(1,2))
  hist(CMP_subset$BiologicalMaterial01,
       col = "honeydew3",
       xlab = "bioM1",
       main = "dist of 1")
  hist (CMP_subset$Yield,
        col ="mistyrose",
        xlab = "yield",
         main = "dist yield")
       
       

  
  plot(CMP_subset[,2],
       CMP_subset[,1],
       xlab="bio1",
       ylab= "yeild",
       main = "scatter",
       col = "navy",
       pch = 10,
       cex=1)

