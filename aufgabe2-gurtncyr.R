# read .csv file
homicide_data <- read.csv(url('https://cgurtner.ch/files/homicide.csv'))

dat <- homicide_data[homicide_data$Perpetrator.Sex != 'Unknown',]
dat <- dat[dat$Weapon != 'Unknown',]

df_male <- head(
  dat[dat$Perpetrator.Sex == 'Male' & dat$Perpetrator.Age >= 18 & dat$Perpetrator.Age <= 60,]
,1000)

df_male

df_female <- head(
  dat[dat$Perpetrator.Sex == 'Female' & dat$Perpetrator.Age >= 18 & dat$Perpetrator.Age <= 60,]
,1000)

df_female
nrow(df_female)

merged <- rbind(df_male, df_female)

nrow(merged)

merged$Weapon[merged$Weapon == "Handgun"] <- "Firearm"
merged$Weapon[merged$Weapon == "Shotgun"] <- "Firearm"
merged$Weapon[merged$Weapon == "Rifle"] <- "Firearm"
merged$Weapon[merged$Weapon == "Gun"] <- "Firearm"

merged$Weapon[merged$Weapon == "Strangulation"] <- "Suffocation"
merged$Weapon[merged$Weapon == "Drowning"] <- "Suffocation"

merged$Weapon[merged$Weapon == "Fire"] <- "Immolation"
merged$Weapon[merged$Weapon == "Explosives"] <- "Immolation"
merged$Weapon[merged$Weapon == "Fall"] <- "Immolation"

nrow(merged)

mycols = c(
  "black", # Blunt Object
  "aquamarine", # Drugs
  "azure3", # Firearm
  "darkolivegreen1",  # Immolation
  "firebrick", # Knife
  "coral", # Poison
  "darkorchid" # Suffocation
)
barplot(table(merged$Weapon, merged$Perpetrator.Sex), beside=TRUE, xlim=c(0,20),col=mycols,legend=TRUE)
  
## Michis Plots
data <- read.csv(url('https://cgurtner.ch/files/homicide.csv'))
# Falsche Daten entfernen
filtered_data = data[data$Victim.Age < 150 & data$Perpetrator.Age > 0,]
#Erstellung Scatterplot
plot(filtered_data$Perpetrator.Age, filtered_data$Victim.Age, xlab = "Alter Täter", ylab = "Alter Opfer", col = rgb(0,0,0,0.05), pch = 16)
scatter.smooth(filtered_data$Perpetrator.Age, filtered_data$Victim.Age, xlab = "Alter Täter", ylab = "Alter Opfer",col="red")

#Pearson Korr
cor(filtered_data$Perpetrator.Age, filtered_data$Victim.Age, use = "pairwise.complete.obs")
#Spearman Korr
cor(filtered_data$Perpetrator.Age[vsel], filtered_data$Victim.Age[vsel], use = "pairwise.complete.obs", method = "spearman")

filtered_data2 = data[data$Victim.Race != "Unknown" & data$Perpetrator.Race != "Unknown",]
mosaicplot(table(filtered_data2$Victim.Race, filtered_data2$Perpetrator.Race),las = 2,col = c("yellow","green","red","grey"),
           main = "", off = 2, border = "black")
table(filtered_data2$Perpetrator.Race, filtered_data2$Victim.Race)
