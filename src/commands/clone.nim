import os, strutils
import ../shared

proc clone*(yes: bool, ssh: bool, rawUrl: string): void =
  var url = rawUrl
  var repo: string
  if ssh:
    if "https://github.com/" in url:
      url = url.replace("https://github.com/", "git@github.com:")
    else:
      url = "git@github.com:" & url
  else:
    if not("https://github.com/" in url or "git@github.com:" in url):
      repo = url
      url = "https://github.com/" & url
  if repo == "":
    repo = url.replace("https://github.com/").replace(
        "git@github.com:").toLowerAscii()

  if not yes:
    ask "Do you want to clone " & repo & "into " & getCurrentDir()

  discard execShellCmd("git clone " & url)
