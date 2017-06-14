This is a simple hello world program for testing git on z/OS. It's meant to be used in conjunction with [Using git for z/OS with GitHub](https://forum.rocketsoftware.com/t/using-git-for-z-os-with-github/654) on the [Rocket Community Forum](https://forum.rocketsoftware.com/categories). 

Here's a suggested scenario demonstrating how git can work with MVS datasets:

* Clone this repository. If you want to push changes, fork it instead and then clone the fork.
* cd into the repo and type `make`. This will compile and link the code and test the resulting executable.
* Run `./allocate.sh`. This will create three PDSes (named `DEMO.{H,C,TXT}`) on MVS that will contain members corresponding to the source files in the Unix file system.
* Run `./to_pds.sh` to populate the PDSes. This would be run any time the git repo is refreshed (via `git pull`).
* Log into TSO, edit one of the source files, and save it.
* Back at the Unix command line, run `./from_pds.sh` to copy the files back from MVS to Unix. This will also run a `git status` command, showing the changes.
* When all done, run `./cleanup.sh` to delete the MVS datasets.
