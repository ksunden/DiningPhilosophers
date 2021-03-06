Welcome to Dining Philosophers, where great minds think alike!

Here we discuss a classic problem, and the following description of the problem is amended from our text book, "Operating System Concetps 9th Edition":

Consider five philosophers who spend their lives thinking and eating. The philosophers share a circular table surrounded by five chairs, each belonging to one philosopher. In the center of the table is a bowl of rice, and the table is laid with five single chopsticks, one between every adjacent two philosophers. When a philosopher thinks, she does not interact with her colleagues. From time to time, a philosopher gets hungry and tries to pick up the two chopsticks that are closest to her (the chopsticks that are between her and her left and right neighbors). A philosopher may pick up only one chopstick at a time. Obviously, she cannot pick up a chopstick that is already in the hand of a neighbor. When a hungry philosopher has both her chopsticks at the same time, she eats without releasing the chopsticks. When she is finished eating, she puts down both chopsticks and starts thinking again.

Here is our solution to the problem:

We implement the asymmetric solution, where Odd philosophers pick up left then right chopsicks, and even philosophers pick up right then left chopsticks.  This avoids starvation and deadlock, but may not optimize chopstick utilization.


Usage of this app:

This app evaluates the time spent eating by using discrete time stamps. In the add, you can modify the duration, i.e., the number of time stamps, of any philosopher's eating time.

On top of the app, the current time stamp is shown in the center. Then in the upper part, you should be able to see the state (Hungry, Eating, Thinking) of each philosopher with the time needed for her to finish eating.

The slider is for adjusting the length of eating time. The value of the time will be seen in the box below the slider.

The "Run" button will run two time stamps in one second. After pressing "Run", the button will change to "Pause", enabling the user to pause the process.

The "Step" button will proceed the process to the next time stamp.

The "Stop" button will stop the simulation output the activity summary of every philosopher.
The button will change to "Start" and allow the simulation to resume.

To restart from the beginning, quit and restart the app.

Enjoy!


Kyle Sunden, Will Reichle, Fayang Pan
Dining Philosopher app for Operating Systems and Networking class, Winter 2014, Kalamazoo College
