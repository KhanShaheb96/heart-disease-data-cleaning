data <- read.csv("heart_disease_uci - modified.csv", header = TRUE, sep = ",")



colSums(is.na(data))


data$age[is.na(data$age)] <- mean(data$age, na.rm = TRUE) 


mode_function <- function(x) {
  uniqx <- unique(x)
  uniqx[which.max(tabulate(match(x, uniqx)))]
}
data$ca[is.na(data$ca)] <- mode_function(data$ca)
data$thal[is.na(data$thal)] <- mode_function(data$thal)





par(mfrow = c(2,3)) 
boxplot(data$age, main="Boxplot of age")
boxplot(data$trestbps, main="Boxplot of trestbps")
boxplot(data$chol, main="Boxplot of chol ")
boxplot(data$thalch, main="Boxplot of thalch")
boxplot(data$oldpeak, main="Boxplot of oldpeak")
boxplot(data$ca, main="Boxplot of ca")
par(mfrow = c(1,1))


Q1 <- quantile(data$chol, 0.25, na.rm = TRUE)

Q3 <- quantile(data$chol, 0.75, na.rm = TRUE)
IQR_value <- Q3 - Q1


data <- data[data$chol >= (Q1 - 1.5 * IQR_value) & data$chol <= (Q3 + 1.5 * IQR_value), ]


boxplot(data$chol, main="Boxplot of chol ")




install.packages("dplyr")
library(dplyr)

levels_restecg <- c("lv hypertrophy", "normal")
labels_restecg <- c(1,2)
data$restecg <- factor(data$restecg, levels = levels_restecg, labels = labels_restecg)


data$num <- factor(data$num, levels = c(0, 1), labels = c("No Disease", "Has Disease"))
select(data,restecg,num)






min_max_normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}
data$trestbps <- min_max_normalize(data$trestbps)
select(data,trestbps)



data <- data[!duplicated(data), ]
str(data)


high_chol <- subset(data, chol > 200)
print(high_chol)




data$trestbps <- ifelse(data$trestbps <= 0, mean(data$trestbps[data$trestbps > 0]), data$trestbps)
data$thalch <- ifelse(data$thalch <= 0, mean(data$thalch[data$thalch > 0]), data$thalch)




table(data$num)

class0 <- data %>% filter(num == "No Disease")
class1 <- data %>% filter(num == "Has Disease")


diff <- nrow(class0) - nrow(class1)


set.seed(123)
new_class1 <- class1 %>% sample_n(diff, replace = TRUE)


data_balanced <- rbind(data, new_class1)


table(data_balanced$num)






set.seed(42)

train_indices <- sample(1:nrow(data_balanced), size = 0.7 * nrow(data_balanced))


trainData <- data_balanced[train_indices, ]
testData <- data_balanced[-train_indices, ]

dim(trainData)
dim(testData)






mean(data$trestbps); median(data$trestbps); mode_function(data$trestbps)
mean(data$oldpeak); median(data$oldpeak); mode_function(data$oldpeak)

mode_function(data$sex)
mode_function(data$cp)





range(data$chol)
IQR(data$chol)
var(data$chol)
sd(data$chol)

range(data_balanced$thalch)
IQR(data_balanced$thalch)
var(data_balanced$thalch)

sd(data_balanced$thalch)

