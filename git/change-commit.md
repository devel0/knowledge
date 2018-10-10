# git change commit

## analyze commits

```
git log
```

## change to another branch/commit

```
git checkout <commit>
```

Note: you can make changes but you need to define where to put these ( in another branch )

## change back to master head

```
git checkout master
```

## switch to another branch

```
git checkout <branch>
```

## revert a commit

```
git revert <commit>
```

## cleanup worktree

follow remove all changes and files that aren't already commited too

```
git clean -dfx
```
