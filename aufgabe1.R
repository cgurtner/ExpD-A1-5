# read .csv file
homicide_data <- read.csv('C:/Users/Seitz/OneDrive/Dokumente/Studium/ExpD/Semesterarbeit/homicide_data.csv')

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
homicide_data$Victim.Count
homicide_data$Perpetrator.Count

# bestimmen Sie die Datentypen von allen Variablen (Spalten)
str(homicide_data)

# remove scientific notation
options(scipen=999)

# group by year and sum up incidents
df_grp_year <- homicide_data |>
  distinct() |>
  count(Year)

# plot the data to a barplot
barplot(df_grp_year$n,names.arg=df_grp_year$Year,xlab="Year",ylab="Incidents",col="blue",
        main="Total incidents per Year", ylim = c(0,30000))

# calculate mean
mean(df_grp_year$n)