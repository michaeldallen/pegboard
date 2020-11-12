# pegboard

github action demo

gitlab ci demo

## libraries

* tube

  hollow or solid cylinder, optionally with rounded edges

* box

  hollow or solid cube, optionally with rounded edges

* cover

  cap for pegboard anchors for use as basis of everything else

## git

### experiment with multiple upstream repos

  * [How To Use git with Multiple Remote Repositories](https://www.cloudsavvyit.com/2464/how-to-use-git-with-multiple-remote-repositories/), by Anthony Heddings

  * <a name="magic"></a>(note: this is magic)
    [pull/push from multiple remote locations](https://stackoverflow.com/questions/849308/pull-push-from-multiple-remote-locations)
    from [Malvineous](https://stackoverflow.com/users/308237/malvineous)

        git remote set-url origin --push --add git@gitlab.com:michaeldallen/pegboard.git
        git remote set-url origin --push --add git@github.com:michaeldallen/pegboard.git
        git push
        <magic happens>

    another look at the same magic: [Pushing to Multiple Git Repos](https://gist.github.com/rvl/c3f156e117e22a25f242)

  from `github`

        git remote add gitlab git@gitlab.com:michaeldallen/pegboard.git
        git remote -v
        git push gitlab main

  from `gitlab`

        git remote add github git@github.com:michaeldallen/pegboard.git
        git remote -v
        git push github main

  * part of Atlassian's excellent tutorial [git syncing](https://www.atlassian.com/git/tutorials/syncing)

  * [Using git with multiple remote repositories](https://mmikowski.github.io/git-cross-origin/)
    by Michael S. Mikowski

## markdown

* sigh ... as always

  Basic Syntax: The Markdown elements outlined in John Gruber's design document.
  [Markdown Guide](https://www.markdownguide.org/basic-syntax/)

* [Cross-reference (named anchor) in markdown](https://stackoverflow.com/questions/5319754/cross-reference-named-anchor-in-markdown)

## whatever
multi-repo test message 2020.11.12
again
again, again
  

test commit to see that only scad commits (to main) trigger builds

Wed 04 Nov 2020 04:32:15 PM EST
another test
