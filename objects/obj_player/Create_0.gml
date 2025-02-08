move_speed = 1.05;
tilemap = layer_tilemap_get_id("tiles_col");

hp = 10;
hp_total = hp;
damage = 1;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

// Variables del dash
dash_speed = 5.0;
dash_duration = 10;
dash_cooldown = 60;
is_dashing = false;
dash_timer = 0;
dash_cooldown_timer = 0;

// Variable de invencibilidad
is_invincible = false;

function add_xp(_xp_to_add) {
    xp += _xp_to_add;
    if (xp >= xp_require) {
        level++;
        xp -= xp_require;
        xp_require *= 1.4;

        hp_total += 5;
        hp = hp_total;
        create_dialog([
            {
                name: "Level UP",
                msg: $"Has subido de nivel! Tus stats son:\nLVL: {level}\nHP {hp_total}\nDMG {damage}"
            }
        ]);
    }
}

// Variables del trabuco
trabuco_damage = 5;
trabuco_cooldown = 30;
trabuco_cooldown_timer = 0;
has_ammo = false; // Inicialmente sin munición