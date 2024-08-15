# Chapter 6

1..12 | ForEach-Object{
    $month=(Get-Date -Day 1 -Month $_ -Year 2024)
    1..$month.AddMonths(1).AddDays(-1).Day | Where-Object {(Get-Date -Month $month.Month -Year 2024 -Day $_).DayOfWeek -eq "Tuesday"} | Select-Object -Skip 1 -First 1 | ForEach-Object {
        Write-Host "The $($_) is the Second Tuesday in the month of $($month.ToString("MMMM"))"
    }
}

Function Get-SecondTuesday {
    param(
        [int]$Month
    )
    $date = Get-Date -Month $Month -Year (Get-Date).Year -Day 1
    return (1..$date.AddMonths(1).AddDays(-1).Day | Where-Object {(Get-Date -Month $date.Month -Year 2024 -Day $_).DayOfWeek -eq "Tuesday"})[1]
}

(1..31 | Where-Object {(Get-Date -Month 8 -Year 2024 -Day $_).DayOfWeek -eq "Tuesday"})[1]
