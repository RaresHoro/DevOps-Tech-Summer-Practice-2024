Lesson 19 Linux Inodes  

It serves as a unique identifier for a specific piece of metadata on a given filesystem

blockdev --getbsz /dev/vda

This way we determined the block size used on the filesystem.   

Lesson 20: Permissions  

d on the first place of the matrix means directory  
l in the same place means soft (symbolic) link  
- means file  

- - normal, regular file  
d - directory  
l - soft (symbolic) link  
b - block special file (like hard drive)  
c - character special file (like /dev/null)  
n - network file  
p - FIFO  
s - socket  

r - means Read permission is granted  
w - means Write permission is granted  
x - means eXecute permission is granted  

Important! eXecute doesn't simply mean execute the file or program, etc. It also means execute the directory, what allows us to enter into the directory.  

u	Owner  
g	Group  
o	Other  
a	all (owner, group and others)  

0	no access  
1	eXecute  
2	Write  
3	Write + eXecute  
4	Read  
5	Read + eXecute  
6	Read + Write  
7	Read + Write + eXecute  

I want to force rwx permissions for owner, rw for group and r only for others  
u=rwx,g=rw,o=r  

First digit Owner, Second digit for the group , the third is for others

The command to change permissions is chmod  
chmod permissions objects  

chmod a+x student3 && ls -l student3 add permision to all  
chmod a-x student3 && ls -l student3 remove  permision to all  

User student2 belongs to group student1 together with student1. So, they can have additional privileges to work on the same objects.  Privileges which are lower than owner, but higher than for everyone in the system   

In order to change the group, we can use chgrp command. Syntax is simple.  

chgrp <group> <objects>  

Now it is time to change owner. We use chown command for it.  

chown <owner>:<group> <objects>

TEST

usermod -aG appuser administrator add appuser as secondary group

userdel -r anotheruser with -r it also deletes the mode directory of the user
