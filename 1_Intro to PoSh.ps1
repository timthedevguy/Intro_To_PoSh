break
# --------------------------------------------------------------------------------------------------------------
# 1.3 What is PowerShell
# --------------------------------------------------------------------------------------------------------------
# "A tool that can be used for automating, enforcing and causing specific outcomes within an environment."
# 
# Can be as simple as one line of code or as complex as thousands with a GUI interface

# No programming training is complete without the mandatory Hello World!!!

Write-Host "Hello World"





# --------------------------------------------------------------------------------------------------------------
# 1.4 What is a PowerShell Function
# --------------------------------------------------------------------------------------------------------------
# A block of repeatable code that either manipulates information or takes information
# to perform some task.

# Important concept of Don't Repeat Yourself (DRY)

function AddFive($number) {
    return $number + 5
}

AddFive 5
AddFive(15)
Write-Host "10 plus 5 is $(AddFive(10))"

# Why are functions important?
# 
# If you have a block of logic that repeats elsewhere in the script it should be a function.
# If you have to modify some of that logic now you only modify it in one place and are not
# repeating yourself in other areas of the script, potentially introducing bugs.





# --------------------------------------------------------------------------------------------------------------
# 1.5 What is a PowerShell Cmdlet
# --------------------------------------------------------------------------------------------------------------
# A block of repeatable code that either performs some task.  Most cmdlets are compiled
# C# code, but don't have to be!

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_cmdletbindingattribute?view=powershell-5.1

# SOUNDS LIKE A FUNCTION! Well, basicly it is, Cmdlets can take additional parameters
# such as WhatIf, Verbose, that are added to Cmdlets automatically

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-5.1

# -- Common Params --
# -Verbose
# -ErrorAction
# -WhatIf

# -- Other Params --
# -Debug
# -WarningAction
# -InformationAction
# -ErrorVariable
# -WarningVariable
# -InformationVariable
# -OutVariable
# -OutBuffer
# -PipelineVariable

# Functions can be made into Cmdlets using CmdletBinding attribute, lets turn our AddFive into
# a simple Cmdlet

function AddFive() {
    [CmdletBinding()]
    param(
        [Parameter(ParameterSetName = 'Default', Mandatory = $true)]
        [int]$Number
    )
    Write-Verbose "Starting number is $($Number)"
    return $Number + 5
}

AddFive(5)
AddFive -Number 5
AddFive -Number 5 -Verbose
#                  -------
#                     1
# 1.  Notice that 'Verbose' is not defined in the param() block like 'Number' is.
#     This is because 'Verbose' is a Common Paramater that got added by the
#     CmdletBinding attribute which makes this function a cmdlet now.




# --------------------------------------------------------------------------------------------------------------
# 1.6 What is a PowerShell Module
# --------------------------------------------------------------------------------------------------------------
# Modules are a group of CmdLets/Functions that are generally
# geared to a specific purpose.  For example 'AzureAD' contains
# all the Azure AD CmdLets needed to interact with Microsoft
# Azure.

# Those with Programming background will compare this to a Library or
# Package.  (C# think DLL)

# Modules are imported using the CmdLet 'Import-Module', Import-Module
# loads every CmdLet and Function of the Module in to the session.  
# As we saw in the Functions topic once something is in the session
# you can use them over and over again.

Import-Module -Name AzureAD

Remove-Module -Name AzureAD

# To see what commands are available after importing a Module use

Get-Command -Module AzureAD

# As of PowerShell 3.0 unloaded module cmdlets will show up in auto-completion
# and will auto 'Import-Module' when first used.  For example, using Get-ADUser
# on a DC will auto import the 'ActiveDirectory' PowerShell module to interact
# with AD.





# --------------------------------------------------------------------------------------------------------------
# 1.7 What are Environment Variables
# --------------------------------------------------------------------------------------------------------------
# Environment variables from the host OS, such as Path

$ENV:PATH
$ENV:COMPUTERNAME
$ENV:USERNAME
$ENV:ALLUSERSPROFILE





