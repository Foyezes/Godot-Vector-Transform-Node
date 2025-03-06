# This node was created by Foyezes
# x.com/Foyezes
# bsky.app/profile/foyezes.bsky.social

@tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeVectorTransform

func _get_name():
	return "VectorTransform"
func _get_category():
	return "Transform"
func _get_description():
	return "Converts VERTEX from View Space to World Space"
func _get_input_port_count():
	return 1
func _get_input_port_name(port):
	return ""
func _get_input_port_type(port):
	return VisualShaderNode.PORT_TYPE_VECTOR_3D
func _get_output_port_count():
	return 1
func _get_output_port_name(port):
	return ""
func _get_output_port_type(port):
	return VisualShaderNode.PORT_TYPE_VECTOR_3D
func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR_3D
func _get_property_count():
	return 3
func _get_property_default_index(index):
	match index:
		0:
			return 0
		1:
			return 0
		2:
			return 0
func _get_property_name(index):
	match index:
		0:
			return "Input"
		1:
			return "Output"
		2:
			return "Method"
func _get_property_options(index):
	match index:
		0:
			return ["Model Space", "World Space", "View Space", "Clip Space"]
		1:
			var input = get_option_index(0)
			match input:
				0:
					return ["World Space", "View Space"]
				1:
					return ["Model Space", "View Space"]
				2:
					return ["Model Space", "World Space", "Clip Space"]
				3:
					return ["View Space"]
		2:
			return ["AxB", "BxA", "AxB(3x3)", "BxA(3x3)"]

func _get_code(input_vars, output_vars, mode, type):
	var input = get_option_index(0)
	var output = get_option_index(1)
	var method = get_option_index(2)
	match [input, output, method]:
		#AxB
		[0, 0, 0]:#Model Space to World Space
			return output_vars[0] + "=vec3((MODEL_MATRIX * vec4(%s, 1.0)).xyz);" % input_vars[0]
		[1, 0, 0]:#World Space to Model Space
			return output_vars[0] + "=vec3(((inverse(MODEL_MATRIX)) * vec4(%s, 1.0)).xyz);" % input_vars[0]
		[0, 1, 0]:#Model Space to View Space
			return output_vars[0] + "=vec3((MODELVIEW_MATRIX * vec4(%s, 1.0)).xyz);" % input_vars[0]
		[2, 0, 0]:#View Space to Model Space
			return output_vars[0] + "=vec3(((inverse(MODELVIEW_MATRIX)) * vec4(%s, 1.0)).xyz);" % input_vars[0]
		[1, 1, 0]:#World Space to View Space
			return output_vars[0] + "=vec3((VIEW_MATRIX * vec4(%s, 1.0)).xyz);" % input_vars[0]
		[2, 1, 0]:#View Space to World Space
			return output_vars[0] + "=vec3((INV_VIEW_MATRIX * vec4(%s, 1.0)).xyz);" % input_vars[0]
		[2, 2, 0]:#View Space to Clip Space
			return output_vars[0] + "=vec3((PROJECTION_MATRIX * vec4(%s, 1.0)).xyz);" % input_vars[0]
		[3, 0, 0]:#Clip Space to View Space
			return output_vars[0] + "=vec3((INV_PROJECTION_MATRIX * vec4(%s, 1.0)).xyz);" % input_vars[0]
			
		#BxA
		[0, 0, 1]:  # Model Space to World Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * MODEL_MATRIX).xyz);" % input_vars[0]
		[1, 0, 1]:  # World Space to Model Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * inverse(MODEL_MATRIX)).xyz);" % input_vars[0]
		[0, 1, 1]:  # Model Space to View Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * MODELVIEW_MATRIX).xyz);" % input_vars[0]
		[2, 0, 1]:  # View Space to Model Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * inverse(MODELVIEW_MATRIX)).xyz);" % input_vars[0]
		[1, 1, 1]:  # World Space to View Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * VIEW_MATRIX).xyz);" % input_vars[0]
		[2, 1, 1]:  # View Space to World Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * INV_VIEW_MATRIX).xyz);" % input_vars[0]
		[2, 2, 1]:  # View Space to Clip Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * PROJECTION_MATRIX).xyz);" % input_vars[0]
		[3, 0, 0]:  # Clip Space to View Space
			return output_vars[0] + "=vec3((vec4(%s, 1.0) * INV_PROJECTION_MATRIX).xyz);" % input_vars[0]
		
		#AxB(3x3)
		[0, 0, 2]:#Model Space to World Space
			return output_vars[0] + "=vec3((MODEL_MATRIX * vec4(%s, 0.0)).xyz);" % input_vars[0]
		[1, 0, 2]:#World Space to Model Space
			return output_vars[0] + "=vec3(((inverse(MODEL_MATRIX)) * vec4(%s, 0.0)).xyz);" % input_vars[0]
		[0, 1, 2]:#Model Space to View Space
			return output_vars[0] + "=vec3((MODELVIEW_MATRIX * vec4(%s, 0.0)).xyz);" % input_vars[0]
		[2, 0, 2]:#View Space to Model Space
			return output_vars[0] + "=vec3(((inverse(MODELVIEW_MATRIX)) * vec4(%s, 0.0)).xyz);" % input_vars[0]
		[1, 1, 2]:#World Space to View Space
			return output_vars[0] + "=vec3((VIEW_MATRIX * vec4(%s, 0.0)).xyz);" % input_vars[0]
		[2, 1, 2]:#View Space to World Space
			return output_vars[0] + "=vec3((INV_VIEW_MATRIX * vec4(%s, 0.0)).xyz);" % input_vars[0]
		[2, 2, 2]:#View Space to Clip Space
			return output_vars[0] + "=vec3((PROJECTION_MATRIX * vec4(%s, 0.0)).xyz);" % input_vars[0]
		[3, 0, 2]:#Clip Space to View Space
			return output_vars[0] + "=vec3((INV_PROJECTION_MATRIX * vec4(%s, 0.0)).xyz);" % input_vars[0]
			
		#BxA(3x3)
		[0, 0, 3]:  # Model Space to World Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * MODEL_MATRIX).xyz);" % input_vars[0]
		[1, 0, 3]:  # World Space to Model Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * inverse(MODEL_MATRIX)).xyz);" % input_vars[0]
		[0, 1, 3]:  # Model Space to View Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * MODELVIEW_MATRIX).xyz);" % input_vars[0]
		[2, 0, 3]:  # View Space to Model Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * inverse(MODELVIEW_MATRIX)).xyz);" % input_vars[0]
		[1, 1, 3]:  # World Space to View Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * VIEW_MATRIX).xyz);" % input_vars[0]
		[2, 1, 3]:  # View Space to World Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * INV_VIEW_MATRIX).xyz);" % input_vars[0]
		[2, 2, 3]:  # View Space to Clip Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * PROJECTION_MATRIX).xyz);" % input_vars[0]
		[3, 0, 3]:  # Clip Space to View Space
			return output_vars[0] + "=vec3((vec4(%s, 0.0) * INV_PROJECTION_MATRIX).xyz);" % input_vars[0]
