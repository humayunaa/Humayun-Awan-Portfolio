#!/usr/bin/Rscript

allegiance <- data.frame(
  Name = c("Luke Skywalker", "Darth Vader", "Obi-Wan Kenobi", "Anakin Skywalker", 
           "Yoda", "Palpatine", "Qui-Gon Jinn", "Jar Jar Binks", "Darth Maul", 
           "Mace Windu", "Ki-Adi-Mundi", "Kit Fisto", "Eeth Koth", "Plo Koon", 
           "Dooku", "Zam Wesell", "Jango Fett", "IG-88", "Greedo", "Bossk", 
           "Boba Fett"),
  Allegiance = c("Jedi", "Sith", "TO THE REPUBLIC", "Jedi", "Jedi", "Sith", "Jedi", 
                 "Possible Sith", "Sith", "Jedi", "Jedi", "Jedi", "Jedi", "Jedi", 
                 "Sith", "Bounty Hunter", "Bounty Hunter", "Bounty Hunter", 
                 "Bounty Hunter", "Bounty Hunter", "Bounty Hunter")
)

#Task2
#!/usr/bin/Rscript

library(dplyr)
library(ggplot2)

starwarsDF = as.data.frame(dplyr::starwars)
#starwarsDF = na.omit(starwarsDF, height, mass)
ggplot(starwarsDF, aes(x = height, y = mass)) +
  geom_point() + 
  xlab('Height') +
  ylab('Mass') +
  ggtitle("Height vs. Mass in Star Wars Characters")


#Task3
#!/usr/bin/Rscript

library(dplyr)
library(ggplot2)

starwars = as.data.frame(dplyr::starwars)

skincolours = starwars %>% 
  count(skin_color) %>% 
  arrange(desc(n))

ggplot(skincolours, aes(x = reorder(skin_color, n), y = n)) +
  geom_bar(stat = 'identity', fill = 'black') +
  xlab("Skin Color") +
  ylab("Number of Characters that Skin Color") +
  ggtitle("Star Wars Characters by Skin Color") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#Task4
#!/usr/bin/Rscript

library(dplyr)
library(ggplot2)

starwars = as.data.frame(dplyr::starwars)

ggplot(starwars, aes(x = reorder(name, -mass), y = mass)) +
  geom_histogram(stat = 'identity', fill = 'red', binwidth = 10) +
  xlab("Name") +
  ylab("Mass") +
  ggtitle("Star Wars Characters by Mass")  +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#Task5
library(dplyr)
library(ggplot2)

starwars = as.data.frame(dplyr::starwars)

notdroids = subset(starwars, species != 'Droid')
#notdroids = na.omit(notdroids, height, eye_color)

ggplot(notdroids, aes(x = eye_color, y = height)) +
  geom_violin(trim = FALSE, bw = 0.2) +
  labs(x = "Eye Color", y = "Height") +
  ggtitle("Comparison of Height and Eye Color for Non-Droid Characters in Star Wars")


#Task6
library(ggplot2)
library(dplyr)

data(starwars)

starwars_filtered <- starwars %>%
  filter(!is.na(mass) & !is.na(birth_year))


ggplot(starwars, aes(x = birth_year, y = mass)) +
  geom_line() +
  xlab("Birth Year") +
  ylab("Mass") +
  ggtitle("Star Wars Characters Mass Over Time")


#Task7
#!/usr/bin/env Rscript

library(dplyr)
library(stringr)

data(starwars)

films <- function(name) {
  character_films <- starwars %>%
    filter(name == !!enquo(name)) %>%
    pull(films) %>%
    as.character() %>%
    str_split(", ") %>%
    unlist()
  
  unique_films <- unique(character_films)
  
  if (length(unique_films) == 0) {
    print(paste("Character", name, "does not appear in any film."))
  } else if (length(unique_films) == 1) {
    print(paste("Character", name, "appears in only one film."))
  } else {
    for (film in unique_films) {
      print(paste("Character", name, "appears in film", film))
    }
  }
}

films("Watto") #test
films("Rey") #test

#Task8
#!/usr/bin/Rscript

library(dplyr)

starwars <- as.data.frame(dplyr::starwars)
library(readr)
allegiance <- read.csv("Rassignment/allegiance.csv")
colnames(allegiance)[colnames(allegiance) == "Name"] <- "name"

starwars <- left_join(starwars, allegiance, by = 'name')
save(starwars, file = "starwars_updated.rdata")


#Task9
#!/usr/bin/env Rscript

library(dplyr)
data(starwars)

starwars <- as.data.frame(dplyr::starwars)
library(readr)
allegiance <- read.csv("Rassignment/allegiance.csv")
colnames(allegiance)[colnames(allegiance) == "Name"] <- "name"

starwars <- left_join(starwars, allegiance, by = "name")
save(starwars, file = "starwars_updated.rdata")

starwars <- starwars %>% 
  mutate(will_find = if_else(Affiliation == "Bounty Hunter", TRUE, FALSE))


#Task10
#!/usr/bin/env Rscript
#!/usr/bin/env Rscript

library(dplyr)
data(starwars)

starwars <- as.data.frame(dplyr::starwars)
library(readr)
allegiance <- read.csv("Rassignment/allegiance.csv")
colnames(allegiance)[colnames(allegiance) == "Name"] <- "name"

starwars <- left_join(starwars, allegiance, by = "name")
save(starwars, file = "starwars_updated.rdata")

starwars <- starwars %>% 
  mutate(would_tell = if_else(Affiliation == "Sith", TRUE, FALSE))