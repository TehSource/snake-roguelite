// Script: snake_add_segment
// Creates a new body segment and correctly inserts it before the tail.
// Arguments:
//   _head_id: The instance id of the snake's head (e.g., obj_snake_head)

function snake_add_segment(_head_id)
{
    // Create the new segment at the head's current position
    var _new_segment = instance_create_layer(_head_id.x, _head_id.y, "Instances", obj_snake_body);

    // Find what was previously the last link in the chain
    var _last_link = _head_id;
    if (array_length(_head_id.body_segments) > 0)
    {
        // If segments exist, the last link is the one at the end of the list
        _last_link = _head_id.body_segments[array_length(_head_id.body_segments) - 1];
    }

    // Tell the new segment to follow the last link
    _new_segment.target = _last_link;

    // Tell the tail to now follow our new segment
    if (instance_exists(_head_id.tail))
    {
        _head_id.tail.target = _new_segment;
    }

    // Add the new segment to the head's list for tracking
    array_push(_head_id.body_segments, _new_segment);
}