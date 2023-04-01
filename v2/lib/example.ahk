; https://www.autohotkey.com/boards/viewtopic.php?f=83&t=100197
#Include <Native\Native>

aa := JSON.parse('{"abc":7}')

class JSON {
    static __New() {
        Native.LoadModule('.\' (A_PtrSize * 8) 'bit\ahk-json.dll', ['JSON'])
        this.DefineProp('true', {value: 1})
        this.DefineProp('false', {value: 0})
        this.DefineProp('null', {value: ''})
    }
    static parse(str) => Map() | Array()
    static stringify(obj, space := 0) => ''
}
