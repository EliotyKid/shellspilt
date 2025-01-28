/// @description Insert description here
// You can write your code in this editor
max_hsp = 3
max_vsp = 8
hsp = 0
vsp = 0

acc = .5
dcc = .5

grav = .3

ground = -1
list_colision = [obj_block]


imput_check = function (){
    var _r = keyboard_check(ord("D"))
    var _l = keyboard_check(ord("A"))
    var _d = keyboard_check(ord("S"))
    var _u = keyboard_check(ord("W"))
    
    var _is_pressed = (_r || _l || _d || _u)
    
    return {
        r : keyboard_check(ord("D")),
        l : keyboard_check(ord("A")),
        d : keyboard_check(ord("S")),
        u : keyboard_check(ord("W")),
        is_pressed : _is_pressed
    }
}

imp = -1

lsm_init("idle")
lsm_add_free_state({
    step: function(){
        imp = imput_check()
        ground = place_meeting(x,y+1,list_colision)
        
        if !ground{
            vsp += grav
        }
        
    },
    draw_gui: function(){
        draw_text(30,30,current_state)
        draw_text(30,60,hsp)
        draw_text(30,90,vsp)
    }
})

lsm_add("idle",{
    step: function(){
        var move_h = imp.r - imp.l
        if imp.r || imp.l{
            lsm_change("run")
        }else{
            hsp = lerp(hsp,max_hsp*move_h,dcc)
        }
    }
})

lsm_add("run",{
    step: function(){
        var move_h = imp.r - imp.l
        
        if imp.r || imp.l{
            hsp = lerp(hsp,max_hsp*move_h,acc)
        }else{
            hsp = lerp(hsp,max_hsp*move_h,dcc)
        }
        
        
        if abs(hsp) < .4 lsm_change("idle")
    }    
})

