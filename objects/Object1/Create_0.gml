/// @description Insert description here
// You can write your code in this editor



init_states()
add_state("idle",{
    step: function(){
        show_debug_message("idle")
        if keyboard_check_pressed(vk_down) change_state("run")
    },
    begin_step: function(){
        show_debug_message("idle_begin")
    }
})
add_state("run",{
    step: function(){
        show_debug_message("run")
        if keyboard_check_pressed(vk_up) change_state("idle")
    },
    end_step: function(){
        show_debug_message("run_end")
    }
})
current_state = "idle"
