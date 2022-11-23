import os, strutils
import ../shared

proc commit*(yes: bool, message, branch, remote: string): void =
  if not(yes):
    discard execShellCmd("git add -n . -v | sed 's/add//g' | sed \"s/'//g\"")
    ask("Do you want to add the files listed above")
  discard execShellCmd("git add . -v")
  echo "Files added successfully"
  if message == "nil":
    echo "Since no commit message was provided I can not proceed"
    quit 0
  if not(yes):
    ask("Would you like to commit the added files with the message \"" &
        message & "\"")
  discard execShellCmd("git commit -m \"" & message & "\"")
  if not(yes):
    ask("Would you like to push your changes to the remote repo")
  var b = branch.replace("nil", "")
  var r = remote.replace("nil", "")
  discard execShellCmd("git push " & b & " " & r)

