# Task 1: Comments
#This is Single line comment
<< cmt
This is a multi-line comment.
Task 1 is asking to provide a multi-line comment
cmt
echo "Task 1 Completed."
#------------------------------------------------#
# Task 2: Echo
echo "Task 2 Completed."
#------------------------------------------------#
# Task 3: Variables
v1="Hello"
v2="Rajesh"
echo $v1 $v2
echo "Task 3 Completed."
#------------------------------------------------#
# Task 4: Using Variables
read -p "Enter number 1: " num1
read -p "Enter number 2: " num2
sum=$(expr $num1 + $num2)
echo "Sum of $num1 and $num2 is: $sum"
echo "Task 4 Completed."
#------------------------------------------------#
# Task 5: Using Built-in Variables
echo "USER - $USER"
echo "PWD - $PWD"
echo "HOME - $HOME"
echo "Shell - $BASH"
echo "Host Name - $HOSTNAME"
echo "Task 5 Completed"
#------------------------------------------------#
# Task 6: Wildcards
ls -l *.sh
echo "Task 6 Completed"
#------------------------------------------------#
