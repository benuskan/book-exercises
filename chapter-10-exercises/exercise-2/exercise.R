# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste("Employee", 1:100)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries_2017 <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salary_adustments <- runif(100, -5000, 10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salaries_2017, salary_adustments, stringsAsFactors = FALSE)
print(salaries)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$salaries_2018 <- salaries$salaries_2017 + salaries$salary_adustments

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$got_raise <- salaries$salaries_2018 > salaries$salaries_2017


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
employee_57 <- salaries[salaries$employees == "Employee 57", "salaries_2018"]

# How many employees got a raise?
nrow(salaries[salaries$got_raise == TRUE, ])

# What was the dollar value of the highest raise?
highest_raise <- max(salaries$salary_adustments)

# What was the "name" of the employee who received the highest raise?
employee_highest_raise <- salaries[salaries$salary_adustments == highest_raise, "employees"]

# What was the largest decrease in salaries between the two years?
largest_decrease <- min(salaries$salary_adustments)

# What was the name of the employee who recieved largest decrease in salary?
employee_largest_decrease <- salaries[salaries$salary_adustments == largest_decrease, "employees"]

# What was the average salary change?
average_salary <- mean(salaries$salary_adustments)

# For people who did not get a raise, how much money did they lose on average?
average_salary_loss <- mean(salaries$salary_adustments[salaries$got_raise == FALSE])
print(average_salary_loss)

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
#it was hard to tell because so many numbers
# Write a .csv file of your salary data to your working directory
write.csv(salaries, "salaries.csv")

