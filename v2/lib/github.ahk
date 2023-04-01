; credit to https://github.com/kurtmckee/ahk_json 
 

class Gitter {
    __new(val) {
        temp := A_ScriptDir "\temp.json"
        url := "https://api.github.com/repos/" val "/releases/latest"
        Download(url, temp)
        sleep(50)
        data := FileRead(temp)

        data := jxon_load(&data)
        ;filedelete, "1.json"
        this.DLUrl := data["assets"][1]["browser_download_url"]
        this.Asset := data["assets"][1]["name"]
        this.Vers := data["html_url"]
        this.body := data["body"]
        this.repo := StrSplit(val, "/")[2]
        ;this.Filetype := data["assets"][1]["browser_download_url"]
    }
    release() {
        return this.DLUrl
    }
    name() {
        return this.asset
    }
    details() {
        return this.body
    }
    zipORexe() {
        Arrays := StrSplit(this.DLUrl, ".")
        filetype := Arrays[Arrays.Length]
        return filetype
    }
    version() {
        url := StrSplit(this.Vers,"/")
        version := url[8]
        return version
        ; msgbox % this.j[1].assets.name
        ; return this.j[1].assets.name
    }
    download(Name) {
        x := this.zipORexe()
        nameExt := Name "." x
        url := this.release()
        Download(url, nameExt)
        if !InStr(nameExt, ":\")
            nameExt := A_ScriptDir . "\" . nameExt
        return nameExt
    }
/*
    checkupd(log) {
      If (log = "") {
          log := A_AppDataCommon "\log.txt"
      }
      loop read, %log%
      {
          if (A_LoopReadLine != "") {
            vers := StrSplit(A_LoopReadLine, ",")
              vers:=vers[2]
              break
          }
      }
      if instr(vers, this.tag())
      {
          return 0
      }
      else
          return 1
  }
  dlupdate(log) {
      this.DL(this.name())
      tag:=this.tag()
      
      fileappend, 
      (C LTrim
      ,%tag%,
      ), "1og.txt"
      filemove, "1og.txt", log, 1
  }
  upd(log) {
      if (this.checkupd(log) = 1)
      {
          this.dlupdate(log) ;downloads if vers/log
      }
  }
  */
     
  }
/*
class Gitter {

  Downloader(Username, Repository_Name, Path_To_Save_DL)
  {
        ;GitDownload("samfisherirl","Geo3D_Manager", Path)
        UR := Username "/" Repository_Name
        Path_To_Save_DL := Path_To_Save_DL "\" Repository_Name
        ;gitfunc := new Git(UR)
        ;gitfunc.DL(Path_To_Save_DL)
  }
  
  GetVersion(Username, Repository_Name)
  {
        ;GitDownload("samfisherirl","Geo3D_Manager", Path)
        UR := Username "\" Repository_Name
        gitfunc := new Git(UR)
        Path_To_Save_DL := Path_To_Save_DL "\" gitfunc.name()
        return gitfunc.tag()
  }
  
    GitGetAsset(Username, Repository_Name)
    {
        ;GitDownload("samfisherirl","Geo3D_Manager", Path)
        UR := Username "\" Repository_Name
        gitfunc := new Git(UR)
        Path_To_Save_DL := Path_To_Save_DL "\" gitfunc.name()
        return gitfunc.asset
    }
    GitGetReleaseUrl(Username, Repository_Name)
    {
        ;GitDownload("samfisherirl","Geo3D_Manager", Path)
        UR := Username "\" Repository_Name
        gitfunc := new Git(UR)
        Path_To_Save_DL := Path_To_Save_DL "\" gitfunc.name()
        return gitfunc.release()
    }
    GitGetUpdateDetails(Username, Repository_Name)
    {
        ;GitDownload("samfisherirl","Geo3D_Manager", Path)
        UR := Username "\" Repository_Name
        gitfunc := new Git(UR)
        Path_To_Save_DL := Path_To_Save_DL "\" gitfunc.name()
        return gitfunc.details()
    }
}
*/
Github(Username, Repository_Name)
{
    ;GitDownload("samfisherirl","Geo3D_Manager", Path)
    val := Username "/" Repository_Name
    gg := Gitter(val)
    return gg
} 