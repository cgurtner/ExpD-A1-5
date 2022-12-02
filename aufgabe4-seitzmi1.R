data <- read.csv(url('https://cgurtner.ch/files/homicide.csv'))
filtered_data2 = data[data$Victim.Race != "Unknown" & data$Perpetrator.Race != "Unknown",]
filtered_data3 = filtered_data2[filtered_data2$Victim.Sex != "Unknown" & filtered_data2$Perpetrator.Sex != "Unknown",]
female_data = filtered_data3[filtered_data3$Perpetrator.Sex != "Male",]
male_data = filtered_data3[filtered_data3$Perpetrator.Sex != "Female",]


par(mfrow=c(1,2), mar = c(1.2,3,1.2,1.2))
mosaicplot(table(female_data$Perpetrator.Race, female_data$Victim.Race),col = c("yellow","green","red","grey"),
           main = "Victims", off = 2, border = "black", las = 2, ylab = "Female Perpetrators")
mosaicplot(table(male_data$Perpetrator.Race, male_data$Victim.Race),col = c("yellow","green","red","grey"),
           main = "Victims", off = 2, border = "black",las = 2, ylab = "Male Perpetrators")