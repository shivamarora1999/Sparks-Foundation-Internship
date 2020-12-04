install.packages("rpart")
install.packages("rpart.plot")

iris_dataset=read.csv("iris.csv")
iris_dataset=iris_dataset[,-1]
head(iris_dataset)

ncol(iris_dataset)
nrow(iris_dataset)

View(iris_dataset)
library(rpart)
library(rpart.plot)


sample_set=sample(150,110)
iris_Training_set=iris_dataset[sample_set,]
iris_Test_set=iris_dataset[-sample_set,]
D_tree=rpart(Species~. , iris_Training_set, method="class")
D_tree

pred=predict(D_tree,iris_Test_set,type = "class")
rpart.plot(D_tree,type=2,extra=1)
t=table(iris_Test_set[,5],pred)


Accuracy=sum(diag(t))/nrow(iris_Test_set)
Accuracy
