// Fragment Shader: shd_flash.fsh
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // Get the original color of the pixel
    vec4 original_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);

    // Output white, but keep the original alpha (transparency)
    gl_FragColor = vec4(1.0, 1.0, 1.0, original_color.a);
}
