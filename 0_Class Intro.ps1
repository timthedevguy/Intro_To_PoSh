break
# -------------------------------------------------------
# Jordan Benzing
# -------------------------------------------------------
# Jordan is an MVP that I had the honor of working and training with when I first joined Truesec,
# I would say he is soley responsible for opening my eyes to the more advanced capabilities of
# PowerShell, before I met Jordan I had used it on and off for simple move scripts and such. I 
# used C# for everything up to that point.

# This training manual is his work and I'm just the delivery method, I may add my own experiences
# if they are helpful.  Jordan now works at Patch My PC and you may have the pleasure of talking
# to him if you interact with Patch My PC at some point.

# You can visit Jordan at https://jordantheitguy.com/Home

# -------------------------------------------------------
# About Me
# -------------------------------------------------------
# Started programming on the Apple IIe in middle school

# Tinkered throughout the years in C, C++, QBasic, VB, VB.NET, HTML/CSS/Javascript, Ruby, C#, ObjectiveC, PHP, Python and now Powershell
# Favorites are C#, Python and Powershell

# Joined Truesec in 2019 as Secure Infrastructure Consultant/DevOps, I am now a member
# of the CyberSecurity Incident Response Team in Recovery and Internal Software Development.

# Big fan of Microsoft LAPS/Windows LAPS, to the point that I wrote a tool called LAPSWebUI with Jordans assistance
# and market that here at Truesec

# Hobbies are coding (Python/C#), gaming (FFXIV/Factorio), gardening


# -------------------------------------------------------
# Schedule
# -------------------------------------------------------
# Monday     - Class Intro, Intro to Posh, Getting Started
# Tuesday    - Exercises, Conditionals and Loops, Exercises
# Wednesday  - Exercises, Sorting/Filtering, Error Handling/Streams, Exercises
# Thursday   - Exercises, Functions, Remoting, Aliases, Snippets (VSCode)
# Friday     - Final Exam :), Help/Fallout, Pipeline Polution, Parameter Splatting, WhatIf











# Work on whatever excersises you'd like until 1400
# Then:
#    Functions
#    Remoting
#    Aliases

# Ignore any reference to Write-TSXOutput, use Write-Host instead...the function provided by Jordan
# does not work anymore

Write-Host "Message" -ForegroundColor Blue  #<-- Write Host with Color example to replace Write-TsxOutput




















$colors = "Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"

$colors | % {
    Write-Host "Current Rainbow Color is: $($_)" -ForegroundColor (0..15 | Get-Random)
}

