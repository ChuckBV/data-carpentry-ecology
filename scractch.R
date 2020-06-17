# scractch.R

## Atomic object
letter <- "a"
letter

## Vector (multiple, one dimensional)
first_five <- c("a","b","c","d","e")
first_five

first_five[3] # using indexing
first_five <- letters[1:5]
first_five
rm(first_five) # no longr needed

## data frame (multiple, two dimmensional)
Postn <- c(1:5)

Capitals <- LETTERS[1:5]
Lowercase <- letters[1:5]

sesame_str <- data.frame(Postn,Capitals,Lowercase)
sesame_str
str(sesame_str)

## Specify part of data frame and modify

sesame_str[3,1] <- NA
sesame_str

## Factors are categories
order <- c("Lepidoptera","Lepidoptera","Lepidoptera","Coleoptera","Diptera","Diptera","Hymenoptera","Hymenoptera")
species <- c("Monarch","Navel orangeworm","Indian meal moth","11-lined Junebeetle","Crane fly","Asian tiger mosquito","Honey bee","Killer hornet")

insects <- data.frame(order,species) # now a data frame with two character vectors (columns, variables)

insects$order <- as.factor(insects$order)

