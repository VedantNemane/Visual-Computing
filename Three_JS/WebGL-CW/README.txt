To get started, open up provided HTML file and make sure that browser is correctly set up to access files
on the local machine. A way to identify if this error occurs is to open up "WebGL-Coursework.html"
then pressing F12 to access console. If console returns a CORS error or an error that prevents it
from accessing a local file on the machine then fix this by running a local server or installing 
an extension.

To run the project simply double click or right-click and open with a compatible browser.

Here are the controls (given in the format key -> action):
F -> Show face render of cube
E -> Show wiremesh/edge render of cube
V -> Show vertex render of cube

X -> Rotate cube on (local) X axis
Y -> Rotate cube on (local) Y axis
Z -> Rotate cube on (local) Z axis

Up arrow -> Translate camera forwards
Down arrow -> Translate camera backwards
Left arrow -> Translate camera left
Right arrow -> Translate camera right
PgUp -> Translate camera upwards
PgDn -> Translate camera downwards

A -> Rotate camera clockwise
D -> Rotate camera anti-clockwise
W -> Rotate camera forwards
S -> Rotate camera backwards

I -> Toggle Y axis rotation for bunny

U -> Show wiremesh/edge render of bunny
J -> Show face render of bunny
M -> Show vertex render of bunny

Q -> Show extension task

Use mouse to interact with dat.GUI after toggling Q on.