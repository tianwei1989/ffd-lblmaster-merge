within Buildings.Rooms.Examples.FFD;
package UserGuide
  extends Modelica.Icons.Information;
  annotation (preferredView="info",
  Documentation(info="<html>
<h4>Introduction</h4>
<p>
For the introduction of coupled simulation and the detailed information
of <a href=\"modelica://Buildings.Rooms.CFD\">Buildings.Rooms.CFD</a>,
please refer to <a href=\"modelica://Buildings/Resources/Images/Rooms/Examples/FFD/Zuo2014.pdf\"/>Zuo 2014.
</p>
<h4>Software Installation</h4>
<p>
In Windows, please make sure Microsoft Visual Studio Express is installed. In Linux, please make sure GCC is installed.
</p>
<h4>Install GLUT</h4>
<p>
In Windows please go to <code>/Buildings/Resources/src/FastFluidDynamics/</code> and 
right-click <code>Install Glut.bat</code> and run as administrator. 
</p>
<p>
In Linux, first open console and type <code> sudo apt-cache search freeGLUT</code> to search latest version. Then, type
<code>sudo apt-get install freeglut3-dev:i386</code> to install GLUT.
</p>
<h4>Build Dynamic Link Library</h4>
<p>
In Windows please go to <code>/Buildings/Resources/src/FastFluidDynamics/</code> and 
double click <code>compile.bat</code>.. In Linux, after opening console, first change 
directory to <code>/Buildings/Resources/src/FastFluidDynamics/</code> , and then type <code>make all</code>.
The Dynamic Link Library is stored in<code>/Buildings/Resources/bin</code> .
</p>
<h4>References</h4>
<p>
<a NAME=\"ZUO2010\"/> 
Wangda Zuo. Coupled Simulation of Indoor Environment, HVAC and Control System by Using Fast Fluid Dynamics and the Modelica Buildings Library. ASHRAE/IBPSA-USA Building Simulation Conference, 2014</
</p>
</html>"));
end UserGuide;
