Function Get-LAPSPassword() {
    [cmdletbinding()]
    param(
        [String]$ComputerName,
        [pscredential]$Credential
    )
    begin {

    }
    process {
        # Password Attribute: ms-Mcs-AdmPwd
        # LAPS Exipre Attribute: ms-Mcs-AdmPwdExpirationTime

        $computer = Get-ADComputer -Identity $ComputerName -Server DC01.binarymethod.com -Credential $Credential -Properties ms-Mcs-AdmPwd, ms-Mcs-AdmPwdExpirationTime
    
        [ordered]@{
            Computer  = $computer.Name
            Password  = $computer."ms-Mcs-AdmPwd"
            ExpiresOn = [DateTime]::FromFileTimeUtc($computer."ms-Mcs-AdmPwdExpirationTime")
        }
    }
}
