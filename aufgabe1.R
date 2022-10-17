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

# Top 10 States With Most Homicide Cases

par(mar=c(8,6,2,2))

filter_year <- data.frame(homicide_data[homicide_data$Year %in% c(2000:2014),])

df <- data.frame(table(filter_year$State))
colnames(df) <- c('state', 'count')
top10 <- df[order(-df$count),][1:10,]

barplot(
    height=top10$count, 
    names=top10$state, 
    las=2, 
    ylim=c(0,40000),
    col=rgb(0.8,0.1,0.1,0.6),
    main = "Top 10 States with most homicide cases 2000 - 2014",
    ylab="Incidents"
)

# mean 2000 - 2014
mean(df$count)
