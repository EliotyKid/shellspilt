

function __inputs(){
    return{
        r: function(){
            return keyboard_check(ord("D"))
        },
        l: function(){
            return keyboard_check(ord("A"))
        },
        isHinput: function(){
            if self.r() || self.l() return true
                
            return false
        }
    }
}


#macro INP __inputs()