# git usage

<!-- TOC -->
* [graphical diff](#graphical-diff)
* [graphical diff ( code )](#graphical-diff--code-)
* [diff from previous commit](#diff-from-previous-commit)
* [undo last commit](#undo-last-commit)
* [show local branches](#show-local-branches)
* [create project local then import into github](#create-project-local-then-import-into-github)
* [integrate original to forked](#integrate-original-to-forked)
* [switch to a new remote committing local](#switch-to-a-new-remote-committing-local)
  + [committing local](#committing-local)
  + [discarding local](#discarding-local)
* [add untracked files](#add-untracked-files)
* [commit all staged files](#commit-all-staged-files)
* [clone specific tag](#clone-specific-tag)
* [commit to a new branch](#commit-to-a-new-branch)
* [show local changes](#show-local-changes)
* [show commit logs](#show-commit-logs)
* [change to another branch/commit](#change-to-another-branchcommit)
* [revert a commit](#revert-a-commit)
* [pick a commit](#pick-a-commit)
* [pick some file from another commit](#pick-some-file-from-another-commit)
* [discard all local changes](#discard-all-local-changes)
* [tag specific commit and push to remote](#tag-specific-commit-and-push-to-remote)
* [merge a branch into current](#merge-a-branch-into-current)
* [github tips](#github-tips)
* [delete branch local and remote](#delete-branch-local-and-remote)
* [pull and switch to a branch](#pull-and-switch-to-a-branch)
* [add submobule](#add-submobule)
* [submobule init](#submobule-init)
<!-- TOCEND -->

<hr/>

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

## show local branches

```sh
git branch
```

or tree

```sh
git log --graph --pretty=oneline --abbrev-commit
```

## create project local then import into github

- **replacements**
    - choose git ignore ( default Visual Studio ) replacing token `VisualStudio.gitignore`
    - choose license ( default MIT ) replacing token `license/mit`
    - set license author name replacing token `myname`
    - set project git url `https://github.com/xxx/project.git`

```sh
mkdir myproject
cd myproject
git init
curl -s https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore -o .gitignore
curl -s https://api.github.com/licenses/mit | jq -r ".body" | sed "s/\[year\]/$(date +%Y)/g" | sed "s/\[fullname\]/myname/g" > LICENSE

git remote add origin https://github.com/xxx/project.git
git add --all
git commit -m "initial commit"
git push -u origin master
```

## integrate original to forked

- scenario
    - forked a project
    - original project have some commit ahead your fork
    - want to integrate original project changes into your fork

- **replacements**
    - `original-repo-url` with original project from where your fork cames from

```sh
git remote add original original-repo-url
git fetch original master
git merge original/master
git push
```

## switch to a new remote committing local

- **replacements**
    - `newremote` an alias for new origin
    - `new-repo-url` with new repository url
    - `branch` new remote repository branch to work on
    
### committing local

```sh
git remote add newremote new-repo-url
git fetch newremote branch
# optionally switch to new branch
# git checkout -b newbranch
git add --all
git commit -a
```

and push to newremote

```sh
git push --set-upstream newremote
```

### discarding local

```sh
git remote add newremote new-repo-url
git fetch newremote branch
git checkout remotes/newremote/branch
```

## add untracked files

- **notes**
    - follow command work well when you use `.gitignore` to avoid inclusion of build artifacts

```sh
git add --all
```

## commit all staged files

```sh
commit -a -m "msg"
```

## clone specific tag

```sh
git clone <url> --branch <tag> --single-branch
```

## commit to a new branch

```sh
git checkout -b newbranch
git add --all
git commit -a -m "msg"
```

and push to remote

```sh
git push --set-upstream origin newbranch
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

- **notes** you can make changes but you need to define where to put these ( [commit to a new branch](#commit-to-a-new-branch) )

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

## merge a branch into current

```sh
git merge anotherbranch
```

## github tips

- retrieve current page in a permalink form ( hotkey `y` )

## delete branch local and remote

```sh
git branch -d branchname
```

to delete branch on remote:

```sh
git push originname --delete branchname
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
git submodule update --init --recursive
```

