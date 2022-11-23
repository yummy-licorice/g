import os
import ../shared

proc commit*(yes: bool, message: string): void =
  if not(yes):
    discard execShellCmd("git ls-files --others --exclude-standard")
    ask("Do you want to add the files listed above")
  discard execShellCmd("git add . -v")
  echo "Files added successfully"
  if message == "nil":
    echo "Since no commit message was provided I can not proceed"
    quit 0
  if not(yes):
    ask("Would you like to commit the added files with the message \"" &
        message & "\"")
  discard execShellCmd("git commit -m " & message)
  if not(yes):
    ask("Would you like to push your changes to the remote repo")
  discard execShellCmd("git push")

