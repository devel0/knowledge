# git usage

*git*

- [diff from previous commit](#diff-from-previous-commit)
- [create project local then import into github](#create-project-local-then-import-into-github)
- [integrate original to forked](#integrate-original-to-forked)
- [switch to a new remote committing local](#switch-to-a-new-remote-committing-local)
  * [committing local](#committing-local)
  * [discarding local](#discarding-local)
- [add untracked files](#add-untracked-files)
- [commit all staged files](#commit-all-staged-files)
- [clone specific tag](#clone-specific-tag)
- [commit to a new branch](#commit-to-a-new-branch)
- [show local changes](#show-local-changes)
- [show commit logs](#show-commit-logs)
- [change to another branch/commit](#change-to-another-branchcommit)
- [revert a commit](#revert-a-commit)
- [discard all local changes](#discard-all-local-changes)
- [tag specific commit and push to remote](#tag-specific-commit-and-push-to-remote)
- [merge a branch into current](#merge-a-branch-into-current)

## diff from previous commit

```sh
git diff commitid^
```

to increase line numbers

```sh
git diff -U10 commitid^
```

for latest commit diff

```sh
git diff HEAD^
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
    - `new-repo-url` with new repository url
    - `branch` new remote repository branch to work on
    
### committing local

```sh
git remote add newremote new-repo-url
git fetch newremote branch
git add --all
git commit -a
```

and push to newremote

```sh
git push --set-upstream origin newremote
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
