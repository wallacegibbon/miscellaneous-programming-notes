Create a temporary branch

```
git checkout -b task_branch
```

Code may have been changed by other people while you were coding, update it:

```
git checkout <main_branch>
git pull
```

Do rebase

```
git checkout task_branch
git rebase -i <main_branch>
```

When conflicts exists

```
git mergetool
git rebase --continue
```

Push

```
git push origin HEAD:refs/for/<main_branch>
```

Clean up

```
git checkout <main_branch>
git pull origin <main_branch>
git branch -D task_branch
```
