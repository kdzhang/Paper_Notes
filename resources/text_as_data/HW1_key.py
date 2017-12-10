import os

os.chdir("/Users/franceszlotnick/Dropbox/TextAsData/ProblemSets/PS1/")

with open("hw1.txt", "w") as f:
	f.write("hello world" + "\n")

	for i in range(1, 101):
		f.write(str(i) + "\n")