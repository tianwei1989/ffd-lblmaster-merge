within Buildings.Rooms.Examples.FFD.Tutorial;
model NaturalConvection "Tutorial for Natural Convection case"
  extends Modelica.Icons.Example;
  package MediumA =
      Buildings.Media.GasesConstantDensity.MoistAirUnsaturated (
        T_default=283.15) "Medium model";
  parameter Integer nConExtWin=0 "Number of constructions with a window";
  parameter Integer nConBou=0
    "Number of surface that are connected to constructions that are modeled inside the room";
  parameter Integer nSurBou=6
    "Number of surface that are connected to the room air volume";
  parameter Integer nConExt=0
    "Number of exterior constructions withour a window";
  parameter Integer nConPar=0 "Number of partition constructions";
  Modelica.Blocks.Sources.Constant qRadGai_flow(k=0) "Radiative heat gain"
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Sources.Constant qConGai_flow(k=0) "Convective heat gain"
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Sources.Constant qLatGai_flow(k=0) "Latent heat gain"
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  inner Modelica.Fluid.System system(T_ambient=283.15)
    annotation (Placement(transformation(extent={{-60,
            -120},{-40,-100}})));
  parameter HeatTransfer.Data.OpaqueConstructions.Generic           matLayRoo1(
      final nLay=1, material={HeatTransfer.Data.Solids.Concrete(x=0.0001)})
    "Construction material for roof"
    annotation (Placement(transformation(extent={{40,62},{60,82}})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam="modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos",
      TDryBul=293.15)
    annotation (Placement(transformation(extent={{120,60},{140,80}})));
  Buildings.Rooms.CFD roo(
   redeclare package Medium = MediumA,
   surBou(
   name={"East Wall","West Wall","North Wall","South Wall","Ceiling","Floor"},
   each A=1*1,
   til={Buildings.HeatTransfer.Types.Tilt.Wall,Buildings.HeatTransfer.Types.Tilt.Wall,
        Buildings.HeatTransfer.Types.Tilt.Wall,Buildings.HeatTransfer.Types.Tilt.Wall,
        Buildings.HeatTransfer.Types.Tilt.Floor,Buildings.HeatTransfer.Types.Tilt.Ceiling},
   each absIR=1e-5,
   each absSol=1e-5,
   boundaryCondition={Buildings.Rooms.Types.CFDBoundaryConditions.Temperature,
       Buildings.Rooms.Types.CFDBoundaryConditions.Temperature,Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate,
       Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate,
       Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate,
       Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate}),
   lat = 0.012787839282646,
   AFlo = 1*1,
   hRoo = 1,
   linearizeRadiation = false,
   useCFD = true,
   sensorName = {"Occupied zone air temperature", "Velocity"},
   cfdFilNam = "Resources/Data/Rooms/FFD/NaturalConvection.ffd",
   nConExt = nConExt,
   nConExtWin = nConExtWin,
   nConPar = nConPar,
   nConBou = nConBou,
   nSurBou = nSurBou,
   samplePeriod = 60,
   T_start=273.15)
  annotation (Placement(transformation(extent={{60,-58},{100,-18}})));
  HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow[nSurBou - 2](each Q_flow=0)
    annotation (Placement(transformation(extent={{26,-102},
            {46,-82}})));
  HeatTransfer.Sources.FixedTemperature           TWesWal(T=274.15)
    "Boundary condition for the west wall" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={130,-110})));
  HeatTransfer.Sources.FixedTemperature           TEasWal(T=273.15)
    "Temperature of east wall"            annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={130,-70})));
