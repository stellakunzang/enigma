# Mod 1 Enigma Project 

## Stella Bonnie 

### Self-Assessment 

**Functionality** - Meets Expectations 

**Object Oriented Programming** - Above Expectations 

**Ruby Conventions and Mechanics** - Above Expectations

**Test Driven Development** - Meets Expectations

**Version Control** - Above Expectations 

### Design Strategy 
For my Enigma project I tried to integrate some of the topics I found most challenging in Mod 1 in order to gain experience using these tools in a real-world context. These include the use of stubs, inheritance, and modules. I began by making 4 classes: Enigma, Key, Offset, and Shift. Using these classes I was able to finetune the methods that I wanted to write in order execute the algorithm in the assignment. Once I tried to bring the three other classes together in the Engima class I realized that I had created some problems because of the way the program was structured. I ended up solving some of these problems by creating two modules: one that would hold the methods that create default values, required in both my Enigma class and supporting classes, and another module to make the key and offset. I then created Shift and Unshift classes to include the modules and do the bulk of the work encrypting and decrypting. After this, I found that the Shift and Unshift classes were not efficient because they were basically copies of one another (including instance variables) with some slight variation. I moved them into one class (Shift), which fixed that problem, but created a new problem. I had negated the use of a module since it would only be utilized by one class. 

At this point I had done and undone quite a bit of work, and turned my brain into a pretzel, so I had to step away from the code and spend sometime with an old fashioned paper and pen. I came back to the program refreshed and decided to refactor in order to minimize repetetive code and meet my goal of utilizing both inheritance and modules. I slimmed down my Abcdable module so that it never required instance variables (which is a no-no) and moved the methods that create keys and offsets into a Shift parent class. I created 2 child classes called Encryption and Decryption, similar to Shift and Unshift, except that the repetition is eliminated by the use of a parent class. They only contain code that is unique to each class and inherit the rest of the repetitive code, including both state and behavior (instance variables and methods). The 2 modules that remain, Abcdable and Defaultable, contain methods that are utilized in multiple classes and don't require instance variables. 

Though I'm sure that someone with more experience in Ruby and Object Oriented Program can look at this and see flaws, I am very pleased with the design that I've ended up with. Questions that remain for me mostly have to do with writing efficient code. I'm sure that there are places where I am iterating repeatedly and I might be better served by storing these values rather than continuing to run the iteration. I decided to err on the side of caution and have less instance variables, since our instructors emphasized this as a good practice. I look forward to reviewing this project at the end of my time at Turing with new knowledge and seeing both how far I've come and also how far I have yet to go. 
