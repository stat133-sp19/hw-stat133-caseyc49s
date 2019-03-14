##-----------------------------------------------------------------------------------------------------------##
## Title: Data Preparation Pipe
## Description: this program processes and prepares data from the player-name.csv files
## Input(s):  andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv
## Output: 
#    1. shots-data.csv in the data folder 
#    2. shots-data-summary.csv in the output folder
#    3. player-name-summary.csv for each player-name.csv file input
#    (see data dictionary for more details)
## Author: Casey Chadwell
##-----------------------------------------------------------------------------------------------------------##


#Read in data as Data Frame Objects with strings as characters

ai <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
dg <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
kd <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
kt <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
sc <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)


# Add a name column in each data frame

ai['name'] = 'Andre Iguodala'
dg['name'] = 'Draymond Green'
kd['name'] = 'Kevin Durant'
kt['name'] = 'Klay Thompson'
sc['name'] = 'Stephen Curry'


# Change the shot made flag
ai_idx = which(ai['shot_made_flag'] == 'y')
ai[ai_idx, 'shot_made_flag'] = 'shot_yes'
ai[-ai_idx, 'shot_made_flag'] = 'shot_no'

dg_idx = which(dg['shot_made_flag'] == 'y')
dg[dg_idx, 'shot_made_flag'] = 'shot_yes'
dg[-dg_idx, 'shot_made_flag'] = 'shot_no'

kd_idx = which(kd['shot_made_flag'] == 'y')
kd[kd_idx, 'shot_made_flag'] = 'shot_yes'
kd[-kd_idx, 'shot_made_flag'] = 'shot_no'

kt_idx = which(kt['shot_made_flag'] == 'y')
kt[kt_idx, 'shot_made_flag'] = 'shot_yes'
kt[-kt_idx, 'shot_made_flag'] = 'shot_ no'

sc_idx = which(sc['shot_made_flag'] == 'y')
sc[sc_idx, 'shot_made_flag'] = 'shot_yes'
sc[-sc_idx, 'shot_made_flag'] = 'shot_no'



# Add game minute as a column 

ai['minute'] = (ai['period']-1) * 12 + (12-ai['minutes_remaining'])
dg['minute'] = (dg['period']-1) * 12 + (12-dg['minutes_remaining'])
kd['minute'] = (kd['period']-1) * 12 + (12-kd['minutes_remaining'])
kt['minute'] = (kt['period']-1) * 12 + (12-kt['minutes_remaining'])
sc['minute'] = (sc['period']-1) * 12 + (12-sc['minutes_remaining'])


# Output summary of dataframes into text files

sink('../output/andre-iguodala-summary.txt')
summary(ai)
sink()

sink('../output/draymond-green-summary.txt')
summary(dg)
sink()

sink('../output/kevin-durant-summary.txt')
summary(kd)
sink()

sink('../output/klay-thompson-summary.txt')
summary(kt)
sink()

sink('../output/stephen-curry-summary.txt')
summary(sc)
sink()


# Stack tables and export

all_shots <- rbind(ai,dg,kd,kt,sc)
write.csv(all_shots,"../data/shots-data.csv")


# Export summary to output folder

sink('../output/shots-data-summary.txt')
summary(all_shots)
sink()
