break
# --------------------------------------------------------------------------------------------------------------
# 5 Remote Management
# --------------------------------------------------------------------------------------------------------------
# One of the best things about PowerShell is the ability to reach out
# to other computers and run commands on them.

# This requires PS Remoting to be enabled which enables and configures WinRM.

# Alot of security requirements to be considered when enabling WinRM, but can be enabled securely, this is outside
# the scope of this book.

# More difficult in Workgroup environment but is possible

# --------------------------------------------------------------------------------------------------------------
# 5.1 Remote Management via PSSession
# --------------------------------------------------------------------------------------------------------------

# Create a Session
New-PSSession -ComputerName VMHOST02

# Now what?
Get-PSSession

# Interactive session
Enter-PSSession -ComputerName VMHOST02
Enter-PSSession -Id 1 # <- ID is provided by the Get-PSSession command

# Can even assign sessions to variables
$session = New-PSSession -ComputerName VMHOST02

# WHY?
# Now you can use that session in varous commands such as Invoke-Command
Invoke-Command -Session $session -ScriptBlock {Write-Output $ENV:COMPUTERNAME}
# Copy a file from local machine to remote machine session
Copy-Item -Path C:\test.txt -Destination C:\test.txt -ToSession $session

# The session will live until destroyed, note that the connection can become inturrupted
# and disconnect or be orphaned.
Get-PSSession | Remove-PSSession

# --------------------------------------------------------------------------------------------------------------
# 5.2 Invoke-Command
# --------------------------------------------------------------------------------------------------------------
# Invoke command will run a script block on the remote machine, probably the most used remote
# command

# Simple command
Invoke-Command -ComputerName VMHOST02 -ScriptBlock {Write-Output $ENV:COMPUTERNAME}
Invoke-Command -Session $session -ScriptBlock {Write-Output $ENV:COMPUTERNAME}

# More complex, also demonstrates that a script block can be assigned to a variable as well!
$block = {
    $name = Read-Host -Prompt "What is your name?"
    Write-Output "Provided name is $($name)"
    Write-Output "Currently on [$($ENV:COMPUTERNAME)]"
}

Invoke-Command VMHOST02 -ScriptBlock $block

# Run command as a Job, this is handy for long running tasks that return data
Invoke-Command VMHOST02 -ScriptBlock $block -AsJob

# uhoh....what happened?
Get-Job

# Notice the blocked, the job is awaiting input but since it's a job there is no input that
# can be captured from a user, so now this job is blocked
Get-Job | Stop-Job
Get-Job | Remove-Job

# Lets try one that doesn't have input required
Invoke-Command -ComputerName VMHOST02 -ScriptBlock {Write-Output $ENV:COMPUTERNAME} -AsJob

# Check status
Get-Job

# Get results of finished job
$results = Get-Job | Receive-Job