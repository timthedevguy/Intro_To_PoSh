break
# Page 31
# --------------------------------------------------------------------------------------------------------------
# 3.1 What Are Conditionals
# --------------------------------------------------------------------------------------------------------------
# If/Then/Else/ElseIf.  The only purpose of If statements are to branch your
# code in to a different direction if something is either $true or $false.  This
# structure is your decision maker in PowerShell.  If something is $true I want to
# perform this action, if it is false I want to do this instead.

$object = $true
$object = $false

# Anatomy of an IF statement (Shown in one line)
 if($object -eq $true){ Write-Host "This is True" }
#-- -----------------   -------------------------
# 1        2                       3

# 1 - If statements always start with the keyword 'If'
# 2 - This is the comparison, if this evaluates to True then the 'True' code
#     block is ran, if it is false and there is no Else then code moves on
# 3 - This is the True code block, this block will always be here, to catch
#     a false then you need to add "Else".  We always catch the True condition

# Anatomy of an IF/ELSE statement (Shown on one line)
if($object -eq $true){ Write-Host "This is True" } Else { Write-Host "This is False" }
#                                                  ----   --------------------------
#                                                   4                 5

# 4 - Else statement indicates we want to capture the False condition
# 5 - This is the False code block, code here will execute if the condition
#     evaluates to False

# Anatomy of an IF/ELSEIF statement (Shown on one line)
$object = "Red"
if($object -eq $true){ Write-Host "This is True" } ElseIf($object -eq "Red") { Write-Host "Object is Red" }
#                                                  ------ -----------------    --------------------------
#                                                     6          7                         8

# 6 - ElseIf statement checks another condition to see if it's True
# 7 - This is the second condition to check
# 8 - This is the True block that will run if the ElseIf condition is True

# Anatomy of an IF/ELSEIF/ELSE statement (Shown on one line)
$object = "Blue"
if($object -eq $true){ Write-Host "This is True" } ElseIf($object -eq "Red") { Write-Host "Object is Red" } Else { Write-Host "No conditions where True" }
#                                                                                                           ----   -------------------------------------
#                                                                                                            9                            10

# 9 - Else keyword signifies we want to catch the False path
# 10 - This is the False code path.  If all Conditions (includeing ElseIf) are False
#      then this code block is executed

# And this is what line 41 looks like in proper multiline format
if($object -eq $true) {

    Write-Host "This is True" 
} 
ElseIf($object -eq "Red") { 

    Write-Host "Object is Red" 
} Else { 

    Write-Host "No conditions where True"
}

# [TIP]: You can test the comparison part of an IF statement by highlighting the ($object -eq $true)
#        remember to include the () and press F8.  This will print True or False and will help
#        you determine which code branch it will take.

# --------------------------------------------------------------------------------------------------------------
# 3.2 What are Operators
# --------------------------------------------------------------------------------------------------------------
# Comparison operators are what is used to determine if something is equal to,
# greater than, less than, etc to something else.  The most common are:

# -eq       Equal To
# -ne       Not Equal To
# -gt       Greater Than
# -lt       Less Than
# -ge       Greater Than or Equal To
# -le       Less Than or Equal To
# -like     Like
# -notlike  Not Like
# -in       Item based in
# -notin    Not in


$test = ""

if($test -eq $null -or $test -eq ""){}

[string]::IsNullOrEmpty($test)  # <-- Common shortcut for line 91 above

if($test) {Write-Host "This is true"}

$sample = 2

if($sample -ge 2) {
    Write-Host "Sample is 2"
}

if($sample -gt 1) {
    Write-Host "Sample is greater than 1"
}

if($sample -gt 2) {
    Write-Host "Sample is Greater Than or Equal to 2"
}

# LIKE/NOTLIKE is useful to search for strings

$string1 = "My name is Tim Davis"

if($string1 -like "*Tim*") {
    Write-Host "Found 'Tim' inside of string1"
}

# Null examples
# Null comparison should always have $null on left of comparison
# operator, not doing so can incorrectly report an object
# as null when it may just be empty.
if (@() -eq $null) { 'true' } else { 'false' }
if (@() -ne $null) { 'true' } else { 'false' }

# Correct
if ($null -eq @()) { 'true' } else { 'false' }
if ($null -ne @()) { 'true' } else { 'false' }

# Notice the use of '*'.  This is your Wildcard character, this allows Tim
# to be found regardless of what is in front or behind the word.  This can 
# sometimes cause false positives like in the next example

$string1 = "There was a tim when all things were new"

# Check why " *Tim* " does not find " time "

if($string1 -like "* tim *") {
    Write-Host "Found 'Tim' inside of string1"
}

# You can see, Tim doesn't exist in the string but 'time' does and since
# we did '*Tim*' PowerShell found it in the word time.  You can get correct
# behavior by adding some spaces.

if($string1 -like "* Tim *") {
    Write-Host "Found 'Tim' inside of string1"
}

# --------------------------------------------------------------------------------------------------------------
# Switch
# --------------------------------------------------------------------------------------------------------------
# Used as a decision tree, similar to a bunch of Ifs, it's not better or worse than
# using a bunch of Ifs, just different

