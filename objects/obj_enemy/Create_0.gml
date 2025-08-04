/// @description Shared enemy setup

// Health
if (!variable_instance_exists(self, "base_hp")) base_hp = 3;
init_health_component(base_hp);

// State Machine
enum ENEMY_STATE { IDLE, MOVE, ATTACK, DAZED }
state = ENEMY_STATE.MOVE;

// Attack and Behavior
can_attack = true;
attack_range = 200;

// Reward
reward_type = "none";