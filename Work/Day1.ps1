##############################################
# Variables
##############################################
$myVar = "test"
$myVar = 19
$myVar = Get-EventLog -LogName Application
$myVar = @("Item 1", "Item 2", "Item 3", "Item 4")

# Looking at lines 3-6 do you think $myVar will hold the value on the right?

# If $myVar will successfully allow the value determine what DataType the result is

##############################################
# Strings
##############################################
$string1 = " brown fox"
$string2 = "The quick "
$string3 = " the lazy dog."
$string4 = " jumped over"

# Concatenate the 4 strings above into one string, you can use String Addition or Expandable strings
$string5 =

##############################################
# Arrays
##############################################
$array = ((1000*80)/(20*20))..1

# Run line 23 for the next steps

# How many items are in $array?
# What DataType is $array?
# What is the value of the last item?
# What is the value of the first itme?
# Remove any the item with a value of 100

##############################################
# Getting Help
##############################################
# Using Get-Help, determine how you would see Events from the Application log that have occured since
# five days ago.  (HINT: Get-Date, AddDays, and Get-Help ... -Online)


##############################################
# Find the error
##############################################
# The following code is broken, can you fix it? (2 errors)

$validColors = @("Red", "Green", "Blue", "Violet", "Black")
Write-Host 'The value of valid color #3 is $($validColors{2})'


##############################################
# Bonus question (2 parts)
##############################################
# Part 1: Using Get-Help, what needs added to only get the 5 newest
# EventLogs
Get-EventLog -LogName Application

# Part 2: How can you display the EventIDs without using a variable? (HINT: Parenthesis OR | can be used)