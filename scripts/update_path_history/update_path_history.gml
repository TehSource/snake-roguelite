// Script: update_path_history
// Writes the instance's current position into the circular buffer.

function update_path_history()
{
    // Write our data into the array at the current head position.
    path[path_head] = [x, y, direction];
    
    // Move the head to the next spot, wrapping around if we reach the end.
    // This is the "circular" part of the buffer.
    path_head = (path_head + 1) % max_path_length;
}