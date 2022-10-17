homicide_data <- read.csv('./data/homicide-reports.csv')

# mindestes 6 Variablen (Spalten)

colnames(homicide_data)

# 30 Beobachtungen (Zeilen) aufweist

nrow(homicide_data)

# dass kategorielle (mindestens 3)

unique(homicide_data$City)
unique(homicide_data$State)
unique(homicide_data$Relationship)
unique(homicide_data$Weapon)
unique(homicide_data$Crime.Type)
unique(homicide_data$Crime.Solved)

# metrische Variablen (mindestens 3)

homicide_data$Victim.Age
homicide_data$Perpetrator.Age
homicide_data$Year

# bestimmen Sie die Datentypen von allen Variablen (Spalten)
str(homicide_data)

