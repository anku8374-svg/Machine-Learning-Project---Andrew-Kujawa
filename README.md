# Machine-Learning-Project---Andrew-Kujawa

------------------------------------------------------------------------------------------------------------

Initial Prompt: 

I would like to do a machine learning project where the goal is to predict whether a robot will fail due to eletrical current, temperature, and speed. I have a spreadsheet with columns ‘robot’, ‘current’, ‘avg_temp’, and ‘speed’. There are approximately 4000 rows. I will ask for MatLAB code soon, but first: Can we talk about the best way to model this data set?

------------------------------------------------------------------------------------------------------------

A Random Forest is a popular machine learning algorithm, which creates multiple decision trees by utilizing random samples from given a data set and then aggregates said data using a voting scheme to achieve a classification output. Each tree in this case will learn some simple decision rule, but due to the aggregation, the final result is going to be both more precise and robust. The reason why we choose to implement a Random Forest model in this particular case is that our data set is made up of structured numeric measurements, whose features interact with each other in some complicated way. Moreover, this approach will provide us with information regarding feature importance, another objective of our work.

------------------------------------------------------------------------------------------------------------
<img width="2568" height="1461" alt="Screenshot (621)" src="https://github.com/user-attachments/assets/1699867e-0069-47fd-b407-ca4a9e1944a7" />
In the confusion matrix, we find out how often our model predicted each label as right or wrong predictions. Diagonal elements represent the accuracy, whereas off-diagonal elements are errors. Furthermore, it can be seen that obstruction and normal classes have been predicted by our model more accurately, whereas a few collision data have been classified as normal class data, and fr-collision class data has been classified as obstruction class. Therefore, it seems like a decent classifier, except that it is difficult to separate obstruction-fr_obstruction and collision-normal classes.

<img width="2523" height="1451" alt="Screenshot (622)" src="https://github.com/user-attachments/assets/67f33bf0-0b9d-4436-a4f9-43990b4d9b5a" />
Looking at the plot, it becomes clear that out of 90 input variables, the random forest algorithm selected only a few significant variables that have influenced their decisions more than others. Higher bar values indicate more significant features, while lower values near or below zero have been less effective. From this observation, it seems that among 90 time-series force torque inputs, our algorithm has utilized some specific inputs that are within the failure window.

------------------------------------------------------------------------------------------------------------
