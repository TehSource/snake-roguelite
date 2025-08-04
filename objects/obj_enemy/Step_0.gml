/// @description Shared enemy state handling

// Check if we should be dazed
enemy_handle_death();

// Stop behavior if dazed
if (state == ENEMY_STATE.DAZED) exit;

// Movement & attack handled in children
