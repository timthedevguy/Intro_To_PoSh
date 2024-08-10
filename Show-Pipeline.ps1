<#
.SYNOPSIS
    Sample cmdlet to show contents of the pipeline

.DESCRIPTION
    DESCRIPTION

.LINK
    LINK

.NOTES
    FileName: Show-Pipeline.ps1
    Author: Tim Davis
    Contact: @timthedevguy
    Created: 2024-08-09

    Version - 0.0.1 - 2024-08-09

    License Info:
    MIT License
    Copyright (c) 2024 TRUESEC

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.


.EXAMPLE

#>

[cmdletbinding()]
param(
    [Parameter(ParameterSetName = 'Default', Mandatory = $true, ValueFromPipeline=$true)]
    [psobject]$Object
)
begin{
    Write-Verbose -Message "Beginning Show-Pipeline.ps1"
}
process{
    Write-Verbose -Message "Processing Show-Pipeline.ps1"
    Write-Host "Pipeline contains $($Object)";
}
end{
    Write-Verbose -Message "Ending Show-Pipeline.ps1"
}