/// @desc horizontal move and colide
/// @arg {Real} _hsp your horizontal speed
/// @arg {Asset.GMObject|Array} _colision array or object to colide
/// @arg {Id.Instance} _inst instance to move
function move_x(_hsp,_colision = obj_block,_inst = id){
    with (_inst){
        var _dir_x = sign(_hsp)
        if place_meeting(x+_dir_x,y,_colision) hsp = 0
        repeat(abs(_hsp)){
            if place_meeting(x+_dir_x,y,_colision){return false}
            else{x += _dir_x}
        }
    }
}


/// @desc vertical move and colide
/// @arg {Real} _vsp your horizontal speed
/// @arg {Asset.GMObject|Array} _colision array or object to colide
/// @arg {Id.Instance} _inst instance to move
function move_y(_vsp,_colision = obj_block,_inst = id){
    with (_inst){
        var _dir_y = sign(_vsp)
        if place_meeting(x,y+_dir_y,_colision) vsp = 0
        repeat(abs(_vsp)){
            if place_meeting(x,y+_dir_y,_colision){return false}
            else{y += _dir_y}
        }
    }
}