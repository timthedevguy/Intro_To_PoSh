# --------------------------------------------------------------------------------------------------------------
# Parameter Splat
# --------------------------------------------------------------------------------------------------------------
# Parameter Splat allows you to define the parameters in a hashtable and then 'splat' those to a cmdlet all
# at once

# Word normally a cmdlet like so
.\Show-ParamSplat.ps1 -Name "Tim" -Age "44" -Force

# Using param splat we can do this

$params = @{
    Name="Tim"
    Age=44
    Force=$true
}


.\Show-ParamSplat.ps1 @params


# Why would you use this?
# I've used it for when I need to call a cmdlet but may not always call it with the same
# parameters, for example when if some condition is true I may run cmdletA with an additional
# parameter, and instead of doing if statements for all possible combinations i would create
# a hashtable of parameters.

# See Get-TSxADUser.ps1