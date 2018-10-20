# change remote

*git*

## switch to a new remote

- change `alias` with an internal name to use when refers to an repo address
- change `new-repo-address` with repo address to associate with `alias`

```
git clone original-repo-address
cd project
git remote add alias new-repo-address
git branch --all
git fetch alias branch
git checkout remotes/alias/branch
```

## commit data to a new remote

- suppose you just clone an opensource project into a working copy `wc` and want to contribute
- by default remote has name `origin` ( `.git/config` )
- you can commit but can't push changes directly to the origin ( if not already enabled as member )
- solution
  - fork the project
  - add your own `my` remote
  - push changes to `my` remote

### example

- clone origin project
```
git clone <project-repo-url>
```

- make changes and commit
```
cd <project>
<make-changes>
git add --all
git commit -a
```

- fork the project ( example: from github on the original project click Fork )

- add your own remote

```
git remote add my <your-fork-project-repo-url>
```

- push changes of current branch to your remote

```
git push my
```

- note: you can push a different branch by specify `git push my <branch-name>`

- notify in case of a pull request from your forked project repository ( example: from github on your forked project click create pull request )

### notes

- `git add --all` works well if `.gitignore` setup ignore development build session files
- to see the complete list of remotes use `git remote -v`
