function generate_level(_width, _height, _tile_size)
{
    // --- 1. Setup the Grid ---
    var _grid_w = floor(_width / _tile_size);
    var _grid_h = floor(_height / _tile_size);
    var _grid = ds_grid_create(_grid_w, _grid_h);
    ds_grid_set_region(_grid, 0, 0, _grid_w - 1, _grid_h - 1, 1); // 1 = Wall

    // --- 2. Drunkard's Walk Algorithm ---
    var _drunk_x = floor(_grid_w / 2);
    var _drunk_y = floor(_grid_h / 2);
    var _total_steps = 4000;
    for (var i = 0; i < _total_steps; i++)
    {
        _grid[# _drunk_x, _drunk_y] = 0; // carve floor
        var _dir = irandom_range(0, 3);
        switch (_dir)
        {
            case 0: _drunk_x++; break;
            case 1: _drunk_x--; break;
            case 2: _drunk_y++; break;
            case 3: _drunk_y--; break;
        }
        _drunk_x = clamp(_drunk_x, 1, _grid_w - 2);
        _drunk_y = clamp(_drunk_y, 1, _grid_h - 2);
    }

    // --- 3. Place Wall Instances ---
    for (var i = 0; i < _grid_w; i++)
    {
        for (var j = 0; j < _grid_h; j++)
        {
            if (_grid[# i, j] == 1)
            {
                instance_create_layer(i * _tile_size, j * _tile_size, "Instances", obj_wall_basic);
            }
        }
    }

    // --- 4. Spawn Enemies on Floor Tiles ---
    var num_basic      = 8; // number of moving enemies
    var num_stationary = 5; // number of stationary enemies

    // Spawn moving enemies
    for (var k = 0; k < num_basic; k++)
    {
        var cell_x, cell_y;
        // Keep picking random cells until we find a floor tile (value 0)
        do {
            cell_x = irandom(_grid_w - 1);
            cell_y = irandom(_grid_h - 1);
        } until (_grid[# cell_x, cell_y] == 0);

        var spawn_x = cell_x * _tile_size + _tile_size / 2;
        var spawn_y = cell_y * _tile_size + _tile_size / 2;
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy_basic);
    }

    // Spawn stationary enemies
    for (var k2 = 0; k2 < num_stationary; k2++)
    {
        var sx, sy;
        do {
            sx = irandom(_grid_w - 1);
            sy = irandom(_grid_h - 1);
        } until (_grid[# sx, sy] == 0);

        var s_xpos = sx * _tile_size + _tile_size / 2;
        var s_ypos = sy * _tile_size + _tile_size / 2;
        instance_create_layer(s_xpos, s_ypos, "Instances", obj_enemy_stationary);
    }

    ds_grid_destroy(_grid);
}
