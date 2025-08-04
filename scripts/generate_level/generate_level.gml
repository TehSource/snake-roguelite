function generate_level(_width, _height, _tile_size)
{
    // --- 1. Setup the Grid ---
    var _grid_w = floor(_width / _tile_size);
    var _grid_h = floor(_height / _tile_size);
    var _grid = ds_grid_create(_grid_w, _grid_h);
    ds_grid_set_region(_grid, 0, 0, _grid_w - 1, _grid_h - 1, 1); // 1 = Wall

    // --- 2. Drunkard's Walk Algorithm (Corrected) ---
    var _drunk_x = floor(_grid_w / 2);
    var _drunk_y = floor(_grid_h / 2);
    var _total_steps = 4000; // How many steps the "drunkard" will take.

    // Using a "for" loop guarantees that the loop will end.
    for (var i = 0; i < _total_steps; i++)
    {
        // Mark the current spot as a floor tile.
        _grid[# _drunk_x, _drunk_y] = 0; // 0 = Floor

        // Take a random step
        var _dir = irandom_range(0, 3);
        switch (_dir)
        {
            case 0: _drunk_x++; break; // Right
            case 1: _drunk_x--; break; // Left
            case 2: _drunk_y++; break; // Down
            case 3: _drunk_y--; break; // Up
        }

        // Clamp to stay within the room, with a 1-tile border.
        _drunk_x = clamp(_drunk_x, 1, _grid_w - 2);
        _drunk_y = clamp(_drunk_y, 1, _grid_h - 2);
    }

    // --- 3. Place Wall Instances ---
    for (var i = 0; i < _grid_w; i++)
    {
        for (var j = 0; j < _grid_h; j++)
        {
            if (_grid[# i, j] == 1) // If the grid cell is a wall
            {
                instance_create_layer(i * _tile_size, j * _tile_size, "Instances", obj_wall_basic);
            }
        }
    }
    
    // Clean up the grid from memory
    ds_grid_destroy(_grid);
}
