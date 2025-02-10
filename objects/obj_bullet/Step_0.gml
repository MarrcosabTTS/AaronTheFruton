// Mover el proyectil
move_and_collide(lengthdir_x(speed, direction), lengthdir_y(speed, direction), tilemap);

// Verificar colisión con enemigos
var _collision = instance_place(x, y, obj_enemy_PADRE);
if (_collision != noone) {
    show_debug_message("Colisión detectada con enemigo. Aplicando daño: " + string(damage));
    with (_collision) {
        hp -= other.damage;
        show_debug_message("Vida del enemigo restante: " + string(hp));

        if (alarm[1] < 0) {
            show_debug_message("Aplicando knockback y cambiando color a rojo.");
            image_blend = c_red;
            kb_x = sign(x - other.x);
            kb_y = sign(y - other.y);
            alarm[1] = 20;
        }
    }
       
        instance_destroy(); // Destruir la bala después del impacto
}

// Verificar colisión con paredes
var _wall_collision = instance_place(x, y, tilemap);
if (_wall_collision != noone) {
    show_debug_message("Bala impactó con una pared."); // Depuración
    instance_destroy(); // Destruir la bala al impactar con la pared
}

