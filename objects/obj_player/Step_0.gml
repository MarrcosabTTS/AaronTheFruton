if (instance_exists(obj_dialog)) {
    exit;
}

if (keyboard_check_pressed(vk_space)) {
    create_dialog([
        {
            name: "Level UP",
            msg: "Me gustan las tetarracas"
        }
    ]);
}

// Lógica del dash
if (keyboard_check_pressed(vk_shift) && !is_dashing && dash_cooldown_timer <= 0) {
    is_dashing = true;
    is_invincible = true; // Activar invencibilidad
    dash_timer = dash_duration;
    dash_cooldown_timer = dash_cooldown;
}

if (is_dashing) {
    var _dash_hor = lengthdir_x(dash_speed, facing);
    var _dash_ver = lengthdir_y(dash_speed, facing);
    move_and_collide(_dash_hor, _dash_ver, tilemap);

    dash_timer--;
    if (dash_timer <= 0) {
        is_dashing = false;
        is_invincible = false; // Desactivar invencibilidad al terminar el dash
    }
}

if (dash_cooldown_timer > 0) {
    dash_cooldown_timer--;
}

// Movimiento normal (solo si no está haciendo un dash)
if (!is_dashing) {
    var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap);

    if (_hor != 0 || _ver != 0) {
        if (_ver > 0) { sprite_index = spr_player_walk_down; }
        else if (_ver < 0) { sprite_index = spr_player_walk_up; }
        else if (_hor > 0) { sprite_index = spr_player_walk_right; }
        else if (_hor < 0) { sprite_index = spr_player_walk_left; }

        facing = point_direction(0, 0, _hor, _ver);
    } else {
        if (sprite_index == spr_player_walk_right) { sprite_index = spr_player_idle_right; }
        else if (sprite_index == spr_player_walk_left) { sprite_index = spr_player_idle_left; }
        else if (sprite_index == spr_player_walk_up) { sprite_index = spr_player_idle_up; }
        else if (sprite_index == spr_player_walk_down) { sprite_index = spr_player_idle_down; }
    }
}

if (keyboard_check_pressed(ord("P"))) {
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage;
}
if (keyboard_check_pressed(ord("O"))) {
    if (has_ammo && trabuco_cooldown_timer <= 0) {
        var _inst = instance_create_depth(x, y, depth, obj_bullet);
        _inst.direction = facing; // Pasar la dirección al proyectil
        _inst.damage = trabuco_damage;
        _inst.tilemap = tilemap; // Pasar el tilemap al proyectil
        
        var _flash = instance_create_depth(x, y, depth, obj_flash);
        _flash.image_angle = facing;
    } else {
        create_dialog([
            {
                name: "Trabuco",
                msg: "No tienes munición!"
            }
        ]);
    }
}

// Reducir el cooldown del trabuco
if (trabuco_cooldown_timer > 0) {
    trabuco_cooldown_timer--;
}