$name = "Timd"

switch($name) {
    "tim" {
        Write-Host "The Name is Tim"
    } 
    "bob" {
        Write-Host "The Name is Bob"
    }
    "charlie" {
        Write-Host "The Name is Charlie"
    }
    default {
        Write-Host "The Name is something else?!?"
    }
}

# Rewritten as a giant if statement.

if($name -eq "tim") {
    Write-Host "The Name is Tim"
}elseif ($name -eq "bob") {
    Write-Host "The Name is Bob"
}elseif ($name -eq "charlie") {
    Write-Host "The Name is Charlie"
} else {
    Write-Host "The Name is something else?!?"  
}


# --------------------------------------------------------------------------------------------------------------
# 3.3 Loops
# --------------------------------------------------------------------------------------------------------------
# Loops allow you to repeat blocks of code

# While             Code repeats while condition is True
# Do/Until          Code repeats until condition is True
# Do/While          Code repeats while condition is True
# For               Code repeats a number of times
# Foreach           Code repeats for each item in collection
# ForEach-Object    Code repeats for each object passed in pipeline


# DO/* vs WHILE
# -----------------------------------------------------------------------------
# DO runs code at least once before checking the condition
# WHILE checks condition and then runs code if True

$sample = 1

$files = Get-ChildItem -Path . -File
$counter = 0

do {
    Write-Host "Working on file: $($counter)" #$($files[$counter])"
    $counter++  # <- ++ is shorthand for $sample = $sample + 
}while($counter -lt 10) #<-- Loops while this is True

Write-Host "All file processing complete"

$sample = 0
do {
    $sample++  # <- ++ is shorthand for $sample = $sample + 1
    Write-Output "Do Loop Ran, Sample is $($sample)"
}until($sample -eq 10) #<-- Loops while this is False

# Counters can be used to ensure a Do/While loop only runs a certain
# amount of times

$count = 1

do{
    Write-Output "Running!"
    $count++
}until($count -eq 10)

$name = ""

do {
    $name = Read-Host -Prompt "What is your name?"

    if($name -eq "Tim") {
        Write-Host "Awesome, that is the best name!"
        $age = Read-Host -Prompt "How old are you?"
    } else {
        Write-Host "We don't like it, try again!"
    }
}until($name -eq "Tim")

Write-Host "$($name) is $($age)!"

$count = 1

do{
    Write-Output "Running!"
    $count++
}while($count -le 10)

$count = 1

while($count -lt 10) {
    Write-Output "Running! $($count)"
    $count++
}

while($sample -eq 5) {
    Write-Output "While Loop Ran"
    #$sample++
}
$sample = 5
while($sample -gt 1 -and $sample -lt 10 ) {
    Write-Output "While Loop Ran for sample #$($sample)"
    $sample++
}

$name = ""

while($name -ne "Tim") {
    $name = Read-Host -Prompt "What is your name?"

    if($name -eq "Tim") {
        Write-Host "Awesome, that is the best name!"
        $age = Read-Host -Prompt "How old are you?"
    } else {
        Write-Host "We don't like it, try again!"

    }
}

Write-Host "$($name) is $($age)!"

$hyperv = Get-Service | Where-Object {$_.DisplayName -like "Hyper-V Virtual Machine Management"}

$hyperv | Stop-Service

$counter = 0

# Only loop 3 times and then exit
while($hyperv.Status -ne "Stopped") {
    Write-Host "Waiting for Hyper-V to stop"
    Start-Sleep -Seconds 10
    $counter ++
    if($counter -ge 3) {
        break
    }
}


# --------------------------------------------------------------------------------------------------------------
# For Loop
# --------------------------------------------------------------------------------------------------------------
# For loop will repeat a number of times, For loop is unique in that you can 
# specify starting counter value, and step amount for each iteration

# Anatomy of For Loop
 for($counter = 1;$counter -le 10;$counter++) { Write-Output "For Loop Ran, counter is $($counter)" }
#--- ------------ --------------- ----------    ---------------------------------------------------
# 1       2              3             4                                 5

# 1 - For keyword starts the for loop
# 2 - Set counter variable and initial value
# 3 - Repeat the code while this condition is True
# 4 - Increment the counter by this amount on each loop
# 5 - The code to repeat

# We can also count backwards
for($counter = 10;$counter -ge 1;$counter--) {
    Write-Output "For Loop Ran, counter is $($counter)" 
}

# We can also count by 2's
for($counter = 1;$counter -le 10;$counter = $counter +2) {
    Write-Output "For Loop Ran, counter is $($counter)" 
}

# For loops are useful for Arrays where you need to know the index for
# other operations

$colors = "Red", "Blue", "Green"

for($counter = 0;$counter -lt $colors.Count;$counter++) {
    Write-Output "Counter is $($counter) and color is $($colors[$counter])"
}

# --------------------------------------------------------------------------------------------------------------
# foreach Loop
# --------------------------------------------------------------------------------------------------------------
# foreach loop is a loop that allows you to pull one item out of a Collection,
# assigns it to a variable and then lets you use that variable.

