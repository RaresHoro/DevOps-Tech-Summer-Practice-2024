# Git Lessons

## Lesson 1: Install Git
```bash
apt install -y git
```

## Lesson 2: Configure Git

- `--system` - table relevant for the whole machine  
- `--global` - for the current user  
- `--local` (default) - for the current repository  

```bash
git config --list -a  # All settings are printed.
git config --list --global  # Only --global table is listed.
git config user.name  # Selected record is printed.
git config --list  # Lists the configurations.
```

We have a file to commit in the repo. We can do it now, as we configured our user.

```bash
git add .
git commit -m "my first commit"  # Commit new file.
```

## Lesson 4: Remove File from Commit

Anyway, we have 4 files in stage. Let's remove `testfile-01`.

```bash
git rm --cached testfile-01
git rm --cached -r .  # Remove everything from here, recursively.
```

We successfully reset the file to the state from the previous commit using `git checkout`.

### Another Way of Going Back

Reset the current HEAD to the selected state.

```bash
git reset  # Moves the current pointer in HEAD and branch refs to a specific state.
```

- **Soft Reset**  
  With `--soft` parameter, we come back to the previous HEAD of the repository, but all changes that we committed remain unchanged.

- **Hard Reset**  
  Moves back and removes the changes that were done.

## Lesson 6: Revert Changes

```bash
git revert --no-edit HEAD  # Use default message.
```

Our current status is like this: we are between two commits, for `file-01` and `file-02`.

- `HEAD` is where we are.
- `HEAD~3` moves back from HEAD by 3 commits; this becomes our new HEAD.

## Lesson 7: Check the Differences

```bash
git diff  # Allows checking the differences between HEAD and current working directory.
```

We can check diff for one file.

```bash
clear && git diff HEAD~1 testfile-01
```

To see the difference between staged work and HEAD, you need to say this explicitly.

```bash
git diff --staged
```

## Lesson 8: Detailed Info About Previous Commits

- `--oneline` shows only the most important info about commits.
- `git log -p` shows us info about all commits.
- `git shortlog` provides info about the author.
- `git log --stat`
- `git log --graph` visualizes work done on branches.
- `git log --oneline --graph` looks better this way.

## Lesson 9: Conflicts

1. `change1` commit
2. `change2` commit
3. Revert to `change1`  
   That means we have `change2` unattended!

```bash
sed -i '2,5d' testfile-02  # Remove lines 2 to 5.
```

After removing the lines, we add the file back.

There are tools that can help you resolve conflicts. Examples are:

- `git mergetool` (part of the git package; you need to specify the proper tool to be invoked)
- Plugins for your favorite editor
- Kdiff3
- Meld

## Lesson 10: Powerful Stash

TBD

## Lesson 11: How to Ignore Some Content

Add the files/directories we want to ignore to `.gitignore`.

```plaintext
!firstdirectory/neveringit  # We want to add it in git (we force it).
```

## Lesson 12: Git Tags

```bash
git tag -a v1.0 -m "version 1.0. initial state"  # Create tag.
```

```bash
git adog | grep 'testfile-06' | awk '{print $2}' | head -n1  # Example command.
```

- `awk '{print $2}'` - with awk we are 'cutting' the output and printing only the second element, where the separator (default one) is a space.
- `git describe` tells us what tag we are at.

```bash
git checkout master
git tag -d v1.0  # Delete tag.
```

## Lesson 13: Merge Branches

```bash
git checkout -b newbranch  # Create new branch.
git checkout  # Moves us between branches.
```

## Lesson 14: Cheat the History

### Rebase

We use rebase to make history more clean, clear, and ordered. It duplicates the commits on the feature branch as commits on the master branch.
