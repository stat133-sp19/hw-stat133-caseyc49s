##-----------------------------------------------------------------------------------------------------------##
## Title: Shot Charts Generator
## Description: this program generates charts by player that shows where each shot was taken
## Input(s):  
#    1. player-name.csv files from the data folder
#    2. jpg of NBA basketball court from images folder
## Output: 
#    1. player-name-shot-chart.pdf in the images folder for each player-name.csv input
#    2. gws-shot-charts.pdf in images folder 
#    3. gws-shot-charts.png in the images folder
## Author: Casey Chadwell
##-----------------------------------------------------------------------------------------------------------##
library(ggplot2)
library(jpeg)
library(grid)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))


## 4.1) Shot Charts of each player
pdf('../images/andre-iguodala-shot-chart.pdf',width=6.5,height=5)
iguodala_shot_chart <- ggplot(data=ai) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag), size=0.75) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
iguodala_shot_chart
dev.off()

pdf('../images/draymond-green-shot-chart.pdf',width=6.5,height=5)
green_shot_chart <- ggplot(data=dg) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag), size=0.75) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
green_shot_chart
dev.off()

pdf('../images/kevin-durant-shot-chart.pdf',width=6.5,height=5)
durant_shot_chart <- ggplot(data=kd) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag), size=0.75) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
durant_shot_chart
dev.off()

pdf('../images/klay-thompson-shot-chart.pdf',width=6.5,height=5)
klay_thompson_chart <- ggplot(data=kt) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag), size=0.75) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
klay_thompson_chart
dev.off()

pdf('../images/stephen-curry-shot-chart.pdf',width=6.5,height=5)
curry_shot_chart <- ggplot(data=sc) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag), size=0.75) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
curry_shot_chart
dev.off()

## Facetted Shot Chart
pdf('../images/gsw-shot-charts.pdf',width=8,height=7)
aggregated_shot_chart <- ggplot(data= all_shots) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag), size=0.75) +
  ylim(-50,420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme(legend.position = 'top') +
  facet_wrap( ~ name, nrow=2,ncol=3)
aggregated_shot_chart
dev.off()

png('../images/gsw-shot-charts.png',width=8,height=7, units = "in", res=1500)
aggregated_shot_chart <- ggplot(data= all_shots) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x=x,y=y,color=shot_made_flag), size=0.75) +
  ylim(-50,420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme(legend.position = 'top') +
  facet_wrap( ~ name, nrow=2,ncol=3)
aggregated_shot_chart
dev.off()