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

		# Select a Folder If Any
		tell account accountName
			if (count of folders) is not 0 then
				set folderNames to name of folders
				set folderName to (choose from list folderNames) as string

				# Handle Subfolders
				set thisFolder to ""
				repeat while thisFolder = ""
					tell folder folderName
						if (count of folders) is not 0 then
							set folderNames to name of folders
							set folderName to (choose from list folderNames) as string
						else
							set thisFolder to folderName
						end if
					end tell
				end repeat
			else

			end if
		end tell
	end tell
end chooseNote