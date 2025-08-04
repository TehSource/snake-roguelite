
// Script: snake_destroy_segment
// Safely removes a segment from the snake and relinks the chain
// Arguments:
//  _head_id: instance id of head
//  _segment_id: instance id of segment to destroy


function snake_destroy_segment(_head_id, _segment_id)
{
    // Find the segment in the head's list
    var _index = array_get_index(_head_id.body_segments, _segment_id);

    // Exit if the segment isn't in the list (safety check)
    if (_index == -1) { return; }

    // Find what was in front of the destroyed segment
    // If it was the first segment, the head was in front.
    var _previous_link = (_index > 0) ? _head_id.body_segments[_index - 1] : _head_id;

    // Find what was behind the destroyed segment
    // If it was the last segment, the tail was behind.
    var _next_link = (_index < array_length(_head_id.body_segments) - 1) ? _head_id.body_segments[_index + 1] : _head_id.tail;

    // Re-link the chain by telling the next link to follow the previous one
    if (instance_exists(_next_link))
    {
        _next_link.target = _previous_link;
    }

    // Remove the segment from the list and destroy its instance
    array_delete(_head_id.body_segments, _index, 1);
    instance_destroy(_segment_id);
}