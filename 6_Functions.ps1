# -------------------------------------------------------
# Writing and Using Functions
# -------------------------------------------------------

Convert-BoolToHuman

# Simple Function
Function Convert-BoolToHuman {
    "No"
}

# How to see what Function code is loaded in the PS Session
${function:Convert-BoolToHuman}

Convert-BoolToHuman

# --------------------------------------------------------------------------------------------------------------
# 6.1 Simple Function with Arguments
# --------------------------------------------------------------------------------------------------------------
Function Convert-BoolToHuman($value, $second, $third) {
    $value
    $second
    $third
}



Convert-BoolToHuman "tim" "lkjsdf"
#              ----- 
#            $value  

# --------------------------------------------------------------------------------------------------------------
# 6.2 Function with Basic Parameters
# --------------------------------------------------------------------------------------------------------------
Function Convert-BoolToHuman {
    param(
        [bool]$Current
    )
    
    if($Current) {
        
        return "Yes"
    } 
    return "No"
}

Convert-BoolToHuman -Current "lkjalskjsafd"

# --------------------------------------------------------------------------------------------------------------
# 6.3 Function with Advanced Parameters
# --------------------------------------------------------------------------------------------------------------
Function Convert-BoolToHuman {
    param(
        [Parameter(Mandatory = $true)]
        [bool] $Current = $false,
        [Parameter(ParameterSetName = 'Default', Mandatory = $false)]
        [string]$name = "Tim"
    )
    Write-Host $name
    if($Current -eq $true) {
        
        return "Yes"
    }

    "No"
}

Convert-BoolToHuman
Convert-BoolToHuman -Current ";lkjsadf;" -name "Bob"

# --------------------------------------------------------------------------------------------------------------
# 6.3 Function with Advanced Parameter + Common Parameters (Cmdlet)
# --------------------------------------------------------------------------------------------------------------
Function Convert-BoolToHuman {
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
Convert-BoolToHuman
Convert-BoolToHuman -Current $true
Convert-BoolToHuman -Current $true -Verbose:$VerbosePreference

# --------------------------------------------------------------------------------------------------------------
# 6.4 Function Dot Sourcing
# --------------------------------------------------------------------------------------------------------------
# Write one file with useful functions, load like so
. .\MyFunctions.ps1

# Allows use of all functions in the file without loading individually