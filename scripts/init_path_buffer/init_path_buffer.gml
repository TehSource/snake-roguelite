// Script: init_path_buffer
// Initializes the data structure for a circular path history buffer.

function init_path_buffer(_max_length)
{
    // The maximum number of points we can store.
    max_path_length = _max_length;
    
    // The main data store. We initialize it to the max size.
    // Each "slot" will hold the [x, y, direction] data.
    path = array_create(max_path_length, 0);
    
    // A pointer to the "head" of the buffer. This is where we'll write the NEXT piece of data.
    path_head = 0;
}