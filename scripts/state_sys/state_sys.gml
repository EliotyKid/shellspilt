//By @Elioty
function init_states(){
    self[$ "states"] = []
    self[$ "current_state"] = noone
    self[$ "enter_state"] = false
}


function state_update(){
    if enter_state == false{
        if variable_instance_exists(self,current_state+"_step_enter") script_execute(self[$ current_state+"_step_enter"])
        enter_state = true
    }
    
    if current_state != noone{
        if !is_undefined(self[$ current_state+"_step_begin"]) script_execute(self[$ current_state+"_step_begin"])
        if !is_undefined(self[$ current_state+"_step"]) script_execute(self[$ current_state+"_step"])
        if !is_undefined(self[$ current_state+"_step_end"]) script_execute(self[$ current_state+"_step_end"])
    }
    
}


function add_state(_name, _stru = {}){
    array_push(states,_name)
    
    if variable_struct_exists(_stru,"step"){
        self[$ string(_name)+"_step"] = _stru.step
    }
    
    if variable_struct_exists(_stru,"begin_step"){
        self[$ string(_name)+"_step_begin"] = _stru.begin_step
    }
    
    if variable_struct_exists(_stru,"end_step"){
        self[$ string(_name)+"_step_end"] = _stru.end_step
    }
}

function change_state(_name){
    current_state = _name
    enter_state = false
}