$colors = "Red", "Green", "Blue"    # <-- Collection of colors (Array)

# Anatomy of a foreach loop
 foreach($bob in $colors) { Write-Host "Current color is $($bob)" }
#------- ------    -------    ---------------------------------------
#   1      2          3                        4

# 1 - foreach keyword starts the foreach loop
# 2 - This is the new variable that represents a single item in the collection/
#     bucket/array.  You can name this anything, it should not already exist.
# 3 - The variable that is the collection/bucket/array to pull items from
# 4 - The code to repeat for each item in the collection/bucket/array

foreach($item in $colors) { 
    Write-Host "Current color is $($item)" 
}

foreach($bob in $files) { 
    Write-Host "Current color is $($bob)" 
}

# As you can see the name of the variable doesn't matter.


# --------------------------------------------------------------------------------------------------------------
# ForEach-Object
# --------------------------------------------------------------------------------------------------------------
# Code repeats for each object passed in pipeline, if you pass 10 objects to the
# pipeline than the code will repeat 10 times.  This makes use of a special $_
# variable to represent the current item being worked with from the pipeline.

$colors = "Red", "Green", "Blue"  # <-- Create an array

# Anatomy of ForEach-Object
 $colors | ForEach-Object { Write-Host "Current color is $($_)" }
#-------   --------------   -------------------------------------
#   1            2                           3

# 1 - The collection/bucket/array of items that you want to repeat code for
# 2 - The ForEach-Object cmdlet, this accepts items from the pipeline
# 3 - The code to repeat for each item in the collection/bucket/array
#     $_ represents the current object in the iteration

$colors = "Red"

$colors | ForEach-Object {
    Write-Host "Current color is $($_)"
}
$files = Get-ChildItem -Path . -File
$files | ForEach-Object { 
    .\Examples\Functions\Get-Extension.ps1 -path $_
}

# The above code shows that it will work even if the object is a single object
# this allows you to treat everything as a collection and not worry about
# if a cmdlet or function returns one or multiple items

# How to have ForEach-Object with counter to be used for Indexing (for whatever reason)
0..10 | ForEach-Object {
    Write-Host "Counter is $($_)"
}

# --------------------------------------------------------------------------------------------------------------
# 3.4 Selecting
# --------------------------------------------------------------------------------------------------------------
# The Select-Object cmdlet selects specified properties of
# an object or set of objects. It can also select unique 
# objects, a specified number of objects, or objects in a 
# specified position in an array.

$colors = "Red", "Green", "Blue", "Yellow"
$colors | Select-Object "Red"

$myDate = Get-Date | Select-Object Month, Day, Year

Get-PSDrive | Select-Object Name,Provider

$results = New-Object -TypeName System.Collections.Generic.List[PSObject]
(1..10) | ForEach-Object {
    $hash = @{
        Prop1 = "Tim"
        Prop2 = "Davis"
    }
    $obj = New-Object -TypeName PSCustomObject -Property $hash
    $results.Add($obj)
}


$filename = (Get-ChildItem C:\)[0] | Select-Object Fullname
Write-Host "Filename is currently $($filename.Fullname)"

# --------------------------------------------------------------------------------------------------------------
# 3.4 Sorting
# --------------------------------------------------------------------------------------------------------------
# Sort-Object can sort on property or just a the object itself


# Sorting without using a property
$colors | Sort-Object -Descending
$colors | Sort-Object

# Sorting using a property
$drives2 = Get-PSDrive | Select-Object Name, Provider | Sort-Object -Property Provider

$drives1 = Get-PSDrive | Select-Object Name -ExpandProperty Name

# --------------------------------------------------------------------------------------------------------------
# 3.4 Filtering Data
# --------------------------------------------------------------------------------------------------------------
# PowerShell lets us get loads and loads of data but sometimes you don't need
# all the data and just want a small subset.  This is done via filtering, as you 
# work with PowerShell you will see that some cmdlets offer -Filter and some
# don't.  We can filter data using Where-Object

$colors = "Red", "Blue", "Green", "Yellow", "Black"

# Anatomy of Where-Object
 $colors | Where-Object { $_ -eq "Red" }
#-------   ------------   ------------
#   1            2              3

# 1 - The collection/bucket/array of data you want to filter
# 2 - Where-Object cmdlet gets items from the Pipeline
# 3 - The filter block, this allows you to specify what you are looking for and
#     where to look for it at in the object.

# We can also use wildcards using -like
$colors | Where-Object { $_ -like "Bl*" }

# You can filter on individual properties
Get-Service | Where-Object { $_.Status -eq "Stopped" }

# You can filter on individual propeties and assign the resulting filtered array
# to a variable for use later

$stoppedServices = Get-Service | Where-Object { $_.Status -eq "Stopped" }


1..100 | ForEach-Object {
    Write-Host "Group-Name-$($_.ToString("000"))"
}

(Get-Date).DayOfWeek
((Get-Date).DayOfWeek -eq "Tuesday")