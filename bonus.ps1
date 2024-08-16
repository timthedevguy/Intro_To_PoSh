# Bonus Work
$users = Get-Content -Path .\Examples\users.json | ConvertFrom-Json

# Using the data in $users

# 1. Generate Call list of Full Name (firstname + surname), Phone Number IF they have one, save to call_list.csv

# 2. Find all users that belong to the "Administrators" group, save Fullname and Username to file called admins.csv

# 3. List all users that need phone numbers, Save just the first name/surname, save to need_phone.csv

# 4. Find all unique domains and save domain name to domain_list.txt

# 5. For each domain found, find all users that belong in that domain, generated alphabetical list of usernames and save .csv
#    where filename is the domain name

# 6. Add a new NoteProperty called 'IsAdmin' and assign True or False if they are in 'Administrators' group,
#    HINT: can use output from #2, save the new $users to JSON '$users | ConvertTo-Json -Depth 100 | Set-Content -Path .\users1.json'

# 7. Group users by domain, investigate the Group-Object cmdlet, would this have helped you with #5?

# 8. Get top 10 largest Profile directory sizes and select username, profile path and size in GB and save
#    to top_10.csv

# 9. Get top 5 largest Profile directory sizes by Domain, display username, profile path and size in GB and
#    save to <domain_name>_top_5.csv