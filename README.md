<h1>Github.ahk</h1>

<h3>
A Modular Library to Download latest releases from the github API, among other github timesavers. </h3>

# 

This library provides a software library as a set of tools and functionalities to help developers automate and simplify the process of downloading the latest releases from GitHub, as well as other time-saving features related to GitHub usage.

GitHub is a popular platform used by developers to collaborate on software projects and track their versions. The GitHub API provides a way for developers to programmatically interact with the platform, including accessing information about repositories, releases, and other data.

The library described here offers a modular approach to downloading the latest releases from GitHub, which can be achieved using classes or functions. This means that developers can choose to use the library in a way that best fits their needs and preferences.

In addition to downloading the latest releases, the library also includes features that help to ensure that the application is always updated with the latest version. This is important for maintaining the security and stability of the software, as well as ensuring that users have access to the latest features and bug fixes.

Overall, this library is designed to help developers save time and effort by providing a set of tools and functionalities that simplify the process of working with GitHub, and in particular, downloading the latest releases from the platform.





<p class="has-line-data" data-line-start="1" data-line-end="2">


 #
 
3/22/23 update: v2

To initiate, you can download the latest release which generates code from a GUI, or see below image.

Quick function list v2:
 
credit to Json Native.ahk creator https://www.autohotkey.com/boards/viewtopic.php?t=100602

```autohotkey
; https://www.autohotkey.com/boards/viewtopic.php?f=83&t=100197
;credit to Json Native.ahk creator https://www.autohotkey.com/boards/viewtopic.php?t=100602

#Include lib\github.ahk
#Include lib\Native.ahk

git := Github("samfisherirl", "Github.ahk")
/*
object := Gitub(Username, Repository)
*/

git.download("release")
/*
object.download("filename for saving")
downloads the first, latest release file
extension is taken care of due to variables
*/

git.download(A_ScriptDir "\release")
/*
Full paths can also be passed
*/

msgbox(git.version())
/*
Latest version, great for storing and checking for updates.
*/
some_stored_version := "v1"


if (some_stored_version != git.version()) {
    notify_update(git)
    git.download(A_ScriptDir "\release")
}

/*
Latest version, great for storing and checking for updates.
*/

notify_update(git) {

    version := git.version()
    urlforDL := git.dlurl
    urlforDL := git.releaseUrl()
    releaseNotes := git.details()
    repoName := git.repo

    msgstring := "Version " . version . " of " . repoName . " has an update: `n" . releaseNotes . "`n`n"
    msgstring .= "`nIt can be downloaded at " urlforDL
    msgbox(msgstring)

}
;
```



; 
 ![image](https://user-images.githubusercontent.com/98753696/224391018-7596576e-e988-4d46-9242-33a667654ed5.png)

#

        

        
How to download latest github release v1:
        
        
        using this url as an example: https://github.com/samfisherirl/github.ahk
 
        object: 
        
        git := new Github("username/repository") ;instantiate the object


        git.DL("geo") ; downloads the latest release, saving to "geo.zip" relative path, you can use any name. 
        
        
        git.release() ; Url of release 
        
        git.details() ; return changes made for latest update

        git.tag() ; returns only version number, ie "v1.2333", ideally for checking if update is necessary
        
        anyname := new Github("any_username/any_repo") 
        
        git := new Github("samfisherirl/github.ahk") ; example using this repository

#
 
 
 
Gui built for generating code in object form:


![Z80uAcG](https://user-images.githubusercontent.com/98753696/194636178-385c2dcb-1220-474c-b3ae-a09b33c94339.png)

 
