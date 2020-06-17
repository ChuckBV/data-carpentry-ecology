# starting-w-data.R

### download data to machine memory
download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

### load data into a csv file
surveys <- read.csv("data_raw/portal_data_joined.csv")

head(surveys)
# record_id month day year plot_id species_id sex hindfoot_length weight   genus  species   taxa plot_type
# 1         1     7  16 1977       2         NL   M              32     NA Neotoma albigula Rodent   Control
# 2        72     8  19 1977       2         NL   M              31     NA Neotoma albigula Rodent   Control
# 3       224     9  13 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control
# 4       266    10  16 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control
# 5       349    11  12 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control
# 6       363    11  12 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control

View(surveys)

### Inspecting data frame objects
str(surveys)
# 'data.frame':	34786 obs. of  13 variables:
# $ record_id      : int  1 72 224 266 349 363 435 506 588 661 ...
# $ month          : int  7 8 9 10 11 11 12 1 2 3 ...
# $ day            : int  16 19 13 16 12 12 10 8 18 11 ...
# $ year           : int  1977 1977 1977 1977 1977 1977 1977 1978 1978 1978 ...
# $ plot_id        : int  2 2 2 2 2 2 2 2 2 2 ...
# $ species_id     : chr  "NL" "NL" "NL" "NL" ...
# $ sex            : chr  "M" "M" "" "" ...
# $ hindfoot_length: int  32 31 NA NA NA NA NA NA NA NA ...
# $ weight         : int  NA NA NA NA NA NA NA NA 218 NA ...
# $ genus          : chr  "Neotoma" "Neotoma" "Neotoma" "Neotoma" ...
# $ species        : chr  "albigula" "albigula" "albigula" "albigula" ...
# $ taxa           : chr  "Rodent" "Rodent" "Rodent" "Rodent" ...
# $ plot_type      : chr  "Control" "Control" "Control" "Control" ...

## Inspecting data.frame objects
dim(surveys)
nrow(surveys)
# [1] 34786

### Size:
#dim(surveys) - returns a vector with the number of rows in the first element, and the number of columns as the second element (the dimensions of the object)
#nrow(surveys) - returns the number of rows
#ncol(surveys) - returns the number of columns

### Content:
#head(surveys) - shows the first 6 rows
#tail(surveys) - shows the last 6 rows

### Names:
#names(surveys) - returns the column names (synonym of colnames() for data.frame objects)
#rownames(surveys) - returns the row names

### Summary:
#str(surveys) - structure of the object and information about the class, length and content of each column
#summary(surveys) - summary statistics for each column

# Indexing and subsetting data frames

#Our survey data frame has rows and columns (it has 2 dimensions), if we want
#to extract some specific data from it, we need to specify the “coordinates” 
#we want from it. Row numbers come first, followed by column numbers. 
#However, note that different ways of specifying these coordinates lead to 
#results with different classes.

#first element in the first column of the data frame (as a vector)
surveys[1, 1]   

#first element in the 6th column (as a vector)
surveys[1, 6]   

#first column of the data frame (as a vector)
surveys[, 1]    

#first column of the data frame (as a data.frame)
surveys[1]      

#first three elements in the 7th column (as a vector)
surveys[1:3, 7] 

#the 3rd row of the data frame (as a data.frame)
surveys[3, ]    

# equivalent to head_surveys <- head(surveys)
head_surveys <- surveys[1:6, ] 



### Skipping forward, factors
sex <- factor(c("male", "female", "female", "male"))
sex
# [1] male   female female male  
# Levels: female male

### ordering the levels
sex <- factor(sex, levels = c("male", "female"))
sex # after re-ordering


year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.

## bar plot of the number of females and males captured during the experiment:
plot(surveys$sex)
# Error in plot.window(...) : need finite 'ylim' values
# In addition: Warning messages:
# 1: In xy.coords(x, y, xlabel, ylabel, log) : NAs introduced by coercion
# 2: In min(x) : no non-missing arguments to min; returning Inf
# 3: In max(x) : no non-missing arguments to max; returning -Inf

# Because this is a character and not a factor?

unique(surveys$sex)
# [1] "M" ""  "F"
surveys$sex <- factor(surveys$sex)
levels(surveys$sex)

surveys$sex <- factor(surveys$sex, levels = c(""))
# [1] ""  "F" "M"

plot(surveys$sex)
