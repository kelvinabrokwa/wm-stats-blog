# Author: Kelvin Abrokwa-Johnson
# Calculates the grade needed for a minimum grade based on grade category weighting

import sys

def verifyWeights():
	total_percentage = 0
	for value in weight_dict.values():
		total_percentage += value
	if int(total_percentage) != 100:
		print("\nThe weightings don't add up to 100%. This program will now end.\n\n\n")
		sys.exit()

def addGrade(category, new_grade):
	"""Creates a list of grades for each category"""
	if grade_dict[category]:
		grade_dict[category].append(new_grade)
	else:
		grade_dict[category] = [new_grade]

def getAverage(list_of_grades):
	"""Calculate Average of all grades in a category, input must be a list. Input is a list of grades."""
	total = 0
	for i in list_of_grades:
		total += i
	average = total / len(list_of_grades)
	return average

# These dictionaries are essentially minified MapReduce (I'm probably just throwing buzzwords around)
weight_dict = {}
grade_dict = {}
avg_dict = {}

# Menu for categories and weighting
print("")
new_cat = 'null'
while new_cat.lower() != '':
	new_cat = input("Enter a new category or just press \"enter\" to finish: ")
	if new_cat.lower() == '':
		break
	new_weight = input("Enter its weigth: ")
	# To make sure they enter a number
	try:
		new_weight = int(new_weight)
	except ValueError:
		new_weight =  int(input("That isn't a number. Please enter an integer: "))
	weight_dict[new_cat] = int(new_weight)

verifyWeights()

print("")
print("="*30)
print("%-15s %-5s %s" % ("Categories", "|", "Weights"))
print("-"*30)
for key, value in weight_dict.items():
	value = int(value)
	print("%-15s %-5s %d" % (key, "|", value))


# Menu for lists of grades
print("="*30, "\n")
print("And now to enter you grades!\n")
print("When prompted for each category, enter each grade") 
print("receieved one at a time, followed by the enter key.\n")
print("When you are finished, simply press \"enter\" for the next category.\n")

for key in weight_dict.keys():
	grade_dict[key] = []
	new_grade = 0
	print(key.upper())
	while new_grade != "q":
		new_grade = input("Enter a grade or just press \"enter\" to move on to the next category: ")
		if new_grade == "":
			break
		grade_dict[key].append(int(new_grade))
	print("\nHere are your grades for", key, ": ")
	for i in grade_dict[key]:
		print(i)
	print("\n")

# Giving category averages
for key in grade_dict.keys():
	avg_dict[key] = getAverage(grade_dict[key])
	print(key, "average:", getAverage(grade_dict[key]))

# Calculating current class average
class_average = 0
for key in avg_dict.keys():
	partial = avg_dict[key] * (weight_dict[key] / 100)
	class_average += partial
print("\nCurrent class average:", class_average, "\n")

target_grade = input("Please enter your target grade as a percentage: ")
print("\n")

print("Choose type the category of your as it appears in the following list\n")

number = 0
for key in weight_dict.keys():
	number += 1
	print(number, end="")
	print(".", key)

print("")
choice = input("--> ")

# The magical, middle school algebra formula, ladies and gents
output = ( float(target_grade) -  ( float(class_average) - float(avg_dict[choice] * (weight_dict[choice]) / 100)) ) * 	\
		\
			( ( float(len(grade_dict[choice])) + 1.0 ) / float(weight_dict[choice] / 100.0)) - 		\
		\
			( float(avg_dict[choice]) * float(len(grade_dict[choice])) )

print("\nYou need a", output, "in order to get a", target_grade)
print("\nThanks for using our program!")
print("Goodbye")