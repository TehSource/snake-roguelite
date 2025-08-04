/// @description Initialization
init_health_component(3);
move_speed = 1;
can_attack = true;

// A simple state machine to track if we are normal or dazed
enum ENEMY_STATE {
    IDLE,
    DAZED,
    MOVE,
    ATTACK
}
state = ENEMY_STATE.MOVE;