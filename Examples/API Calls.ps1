$headers = @{
    Accept = "application/json"
}

# Invoke-RestMethod converts the JSON response to a PSObject for you
$data = Invoke-RestMethod -Uri "https://icanhazdadjoke.com/" -Headers $headers
# Invoke-WebRequest makes you process the raw .Content to whatever form
# you may need in your script, but allows you to access all other details such
# as Headers and Response Codes
$data = Invoke-WebRequest -Uri "https://icanhazdadjoke.com/" -Headers $headers