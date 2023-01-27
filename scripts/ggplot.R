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
CMP_subset = CMP[ , column_ids]

install.packages("ggplot2")
library (ggplot2)


ggp1 = ggplot(CMP_subset, 
              aes(x =Yield))
ggp1

ggp1+geom_histogram()

ggp1 = ggp1 + 
      geom_histogram(aes(y = ..density..),
      binwidth = 0.75, 
      color = "steelblue",
      fill = "khaki")
ggp1
ggp1 = ggp1 + 
      geom_density (alpha = .5,
      color = "gray",
      fill = "steelblue")
ggp1

ggp1 = ggp1 +
        labs(
          title = "yield dist",
          subtitle = "his &density"
        )
ggp1


ggp1 = ggp1 +
  # Add a black and white theme.
  theme_bw() +
  # Customize elements of the theme.
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))
ggp1





ggp2= ggplot(CMP_subset,
             aes(x = BiologicalMaterial01,
                 y= Yield))
ggp2             
             

ggp2=ggp2+geom_point()
ggp2


ggp2= ggp2+
      geom_point(color="darkorange")+
      geom_smooth(method = lm)+
      labs(title = "bio.Material 1 vs Yield",
           subtitle = "scatterplot with linear fit")
ggp2

ggp2= ggp2 + theme_bw()+
      theme(
          axis.title = element_text(size =20),
          axis.text = element_text(size =16),
          plot.title = element_text(size =25),
          plot.subtitle = element_text(size =18))
ggp2          
        
  
library(tidyverse)

my_ggtheme = theme_bw() +
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        legend.text = element_text(size = 16),
        legend.title = element_text(size = 18),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))
Intro


view(CMP_subset)
CMP_subset_long = CMP_subset %>%
  gather(key = "variable",
         value = "value")
view(CMP_subset_long)



CMP_subset_long = CMP_subset_long %>%
    mutate(variable =
             str_replace(variable,
                          "Manufacturing",
                          "Man. "))%>%
    mutate(variable =
              str_replace(variable,
                          "Biological",
                          "Bio "))%>%
    mutate(variable =
              str_replace(variable, 
                          "0",
                          " "))
view(CMP_subset_long)