# --------------------------------------------------------------------------------------------------------------
# 1.8 What are PS Drives
# --------------------------------------------------------------------------------------------------------------
# PowerShell Drives are contructs that provide access to data from a PowerShell Provider
# There are differnet providers but we won't go much in to them, they can be accessed
# like a drive even though they may not be (Registry for example)

Get-PSDrive
Get-ChildItem -Path C:\
Get-ChildItem -Path HKLM:\





# --------------------------------------------------------------------------------------------------------------
# 1.9 What is PowerShell Pipeline
# --------------------------------------------------------------------------------------------------------------
# Think of the PowerShell pipeline as an assembly line.  Each step on the line
# does something to the product on the line.  At the end of the line the product
# is in it's final form.

Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object Name -ExpandProperty Name | Sort-Object -Descending
#----------   --------------------------------------   ---------------------------------------   -----------------------
#    1                          2                                          3                                4

# How this works
# 1 -> Gets a list of all services on the computer, includes properties such as
#      Name, Status, DisplayName, etc etc.
# 2 -> Where-Object tells PowerShell to only pick items in the list that have
#      a Status property with the value of Stopped
# 3 -> Select-Object tells PowerShell we only want to return the Name property
#      of each item (We don't want all the extra Properties)
# 4 -> Final step is we use Sort-Object to sort the names Descending (Z -> A)

# To test this your self and see the progression
# Highlight 'Get-Service' and press F8
# Highlight 'Get-Service | Where-Object {$_.Status -eq "Stopped"}' and press F8
# Highlight 'Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object Name -ExpandProperty Name' and press F8

# You will see the data change with each move down the Pipeline

# You will see this called piping, pipeline, etc. And coincidently it uses the '|' pipe character.





# --------------------------------------------------------------------------------------------------------------
# 1.10 What is PowerShell Remoting
# --------------------------------------------------------------------------------------------------------------
# Perhaps the most powerful aspect of PowerShell is the ability to 
# connect to other computers and perform commands

# The remote tasks can be performed using different methods like:

# Remotely instructiong the machine to perform a task (WSMAN)

# Entering a PSSession and issuing commands as if you are on the machine

# Creating PowerShell jobs which will do something remotely and then report back





# --------------------------------------------------------------------------------------------------------------
# 1.11 Steal with Pride!
# --------------------------------------------------------------------------------------------------------------
# There is no shame in searching for help, code written by others from Stack Overflow,
# GitHub, etc.  The code is there for you to learn from.

# VERY IMPORTANT! - Be sure you understand what the code is doing before you
#                   run it on your machine.





# --------------------------------------------------------------------------------------------------------------
# 1.12 What is Pseudo Code
# --------------------------------------------------------------------------------------------------------------
# Pseudo code is a method of planning code using plain english which helps
# focus on the logic and steps required instead of the actual commands needed.

# Throughout the book you will find excersises and blocks for your answers,
# these blocks are not intended for you to write 300 lines of PowerShell code,
# but for Pseudo Code.

# For example, you have a Goal of Moving a file from A to B.  Your Pseudo Code may
# look something like this.

# Goal: Move a file from A - B
# Start: See if file we want to move exists
# End: Move file to destination

# Steps:
#   1) Confirm file exists
#   2) Get file location
#   3) Confirm dest path exists
#   4) Confirm file does not exist in dest
#   5) Move the file
#   6) Confirm file has been moved





# --------------------------------------------------------------------------------------------------------------
# 1.13 What is Git/GitHub
# --------------------------------------------------------------------------------------------------------------
# VCS??  Git is a Version Control System which helps devs
# by keeping track of historic changes to the code.  GitHub is a 
# web front end/host to your git repo.  Really useful
# when you need to go back to a point when the code worked after
# trying a bunch of things.

# GitHub Desktop
# Git in VSCode






# --------------------------------------------------------------------------------------------------------------
# 1.14 GitHub Exercises
# --------------------------------------------------------------------------------------------------------------

# Setup GitHub account
# Download GitHub Desktop
# Navigate to 'https://github.com/timthedevguy/Intro_To_PoSh'
# Open in GitHub Desktop, and Clone locally


