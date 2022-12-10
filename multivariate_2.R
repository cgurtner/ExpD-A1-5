data <- read.csv(url('https://cgurtner.ch/files/homicide.csv'))

filtered_data = data[data$Victim.Age < 150 & data$Perpetrator.Age > 0,]

group_1 = filtered_data[filtered_data$Perpetrator.Age > 60 & filtered_data$Perpetrator.Age < 99,]
group_2 = filtered_data[filtered_data$Perpetrator.Age > 40 & filtered_data$Perpetrator.Age < 60,]
group_3 = filtered_data[filtered_data$Perpetrator.Age > 20 & filtered_data$Perpetrator.Age < 40,]
group_4 = filtered_data[filtered_data$Perpetrator.Age > 0 & filtered_data$Perpetrator.Age < 20,]

par(mfrow=c(2,2), mar = c(4,4,3,0.5))
plot(group_4$Perpetrator.Age, group_4$Victim.Age, 
     xlab = "Alter Taeter", ylab = "Alter Opfer", col = rgb(0,0,0,0.05), pch = 16)

plot(group_3$Perpetrator.Age, group_3$Victim.Age, 
     xlab = "Alter Taeter", ylab = "Alter Opfer", col = rgb(0,0,0,0.05), pch = 16)

plot(group_2$Perpetrator.Age, group_2$Victim.Age, 
     xlab = "Alter Taeter", ylab = "Alter Opfer", col = rgb(0,0,0,0.05), pch = 16)

plot(group_1$Perpetrator.Age, group_1$Victim.Age, 
     xlab = "Alter Taeter", ylab = "Alter Opfer", col = rgb(0,0,0,0.05), pch = 16)