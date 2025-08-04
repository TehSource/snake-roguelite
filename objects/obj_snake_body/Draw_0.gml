// --- Damage Flash Effect ---
if (is_flashing)
{
    // Use a special shader to flash white (more efficient than image_blend)

    shader_set(shd_flash);
    draw_self();
    shader_reset();

}
else
{
    draw_self(); // Draw normally
}