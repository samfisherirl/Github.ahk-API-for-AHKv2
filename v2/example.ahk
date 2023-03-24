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

version := git.version()
urlforDL :=  git.release()
releaseNotes := git.details()
repoName := git.repo

msgstring := "Version "  . version . " of " . repoName . " has an update: `n" . releaseNotes

msgstring .= "`nIt can be downloaded at " urlforDL
msgbox(msgstring)
/*
Latest version, great for storing and checking for updates.
*/




;