break
# --------------------------------------------------------------------------------------------------------------
# 4.1 Data Streams
# --------------------------------------------------------------------------------------------------------------

# Output/Success Stream
# ---------------------------------------
# Write-Host vs Write-Output
# Write-Host is writes data back to the host which then decides what to do with it, Write-Output is the real
# success stream
$testHost = Write-Host "Testing Write-Host"
$testOut = Write-Output "Testing Write-Output"

# Error Stream
# ---------------------------------------
# All errors are automaticly written to this stream for proper logging, you can write your 
# own errors to the stream
Write-Error "Something went very wrong"
Write-Error "Something went very wrong, forcing app to stop" -ErrorAction Stop
Write-Host "This is after the error that stops..."
Write-Error "Something went very wrong, attempting to continue" -ErrorAction Continue
Write-Host "This is after the error that continues..."

# Warning Stream
# ---------------------------------------
# Similar to Error stream but lets you alert the user that something just wasn't expected
Write-Warning "Oh, snap, it worked but I'm not sure why..."

# Verbose Stream
# ---------------------------------------
# Verbose stream is probably the most used steam but by default it is hidden from the user
# You can force it by setting VerbosePreference
$VerbosePreference = "Continue"
Write-Verbose "Test Verbose, visible"
$VerbosePreference = "SilentlyContinue"
Write-Verbose "Test Verbose, invisible"
Write-Verbose "Test Verbose, Forced" -Verbose

# Debug Stream
# ---------------------------------------
# Surprisingly this stream isn't used as much as Verbose, this stream will ask if you
# want to stop, continue, halt, etc.
Write-Host "First line"
Write-Debug "The value of `$name is now 'Tim'" -Debug
Write-Host "Next Line"

# --------------------------------------------------------------------------------------------------------------
# Error Handling
# --------------------------------------------------------------------------------------------------------------
# Errors aren't always what they seem!  You have two different
# type of exceptions in PowerShell, Terminating Errors and
# Non-Terminating Errors.  Terminating errors will halt the
# function or script.  Non-Terminating errors will allow the 
# script to continue.

# Terminating errors are generally syntax errors etc

# Non-Terminating errors
$folders = Get-ChildItem -Path "C:\Tim Davis"
Write-Host "I've ran"

# Run lines 14-15 and notice that you get an error (angry red text) but you also
# still see the 'I've ran' printed to screen.

# Anatomy of Try/Catch
 try { Write-Host "Code to try!" } catch { Write-Host "Code failed, run this instead" }
#---   -------------------------   -----   ------------------------------------------
# 1               2                  3                         4

# 1 - try keyword starts the try/catch
# 2 - This is the code that we want to try and run, you may or may not expect it to fail
#     but if it could potentially fail then lets wrap it in try/catch
# 3 - catch keyword to start the catch section
# 4 - If the code in the try block fails due to an error than the code in the catch block
#     will execute.  This code can be anything.  You can attempt to correct the error and
#     continue or you can branch to another path or you can abort the script

# Lets wrap the code in a Try/Catch

try{
    Get-ChildItem -Path "C:\Tim Davis"
    Write-Host "I've ran"
} catch {
    Write-Host "I've been caught"
}
Write-Host "Still running"
# But wait.......you still saw angry red text, AND you still saw 'I've ran' but you did 
# NOT see 'I've been caught'.  

# This is because the error thrown by Get-ChildItem is a Non-Terminating error, this means
# PowerShell will display to the screen and then attempt to continue as if nothing happened.
# Sometimes this behavior is ok, other times it leads to lots of issues later in the script.

# To force the non-terminating error to be a terminating error (terminating errors are caught
# by try/catch) we can use -ErrorAction to override the default.

# The default ErrorAction for a script is 'Continue', this means display the error and move
# on.  We can override the behavior on a cmdlet level by using -ErrorAction Stop, 'Stop'
# tells PowerShell to treat this as a terminating error and halt the script, which means
# we can then catch that error and do something with it.

Write-Host "Gathering files from C:\Tim Davis"
try{
    Get-ChildItem -Path "C:\Tim Davis" -ErrorAction Stop # <-- Force Terminating Error
    #                               >> ----------------- <<
    Write-Host "I've ran"
} catch {
    Write-Host "C:\Tim Davis doesn't exists please try again"
}

# Now if you run the above code you will NOT see any angry red text and you also only
# see 'I've been caught'.  This means we have succesfully caught the error and we can
# now attempt to correct it so the script can move on gracefully.


# The default for scripts is to Continue, this can be viewed by checking the
# $ErrorActionPreference built in variable

$ErrorActionPreference

# You can set this variable to Stop at the beginning of your script to treat all
# errors as Terminating.

$ErrorActionPreference = 'Continue'

try{
    Get-ChildItem -Path "C:\Tim Davis" 
    Write-Host "I've ran"
} catch {
    Write-Host "I've been caught"
}

# Notice if you run lines 78-85 you don't see angry red text and you only see 
# 'I've been caught'.  Line 81 does NOT have the -ErrorAction Stop override.
# You can set the ErrorActionPrefernce back to default using

$ErrorActionPreference = 'Continue'

# Try/Catch/Finally

try {
    # Try doing something
} catch {
    # Do this if it fails
} finally {
    # Always do this
}

# Example

try{
    $test = Get-ChildItem -Path "C:\Windows" -ErrorAction Stop 
    Write-Host "I've ran"
} catch {
    Write-Host "I've been caught"
} finally {
    Write-Host "Now I'm finished"
}