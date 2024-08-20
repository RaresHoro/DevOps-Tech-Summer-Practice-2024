# Day 2

## PS Command

- **PID** - Process ID.
- **TTY** - Terminal associated with the process. (Detailed reading about TTY available.)
- **TIME** - Total time of CPU usage.
- **CMD** - The command that is running.

### Arguments with or without Dash

- **STAT** - State of the process, very important to understand.

Most people use `grep` with `ps`.  
`ps` has advanced filtering.

- `-f`: This option stands for "full format."  
- `-u` in `ps` means user.

### Process States

- **D** - Uninterruptible sleep (usually IO).
- **I** - Idle kernel thread.
- **R** - Running or runnable (on run queue).
- **S** - Interruptible sleep (waiting for an event to complete).
- **T** - Stopped by job control signal.
- **t** - Stopped by debugger during tracing.
- **X** - Dead (should never be seen).
- **Z** - Defunct ("zombie") process, terminated but not reaped by its parent.

Some statuses may have a second letter. Important ones include:

- **<** - High-priority (not nice to other users).
- **N** - Low-priority (nice to other users).
- **s** - Session leader.
- **l** - Multi-threaded.
- **+** - In the foreground process group.

### Common `ps` Command

- `ps aux` is commonly used. It shows important info like PID, status, and resource usage.

## Lesson 10: Create Aliases

- `ll` is an alias for `ls -al`.
- Use `alias command` to create one.

### Permanent Aliases

- `source` reads and executes scripts (or content of files) in the current shell.
- With redirections, we can add something to a file (if the file exists) or create a new file.

```bash
echo "alias lh1='ls -alh'" >> .bash_aliases
```

### User Management

- `sudo -i` starts a new session as root.
- **UID** - Unique User Identifier.
  - UID 0 is reserved for root.
  - 1-99 are reserved for predefined accounts (like games, mail, www-data, sys, bin, etc.).
  - 100-999 reserved for system and administrative accounts.
  - 1000+ are reserved for users.

The structure of the `/etc/passwd` file:

```
username:password:UID:GID:description:homedir:shell
```

In the shadow file, passwords for users are hashed; if there is no password set, it shows as `*`.

### Group Management

- The file `/etc/group` contains information about groups.
- `id` finds information about the current user.

### Combining Commands

```bash
command $(another_command)
```

- `adduser` is more verbose and interactive, asking for user password and other information.

### User Creation Options

- `-d` - Create home directory in specified location.
- `-m` - Create the home directory.
- `-p` - Password.
- `-s` - Provide shell.
- `-c` - Comments or description of the account.

### User Management Commands

- `useradd -h .` - Find what can be done as an admin.
- `passwd` - Change passwords.
- `usermod` - Modify the user.

### Group Management with `usermod`

- `-g` - Set the primary group for the user.
- `-G` - Add the user to one or more supplementary groups.
- `usermod -G a` means append; good practice.

To move a home directory:

```bash
usermod testuser3 -d /home/newdir -m
```

To remove secondary groups:

```bash
usermod testuser3 -G ""
```

To add another secondary group:

```bash
usermod -aG
```

### Command History

- `history | grep cat` narrows history command.
- `-i` allows traversing the file case-insensitively.
- `shopt -s histappend` appends history.
- `ls -al .bash_history` shows history file.
- `cat .bash_history` displays the history.
- `echo $HISTSIZE` prints the variable.
- `set` lists all shell variables and functions defined in the shell session.

### Redirection

- `>` (Overwrite Redirection)
- `>>` (Append Redirection)

## Lab 13: `su` and `sudo`

- `su -` substitutes user.

### Configuration of `/etc/sudoers` File

Each config line looks like this:

```
user pos1=(pos2:pos3) pos4
or
%group pos1=(pos2:pos3) pos4
```

Remove lines with `student` from the `/etc/sudoers` file.

Example line in the sudoers file:

```
student2 ALL=(ALL:ALL) NOPASSWD:ALL
```

### Breakdown

- `student2`: User granted permissions.
- `ALL`: Can run commands from any host.
- `(ALL:ALL)`: Can execute commands as any user and group.
- `NOPASSWD`: No password required for sudo commands.
- `ALL`: Can run any command.

## Lab 14: Logs

### Log Files Overview

- `syslog`: General system/application log.
- `auth.log`: Authorization and login attempts.
- `dmesg`: Kernel messages and boot/runtime info.
- `kern.log`: Kernel messages.
- `boot.log`: System startup sequence.
- `lastlog`: Last login records.
- `faillog`: Failed login attempts.
- `wtmp.log`: Login information for utilities.
- `dpkg.log`: Package management activities.

### Logger Command

```bash
logger "This is a test message"
```

### Working with Binary Files from Systemd

- `journalctl`: View logs.
- `journalctl --since "$(date '+%Y-%m-%d %H:%M:%S' --date='5 minutes ago')"`: Log entries from a specific time.

## Lesson 15: Streams

- Three streams: stdin, stdout, stderr.
- `cat notexists.txt 2> errorfile`: Write errors into a log.
- `2` is used to redirect to stderr.

### Capturing STDOUT and STDERR

```bash
cat notexists.txt > capture.txt 2>&1
```

- `2>&1` means both streams go to the same destination.

### Creating Special Files

```bash
mknod -m 0666 /dev/null c 1 3
```

- `mknod` creates a special file.
- `-m 0666` sets file permissions.
- `/dev/null` is the name.
- `c` is the device type.
- `1 3` are the MAJOR and MINOR numbers to specify the device.

## Lesson 16: CronTab

- **Cron** is a service responsible for control and execution of scheduled tasks.
- **Crontab** is a list of tasks or commands scheduled to be executed at specific dates and times.

### Setting Crontab

```bash
crontab -e
```

Example entry:

```
12 9 23 * * /usr/bin/ls -al > logfile 2>&1
```

## Lesson 17: Know Your Files

- `/dev/vda`: Entire virtual disk.
- `/dev/vda1`: First partition on that disk.

### Using `stat`

- `stat` allows us to get different types of information about a file.
- **What `stat` Gives**:
  - **File** - Name of the file.
  - **Size** - Size of the file in bytes.
  - **Blocks** - Size of the file in blocks.
  - **IO Block** - Size of each block.

```bash
stat -f mybashscript.sh
```

- `-f` gives information about the filesystem.
