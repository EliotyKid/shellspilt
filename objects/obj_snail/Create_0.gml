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




lsm_init("idle")
lsm_add_free_state({
    step: function(){
        ground = place_meeting(x,y+1,list_colision)
        
        if !ground{
            vsp += grav
        }
        
    },
    draw_gui: function(){
        draw_text(30,30,current_state)
        draw_text(30,60,hsp)
        draw_text(30,90,vsp)
        draw_text(30,120,INP.isHinput())
    }
})

lsm_add("idle",{
    step: function(){
        var move_h = INP.r() - INP.l()
        if INP.isHinput(){
            lsm_change("run")
        }else{
            hsp = lerp(hsp,max_hsp*move_h,dcc)
        }
    }
})

lsm_add("run",{
    step: function(){
        var move_h = INP.r() - INP.l()
        
        if INP.r() || INP.l(){
            hsp = lerp(hsp,max_hsp*move_h,acc)
        }else{
            hsp = lerp(hsp,max_hsp*move_h,dcc)
        }
        
        
        if abs(hsp) < .4 lsm_change("idle")
    }    
})

