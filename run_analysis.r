## read the subjection_****.txt file.
x1 <- read.table("subject_test.txt")
y1 <- read.table("subject_train.txt")

## combine the two datasets
z1 <- rbind(x1, y1)

## read the X_****.txt file.
x <- read.table("X_test.txt")
y <- read.table("X_train.txt")

## extract the required data.
z <- rbind(x, y)
z <- cbind(z[,41:46], z[,81:86], z[,121:126], z[,161:166], z[,201:202], z[,214:215], z[,227:228], z[,240:241], z[,253:254], z[,266:271], z[,294:296], z[,345:350], z[,373:375], z[,424:429], z[,452:454], z[,503:504], z[,513], z[,516:517], z[,526], z[,529:530], z[,539], z[,542:543], z[,552])

## read the y_****.txt file.
x0 <- read.table("y_test.txt")
y0 <- read.table("y_train.txt")

## combine the two.
z0 <- rbind(x0, y0)

## combine the above data sets.
rawdata <- cbind(z0, z1, z)

## read the features.txt and extract it.
f <- read.table("features.txt")
n <- c(as.character(f[41:46,2]), as.character(f[81:86,2]), as.character(f[121:126,2]), as.character(f[161:166,2]), as.character(f[201:202,2]), as.character(f[214:215,2]), as.character(f[227:228,2]), as.character(f[240:241,2]), as.character(f[253:254,2]), as.character(f[266:271,2]), as.character(f[294:296,2]), as.character(f[345:350,2]), as.character(f[373:375,2]), as.character(f[424:429,2]), as.character(f[452:454,2]), as.character(f[503:504,2]), as.character(f[513,2]), as.character(f[516:517,2]), as.character(f[526,2]), as.character(f[529:530,2]), as.character(f[539,2]), as.character(f[542:543,2]), as.character(f[552,2]))

## reaname the colnames
colnames(rawdata) <- c("activity", "subject", n)

## rearrange the data.
library(dplyr)
data <- arrange(rawdata, activity, subject)

## output
write.table(data, "data_1.txt", row.names = F)


##=====================================================##
## This is the second dataset.

## calculate the mean of each variable.
res <- NULL
for(i in 1:6) {
      data_act <- data[data[,1] == i,]
      for(j in 1:30) {
            data_act_sub <- data_act[data_act[,2] == j,]
            meanvals <- NULL
            for(k in 3:75) {
                  meanval <- mean(data_act_sub[,k])
                  meanvals <- c(meanvals, meanval)
            }
            meanvals <- c(i, j, meanvals)
            res <- rbind(res, meanvals)
            colnames(res) <- c("activity", "subject", n)
      }
}

## output
write.table(res, "data_2.txt", row.names = F)