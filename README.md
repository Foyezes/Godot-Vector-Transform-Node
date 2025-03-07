# Godot Vector Transform Node
This is a visual shader addon for Godot 4.2+. This adds the `VectorTransform` node to the visual shader editor.

![vectorTransform](https://github.com/user-attachments/assets/d3a98b50-90df-41b7-bf9a-a4b81620cc0a)



This node transforms the input to different coordinates. E.g. Model Space Coordinates to World Space Coordinates.
# Transform Modes
The input is multiplied by the transformation matrices provided in the [Godot Shader Documentation](https://docs.godotengine.org/en/stable/tutorials/shaders/shader_reference/spatial_shader.html).

For AxB & BxA

    =vec3((MODEL_MATRIX * vec4(%s, 1.0)).xyz);

For AxB(3x3) & BxA(3x3)

    =vec3((MODEL_MATRIX * vec4(%s, 0.0)).xyz);
    
![vectort1](https://github.com/user-attachments/assets/9e461a48-13d5-434d-9a30-a68d87646c25)



|Transform Mode|MATRIX|
| -----|-------|
|Model Space to World Space|MODEL_MATRIX|
|World Space to Model Space|inverse(MODEL_MATRIX)|
|Model Space to View Space|MODELVIEW_MATRIX|
|View Space to Model Space|inverse(MODELVIEW_MATRIX)|
|World Space to View Space|VIEW_MATRIX|
|View Space to World Space|INV_VIEW_MATRIX |
|View Space to Clip Space|PROJECTION_MATRIX|
|Clip Space to View Space|INV_PROJECTION_MATRIX|


# Installation
You can get it from the [Asset Store](https://godotengine.org/asset-library/asset/3639) in editor.
Or extract the zip file and copy the folder to your project. You'll need to restart the editor for the node to appear in visual shader.
