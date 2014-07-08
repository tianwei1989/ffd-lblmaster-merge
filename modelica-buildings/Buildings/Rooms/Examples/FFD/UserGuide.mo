within Buildings.Rooms.Examples.FFD;
package UserGuide
  extends Modelica.Icons.Information;
  annotation (preferredView="info",
  Documentation(info="<html>
<h4>Introduction</h4>
<p>
For the introduction of coupled simulation and the detailed information
of <a href=\"modelica://Buildings.Rooms.CFD\">Buildings.Rooms.CFD</a>,
please refer to <a href=\"modelica://Buildings.Rooms.UsersGuide.CFD\">Buildings.Rooms.UsersGuide.CFD</a>.
For the step by step guide on performing the coupled simulation, please refer to <a href=\"modelica://Buildings.Rooms.Examples.FFD.Tutorial\">Buildings.Rooms.Examples.FFD.Tutorial</a>.
</p>
<h4>Files for the Coupled Simulation</h4>
<p>
The source code of the FFD program is located at <code>Buildings/Resources/src/FastFluidDynamics</code>.
</p>
<p>
To run the coupled simulation with FFD, the following files are needed that are given in the library:
</p>
<ul>
<li>
dynamic linker files located at <code>Buildings/Resources/bin/</code>: 
<ul>
<li>
Windows: <code>FFD-DLL.dll</code> and <code>FFD-DLL.lib</code>
</li>
<li>
Linux: <code>FFD-DLL.so</code>
</li>
</ul>
</li>
<li>
FFD input file for simulation parameter *.ffd located at <code>Buildings/Resources/Data/Rooms/FFD/</code>
</li>
<li>
geometry files *.cfd (mesh file) and *.dat (property of obstacles) generated by SCI_FFD.
</li>
</ul>
<h4>Install GLUT</h4>
The FFD uses GLUT for visualization and the glut library is needed to compile the FFD code. 
However, current version does not support the visualization feature for the coupled simulation.  
<p>
<ul>
<li>
In Windows: 
<ol>
<li>
go to <code>Buildings/Resources/src/FastFluidDynamics/</code>. 
</li>
<li>
right-click <code>Install Glut.bat</code> 
</li>
<li>
run as administrator
</li>
</ol>
</li>
<li>
In Linux (Ubuntu): 
<ol>
<li>
open console 
</li>
<li>
type <code> sudo apt-cache search freeGLUT</code> to search latest version
</li>
<li>
type <code>sudo apt-get install freeglut3-dev:i386</code> to install GLUT
</li>
</ol>
</li>
</ul>
</p>
<h4>Build Dynamic Linker</h4>
<p>
The FFD program can be compiled into a dynamic linker using Microsoft Visual Studio Express in Windows and GCC in Linux. 
<ul>
<li>
In Windows: 
<ol>
<li>
go to <code>Buildings/Resources/src/FastFluidDynamics/</code>
</li>
<li>
double click <code>compile.bat</code>
</li>
</ol>
</li>
<li>
In Linux: 
<ol>
<li>
open console
</li>
<li>
change directory to <code>Buildings/Resources/src/FastFluidDynamics/</code>
</li>
<li>
type <code>make all</code>
</li>
</ol>
</li>
</ul>
The dynamic linkers are stored in <code>Buildings/Resources/bin</code>.
</p>
</html>"));
end UserGuide;
