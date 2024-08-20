# Notes Labs Linux 1-8

- `ls -l .`  
  - One dash informs the system that we will pass one letter argument, like 'l'.
  - Two dashes mean that the argument will contain more than one letter. Most commonly it will be an English word.

- `ls -a` shows hidden files.  
- `ls -A` shows almost all files.

- `atime` - the last time when the file was accessed.  
- `mtime` - last modification time.  
- `ctime` - last metadata modification time (permissions change, location of the file, etc.).

- `-t` sorts from new to old by modification time.  
- `ls -lt` shows metadata changes.

- `-lu` also changes metadata?

- `-lS` sorts by size.  
- `-h` makes it easily readable.  
- `..` refers to the parent directory.

- `-u` shows the exact modification time.  
- `-f` in `ls` shows which sections are available.

- `whatis` tells us what the command does.

- `mkdir` - make directory.  
  - Use `-p` to create parent directory and the second part.

- `cd ../../../var/log/nginx`  
- `cd /var/log/nginx`  
  - We use the absolute path.
- `cd ~` or `cd` is used to go to the root directory.  
- `rm -rf` forcefully removes a directory; it's a risky method as it assumes the user knows what they are doing.  
- `rmdir parentdir/*`  
- `rmdir parentdir` is also used to remove a directory.

- `touch` creates a new file.  
- `*` is a wildcard character (e.g., `my*file`).  
- `?` represents just one wildcard character.

- `vim` is also a way to create files.

- `grep` searches for an occurrence.  
- `wc` counts.  
- `uniq` works best with `sort`.  
- `command1 | command2` means the output of command1 is the input for command2.

- `vim :q` - quit.  
- `:q` - quit and do not save.  
- `:wq` - quit and save.

- `tree` shows the current directory recursively.

So, the last parameter describes where to copy all files listed in parameters (but last, of course).

- `cp two01 two02 ../targetdir`  
- `mv` - move files.  
- `diff` checks differences between files.

## Top Command

- Shows vast info.  
- `who` shows who is logged in.  
- Load average: `0.52, 0.58, 0.59`.  
- Also modifies the default view.

- This specifically refers to the first CPU core in a multi-core processor setup: `cpu0`.  
- This represents the overall CPU usage across all available CPU cores. It summarizes the total performance metrics for the system's CPUs: `cpu s`.

- Order by memory usage: press `M`.  
- Now, by pressing `N`, we will look at the list sorted by PID.  
- Press `T` to order by running time.  
- Finally, we can come back to CPU usage sort by pressing `P`.
