      ; credit to https://github.com/clangremlini/OTA.ahk 
      ; credit to https://github.com/kurtmckee/ahk_json 
      class Github {
        __New(Repo) {
            Ar := []
            Ar := StrSplit(Repo, "/")
            
            url := "https://api.github.com/repos/" Repo "/releases/latest"
            urlDownloadToFile, %url%, 1.json
            sleep, 50
            FileRead, Jsn, 1.json
            data := json_load(Jsn)
            filedelete, 1.json
            this.DLUrl := data["assets"][1]["browser_download_url"]
            this.Asset := data["assets"][1]["name"]
            this.Vers := data["html_url"]
            ;this.Filetype := data["assets"][1]["browser_download_url"]
        }
        release() {
            return this.DLUrl
        }
        name() {
            return this.asset
        }
        zipORexe() {
            Array := StrSplit(this.DLUrl, ".")
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
        DL(Name) {
            x := this.zipORexe()
            ext := Name "." x
            url := this.release()
            UrlDownloadToFile, %url%, %ext%
            if !InStr(ext, ":\")
              ext := A_ScriptDir . "\" . ext
            return ext
        }
      }

