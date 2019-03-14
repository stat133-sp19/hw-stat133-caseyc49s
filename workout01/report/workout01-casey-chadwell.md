Workout 01
================
Casey Chadwell

Shooting Statistics for Select Golden State Warriors players
============================================================

Shooting statistics were once only made available to professionals, but the new world of open data is changing that. Now the data is available online to anyone who wants to see it! With that comes a great number of possibilities and insights on the game, even for amateur data analysts. These insights could be used for anyting from recruitment to instagram retweets, and maybe even for salary increases. In this article, we will use some basic data techniques to gain insights into the 2016 season for Golden State Warriors players Andre Iguodala, Draymond Green, Kevin Durant, Klay Thompson, and Stephen Curry. First we will see where their shots, and missed shots, took place. Then we will examine their Effective Shooting Percentage.

Background and Deffinitions
===========================

We will first look at a commonly used tool in the world of basketball analytics, namely shot charts. These are extensively by coaches in order to make plays and plan for specific offenders.(Sass)

Next, we will examine shooting percentages and some other key statistics. According to an article by coack Jeff Haefner the four most important basketball statistics are *Field Goal Attempts*, *Effective Field Goal Percentage*, *Free Throw Attempts*, and *Free Throw Percentage*.(Haefner) He says that if your team's players does better in all four of these areas, you are all but gaurenteed a win. For the purpose of this article, the statistics are defined as follows:

1.  *Field Goal Attempts*: The number of shots taken by the payer regardless of success or failure. This can be useful to determine what weight to give a player with a high or low shooting percentage.

2.  *Effective Field Goal Percentage*: In this article, instead of the commonly used EFG%, we will difine this more simply as the total number of shots made (2PT or 3PT) divided by the total number of shots attempted.

3.  *Free Throw Attempts*: The number of 3PT fiels goals attempted.

4.  *Free Throw Percentage*: The number of free throws made divided by the number of free throws attempted.

Data Preparation
----------------

The data used in this project was initially obtained from the UC Berkeley Stat 133 GitHub repository at <https://github.com/ucb-stat133/stat133-hws>.

The initial files were then modified using `make-shots-data-script.R` file which can be found in the [code](../code/make-shot-data-script.R) folder of this repo. This script updates the initially obtained data to include additional columns such as player name and minute of the game, in addition to combining the different files into one. If you are interested in learning more about the data, please refer to the [data dictionary](../data/data-dictionary.md).

Analysis
--------

The shot charts for the 5 GSW players that was generated from the data is shown below.

#### Shot Charts

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

The next results obtained was effective shooting percentages for the players.

#### Effective Shooting Percentage

##### Overall 2 Point Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Draymond Green   346   171     0.494
    ## 3 Kevin Durant     643   390     0.607
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Stephen Curry    563   304     0.540

##### Overall 3 point Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   161    58     0.360
    ## 2 Draymond Green   232    74     0.319
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Klay Thompson    580   246     0.424
    ## 5 Stephen Curry    687   280     0.408

##### Overall Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   371   192     0.518
    ## 2 Draymond Green   578   245     0.424
    ## 3 Kevin Durant     915   495     0.541
    ## 4 Klay Thompson   1220   575     0.471
    ## 5 Stephen Curry   1250   584     0.467

The next thing we analyze is the effective shooting percentages by player when there is less than one minute left in the game.

##### &lt; 1 Minute Remaining 2 Point Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala    36    28     0.778
    ## 2 Draymond Green    24    13     0.542
    ## 3 Kevin Durant      48    28     0.583
    ## 4 Klay Thompson     30    17     0.567
    ## 5 Stephen Curry     59    32     0.542

##### &lt; 1 Minute Remaining 3 point Effective Shooting % by Player

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala    22     7     0.318
    ## 2 Draymond Green    22     3     0.136
    ## 3 Kevin Durant      38    14     0.368
    ## 4 Klay Thompson     31    12     0.387
    ## 5 Stephen Curry    114    33     0.289

##### &lt; 1 Minute Remaining Overall Effective Shooting % by Player

``` r
l1m = filter(all_shots, minutes_remaining < 1)
l1mbp = mutate(
  summarise(
    group_by(
      l1m, 
      name),
    total = n(),
    made = sum(shot_made_flag == 'shot_yes')
  ),
  perc_made = made/total
)
l1mbp
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala    58    35     0.603
    ## 2 Draymond Green    46    16     0.348
    ## 3 Kevin Durant      86    42     0.488
    ## 4 Klay Thompson     61    29     0.475
    ## 5 Stephen Curry    173    65     0.376

Discussion
----------

From the shot charts, we can see that many players attempt a lot more shots than others. We can also see that some players have their so called 'sweet spots' where they are more likely to make baskets.

From the percentages, we can see that the players vary not only on their percent made but also on their last minute shots. It is a popular thing in basketball to see the time running out and try and fit in one last throw, from this data we can see that some players are more successful than others. Andre Iguodala seems to be the leader of the pack in this regard, since his shooting percentage actually goes up.

Conclusions
-----------

Data can be very useful in basketball, even for small things. It can be interesting to analyze and not very difficult for the novice data scientist. In the coming seasons, it will be interesting to see the impacts of the growing field of data anylitics on the sport of basketball.

References
----------

"9 Stats That Every Serious Basketball Coach Should Track." Welcome to BREAKTHROUGH BASKETBALL, &lt;www.breakthroughbasketball.com/stats/9\_stats\_basketball\_coach\_should\_track.html&gt;.

"Hubie Brown and Using Shot Charts To Improve Shooting Percentages." Welcome to BREAKTHROUGH BASKETBALL, &lt;www.breakthroughbasketball.com/stats/using-shot-charts.html&gt;.
