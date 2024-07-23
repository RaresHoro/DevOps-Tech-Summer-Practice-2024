Day 2

PS

PID - quite obvious, this is the process id.
TTY - Terminal associated with the process. Here is a very detailed reading about TTY.
TIME - total time of CPU usage
CMD - the command which is running.

arguments with or without dash

STAT. It means state of the process and it is very importnt to understand.

Most people use grep with ps.
Ps has advanced filtering.

-f: This option stands for "full format."
-u in ps means user


D - uninterruptible sleep (usually IO)
I - Idle kernel thread
R - running or runnable (on run queue)
S - interruptible sleep (waiting for an event to complete)
T - stopped by job control signal
t - stopped by debugger during the tracing
X - dead (should never be seen)
Z - defunct ("zombie") process, terminated but not reaped by its parent
Some statuses may have the second letter. Let's list the most important

< - high-priority (not nice to other users)
N - low-priority (nice to other users)
s - is a session leader
l - is multi-threaded
+ - is in the foreground process group

ps aux

I think it is the mostly used combination. It shows the most important info, like PID, status and resources usage.

Lesson 10 Create Aliases

ll alias for ls -al
alias command to create one.

Permanent aliases.

source is very useful in many cases. It reads and executes scripts (or should we say - content of the files, as it doesn't need to be script) in current shell
with redirections we are able to add something to file (if file exists), or add new file. Let's use it.

echo "alias lh1='ls -alh'" >> .bash_aliases

sudo -i Start new Session

as we are in the root directory we can create aliases for all users

UID is an unique User Identifier
UID 0 is reserved for root.
1-99 are reserved for predefined accounts (like games, mail, www-data, sys, bin and more)
100-999 reserved for system and administrative accounts.
1000+ are reserved for users.

The structure of this file is as follows:

username:password:UID:GID:description:homedir:shell.

In the shadow file the password for the users are hashed, * nthere is no passwrod set.
group
The file /etc/group contains information about groups.
id find information about curret user

command $(another_command)
Combining commands

First difference is that adduser is more verbose. We see what is happening.

Second, very significant difference is that adduser is interactive. It asks for password for user and other information. Provide some test data during the execution of the binary. Let's have something to compare.

become an admin:
Let's go through most important arguments, which we should consider to use during create of new user.

-d - create home directory in specified location, if we want to change

-m - create the home directory

-p - password

-s - provide shell

-c - comments, or description of the account

useradd -h .
find what can we do as an admin
user add
passwd change the passwords
usermod :modify rhe user


-g: This option is used to set the primary group for the user. When you use -g, you are changing the primary group of the specified user.

-G: This option is used to add the user to one or more supplementary groups. The user will retain their primary group but will also be added to the specified additional groups.
 usermod -G. a means here - append. Good practice

In order to properly move home directory (not just create if it doesn't exist, remember adduser without parameters?) we need to add another argument.

usermod testuser3 -d /home/newdir -m put -m to add it to home.

In order to remove secondary groups, we can run

usermod testuser3 -G ""

add two arguments:

r - remove files
f - force removal (in case if files don't belongs to the user).

The proper arguments for usermod when I want to add another secondary group is:

Answer
-aG

history | grep cat narrowhistory command

-i allows us to traverse the file case insensitive
 see what else we have in the configuration.
shopt -s histappend

ls -al .bash_history

cat .bash_history in this way we see yhe history

echo $HISTSIZE
echo HISTSIZE
Print the variable not the string

set: This command lists all the shell variables and functions currently defined in the shell session, including environment variables.

A shell variable is a named storage location in a Unix-like operating system's shell that holds data, such as strings, numbers, or other values
> .another_history redirect nothing to the file
set
> (Overwrite Redirection)
>> (Append Redirection)

Lab 13su-ss
su -substitute

configuration of /etc/sudoers file

Each config line looks like this:

user pos1=(pos2:pos3) pos4

or

%group pos1=(pos2:pos3) pos4

We do it with sed and remove the lines with student from the /etc/sudoers file

This line in the sudoers file:



student2 ALL=(ALL:ALL) NOPASSWD:ALL

Breakdown: 

student2: User granted permissions.

ALL: Can run commands from any host.
  
(ALL:ALL): Can execute commands as any user and group.

NOPASSWD:: No password required for sudo commands.

ALL: Can run any command.  

NONE: Will get me in trouble for not locking my computer
:))))))   


LAB 14:Logs

Log Files Overview:  
syslog: General system/application log.  
auth.log: Authorization and login attempts.  
dmesg: Kernel messages and boot/runtime info.  
kern.log: Kernel messages.  
boot.log: System startup sequence.  
lastlog: Last login records.  
faillog: Failed login attempts.  
wtmp.log: Login information for utilities.  
dpkg.log: Package management activities.  

Logger command adds a line to the logs
logger "This is a test message"  

Let's learn how to work with binary files from systemd.

journalctl 

journalctl --since "$(date '+%Y-%m-%d %H:%M:%S' --date='5 minutes ago')" log entries from specific time  

Lesson 15 Streams

3 streams - stdin stdout sterror

cat notexists.txt 2> errorfile: Write errors into a log 
2 used to redirect to stderr

We can capture STDOUT and STDERR in the same file.  

cat notexists.txt > capture.txt 2>&1  

2>&1 same destination for both streams  

mknod -m 0666 /dev/null c 1 3  

mknod creates a speacial file  
-m 0666 says about file permission  
/dev/null is the name  
c is the device type  
1 3 are the MAJOR and MINOR numbers to specify the device  

Lesson 16:CRonTAb 

cron is a service responsible for control and execution of scheduled tasks.  
cron is a service which controls multiple crontabs.  
crontab is simply a list of tasks or commands which are scheduled to be executed on specific date and time  
So, if we set 15 * as two first elements, it means: execute 15 minutes after every hour.  
Setting Crontab:  
crontab -e opens crontab editor  
12 9 23 * * /usr/bin/ls -al > logfile 2>&1 in vim  

Lesson 17: Know your files!  

/dev/vda: Entire virtual disk.  
/dev/vda1: First partition on that disk.  

stat allows us to get diffeerent type of information than file.  

What stat gives  
File - it is obvious, this is the name of our file.  
Size - the size of thee file in bytes.  
Blocks - the size of the file, but in blocks.  
IO Block - size of the each blocks.  
   
stat -f mybashscript.sh

-f gives us information about filesystem.  

stat --printf="File %n is %s bytes, and is a %F\n" mybashscript.sh seems useful 

Lesson 18: Soft and hard links  

- ln sintax for links

ln SOURCE TARGET : Hard Link.
ln -s SOURCE TARGET : Soft Link.

Inodes 
ls -il ../source/file1  
ls -il  

stat ../source/file1 counts hard links

unlink LINK  



