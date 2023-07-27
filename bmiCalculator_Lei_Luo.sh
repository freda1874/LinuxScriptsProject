
#!bin/bash

<<comment
[Student name]: Lei Luo  
[Description of the script]:Create a script called bmiCalculator.sh that will calculate the Body Mass Index (BMI) based on user provided weight and height values.
[A brief algorithm describing the code:]The code requests user input for height and weight, calculates the Body Mass Index (BMI) from these values, and then categorizes the BMI into "Underweight", "Normal Weight", "Overweight", or "Obesity" based on predefined BMI ranges.

comment
clear

echo "Enter your height in m: "
read height

echo "Enter your weight in kg: "
read weight

# Calculate the BMI

bmi=$(echo "scale=2;$weight/($height * $height)"|bc)

# Determine the BMI category. 
if (( $(echo "$bmi < 18.5" | bc -l) )); then
    category="Underweight"
elif (( $(echo "$bmi >= 18.5 && $bmi < 25" | bc -l) )); then
    category="Normal Weight"
elif (( $(echo "$bmi >= 25 && $bmi < 30" | bc -l) )); then
    category="Overweight"
else 
    category="Obesity"
fi

echo "Your BMI is: $bmi"
echo "Category: $category"
