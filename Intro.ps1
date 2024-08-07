# -------------------------------------------------------
# Jordan Benzing
# -------------------------------------------------------
# Jordan is an MVP that I had the pleasure of working and training with when I first joined Truesec.
# This training manual is his work and I'm just the delivery method, I may add my own experiences
# if they are helpful.  Jordan now works at Patch My Pc and you may have the pleasure of talking
# to him if interact with the company.

# -------------------------------------------------------
# About Me
# -------------------------------------------------------
# Started programming on the Apple IIe in middle school
# Tinkered throughout the years in C, C++, QBasic, VB, VB.NET, HTML/CSS/Javascript, Ruby, C#, ObjectiveC, PHP, Python and now Powershell
# Favorites are C#, Python and Powershell
# Joined Truesec in 2019 as a Consultant/DevOps guy
# Hobbies, coding, gaming, gardening





# -------------------------------------------------------
# 1.3 What is PowerShell
# -------------------------------------------------------
# "A tool that can be used for automating, enforcing and causing specific outcomes within an environment."
# 
# Can be as simple as one line of code or as complex as thousands with a GUI interface

# No programming training is complete without the mandatory Hello World!!!

Write-Host "Hello World"





# -------------------------------------------------------
# 1.4 What is a PowerShell Function
# -------------------------------------------------------
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





# -------------------------------------------------------
# 1.5 What is a PowerShell Cmdlet
# -------------------------------------------------------
# A block of repeatable code that either performs some task.  Most cmdlets are compiled
# C# code, but don't have to be!

# SOUNDS LIKE A FUNCTION! Well, basicly it is, Cmdlets can take additional parameters
# such as WhatIf, Verbose, that changes how the Cmdlet works.

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





# -------------------------------------------------------
# 1.6 What is a PowerShell Module
# -------------------------------------------------------
# Module is a collection of related Cmdlets, Microsoft provides Modules
# for varous systems.

Import-Module ActiveDirectory # Requires RSAT Tools installed





# -------------------------------------------------------
# 1.7 What are Environment Variables
# -------------------------------------------------------
# Environment variables from the host OS, such as Path

$ENV:PATH
$ENV:COMPUTERNAME
$ENV:USERNAME
$ENV:ALLUSERSPROFILE





# -------------------------------------------------------
# 1.8 What are PS Drives
# -------------------------------------------------------
# PowerShell Drives are contructs that provide access to data from a PowerShell Provider
# There are differnet providers but we won't go much in to them, they can be accessed
# like a drive even though they may not be (Registry for example)

Get-PSDrive
Get-ChildItem -Path C:\
Get-ChildItem -Path HKLM:\