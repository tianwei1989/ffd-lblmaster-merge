within Buildings.Rooms.Examples.FFD;
model MixedConvectionWithBox
  "simulate mixed convection in a room with a box inside"
   extends Modelica.Icons.Example;
   //extends Buildings.Rooms.Examples.FFD.BaseClasses.PartialRoom(
   //parameter Integer nBloSur=6 "Number of Block surfaces";
   extends Buildings.Rooms.Examples.FFD.Tutorial.MixedConvection(
     roo(
       surBou(
         name={"East Wall","West Wall","North Wall","South Wall","Ceiling","Floor"},
         A={5.7584,5.8804,5.9536,5.9536,5.9536,5.9536},
         til={Buildings.HeatTransfer.Types.Tilt.Wall,
             Buildings.HeatTransfer.Types.Tilt.Wall,
             Buildings.HeatTransfer.Types.Tilt.Wall,
             Buildings.HeatTransfer.Types.Tilt.Wall,
             Buildings.HeatTransfer.Types.Tilt.Ceiling,
             Buildings.HeatTransfer.Types.Tilt.Floor},
         each boundaryCondition=Buildings.Rooms.Types.CFDBoundaryConditions.Temperature),
       cfdFilNam="Resources/Data/Rooms/FFD/MixedConvectionWithBox.ffd"),
     nSurBou=6,
     nOthWal=4,
     TOthWal(each T=300.55),
     TFlo(T=300.05),
     bouIn(m_flow=0.04,T=295.35));
   HeatTransfer.Sources.FixedTemperature Tcei(T=298.95)
    "temperature of ceiling"                                            annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={150,-130})));

equation
  connect(Tcei.port, roo.surf_surBou[5]) annotation (Line(
      points={{140,-130},{96.2,-130},{96.2,-32}},
      color={191,0,0},
      smooth=Smooth.None));

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-80,-160},{220,
            140}}),     graphics),
    __Dymola_Commands(file=
          "modelica://Buildings/Resources/Scripts/Dymola/Rooms/Examples/FFD/MixedConvectionWithBox.mos"
        "Simulate and plot"),
   Documentation(info="<html> 
<p align=\"left\">
</html>", revisions="<html>
<ul>
<li>   
December 31, 2013, by Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"));
end MixedConvectionWithBox;
