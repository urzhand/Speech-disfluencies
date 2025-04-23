# statistics for disfluencies project

# check whether participants answered the questions with a different quality
# depending on whether the recording had disfluencies or not

# input of dataset
disf <- read.csv("results_questions.csv")
summary(disf)

disf$variant <- as.factor(disf$variant)
disf$question <- as.factor(disf$question)

# visualization
library(ggpubr)
ggboxplot(disf, x="variant", y="accuracy", color="variant", palette = c("#00AFBB", "#E7B800"), main="Accuracy of answers depending on the recording", xlab="recording type", ylab="accuracy of answers")

#t-test
res <- t.test(accuracy ~ variant, data = disf, var.equal =TRUE)
res

# check whether participants answered had a better retelling depending 
# on whether the recording had disfluencies
retell <- read.csv("results_recordings.csv")
summary(retell)

retell$stimuli <- as.factor(retell$stimuli)

ggboxplot(retell, x="stimuli", y="accuracy", color="stimuli", palette = c("#00AFBB", "#E7B800"), main="Quality of retelling depending on the recording", xlab="recording type", ylab="accuracy of answers")

# t-test for whether the retelling was better depending on the recording
res2 <- t.test(accuracy ~ stimuli, data = retell, var.equal =TRUE)
res2

# t-test whether the details were mentioned depending on the disfluency
res3 <- t.test(retell$disfl, retell$no, var.equal = TRUE)
res3
