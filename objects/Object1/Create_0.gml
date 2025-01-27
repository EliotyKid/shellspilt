/// @description Insert description here
// You can write your code in this editor

lsm_init()

lsm_add_free_state({
    step: function (){
        show_debug_message("step_free_state")    
    },
    draw_gui: function(){
        draw_text(30,30,current_state)
        draw_text(30,40,enter_state)
    }   
})

lsm_add("idle",{
    enter: function(){
        show_debug_message("entrei no idle")
    },
    step: function(){
        show_debug_message("idle")
        if keyboard_check_pressed(vk_down) lsm_change("run")
    },
    begin_step: function(){
        show_debug_message("idle_begin")
    },
    end_step: function(){
        show_debug_message("idle_end")
    },
    leave: function(){
        show_debug_message("sai do idle")
    }
})

lsm_add("run",{
    enter: function(){
        show_debug_message("entrei no run")
    },
    begin_step: function(){
        show_debug_message("run_begin")
    },
    step: function(){
        show_debug_message("run")
        if keyboard_check_pressed(vk_up) lsm_change("idle")
    },
    end_step: function(){
        show_debug_message("run_end")
    },
    leave: function (){
        show_debug_message("sai do run")
    }
})

current_state = "idle"