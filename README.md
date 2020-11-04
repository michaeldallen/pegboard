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
    

  from `github`

        git remote add gitlab git@gitlab.com:michaeldallen/pegboard.git
        git remote -v
        git push gitlab main

  from `gitlab`

        git remote add github git@github.com:michaeldallen/pegboard.git
        git remote -v
        git push github main
          
  * part of Atlassian's excellent tutorial [git syncing](https://www.atlassian.com/git/tutorials/syncing)

## markdown

* sigh ... as always

  Basic Syntax: The Markdown elements outlined in John Gruber's design document.
  [Markdown Guide](https://www.markdownguide.org/basic-syntax/)

