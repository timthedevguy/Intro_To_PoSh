$users = Get-Content ".\data.json" | ConvertFrom-Json

# Step 1, run lines 1-104 to populate $users with User data (Local User Accounts from a PC)
# and Administrators Group data.  
# Using user data, generate a collection of custom user objects with the following properties
# Name
# Enabled (Yes|No)
# PasswordRequired (Yes|No)
# UserCanChangePassword (Yes|No)

# One a collection of custom objects have been created, display them by piping to Format-Table

# Results will look like
#
#Name               PasswordRequired IsBuiltInAdmin IsAdmin UserMayChangePassword Enabled
#----               ---------------- -------------- ------- --------------------- -------
#Administrator      Yes              Yes            Yes     Yes                   Yes
#DefaultAccount     No               No             No      Yes                   No
#Guest              No               No             No      No                    No
#shared             Yes              No             No      No                    No
#WDAGUtilityAccount Yes              No             No      Yes                   No

# In this exercise you will use Loops, Conditionals, could potentially use a Function,
# HashTable, as well as creaing an object from a Hashtable, and Lists