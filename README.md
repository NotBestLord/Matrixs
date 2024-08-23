# Matrixes
Add editable Matrixes (2D Arrays) of several types:
<br>  int / bool / float / Resource
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

## Resource Matrix
The MatrixResource has a special field "Resource Types".<br>
`@export var matrix : MatrixResource`<br>
<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/res-matrix.png?raw=true"/>
<br>This field contains all the types of resources which the matrix can hold.<br>
<br>When changing it, type a list of all acceptable resource types,<br> seperated by commas (,).<br>Whitespaces will be ignored.

## Screenshots

<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/bool_matrix.png?raw=true"/>
<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/float-matrix.png?raw=true"/>
<img src="https://github.com/NotBestLord/Matrixs/blob/master/screenshots/res-matrix.png?raw=true"/>
