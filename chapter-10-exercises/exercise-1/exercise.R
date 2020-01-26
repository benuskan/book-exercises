# Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)
seahawks_scores <- c(12, 30, 13, 21)

# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season
opposing_scores <- c(28, 24, 27, 26)

# Combine your two vectors into a dataframe called `games`
games <- data.frame(seahawks_scores, opposing_scores)

# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!
games$diff <- games$seahawks_scores - games$opposing_scores

# Create a new column "won" which is TRUE if the Seahawks won the game
games$won <- games$seahawks_scores > games$opposing_scores

# Create a vector of the opponent names corresponding to the games played
opponent_names <- c("Rams", "Panthers", "Cardinals", "49ers")

# Assign your dataframe rownames of their opponents
rownames(games) <- opponent_names

# View your data frame to see how it has changed!
print(games)
