# Matrixes
Add editable Matrixes (2D Arrays) of several types:
<br>  int / bool / float / Resource
## Installation
The procedure is the same as other Godot plugins. See the [Godot docs](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html) for a full explanation.

1. Click the **AssetLib** tab at the top of the editor and look for Matrixs.
2. Download the plugin and install the contents of the `addons` folder into your project's directory. You don't need any other files.
3. Go to Project -> Project Settings... -> Plugins and enable the plugin by checking "Enable".

## Usage
`@export var matrix : MatrixBool`
<br>Just export the matrix type you want to use.
- MatrixBool
- MatrixInt
- MatrixFloat
- MatrixResource
<br>And edit it in the inspector.
<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/bool_matrix.png?raw=true"/>
Edit its size and values easily!
<br><br>
Matrixes values are accessed through
`matrix.values[y][x]`

## Resource Matrix
The MatrixResource has a special field "Resource Types".<br>
`@export var matrix : MatrixResource`<br>
<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/res-matrix.png?raw=true"/>
<br>This field contains all the types of resources which the matrix can hold.<br>
<br>When changing it, type a list of all acceptable resource types,<br> seperated by commas (,).<br>Whitespaces will be ignored.
<br><br>
**Note that the ResourceMatrix does not allow the editing of contained Resources.**


## Screenshots

<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/bool_matrix.png?raw=true"/>
<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/float-matrix.png?raw=true"/>
<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/res-matrix.png?raw=true"/>
