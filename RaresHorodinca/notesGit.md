 Lesson 1 Install Git 

 apt install -y git

 Lesson 2 Configure Git  

 --system - table relevant for the whole machine  

--global - for the current user  

--local (default) for the current repository  

git config --list -a ll settings are printed.  

git config --list --global - only --global table is listed  

git config user.name - selected record is printed.  

git config --list lists the configurations

We have a file to commit in the repo. We can do it now, as we configured our user.

git add .

git commit newfile -m "my first commit"

Lesson 4 : Remove file from commit  

Anyway, we have 4 files in stage. Let's remove testfile-01  

git rm --cached testfile-01  

git rm --cached -r .  

please notice, we used . to say everything from here and -r which means recursive.  

We succesfully reset the file to the state from previous commit, using git checkout

Another way of going back  
Reset the current HEAD to the selected state  

git reset moves the current pointer in HEAD and branch refs to specific state. 

Soft reset  

With --soft parameter we came back to the previous HEAD of the repository, but all changes which we commited are unchanged.  

soft - moves back  
hard - moves back and renoves the changes done which were done

Lesson 6 Revert Changes 

git revert --no-edit HEAD  
--no-edit we informed git that we don't want to pass any message and we ask to use default  

Our current status is like this: we are between two commits, for file-01 and file-02.  

HEAD is where we are, HEAD~3 move back form head by 3 commits , this becomes our new HEAD.  

Lesson 7 :Check the Differenences

git diff, allows to check the differences between HEAD and current working directory  
Another words, what was changed during our recent work.  

we can check diff for one file.  

clear && git diff HEAD~1 testfile-01


In order to see the difference between staged work and HEAD, you need to say this explicitly.

git diff --staged

Lesson 8 : Detailed info about previuos commits  

--oneline shows only most important info about commits  

git log -p : shows us ingo about all commits  

git shortlog info about author  

git log --stat  

git log --graph visualise work done on branches.  

git log --oneline --graph looks better this way  


Lesson 9 Conflicts  

change1 commit  
change2 commit  
revert to change1  
That means, we have change2 unattended!  

sed -i '2,5d' testfile-02 remove lines t2 to 5  

After emove the lines, we add the file back 

There are tools which can help you to resolve conflicts. Examples are

git-mergetool (part of the git package, you need to specify proper tool which will be invoked)  
Plugins to your beloved editor  
Kdiff3  
Meld  

Lesson 10 Powerful stash 

TBD

Lesson 11 How to ignore some content  

Add the files/dir we want to ignore to .gitignore

!firstdirectory/neveringit : ! - we want to add it in git(we force it)  

Lesson 12 : Git Tags 

git tag -a v1.0 -m "version 1.0. initial state" create tag  

git adog | grep 'testfile-06' | awk '{print $2}' | head -n1  

awk '{print $2}' - with awk we are 'cutting' the output and print only the third (counted from 0) element, where separator (default one) is a space.  

git describe tells us what tg are we at  

git checkout master

git tag -d v1.0  delete tag  

Lesson 13 : merge branches 

git checkout -b newbranch  vreate new branch  
git checkout moves us between branches  


Lesson 14 Cheat the history  

Rebase  
We are using rebase to make history more clean, clear and ordered  

Duplicates the commits on the feature branch as commits on the master branch





