import strutils

proc ask*(prompt: string): void =
  stdout.writeLine prompt & " (Y/n)"
  var input = readline(stdin).toLowerAscii()
  if not(input == "" or input == "y"):
    echo "Operation Canceled, Exiting..."
    quit 1
