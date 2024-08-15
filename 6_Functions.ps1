# -------------------------------------------------------
# Writing and Using Functions
# -------------------------------------------------------

BoolToReadable

# Simple Function
Function BoolToReadable {
    "Yes"
}

BoolToReadable

# --------------------------------------------------------------------------------------------------------------
# 6.1 Simple Function with Arguments
# --------------------------------------------------------------------------------------------------------------
Function BoolToReadable($value, $second) {
    $value
    $second
}



BoolToReadable "tim" "lkjsdf"
#              ----- 
#            $value  

# --------------------------------------------------------------------------------------------------------------
# 6.2 Function with Basic Parameters
# --------------------------------------------------------------------------------------------------------------
Function BoolToReadable {
    param(
        [bool] $Current
    )
    
    if($Current) {
        
        return "Yes"
    } 
    return "No"
}

BoolToReadable -Current $false

# --------------------------------------------------------------------------------------------------------------
# 6.3 Function with Advanced Parameters
# --------------------------------------------------------------------------------------------------------------
Function BoolToReadable {
    param(
        [Parameter(Mandatory = $true)]
        [bool] $Current = $false,
        [Parameter(ParameterSetName = 'Default', Mandatory = $false)]
        [string]$name = "Tim"
    )
    Write-Host $name
    if($Current) {
        
        return "Yes"
    }

    "No"
}

BoolToReadable
BoolToReadable -Current $true -name "Bob"

# --------------------------------------------------------------------------------------------------------------
# 6.3 Function with Advanced Parameter + Common Parameters (Cmdlet)
# --------------------------------------------------------------------------------------------------------------
Function BoolToReadable {
    [CmdletBinding()]

    param(
        [Parameter()]
        [bool] $Current
    )
    Write-Verbose "Current Value is: $($Current.ToString())"   

    if($Current) {
        
        return "Yes"
    }

    "No"
}
$VerbosePreference = "SilentlyContinue"
BoolToReadable
BoolToReadable -Current $false
BoolToReadable -Current $true -Verbose:$VerbosePreference

# --------------------------------------------------------------------------------------------------------------
# 6.4 Function Dot Sourcing
# --------------------------------------------------------------------------------------------------------------
# Write one file with useful functions, load like so
. .\MyFunctions.ps1

# Allows use of all functions in the file without loading individually