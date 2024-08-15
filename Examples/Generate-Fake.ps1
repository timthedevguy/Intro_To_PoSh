$results = New-Object -TypeName System.Collections.Generic.List[PSObject]
$firstNames = Get-Content -Path .\first-names.txt
$lastNames = Get-Content -Path .\names.txt

0..300 | ForEach-Object {
    $hash = [ordered] @{
        FirstName = $($firstNames | Get-Random)
        SurName =  $($lastNames | Get-Random)
    }
    $results.Add((New-Object -TypeName PSObject -Property $hash))
}

$firstNames = $null
$lastNames = $null

$results | ForEach-Object {
    $user = $_
    $user | Add-member -MemberType NoteProperty -Name "Username" -Value "$($user.FirstName).$($user.SurName)"
    $user | Add-Member -MemberType NoteProperty -Name "Enabled" -Value (($true,$false) | Get-Random)
    $user | Add-Member -MemberType NoteProperty -Name "ProfilePath" -Value "C:\Users\$($user.Username)"
    $user | Add-Member -MemberType NoteProperty -Name "MemberOf" -Value ((1..(1..10 | Get-Random) | ForEach-Object {Get-Content -Path .\groups.txt | Get-Random}) | Select-Object -Unique)
    $user | Add-member -MemberType NoteProperty -Name "Domain" -Value (Get-Content -Path .\domains.txt | Get-Random)

    if(($true,$false) | Get-Random) {
        $user | Add-Member -MemberType NoteProperty -Name "Phone" -Value "($(-join (1..3 | ForEach-Object{0..9 | Get-Random}))) $(-join (1..3 | ForEach-Object{0..9 | Get-Random}))-$(-join (1..4 | ForEach-Object{0..9 | Get-Random}))"
    } else {
        $user | Add-Member -MemberType NoteProperty -Name "Phone" -Value ""
    }

    $user | Add-Member -MemberType NoteProperty -Name "ProfileSize" -Value ((1..(0..100 | Get-Random) | ForEach-Object {(0..500 | Get-Random) * 1kb}) | Measure-Object -Sum).Sum
}

$results | ConvertTo-Json -Depth 100 | Set-Content -Path .\users.json