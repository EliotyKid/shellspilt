//By @Elioty

function __add_sub_state(_name,_stru,_sub_state){
    if variable_struct_exists(_stru,_sub_state){
        self[$ string(_name)+"_"+_sub_state] = _stru[$ _sub_state]
    }
}

function __sub_state_execute(_state){
    if !is_undefined(self[$ current_state+"_"+_state]) script_execute(self[$ current_state+"_"+_state])
}

///@desc inicia as variaves para a maquina de estados
function lsm_init(){
    self[$ "states"] = []
    self[$ "current_state"] = noone
    self[$ "enter_state"] = false
    self[$ "free_state_enable"] = false
}

///@desc atualiza o estado a cada frame
function lsm_update(){
    if free_state_enable{
        if !is_undefined(self[$ "free_state_step_begin"]) script_execute(self[$ "free_state_step_begin"])
        if !is_undefined(self[$ "free_state_step"]) script_execute(self[$ "free_state_step"])
        if !is_undefined(self[$ "free_state_step_end"]) script_execute(self[$ "free_state_step_end"])
    }
    
    if enter_state == false{
        __sub_state_execute("enter")
        enter_state = true
    }
    
    
    if current_state != noone{
        __sub_state_execute("begin_step")
        __sub_state_execute("step")
        __sub_state_execute("end_step")
    }
    
}

///@desc desenha o draw de cada estado
function lsm_draw(){
    if !is_undefined(self[$ "free_state_draw"]) script_execute(self[$ "free_state_draw"])
    __sub_state_execute("draw")
}

///@desc desenha o draw gui de cada estado
function lsm_draw_gui(){
     if !is_undefined(self[$ "free_state_draw_gui"]) script_execute(self[$  "free_state_draw_gui"])
     __sub_state_execute("draw_gui")
}



///@desc adiciona um novo estado
/// @arg {String} _name o nome do estado
/// @arg {Struct} _stru a estrutura com os sub estado
function lsm_add(_name, _stru = {}){
    array_push(states,_name)
    
    __add_sub_state(_name,_stru,"step")
    
    __add_sub_state(_name,_stru,"enter")
    
    __add_sub_state(_name,_stru,"begin_step")
    
    __add_sub_state(_name,_stru,"end_step")
    
    __add_sub_state(_name,_stru,"draw")
    
    __add_sub_state(_name,_stru,"draw_gui")
    
    __add_sub_state(_name,_stru,"leave")
}

///@desc muda de estado
///@arg {String} _name nome do estado de destino
function lsm_change(_name){
    if !is_undefined(self[$ current_state+"_leave"]) script_execute(self[$ current_state+"_leave"])
    current_state = _name
    enter_state = false
}

///@desc adiciona um estado que vai rodar todo tempo
function lsm_add_free_state(_stru={ }){
    var _name = "free_state"
    free_state_enable = true
    
    __add_sub_state(_name,_stru,"step")
        
    __add_sub_state(_name,_stru,"begin_step")
    
    __add_sub_state(_name,_stru,"end_step")
    
    __add_sub_state(_name,_stru,"draw")
    
    __add_sub_state(_name,_stru,"draw_gui")
    
    __add_sub_state(_name,_stru,"leave")
}







