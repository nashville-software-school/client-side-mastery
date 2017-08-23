# Advanced Git

## Rebasing

You're going to learn how to [rebase](https://www.git-scm.com/book/en/v2/Git-Branching-Rebasing) branches instead of merging them.

In a merge, git performs a three-way diff between the branch you are merging, your current branch, and the common ancestor where the branch occurred. In a rebase, git takes all of the commits on another branch, and replays them, one by one, onto your current branch.

Let's try it out

```bash
git checkout master
git branch branch-a
git checkout -b branch-b
echo '# Rebasing' > REBASE.md
git add .
git commit -m "Adding rebase document"
echo '# How to contribute' > CONTRIBUTE.md
git add .
git commit -m "Adding contribution documentation"

git checkout branch-a
echo '# Release notes' > RELEASE.md
git add .
git commit -m "Adding release notes document"

git checkout master
git merge branch-a

git checkout branch-b
git rebase master
```

## Squashing commits with rebase

If you did a series of commits that really should be squashed into one commit because the changes were really all part of one, larger, effort, you can do that with an **interactive rebase**.

Look at the commit log below. You see that there are three commits that really need to be squashed down into one commit so that the history is cleaner.

```
commit 6bba637fb7d0db14a8e3c679b3199430b8594dd6
Author: Steve Brownlee <chortlehoort@gmail.com>
Date:   Tue Nov 24 14:20:12 2015 -0600

    Added hello feature

commit 5bbe95b5127656b46c5460f1f36ca7810f5cb64f
Author: Steve Brownlee <chortlehoort@gmail.com>
Date:   Tue Nov 24 14:19:02 2015 -0600

    Added hello feature

commit 07893682bd17dd81e1e3e100c808e346c153d120
Author: Steve Brownlee <chortlehoort@gmail.com>
Date:   Tue Nov 24 14:02:36 2015 -0600

    Added hello feature

commit fd74cbc7764cad09afa881ff825a48d888df3421
Author: Steve Brownlee <chortlehoort@gmail.com>
Date:   Tue Nov 24 12:00:06 2015 -0600

    Some example ES6 class code
```

So what you need to do is copy the commit id of the one previous to the commits you want to squash. In this example, I'd copy `fd74cbc7764cad09afa881ff825a48d888df3421`.

Then do an interactive rebase with the following command.

`git rebase -i fd74cbc7764cad09afa881ff825a48d888df3421`

You're then presented with the interactive rebase UI in vim.

```
pick 6365bbe Added hello feature
pick 7870534 Added hello feature
pick fb89f68 Added hello feature

# Rebase 6bba637..07893682 onto fd74cbc (8 command(s))
#
# Commands:
# p, pick = use commit
# r, reword = use commit, but edit the commit message
# e, edit = use commit, but stop for amending
# s, squash = use commit, but meld into previous commit
# f, fixup = like "squash", but discard this commit's log message
# x, exec = run command (the rest of the line) using shell
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

Make sure you keep the first line as `pick`. For the remainder of the commits, you're going to change `pick` to the letter `s` - to squash them.

```
pick 6365bbe Added hello feature
s 7870534 Added hello feature
s fb89f68 Added hello feature
```

Save and exit with `:x` and you'll be presented with another screen to edit the commit message for the new, squashed commit.

```
# This is a combination of 3 commits.
# The first commit's message is:
Added hello feature

# This is the 2nd commit message:

Added hello feature

# This is the 3rd commit message:

Added hello feature
```

Just delete everything you don't want, make sure your commit message is clear, and exit.

```
# This is a combination of 3 commits.
# The first commit's message is:
Added awesome hello feature

```

Now if you `git log` you will no longer see three commits, but rather one, with your message.
