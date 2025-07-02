# git usage

- [github fork workflow ( using vscode )](#github-fork-workflow--using-vscode-)
- [rename branch](#rename-branch)
- [checkout a remote branch](#checkout-a-remote-branch)
- [graphical diff](#graphical-diff)
- [graphical diff ( code )](#graphical-diff--code-)
- [diff from previous commit](#diff-from-previous-commit)
- [undo last commit](#undo-last-commit)
- [commit all staged files](#commit-all-staged-files)
- [clone specific tag](#clone-specific-tag)
- [show local changes](#show-local-changes)
- [show commit logs](#show-commit-logs)
- [change to another branch/commit](#change-to-another-branchcommit)
- [revert a commit](#revert-a-commit)
- [pick a commit](#pick-a-commit)
- [pick some file from another commit](#pick-some-file-from-another-commit)
- [discard all local changes](#discard-all-local-changes)
- [tag specific commit and push to remote](#tag-specific-commit-and-push-to-remote)
- [github tips](#github-tips)
- [show branches tree](#show-branches-tree)
- [show local branches](#show-local-branches)
- [commit to a new branch](#commit-to-a-new-branch)
- [merge a branch into current](#merge-a-branch-into-current)
- [delete branch local and remote](#delete-branch-local-and-remote)
- [rename branch local and remote](#rename-branch-local-and-remote)
- [pull and switch to a branch](#pull-and-switch-to-a-branch)
- [add submobule](#add-submobule)
- [submobule init](#submobule-init)
- [reset head on remote](#reset-head-on-remote)
- [skip changes from already added file](#skip-changes-from-already-added-file)
- [restart track changes for already added file](#restart-track-changes-for-already-added-file)
 
<hr/>

## github fork workflow ( using vscode )

Don't fork a project until you made some effective changes locally to the original cloned repository, instead:

- clone project which you want to contribute

```sh
git clone REPO_URL
```

- make changes locally and test them
- create a branch named ( eg. `fix-some` ) with `Source Control / Branch / Create Branch...` or

```sh
git checkout -b fix-some
```

- commit changes to your local branch
- FORK the project using github btn then copy your forked repository url ( MY_ORIGIN ) to clipboard
- add your origin from `Source Control / More Actions / Add Remote...` ( paste your fork url then insert a name `my` )
- push changes to your repo `Source Control / Push` ( this will ask you to choose an origin as upstream of the branch `fix-some`, then choose your fork origin `my` )
- go to github on your forked repository and click `Compare & pull request` btn

## rename branch

sometime you need to import a local git repo to a remote where the default branch differs in the name, ie. local is `master` while in remote is `main`; to overcome this issue rename the branch before push

```sh
git branch -M main
```

## checkout a remote branch

if remote not available adds ( REMOTENAME could "original" if you working on a fork and wants to add the original one )

```sh
git remote add REMOTENAME URL
```

then fetch the branch you need

```sh
git fetch REMOTENAME TAG
```

for a list of branches available locally use `git branch -a`

then checkout remote branch

```sh
git checkout -b remotes/REMOTENAME/TAG
```

## graphical diff

```sh
apt install -y diffuse
```

edit `~/.gitconfig`

```
[diff]
    tool = diffuse
```

and optionally to disable confirm open gui

```
[difftool]
    prompt = false
```

## graphical diff ( code )

tune `~/.gitconfig`

```
[merge]
    tool = vscode

[mergetool "vscode"]
    cmd = code --wait $MERGED

[diff]
    tool = vscode

[difftool "vscode"]
    cmd = code --wait --diff $LOCAL $REMOTE
    prompt = false
```

## diff from previous commit

```sh
git diff commitid^!
```

to increase line numbers

```sh
git diff -U10 commitid^!
```

for latest commit diff

```sh
git diff HEAD^
```

## undo last commit

```sh
git reset HEAD~
```

## commit all staged files

```sh
commit -a -m "msg"
```

## clone specific tag

```sh
git clone <url> --branch <tag> --single-branch
```

## show local changes

```sh
git diff
```

## show commit logs

```sh
git log
```

## change to another branch/commit

```sh
git checkout <commit>
```

## revert a commit

```sh
git revert <commit>
```

## pick a commit

this will bring given commit and inject into current HEAD

```sh
git cherry-pick <commit>
```

## pick some file from another commit

```sh
git checkout <COMMIT_SHA> -- filepath1 filepath2
```

## discard all local changes

```sh
git clean -dfx
```

## tag specific commit and push to remote

```sh
git tag -a vxxx <commit>
git push --tags
```

## github tips

- retrieve current page in a permalink form ( hotkey `y` )

## show branches tree

prerequisite : `apt install git-extras`

```sh
git-show-tree
```

## show local branches

```sh
git branch
```

sorted by recent

```sh
git branch --sort=-committerdate
```

or tree

```sh
git log --graph --pretty=oneline --abbrev-commit
```

## commit to a new branch

```sh
git checkout -b newbranch
git add --all
git commit -a -m "msg"
```

## merge a branch into current

```sh
git merge anotherbranch
```

## delete branch local and remote

```sh
git branch -d branchname
```

to delete branch on remote:

```sh
git push originname --delete branchname
```

## rename branch local and remote

```sh
git branch -m old-name new-name
git push --set-upstream origin new-name
git push origin --delete old-name
```

## pull and switch to a branch

```sh
git fetch origin
git checkout --track origin/<branchname>
```

## add submobule

for example follow initialize a submodule for given repo url and branch into local subfolder inside a `thirdy` folder

```sh
mkdir thirdy
git submodule add -b avalonia-pkg-upgrade https://github.com/SearchAThing-forks/CSharpMath.git thirdy/CSharpMath
```

## submobule init

```sh
git submodule update --init
```

or if need to update submodule present in submodule ( use with caution, may not necessary )

```sh
git submodule update --init --recursive
```

## reset head on remote

```sh
git reset --hard SHA
git push origin BRANCH --force
```

- refs: https://www.abrahamberg.com/blog/git-remove-commits-from-branch-after-push-reset-revert-or-rebase/

## skip changes from already added file

```sh
git update-index --assume-unchanged FILE
```

## restart track changes for already added file

```sh
git update-index --no-assume-unchanged FILE
```