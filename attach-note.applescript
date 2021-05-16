set thisNote to chooseNote()

on chooseNote()
	tell application "Notes"
		# Select an Account If More Than 1
		if (count of accounts) is greater than 1 then
			set accountNames to name of accounts
			set accountName to (choose from list accountNames with prompt "Choose an Account:") as string
		else
			set accountName to name of account 1
		end if

		# Select a Folder If Any
		tell account accountName
			if (count of folders) is not 0 then
				set folderNames to name of folders
				set folderName to (choose from list folderNames with prompt "Choose a Folder:") as string

				# Handle Subfolders
				set thisFolder to ""
				repeat while thisFolder = ""
					tell folder folderName
						if (count of folders) is not 0 then
							set folderNames to name of folders
							set folderName to (choose from list folderNames with prompt "Choose a Folder:") as string
						else
							set thisFolder to folderName
						end if
					end tell
				end repeat

				# Select Note From Folder
				tell folder thisFolder
					set noteNames to name of notes
					set noteName to (choose from list noteNames with prompt "Choose a Note:") as string
				end tell
			else
				# Select Note From Account
				set noteNames to name of notes
				set noteName to (choose from list noteNames with prompt "Choose a Note:") as string
			end if
		end tell
	end tell
end chooseNote