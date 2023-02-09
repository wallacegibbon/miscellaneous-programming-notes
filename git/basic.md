Basic operations

```
git init
git add file1 file2 ...
git add [directory]
git commit [-m 'version message']
```

Config

```
git config --global user.name myname
git config --global user.email myemail@xx.com
git config --global core.editor vi
```

Enable color

```
git config --global color.ui auto
```

Or one by one:

```
git config --global color.status auto
git config --global color.branch auto
git config --global color.diff auto
#...
```

Disable color
```
git config --global color.ui false
```

Set proxy
```
git config --global http.proxy socks5://127.0.0.1:1080
```

List current config

```
git config --list   # or just `git config -l`
```

You can also use

```
git rm
git mv
```

'git rm' and 'git mv' works just like 'rm' and 'mv', but they change the
records in git

Check out file change

```
git status
git diff
```

Show information of previous versions

* git log
* git reflog

Switch among different versions

```
git reset --hard commit-id
```

If you just want to delete some commits, use "reset" WITHOUT "--hard"

```
git reset commit-id
```

Then commit again, the useless old commits will disappear.


Discard the uncommitted change

```
git checkout -- filename
```

Push to an existing repository from the command line with https,
you need always input username and password of you account.
```
git remote add origin https://github.com/yourname/test_git.git
git push origin master
```

delete origin and add a new one

```
git remote rm origin
git remote add origin https://git.oschina.net/yourname/test.git
```

With ssh, you just need password of you ssh

```
git remote add github git@github.com:yourname/test.git
git push github master
git remote add oschina git@git.oschina.net:yourname/test.git
git push oschina master
```

Or you can just simply:
```
git push git@git.oschina.net:yourname/test.git master
```

fetch from repository
```
git fetch git@git.oschina.net:yourname/test.git master:temp
```

Fetch and merge

```
git pull git@git.oschina.net:yourname/test.git master
git pull oschina master
```


Just copy the whole project
```
git clone git@git.oschina.net:yourname/test.git
```

Create a branch
```
git branch branch_x
```

List branch

```
git branch
# branch that starting with a '*' is the current branch
```

switch to a certain branch
```
git checkout branch_x
```

Create a branch "branch_x" and switch to it
```
git checkout -b branch_x
```

Merge branch and master
you should commit both branch and master and switch to master, then:
```
git merge branch_x
```

Then commit again:
```
git commit -a
```

'git commit -a' is just like 'git add . ; git commit' sometimes,
but it will not add new file.

Push local test as remote master
```
git push origin test:master
```

Push local test as remote test
```
git push origin test:test
```

Pull remote master as local test, different from push, master first
```
git pull origin master:test
```

Repalce the origin master:
```
git push origin master --force
```

Show the origin branch
```
git ls-remote  # need password, show details
git branch -r  # do not need password, show only branch name
```

Delete local branch
```
git branch -d branchname
```

Delete remote branch
```
git push origin :branchname
```

Change the last commit message
```
git commit --amend
```
