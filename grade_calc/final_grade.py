#Program for "What Do I Need on This Final?".

#Take class name.
class_name = input("Name of class: ")
class_name = class_name.capitalize()

#Take desired grade for class.
desired_grade = float(input("Desired final grade for the class \
(as a percent): "))

#Take different categories of class.
print("Please add assignment categories (i.e. Quizzes, Tests, etc.) for \n\
class. When all categories entered, just press enter for final category.")
list_of_categories = []
category_number = 1
category = 0
while category != "":
    category_number = str(category_number)
    category = input("Category " + category_number + ": ")
    category = category.capitalize()
    list_of_categories.append(category)
    category_number = int(category_number)
    category_number += 1
list_of_categories.remove("")

#Take the weight of these categories.
print("Please enter the weight (as a percent) for each category in the course.")
count_1 = len(list_of_categories)
list_of_weights = []
count_2 = 1
while count_1 != 0:
    weight = float(input("Weight of " + list_of_categories[count_2] + ": "))
    list_of_weights.append(weight)
    count_1 -= 1
    count_2 += 1
    
#Take previous grades in these categories.
print("Please enter previous grades in each of these categories. When all \n\
grades entered for a category, just press enter for final grade.")
current_list_of_grades = []
for i in list_of_categories:
    list_of_grades_for_i = []
    grade = 0
    grade_number = 1
    while grade != "":
        grade = float(input("Grade "+ grade_number + "for " + i + ": "))
        list_of_grades_for_i.append(grade)
        grade_number += 1
    current_list_of_grades.append(list_of_grades_for_i)

#Calculate average for the class so far and display to user.
current_grade_list = []
category_count = 1
for i in current_list_of_grades:
    grades_for_category = i
    total = 0
    for i in grades_for_category:
        total += i
    average_score = total / len(i)
    percent_of_current_grade = average_score * (list_of_weights[category_count] /\
                                              100)
    current_grade_list.append(percent_of_current_grade)
    category_count += 1
current_grade = 0
for i in current_grade_list:
    current_grade += i
print("Your current grade is: "+current_grade)

#Take desired future assignment to determine minumum grade needed.
assignment_category = input("Please enter category of the future assignment \
which you wish to find the minimum grade needed to get desired average: ")
assignment_category = assignment_category.capitalize()

#Calculate minimum grade needed on assignment to receive desired grade.
