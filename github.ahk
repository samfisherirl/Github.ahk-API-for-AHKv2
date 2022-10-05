
; credit to https://github.com/clangremlini/OTA.ahk 
; credit to https://github.com/kurtmckee/ahk_json 
class Github {
    __New(Repo) {
      ar := []
        Ar := StrSplit(Repo, "/")

        url := "https://api.github.com/repos/" Repo "/releases/latest"
        urlDownloadToFile, %url%, 1.json
        sleep, 50
        FileRead, Jsn, 1.json
        data := json_load(Jsn)
        ;filedelete, 1.json
        this.Down := data["assets"][1]["browser_download_url"]
        this.asset := data["assets"][1]["name"]
        this.Vers := data["html_url"]
        ;this.Filetype := data["assets"][1]["browser_download_url"]
    }
    release() {
        return this.Down
    }
    name() {
      return this.asset
    }
    getFiletype() {
      Array := StrSplit(this.down, ".")
      indx:=Array.MaxIndex()
      filetype:=Array[indx]
      return filetype
    }
    tag() {
      url := StrSplit(this.Vers,"/")
      tag := url[8]
      return tag
       ; msgbox % this.j[1].assets.name
       ; return this.j[1].assets.name
    }
    DL(File) {
      x := this.getFiletype()
      ext := File "." x
      url := this.release() 
      UrlDownloadToFile, %url%, %ext%
      return  comb
    }
}

