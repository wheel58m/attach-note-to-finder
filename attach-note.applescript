set thisNote to chooseNote()

on chooseNote()
	tell application "Notes"
		# Select an Account If More Than 1
		if (count of accounts) is greater than 1 then
			set accountNames to name of accounts
			set accountName to (choose from list accountNames) as string
		else
			set accountName to name of account 1
		end if
	end tell
end chooseNote