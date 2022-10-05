# Download latest releases from github with Object based repos

<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="githubahk_0"></a>github.ahk</h1>
<p class="has-line-data" data-line-start="1" data-line-end="2">Github.ahk - Download latest releases from repositories</p>
<p class="has-line-data" data-line-start="3" data-line-end="5"><code>rep := &quot;samfisherirl/Geo3D_Manager&quot;</code><br>
;        username   /   repository</p>
<p class="has-line-data" data-line-start="7" data-line-end="9"><code>git := new Github(rep)</code><br>
;object :=  class(variable)</p>
<p class="has-line-data" data-line-start="10" data-line-end="13"><code>git.DL(&quot;geo&quot;)</code><br>
; downloads latest release as “geo.7z” accounting for variable extension<br>
; (geo can be replaced with any name)</p>
<p class="has-line-data" data-line-start="15" data-line-end="19"><code>releasename := git.name()</code><br>
<code>file_to_Save := A_AppDataCommon &quot;\&quot; releasename</code><br>
;DL to “C:\programdata\geomanager.7z”<br>
; this accounts for file name extension variable</p>
<p class="has-line-data" data-line-start="21" data-line-end="23"><code>msgbox % file_to_Save</code><br>
<code>git.DL(file_to_Save)</code></p>
<p class="has-line-data" data-line-start="24" data-line-end="25">;object</p>
<p class="has-line-data" data-line-start="27" data-line-end="29">; long version of above dl option<br>
;you need the proper extension ^</p>
<p class="has-line-data" data-line-start="31" data-line-end="33">;Return URL of Latest Release Version<br>
<code>msgbox % git.release()</code></p>
<p class="has-line-data" data-line-start="35" data-line-end="37">;return version of latest release tag<br>
<code>msgbox % git.tag()</code></p>
<p class="has-line-data" data-line-start="38" data-line-end="40"><code>msgbox % git.name()</code><br>
file name</p>