equation
  connect(qRadGai_flow.y, multiplex3_1.u1[1]) annotation (Line(
      points={{-39,10},{-10,10},{-10,-23},{-2,-23}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qConGai_flow.y, multiplex3_1.u2[1]) annotation (Line(
      points={{-39,-30},{-2,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qLatGai_flow.y, multiplex3_1.u3[1]) annotation (Line(
      points={{-39,-70},{-12,-70},{-12,-37},{-2,-37}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex3_1.y, roo.qGai_flow) annotation (Line(
      points={{21,-30},{30,-30},{30,-30},{40,-30},{40,-30},{58,-30}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(weaDat.weaBus, roo.weaBus) annotation (Line(
      points={{140,70},{156,70},{156,-20.1},{97.9,-20.1}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(TEasWal.port, roo.surf_surBou[1])
    annotation (Line(
      points={{120,-70},{76.2,-70},{76.2,-52}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TWesWal.port, roo.surf_surBou[2])
    annotation (Line(
      points={{120,-110},{76.2,-110},{76.2,-52}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(fixedHeatFlow[1].port, roo.surf_surBou[3])
    annotation (Line(
      points={{46,-92},{76.2,-92},{76.2,-52}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(fixedHeatFlow[2].port, roo.surf_surBou[4])
    annotation (Line(
      points={{46,-92},{76.2,-92},{76.2,-52}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(fixedHeatFlow[3].port, roo.surf_surBou[5])
    annotation (Line(
      points={{46,-92},{76.2,-92},{76.2,-52}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(fixedHeatFlow[4].port, roo.surf_surBou[6])
    annotation (Line(
      points={{46,-92},{76.2,-92},{76.2,-52}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Documentation(info="<html>
<p>
For the case description, please refer to 
<a href=\"modelica://Buildings.Rooms.Examples.FFD.NaturalConvection\">Buildings.Rooms.Examples.FFD.NaturalConvection</a>.
</p>
<h4>Implementation</h4>
<p>
This section describes step by step how we implemented the model.
</p>
<ol>
<li>
<p> 
Add the following model components into NaturalConvection model:
</p>
<ul>
<li>
<a href=\"modelica://Modelica.Fluid.System\">Modelica.Fluid.System</a>. 
This model provides a basic physical environment for simulation.
</li>
<li>
<a href=\"modelica://Buildings.Rooms.CFD\">Buildings.Rooms.CFD</a>. 
This model is used to implement data exchange between Modelica and FFD. Name it as <code>roo</code>.
</li>
<li>
<a href=\"modelica://Buildings.BoundaryConditions.WeatherData.ReaderTMY3\">Buildings.BoundaryConditions.WeatherData.ReaderTMY3</a>. 
Use weather data from OHare Intl. Airport, Chicago, Illinoi, U.S.A. Name it as <code>weaDat</code>.
</li>
<li>
<a href=\"modelica://Buildings.HeatTransfer.Data.OpaqueConstructions.Generic\">Buildings.HeatTransfer.Data.OpaqueConstructions.Generic</a>. 
This model provides room construction properties. 
Name it as <code>matLayRoo</code>.
</li>
<li>
<a href=\"modelica://Modelica.Blocks.Sources.Constant\">Modelica.Blocks.Sources.Constant</a>. Three models are needed to specify that internal radiation, internal convective heat gain and internal latent heat gain  zero.
Name these models as <code>qRadGai_flow</code>, <code>qConGai_flow</code> and <code>qLatGai_flow</code>, respectively.
</li>
<li>
<a href=\"modelica://Modelica.Blocks.Routing.Multiplex3\">Modelica.Blocks.Routing.Multiplex3</a>. 
This block is used to concentrate three number inputs into one vector output. Name it as <code>multiple_x3</code>.
</li>
<li>
<a href=\"modelica://Buildings.HeatTransfer.Source.FixedTemperature\">Buildings.HeatTransfer.Source.FixedTemperature</a>. 
Two models are needed to specify the temperature on the east and west walls. 
Name them as <code>TeasWal</code> and <code>TwesWal</code>, respectively.
</li>
<li>
<a href=\"modelica://Buildings.HeatTransfer.Source.FixedHeatFlow\">Buildings.HeatTransfer.Source.FixedHeatFlow</a>. 
This model is used to specify that the other four walls are adiabatic. Please note that it is necessary
to claim it as a vector whose number of elements is 4.
Define it as <code>fixedHeatFlow[nSurBou - 2]</code>.
</li>
</ul>
</li>
<li>
<p>
In script mode, add medium and number of surfaces as below:
</p>
<pre>
Buildings.Rooms.CFD roo(
 package MediumA = Buildings.Media.GasesConstantDensity.MoistAirUnsaturated (T_default=283.15);
 parameter Integer nConExtWin=0;
 parameter Integer nConBou=0;
 parameter Integer nSurBou=6;
 parameter Integer nConExt=0;
 parameter Integer nConPar=0;
</pre>
</li>
<li>
<p>
Edit <code>roo</code> as below:
</p>
<pre>
redeclare package Medium = MediumA,
surBou(
 name={\"East Wall\",\"West Wall\",\"North Wall\",\"South Wall\",\"Ceiling\",\"Floor\"},
 each A=1*1,
 til={Buildings.HeatTransfer.Types.Tilt.Wall,
      Buildings.HeatTransfer.Types.Tilt.Wall,
      Buildings.HeatTransfer.Types.Tilt.Wall,
      Buildings.HeatTransfer.Types.Tilt.Wall,
      Buildings.HeatTransfer.Types.Tilt.Ceiling,
      Buildings.HeatTransfer.Types.Tilt.Floor},
 each absIR=1e-5,
 each absSol=1e-5,
 boundaryCondition={
      Buildings.Rooms.Types.CFDBoundaryConditions.Temperature,
      Buildings.Rooms.Types.CFDBoundaryConditions.Temperature,
      Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate,
      Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate,
      Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate,
      Buildings.Rooms.Types.CFDBoundaryConditions.HeatFlowRate}),
 lat = 0.012787839282646,
 AFlo = 1*1,
 hRoo = 1,
 linearizeRadiation = false,
 useCFD = true,
 sensorName = {\"Occupied zone air temperature\", \"Velocity\"},
 cfdFilNam = \"Resources/Data/Rooms/FFD/NaturalConvection.ffd\",
 nConExt = nConExt,
 nConExtWin = nConExtWin,
 nConPar = nConPar,
 nConBou = nConBou,
 nSurBou = nSurBou,
 T_start=273.15,
 samplePeriod = 60);
</pre>
</li>
<li>
<p>
Edit <code>matLayRoo</code> as below:
</p>
<pre>
parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic matLayRoo(
 final nLay=1, material={HeatTransfer.Data.Solids.Concrete(x=0.0001)});
</pre>
</li> 
<li>
<p>
Connect components as shown in below figure.
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/Rooms/Examples/FFD/NaturalConvectionTutorialModel.png\"/> 
</p>
</li>
<li>
Set the values for components:
<ul>
<li>
Set <code>qRadGai_flow</code>, <code>qConGai_flow</code> and <code>qLatGai_flow</code> to 0. 
</li>
<li>
Set <code>fixedHeatFlow</code> to 0. 
</li>
<li>
Set <code>TeasWal</code> to 273.15.
</li>
<li>
Set <code>TwesWal</code> to 274.15.
</li>
</ul>
</li>
<li>
Use Simplified CFD Interface (SCI) to generate geometry input file for FFD. 
<ul>
<li>
The length in X Y and Z is 1 m respectively. Use 20X20X20 uniform grids.
</li>
<li>
Set the time step size as 10 seconds. 
</li>
<li>
Generate the input files which are by default name as <code>input.cfd</code> (mesh file) and <code>zeroone.dat</code> (information for obstacles).
</li>
<li>
Rename the files as <code>NaturalConvection.cfd</code> and <code>NaturalConvection.dat</code>, respectively.
</li>
</ul>
</li>
<li>
Revise the FFD parameter input file <code>NaturalConvection.ffd</code> (example file already in <code>Buildings/Resources/Data/Rooms/FFD/</code>):     
<pre>
 inpu.parameter_file_format SCI
 inpu.parameter_file_name Resources/Data/Rooms/FFD/NaturalConvection.cfd 
 inpu.block_file_name Resources/Data/Rooms/FFD/NaturalConvection.dat
 prob.nu 1.5e-5 // Kinematic viscosity
 prob.rho 1 // Density
 prob.gravx 0 // Gravity in x direction
 prob.gravy 0 // Gravity in y direction
 prob.gravz -0.01 // Gravity in z direction
 prob.cond 0.02 // Conductivity
 prob.Cp 1000.0 // Specific heat capacity
 prob.beta 3e-3 // Thermal expansion coefficient
 prob.diff 0.00001 // Diffusivity for contaminants
 prob.alpha 2e-5 // Thermal diffusivity
 prob.coeff_h 0.0004 // Convective heat transfer coefficient near the wall
 prob.Temp_Buoyancy 0.0 // Reference temperature for calculating buoyance force
 init.T 0.0 // Initial condition for Temperature
 init.u 0.0 // Initial condition for velocity u
 init.v 0.0 // Initial condition for velocity v
 init.w 0.0 // Initial condition for velocity w
</pre>
<p>
Please note that some of the physical properties were set to obtained the desired Rayleigh Number of 1E5.
</p>
</li>
<li>
Put <Code>NaturalConvection.ffd</code>, <Code>NaturalConvection.dat</code>, and <Code>NaturalConvection.cfd</code> at <code>Buildings/Resources/Data/Rooms/FFD/</code>.
</li>
<li>
Set simulation stop time to 7200 seconds and choose Radau solver. 
</li>
<li>
Translate the model and start the simulation.
</li> 
</ol>
</html>",revisions="<html>
<ul>
<li>
June 27, 2014, by Wei Tian, Thomas Sevilla, Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"),
    __Dymola_Commands(file=
     "modelica://Buildings/Resources/Scripts/Dymola/Rooms/Examples/FFD/Tutorial/NaturalConvection.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(extent={{-100,-180},{
            240,100}},
          preserveAspectRatio=false), graphics));
end NaturalConvection;