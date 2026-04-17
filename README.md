# Machine-Learning-Project---Andrew-Kujawa

------------------------------------------------------------------------------------------------------------

Initial Prompt: 

I would like to do a machine learning project where the goal is to predict whether a robot will fail due to 
eletrical current, temperature, and speed. I have a spreadsheet with columns ‘robot’, ‘current’, ‘avg_temp’, 
and ‘speed’. There are approximately 4000 rows. I will ask for MatLAB code soon, but first: Can we talk 
about the best way to model this data set?

------------------------------------------------------------------------------------------------------------

A Random Forest is a popular machine learning algorithm, which creates multiple decision trees 
by utilizing random samples from given a data set and then aggregates said data using a voting 
scheme to achieve a classification output. Each tree in this case will learn some simple 
decision rule, but due to the aggregation, the final result is going to be both more precise 
and robust. The reason why we choose to implement a Random Forest model in this particular 
case is that our data set is made up of structured numeric measurements, whose features 
interact with each other in some complicated way. Moreover, this approach will provide us with 
information regarding feature importance, another objective of our work.

------------------------------------------------------------------------------------------------------------
