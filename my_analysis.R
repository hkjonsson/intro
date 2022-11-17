### load packages
if(!require(pacman)) install.packages("pacman")
pacman::p_load(palmerpenguins,  # palmer penguins data
               tidyverse,
               ggbeeswarm)      # beeswarm plot options

# prepare data
penguins_complete <- penguins |> 
  
  # complete cases
  drop_na() |> 
  
  # make year a factor
  mutate(year = factor(year))

# make plot
(bodymass_plot <- ggplot(penguins_complete,
                    aes(x = year,
                        y = body_mass_g,
                        fill = sex)) +
    geom_beeswarm(colour = "grey50",
                  size = 2,
                  shape = 21,
                  alpha = 0.5) +
    scale_fill_manual(values = c("forestgreen", "firebrick3")) +
    theme_classic())
