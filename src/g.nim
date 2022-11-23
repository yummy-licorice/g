import docopt, pkginfo, semver
import commands/[clone, commit]

let doc = """
G - Infinitybeond1's simple command line git wrapper

Usage:
  g clone [-s | --ssh] [-y | --yes] <url>
  g commit [-y | --yes] [<message>]
  g (-h | --help)
  g (-v | --version)

Options:
  -h --help     Show this screen.
  -v --version     Show version.
"""

const version = pkg().getVersion

let args = docopt(doc, version = "g v" & $version)

if args["clone"]:
  clone(args["--yes"] or args["-y"], args["--ssh"] or args["-s"], $args["<url>"]) 
elif args["commit"]:
  commit(args["--yes"] or args["-y"], $args["<message>"])