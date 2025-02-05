# Godot Vector Transform Node
This is a visual shader addon for Godot 4.2+. This adds the `VectorTransform` node to the visual shader editor.
![vectorTransform](https://github.com/user-attachments/assets/a7726863-744a-4b7f-875c-5b90a607014e)


This node transforms the input to different coordinates. E.g. Model Space Coordinates to World Space Coordinates.
# Transform Modes
The input is multiplied by the transformation matrices provided in the [Godot Shader Documentation](https://docs.godotengine.org/en/stable/tutorials/shaders/shader_reference/spatial_shader.html).

    =vec3((MODEL_MATRIX * vec4(%s, 1.0)).xyz);
![vectorTransform2](https://github.com/user-attachments/assets/28034aac-f6ad-4f61-a582-065a68c74ffc)


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
Extract the zip file and copy the folder to your project. You'll need to restart the editor for the node to appear in visual shader.
Alternatively, you can make a new gdscript file and copy the code.
