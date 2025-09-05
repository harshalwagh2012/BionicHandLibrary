package BionicHand
  annotation (version="1.0.0", uses(Modelica(version="4.0.0"), ModelicaServices(version="4.0.0")));
  model Testspace
    inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n(displayUnit="1") = {0,0,-1}, axisLength(displayUnit="cm") = 0.1, axisDiameter(displayUnit="cm") = 0.04) annotation (Placement(transformation(extent={{-10.0001,-10},{10,10}}, rotation=90, origin={51,-154})));
    Finger.Middle middle
      annotation (Placement(transformation(extent={{28,0},{48,20}})));
    Finger.Ring ring
      annotation (Placement(transformation(extent={{54,0},{74,20}})));
    Finger.Baby baby
      annotation (Placement(transformation(extent={{80,0},{100,20}})));
    Finger.Index index(fixedShape(length=0.02, width=0.01, height=0.01))
      annotation (Placement(transformation(extent={{2,0},{22,20}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b MCP
      annotation (Placement(transformation(extent={{0,100},{20,120}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b PIP
      annotation (Placement(transformation(extent={{30,100},{50,120}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b DIP
      annotation (Placement(transformation(extent={{60,100},{80,120}})));
    Palm palm annotation (Placement(transformation(extent={{2,-104},{22,-84}})));
    Wrist wrist(fixedShape(length=0.07))
      annotation (Placement(transformation(extent={{41,-140},{61,-120}})));
    Control_system.MCP mCP
      annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    Control_system.PIP pIP
      annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
    Control_system.DIP dIP
      annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
    Control_system.Wrist wrist1 annotation (Placement(transformation(extent={{-60,-140},{-40,-120}})));
  equation
    connect(MCP, index.flange_a2) annotation (Line(points={{10,110},{10,78},{-4,78},{-4,4},{2,4},{2,4.4}}, color={0,0,0}));
    connect(MCP, middle.flange_a2) annotation (Line(points={{10,110},{10,78},{24,78},{24,4.4},{28,4.4}}, color={0,0,0}));
    connect(MCP, ring.flange_a2) annotation (Line(points={{10,110},{10,78},{50,78},{50,4},{54,4},{54,4.4}}, color={0,0,0}));
    connect(MCP, baby.flange_a2) annotation (Line(points={{10,110},{10,78},{76,78},{76,4.4},{80,4.4}}, color={0,0,0}));
    connect(PIP, index.flange_a1) annotation (Line(points={{40,110},{40,82},{-2,82},{-2,10.2},{2,10.2}}, color={0,0,0}));
    connect(PIP, middle.flange_a1) annotation (Line(points={{40,110},{40,82},{26,82},{26,10.2},{28,10.2}}, color={0,0,0}));
    connect(PIP, ring.flange_a1) annotation (Line(points={{40,110},{40,82},{52,82},{52,10},{54,10},{54,10.2}}, color={0,0,0}));
    connect(baby.flange_a1, PIP) annotation (Line(points={{80,10.2},{78,10.2},{78,82},{40,82},{40,110}}, color={0,0,0}));
    connect(DIP, index.flange_a) annotation (Line(points={{70,110},{70,86},{0,86},{0,16.4},{2,16.4}}, color={0,0,0}));
    connect(middle.flange_a, DIP) annotation (Line(points={{28,16.4},{28,86},{70,86},{70,110}}, color={0,0,0}));
    connect(ring.flange_a, DIP) annotation (Line(points={{54,16.4},{54,86},{70,86},{70,110}}, color={0,0,0}));
    connect(baby.flange_a, DIP) annotation (Line(points={{80,16.4},{80,86},{70,86},{70,110}}, color={0,0,0}));
    connect(palm.frame_a1, middle.frame_a) annotation (Line(points={{37.2,-2.6},{37.2,-8.88178e-16},{37.8,-8.88178e-16}}, color={95,95,95}, thickness=0.5));
    connect(palm.frame_a2, ring.frame_a) annotation (Line(points={{64.2,-2.6},{64.2,-2},{64,-2},{64,0},{63.8,0}}, color={95,95,95}, thickness=0.5));
    connect(baby.frame_a, palm.frame_a3) annotation (Line(points={{89.8,0},{89.8,-2},{90,-2},{90,-2.2},{88.8,-2.2}}, color={95,95,95}, thickness=0.5));
    connect(index.frame_a, palm.frame_a) annotation (Line(points={{11.8,0},{11.8,-2},{14,-2},{14,-2.4},{11.8,-2.4}}, color={95,95,95}, thickness=0.5));
    connect(wrist.frame_a1, palm.frame_a4) annotation (Line(points={{51,-120},{51.4,-120},{51.4,-104}}, color={95,95,95}, thickness=0.5));
    connect(wrist.frame_a, world.frame_b) annotation (Line(points={{51,-140},{51,-140},{51,-144},{51,-144}}, color={95,95,95}, thickness=0.5));
    connect(dIP.flange_a, DIP) annotation (Line(points={{-40,89.8},{-22,89.8},{-22,126},{70,126},{70,110}}, color={0,0,0}));
    connect(pIP.flange_a, PIP) annotation (Line(points={{-40,50.8},{-20,50.8},{-20,124},{40,124},{40,110}}, color={0,0,0}));
    connect(mCP.flange_a, MCP) annotation (Line(points={{-40,10},{-18,10},{-18,122},{10,122},{10,110}}, color={0,0,0}));
    connect(wrist1.flange_a, wrist.flange_a) annotation (Line(points={{-40,-130},{29,-130},{29,-130},{41,-130}}, color={0,0,0}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-68,120},{-30,-154}}, lineColor={255,0,0}, fillColor={255,255,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0)}), Icon(coordinateSystem(preserveAspectRatio=false)));
  end Testspace;

  model Finger
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false)));
    model Index
      Modelica.Mechanics.MultiBody.Parts.BodyShape Proxima_Phalanx3(animateSphere=true, r(displayUnit="cm") = {0,0,0.02}, r_CM(displayUnit="cm") = {0,0,0.01}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-121.308})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Middle_Phalanx3(r(displayUnit="cm") = {0,0,0.02}, r_CM(displayUnit="cm") = {0,0,0.01}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={16,-68})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Distal_Phalanx3(r(displayUnit="cm") = {0,0,0.025}, r_CM(displayUnit="cm") = {0,0,0.0125}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={16,-10})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute9(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-95.3084})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute10(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-147.308})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute11(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-37.3084})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-92,-44},{-72,-24}}), iconTransformation(extent={{-110,54},{-90,74}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a1 annotation (Placement(transformation(extent={{-90,-102},{-70,-82}}), iconTransformation(extent={{-110,-8},{-90,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a2 annotation (Placement(transformation(extent={{-88,-156},{-68,-136}}), iconTransformation(extent={{-110,-66},{-90,-46}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=90, origin={16,-202}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={-2,-100})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(shapeType="cylinder", length(displayUnit="cm") = 0.02, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{106,-128},{126,-108}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{62,-134},{86,-110}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1(shapeType="cylinder", length(displayUnit="cm") = 0.02, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{108,-86},{128,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(n(displayUnit="1") = {0,1,0}, angle=90)
        annotation (Placement(transformation(extent={{66,-84},{90,-60}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape2(shapeType="cylinder", length(displayUnit="cm") = 0.025,width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{98,-26},{118,-6.0004}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{46,-14},{70,9.9996}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Proxima_Phalanx1(animateSphere=true, r(displayUnit="cm") = {0,0,0.01}, r_CM(displayUnit="cm") = {0,0,0.005}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={16,-176})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape3(shapeType="cylinder", length(displayUnit="cm") = 0.01, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{126,-176},{146,-156}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{60,-182},{84,-158}})));
    equation
      connect(revolute9.frame_a, Proxima_Phalanx3.frame_b) annotation (Line(points={{15.8786,-105.308},{15.8786,-105.308},{15.8786,-111.308},{15.8786,-111.308}}, color={95,95,95}, thickness=0.5));
      connect(revolute9.frame_b, Middle_Phalanx3.frame_a) annotation (Line(points={{15.8786,-85.3084},{15.8786,-78},{16,-78}}, color={95,95,95}, thickness=0.5));
      connect(revolute10.frame_b, Proxima_Phalanx3.frame_a) annotation (Line(points={{15.8786,-137.308},{15.8786,-131.308},{15.8786,-131.308}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_b, Distal_Phalanx3.frame_a) annotation (Line(points={{15.8786,-27.3084},{16.4606,-27.3084},{16.4606,-20},{16,-20}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_a, Middle_Phalanx3.frame_b) annotation (Line(points={{15.8786,-47.3084},{15.8786,-47.3084},{15.8786,-58},{16,-58}}, color={95,95,95}, thickness=0.5));
      connect(flange_a, revolute11.axis) annotation (Line(points={{-82,-34},{-68,-34},{-68,-37.3084},{5.8786,-37.3084}}, color={0,0,0}));
      connect(flange_a1, revolute9.axis) annotation (Line(points={{-80,-92},{-36,-92},{-36,-95.3084},{5.8786,-95.3084}}, color={0,0,0}));
      connect(flange_a2, revolute10.axis) annotation (Line(points={{-78,-146},{-18,-146},{-18,-147.308},{5.8786,-147.308}}, color={0,0,0}));
      connect(fixedRotation.frame_b, fixedShape.frame_a) annotation (Line(points={{86,-122},{94,-122},{94,-118},{106,-118}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation.frame_a, Proxima_Phalanx3.frame_b) annotation (Line(points={{62,-122},{42,-122},{42,-111.308},{15.8786,-111.308}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation2.frame_a, Distal_Phalanx3.frame_b) annotation (Line(points={{46,-2.0002},{38,-2.0002},{38,0},{16,0}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation2.frame_b, fixedShape2.frame_a) annotation (Line(points={{70,-2.0002},{94,-2.0002},{94,-16.0002},{98,-16.0002}}, color={95,95,95}, thickness=0.5));
      connect(Middle_Phalanx3.frame_b, fixedRotation1.frame_a) annotation (Line(points={{16,-58},{16,-54},{66,-54},{66,-72}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation1.frame_b, fixedShape1.frame_a) annotation (Line(points={{90,-72},{100,-72},{100,-76},{108,-76}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx1.frame_a, frame_a) annotation (Line(points={{16,-186},{16,-186},{16,-202}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx1.frame_b, revolute10.frame_a) annotation (Line(points={{16,-166},{15.8786,-166},{15.8786,-157.308}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx1.frame_b, fixedRotation3.frame_a) annotation (Line(points={{16,-166},{16,-164},{60,-164},{60,-170}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation3.frame_b, fixedShape3.frame_a) annotation (Line(points={{84,-170},{108,-170},{108,-166},{126,-166}}, color={95,95,95}, thickness=0.5));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-54,42},{-34,-58}}, lineColor={0,0,0}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-24,56},{-4,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{8,40},{24,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{36,30},{52,-56}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,300},{100,100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,500},{100,300}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0)}));
    end Index;

    model Middle
      Modelica.Mechanics.MultiBody.Parts.BodyShape Proxima_Phalanx3(animateSphere=true, r(displayUnit="cm") = {0,0,0.025}, r_CM(displayUnit="cm") = {0,0,0.0125}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={15.8786,-121.308})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Middle_Phalanx3(r(displayUnit="cm") = {0,0,0.025}, r_CM(displayUnit="cm") = {0,0,0.0125}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-67.3084})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Distal_Phalanx3(r(displayUnit="cm") = {0,0,0.025}, r_CM(displayUnit="cm") = {0,0,0.0125}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={16,-10})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute9(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-95.3084})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute10(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-147.308})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute11(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-37.3084})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-92,-44},{-72,-24}}), iconTransformation(extent={{-110,54},{-90,74}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a1 annotation (Placement(transformation(extent={{-90,-102},{-70,-82}}), iconTransformation(extent={{-110,-8},{-90,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a2 annotation (Placement(transformation(extent={{-88,-156},{-68,-136}}), iconTransformation(extent={{-110,-66},{-90,-46}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=90, origin={16,-202}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={-2,-100})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Proxima_Phalanx1(animateSphere=true, r(displayUnit="cm") = {0,0,0.02}, r_CM(displayUnit="cm") = {0,0,0.01}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={16,-176})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1(shapeType="cylinder", length(displayUnit="cm") = 0.02, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{94,-176},{114,-156}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{58,-178},{82,-154}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{58,-124},{82,-100}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape2(shapeType="cylinder", length(displayUnit="cm") = 0.025, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{94,-122},{114,-102}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(n(displayUnit="1") = {0,1,0}, angle=90)
        annotation (Placement(transformation(extent={{58,-70},{82,-46}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape3(shapeType="cylinder", length(displayUnit="cm") = 0.025, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01)
        annotation (Placement(transformation(extent={{94,-68},{114,-48}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation4(n(displayUnit="1") = {0,1,0}, angle=90)
        annotation (Placement(transformation(extent={{56,-12},{80,12}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape4(shapeType="cylinder", length(displayUnit="cm") = 0.025, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01)
        annotation (Placement(transformation(extent={{92,-10},{112,10}})));
    equation
      connect(revolute9.frame_a, Proxima_Phalanx3.frame_b) annotation (Line(points={{15.8786,-105.308},{15.8786,-105.308},{15.8786,-111.308},{15.8786,-111.308}}, color={95,95,95}, thickness=0.5));
      connect(revolute9.frame_b, Middle_Phalanx3.frame_a) annotation (Line(points={{15.8786,-85.3084},{15.8786,-77.3084},{15.8786,-77.3084}}, color={95,95,95}, thickness=0.5));
      connect(revolute10.frame_b, Proxima_Phalanx3.frame_a) annotation (Line(points={{15.8786,-137.308},{15.8786,-131.308},{15.8786,-131.308}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_b, Distal_Phalanx3.frame_a) annotation (Line(points={{15.8786,-27.3084},{16.4606,-27.3084},{16.4606,-20},{16,-20}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_a, Middle_Phalanx3.frame_b) annotation (Line(points={{15.8786,-47.3084},{15.8786,-47.3084},{15.8786,-57.3084},{15.8786,-57.3084}}, color={95,95,95}, thickness=0.5));
      connect(flange_a, revolute11.axis) annotation (Line(points={{-82,-34},{-68,-34},{-68,-37.3084},{5.8786,-37.3084}}, color={0,0,0}));
      connect(flange_a1, revolute9.axis) annotation (Line(points={{-80,-92},{-36,-92},{-36,-95.3084},{5.8786,-95.3084}}, color={0,0,0}));
      connect(flange_a2, revolute10.axis) annotation (Line(points={{-78,-146},{-18,-146},{-18,-147.308},{5.8786,-147.308}}, color={0,0,0}));
      connect(Proxima_Phalanx1.frame_a, frame_a) annotation (Line(points={{16,-186},{16,-202},{16,-202}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx1.frame_b, revolute10.frame_a) annotation (Line(points={{16,-166},{15.8786,-166},{15.8786,-157.308}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation1.frame_b, fixedShape1.frame_a) annotation (Line(points={{82,-166},{90.631,-166},{90.631,-166},{94,-166}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation2.frame_b, fixedShape2.frame_a) annotation (Line(points={{82,-112},{90.631,-112},{90.631,-112},{94,-112}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation3.frame_b, fixedShape3.frame_a) annotation (Line(points={{82,-58},{90.631,-58},{90.631,-58},{94,-58}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation4.frame_b, fixedShape4.frame_a) annotation (Line(points={{80,0},{88.044,0},{88.044,0},{92,0}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx1.frame_b, fixedRotation1.frame_a) annotation (Line(points={{16,-166},{16,-162},{58,-162},{58,-166}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx3.frame_b, fixedRotation2.frame_a) annotation (Line(points={{15.8786,-111.308},{15.8786,-110},{58,-110},{58,-112}}, color={95,95,95}, thickness=0.5));
      connect(Middle_Phalanx3.frame_b, fixedRotation3.frame_a) annotation (Line(points={{15.8786,-57.3084},{15.8786,-52},{58,-52},{58,-58}}, color={95,95,95}, thickness=0.5));
      connect(Distal_Phalanx3.frame_b, fixedRotation4.frame_a) annotation (Line(points={{16,0},{16,6},{56,6},{56,0}}, color={95,95,95}, thickness=0.5));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-54,42},{-34,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,138},{100,-100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-24,56},{-4,-58}}, lineColor={0,0,0}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{8,40},{24,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{36,30},{52,-56}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,376},{100.001,138}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,614},{100.001,376}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0)}));
    end Middle;

    model Ring
      Modelica.Mechanics.MultiBody.Parts.BodyShape Proxima_Phalanx3(animateSphere=true, r(displayUnit="cm") = {0,0,0.02}, r_CM(displayUnit="cm") = {0,0,0.01}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-121.308})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Middle_Phalanx3(r(displayUnit="cm") = {0,0,0.02}, r_CM(displayUnit="cm") = {0,0,0.01}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={15.8786,-67.3084})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Distal_Phalanx3(r(displayUnit="cm") = {0,0,0.025}, r_CM(displayUnit="cm") = {0,0,0.0125}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={16,-10})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute9(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-95.3084})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute10(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-147.308})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute11(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-37.3084})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-92,-44},{-72,-24}}), iconTransformation(extent={{-110,54},{-90,74}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a1 annotation (Placement(transformation(extent={{-90,-102},{-70,-82}}), iconTransformation(extent={{-110,-8},{-90,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a2 annotation (Placement(transformation(extent={{-88,-156},{-68,-136}}), iconTransformation(extent={{-110,-66},{-90,-46}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=90, origin={16,-202}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={-2,-100})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Proxima_Phalanx1(animateSphere=true, r(displayUnit="cm") = {0,0,0.015}, r_CM(displayUnit="cm") = {0,0,0.0125}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={16,-178})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1(shapeType="cylinder", length(displayUnit="cm") = 0.02, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{98,-124},{118,-104}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{62,-126},{86,-102}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape2(shapeType="cylinder", length(displayUnit="cm") = 0.02, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01)
        annotation (Placement(transformation(extent={{98,-66},{118,-46}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(n(displayUnit="1") = {0,1,0}, angle=90)
        annotation (Placement(transformation(extent={{62,-68},{86,-44}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation4(n(displayUnit="1") = {0,1,0}, angle=90)
        annotation (Placement(transformation(extent={{56,-6},{80,18}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape4(shapeType="cylinder", length(displayUnit="cm") = 0.025, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01)
        annotation (Placement(transformation(extent={{92,-4},{112,16}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape3(shapeType="cylinder", length(displayUnit="cm") = 0.015, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{102,-178},{122,-158}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{66,-180},{90,-156}})));
    equation
      connect(revolute9.frame_a, Proxima_Phalanx3.frame_b) annotation (Line(points={{15.8786,-105.308},{15.8786,-105.308},{15.8786,-111.308},{15.8786,-111.308}}, color={95,95,95}, thickness=0.5));
      connect(revolute9.frame_b, Middle_Phalanx3.frame_a) annotation (Line(points={{15.8786,-85.3084},{15.8786,-77.3084},{15.8786,-77.3084}}, color={95,95,95}, thickness=0.5));
      connect(revolute10.frame_b, Proxima_Phalanx3.frame_a) annotation (Line(points={{15.8786,-137.308},{15.8786,-131.308},{15.8786,-131.308}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_b, Distal_Phalanx3.frame_a) annotation (Line(points={{15.8786,-27.3084},{16.4606,-27.3084},{16.4606,-20},{16,-20}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_a, Middle_Phalanx3.frame_b) annotation (Line(points={{15.8786,-47.3084},{15.8786,-47.3084},{15.8786,-57.3084},{15.8786,-57.3084}}, color={95,95,95}, thickness=0.5));
      connect(flange_a, revolute11.axis) annotation (Line(points={{-82,-34},{-68,-34},{-68,-37.3084},{5.8786,-37.3084}}, color={0,0,0}));
      connect(flange_a1, revolute9.axis) annotation (Line(points={{-80,-92},{-36,-92},{-36,-95.3084},{5.8786,-95.3084}}, color={0,0,0}));
      connect(flange_a2, revolute10.axis) annotation (Line(points={{-78,-146},{-18,-146},{-18,-147.308},{5.8786,-147.308}}, color={0,0,0}));
      connect(Proxima_Phalanx1.frame_a, frame_a) annotation (Line(points={{16,-188},{16,-202},{16,-202}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx1.frame_b, revolute10.frame_a) annotation (Line(points={{16,-168},{15.8786,-168},{15.8786,-157.308}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation1.frame_b, fixedShape1.frame_a) annotation (Line(points={{86,-114},{94.631,-114},{94.631,-114},{98,-114}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation2.frame_b, fixedShape2.frame_a) annotation (Line(points={{86,-56},{95.362,-56},{95.362,-56},{98,-56}}, color={95,95,95}, thickness=0.5));
      connect(Middle_Phalanx3.frame_b, fixedRotation2.frame_a) annotation (Line(points={{15.8786,-57.3084},{15.8786,-54},{62,-54},{62,-56}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx3.frame_b, fixedRotation1.frame_a) annotation (Line(points={{15.8786,-111.308},{15.8786,-108},{62,-108},{62,-114}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation4.frame_b, fixedShape4.frame_a) annotation (Line(points={{80,6},{88.044,6},{88.044,6},{92,6}}, color={95,95,95}, thickness=0.5));
      connect(Distal_Phalanx3.frame_b, fixedRotation4.frame_a) annotation (Line(points={{16,0},{16,6},{56,6}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation3.frame_b, fixedShape3.frame_a) annotation (Line(points={{90,-168},{98.631,-168},{98.631,-168},{102,-168}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation3.frame_a, Proxima_Phalanx1.frame_b) annotation (Line(points={{66,-168},{16,-168}}, color={95,95,95}, thickness=0.5));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-54,42},{-34,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,96},{100,-100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-24,56},{-4,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{8,40},{24,-58}}, lineColor={0,0,0}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{36,30},{52,-56}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,292},{100,96}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,488},{100,292}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0)}));
    end Ring;

    model Baby
      Modelica.Mechanics.MultiBody.Parts.BodyShape Proxima_Phalanx3(animateSphere=true, r(displayUnit="cm") = {0,0,0.02}, r_CM(displayUnit="cm") = {0,0,0.01}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={16,-122})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Middle_Phalanx3(r(displayUnit="cm") = {0,0,0.02}, r_CM(displayUnit="cm") = {0,0,0.01}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={16,-66})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape Distal_Phalanx3(r(displayUnit="cm") = {0,0,0.025}, r_CM(displayUnit="cm") = {0,0,0.0125}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={16,-10})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute9(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-95.3084})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute10(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-147.308})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute11(useAxisFlange=true, animation=false, n(displayUnit="1") = {0,1,0}, cylinderLength(displayUnit="cm") = 0.04, cylinderDiameter(displayUnit="cm") = 0.01, phi(start=0), w(start=0.20943951023932), a(start=0.034906585039887)) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={15.8786,-37.3084})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-92,-44},{-72,-24}}), iconTransformation(extent={{-110,54},{-90,74}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a1 annotation (Placement(transformation(extent={{-90,-102},{-70,-82}}), iconTransformation(extent={{-110,-8},{-90,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a2 annotation (Placement(transformation(extent={{-88,-156},{-68,-136}}), iconTransformation(extent={{-110,-66},{-90,-46}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=90, origin={16,-202}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={-2,-100})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1(shapeType="cylinder", length(displayUnit="cm") = 0.02, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{102,-126},{122,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{66,-128},{90,-104}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape2(shapeType="cylinder", length(displayUnit="cm") = 0.02, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{102,-88},{122,-68}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(n(displayUnit="1") = {0,1,0}, angle=90)
        annotation (Placement(transformation(extent={{66,-90},{90,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation4(n(displayUnit="1") = {0,1,0}, angle=90)
        annotation (Placement(transformation(extent={{60,4},{84,28}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape4(shapeType="cylinder", length(displayUnit="cm") = 0.025, width(displayUnit="cm") = 0.01, height(displayUnit="cm") = 0.01)
        annotation (Placement(transformation(extent={{96,6},{116,26}})));
    equation
      connect(revolute9.frame_a, Proxima_Phalanx3.frame_b) annotation (Line(points={{15.8786,-105.308},{15.8786,-105.308},{15.8786,-112},{16,-112}}, color={95,95,95}, thickness=0.5));
      connect(revolute9.frame_b, Middle_Phalanx3.frame_a) annotation (Line(points={{15.8786,-85.3084},{15.8786,-76},{16,-76}}, color={95,95,95}, thickness=0.5));
      connect(revolute10.frame_b, Proxima_Phalanx3.frame_a) annotation (Line(points={{15.8786,-137.308},{15.8786,-132},{16,-132}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_b, Distal_Phalanx3.frame_a) annotation (Line(points={{15.8786,-27.3084},{16.4606,-27.3084},{16.4606,-20},{16,-20}}, color={95,95,95}, thickness=0.5));
      connect(revolute11.frame_a, Middle_Phalanx3.frame_b) annotation (Line(points={{15.8786,-47.3084},{15.8786,-47.3084},{15.8786,-56},{16,-56}}, color={95,95,95}, thickness=0.5));
      connect(flange_a, revolute11.axis) annotation (Line(points={{-82,-34},{-68,-34},{-68,-37.3084},{5.8786,-37.3084}}, color={0,0,0}));
      connect(flange_a1, revolute9.axis) annotation (Line(points={{-80,-92},{-36,-92},{-36,-95.3084},{5.8786,-95.3084}}, color={0,0,0}));
      connect(flange_a2, revolute10.axis) annotation (Line(points={{-78,-146},{-18,-146},{-18,-147.308},{5.8786,-147.308}}, color={0,0,0}));
      connect(frame_a, revolute10.frame_a) annotation (Line(points={{16,-202},{16,-157.308},{15.8786,-157.308}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation1.frame_b, fixedShape1.frame_a) annotation (Line(points={{90,-116},{98.631,-116},{98.631,-116},{102,-116}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation2.frame_b, fixedShape2.frame_a) annotation (Line(points={{90,-78},{98.631,-78},{98.631,-78},{102,-78}}, color={95,95,95}, thickness=0.5));
      connect(Middle_Phalanx3.frame_b, fixedRotation2.frame_a) annotation (Line(points={{16,-56},{16,-52},{66,-52},{66,-78}}, color={95,95,95}, thickness=0.5));
      connect(Proxima_Phalanx3.frame_b, fixedRotation1.frame_a) annotation (Line(points={{16,-112},{16,-108},{66,-108},{66,-116}}, color={95,95,95}, thickness=0.5));
      connect(fixedRotation4.frame_b, fixedShape4.frame_a) annotation (Line(points={{84,16},{92.9103,16},{92.9103,16},{96,16}}, color={95,95,95}, thickness=0.5));
      connect(Distal_Phalanx3.frame_b, fixedRotation4.frame_a) annotation (Line(points={{16,0},{16,8},{60,8},{60,16}}, color={95,95,95}, thickness=0.5));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-54,42},{-34,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,62},{100,-100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-24,56},{-4,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{8,40},{24,-58}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{36,30},{52,-56}}, lineColor={0,0,0}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,224},{100,62}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,386},{100,224}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0)}));
    end Baby;
  end Finger;

  model Palm
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(r(displayUnit="cm") = {0,0.02,0}, r_CM(displayUnit="cm") = {0,0.01,0}, m(displayUnit="g") = 0.001)
      annotation (Placement(transformation(extent={{116,54},{136,74}})));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(r(displayUnit="cm") = {0,0.02,0}, r_CM(displayUnit="cm") = {0,0.01,0}, m(displayUnit="g") = 0.001)
      annotation (Placement(transformation(extent={{164,54},{184,74}})));
    Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(r_shape(displayUnit="cm") = {0,0.0325,-0.075}, lengthDirection(displayUnit="1") = {0,0,1}, widthDirection(displayUnit="1") = {0,1,0}, length(displayUnit="cm") = 0.075, width(displayUnit="cm") = 0.075, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=-90, origin={-6,18})));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(r(displayUnit="cm") = {0,0.02,0}, r_CM(displayUnit="cm") = {0,0.01,0}, m(displayUnit="g") = 0.001)
      annotation (Placement(transformation(extent={{68,54},{88,74}})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=90, origin={58,96}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={-2,916})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90, origin={102,96}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={252,914})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2 annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90, origin={152,98}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={522,914})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3 annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90, origin={198,98}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={768,918})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a4 annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90, origin={150,-62}),iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={394,-100})));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(r(displayUnit="cm") = {0,0,0.075}, r_CM(displayUnit="cm") = {0,0.01,0}, m(displayUnit="g") = 0.001) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={148,-22})));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(r(displayUnit="cm") = {0,-0.0325,0}, r_CM(displayUnit="cm") = {0,0.02,0}, m(displayUnit="g") = 0.001)
      annotation (Placement(transformation(extent={{112,18},{92,38}})));
  equation
    connect(bodyShape.frame_a, fixedShape.frame_a) annotation (Line(points={{68,64},{60,64},{60,28},{-6,28}}, color={95,95,95}, thickness=0.5));
    connect(frame_a1, bodyShape1.frame_a) annotation (Line(points={{102,96},{102,64},{116,64}}, color={95,95,95}, thickness=0.5));
    connect(frame_a1, bodyShape.frame_b) annotation (Line(points={{102,96},{102,64},{88,64}}, color={95,95,95}, thickness=0.5));
    connect(frame_a, bodyShape.frame_a) annotation (Line(points={{58,96},{60,96},{60,64},{68,64}}, color={95,95,95}, thickness=0.5));
    connect(frame_a2, bodyShape1.frame_b) annotation (Line(points={{152,98},{152,64},{136,64}}, color={95,95,95}, thickness=0.5));
    connect(frame_a2, bodyShape2.frame_a) annotation (Line(points={{152,98},{152,64},{164,64}}, color={95,95,95}, thickness=0.5));
    connect(frame_a3, bodyShape2.frame_b) annotation (Line(points={{198,98},{196,98},{196,64},{184,64}}, color={95,95,95}, thickness=0.5));
    connect(frame_a4, bodyShape3.frame_a) annotation (Line(points={{150,-62},{148,-62},{148,-32}}, color={95,95,95}, thickness=0.5));
    connect(bodyShape3.frame_b, bodyShape4.frame_a) annotation (Line(points={{148,-12},{148,28},{112,28}}, color={95,95,95}, thickness=0.5));
    connect(bodyShape4.frame_b, bodyShape.frame_a) annotation (Line(points={{92,28},{60,28},{60,64},{68,64}}, color={95,95,95}, thickness=0.5));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,-100},{884,916}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Text(textString="MADE BY HARSHAL WAGH", extent={{278,-10},{511,-126}}, textColor={255,0,0}),Rectangle(extent={{272,-36},{512,408}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-54,2},{44,-76}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-54,66},{-48,6}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{38,66},{44,6}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-24,66},{-18,5.99997}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{6,66},{12,6}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0)}));
  end Palm;

  model Wrist
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, animation=false, n(displayUnit="1") = {1,0,0}) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={167.819,-11.6598})));
    Modelica.Mechanics.MultiBody.Parts.BodyShape hand(animateSphere=true, r(displayUnit="cm") = {0,0,-0.07}, r_CM(displayUnit="cm") = {0,0,0.005}, m(displayUnit="g") = 0.02) annotation (Placement(transformation(extent={{-10,10},{10,-10}}, rotation=90, origin={167.819,-49.6598})));
    Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(shapeType="cylinder", r_shape={0,0,0}, length(displayUnit="cm") = 0.07, width(displayUnit="cm") = 0.03, height(displayUnit="cm") = 0.01) annotation (Placement(transformation(extent={{249.819,-37.6598},{269.819,-17.6598}})));
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(n(displayUnit="1") = {0,1,0}, angle=90) annotation (Placement(transformation(extent={{203.819,-39.6598},{227.819,-15.6598}})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=90, origin={166,32}), iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={0,-100})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90, origin={168,-120}),iconTransformation(extent={{-16,-16},{16,16}}, rotation=90, origin={0,100})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{50,-24},{70,-4}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  equation
    connect(hand.frame_b, revolute.frame_a) annotation (Line(points={{167.819,-39.6598},{167.819,-22.6598},{167.819,-22.6598},{167.819,-21.6598}}, color={95,95,95}, thickness=0.5));
    connect(fixedRotation3.frame_b, fixedShape.frame_a) annotation (Line(points={{227.819,-27.6598},{249.819,-27.6598},{249.819,-27.6598}}, color={95,95,95}, thickness=0.5));
    connect(revolute.frame_b, frame_a) annotation (Line(points={{167.819,-1.6598},{167.819,32},{166,32}}, color={95,95,95}, thickness=0.5));
    connect(hand.frame_a, frame_a1) annotation (Line(points={{167.819,-59.6598},{167.819,-120},{168,-120}}, color={95,95,95}, thickness=0.5));
    connect(flange_a, revolute.axis) annotation (Line(points={{60,-14},{60,-4},{157.819,-4},{157.819,-11.6598}}, color={0,0,0}));
    connect(fixedRotation3.frame_a, hand.frame_a) annotation (Line(points={{203.819,-27.6598},{192,-27.6598},{192,-72},{168,-72},{168,-59.6598},{167.819,-59.6598}}, color={95,95,95}, thickness=0.5));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Ellipse(extent={{-40,38},{40,-38}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, startAngle=0, endAngle=360)}));
  end Wrist;

  model Example
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false)));
    model Handfold
      inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n(displayUnit="1") = {0,0,-1}, axisLength(displayUnit="cm") = 0.1, axisDiameter(displayUnit="cm") = 0.04) annotation (Placement(transformation(extent={{-10.0001,-10},{10,10}}, rotation=90, origin={204.134,-396.553})));
      Finger.Middle middle annotation (Placement(transformation(extent={{180.134,-182.553},{200.134,-162.553}})));
      Finger.Ring ring annotation (Placement(transformation(extent={{206.134,-182.553},{226.134,-162.553}})));
      Finger.Baby baby annotation (Placement(transformation(extent={{232.134,-182.553},{252.134,-162.553}})));
      Finger.Index index(fixedShape(length=0.02, width=0.01, height=0.01)) annotation (Placement(transformation(extent={{154.134,-182.553},{174.134,-162.553}})));
      Palm palm annotation (Placement(transformation(extent={{154.134,-286.553},{174.134,-266.553}})));
      Wrist wrist(fixedShape(length=0.07)) annotation (Placement(transformation(extent={{194.134,-336.553},{214.134,-316.553}})));
      Control_system.MCP mCP annotation (Placement(transformation(extent={{72.1337,-182.553},{92.1337,-162.553}})));
      Control_system.PIP pIP annotation (Placement(transformation(extent={{72.1337,-142.553},{92.1337,-122.553}})));
      Control_system.DIP dIP annotation (Placement(transformation(extent={{72.1337,-102.553},{92.1337,-82.5533}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{156.134,-80.5533},{176.134,-60.5533}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1 annotation (Placement(transformation(extent={{190.134,-78.5533},{210.134,-58.5533}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b2 annotation (Placement(transformation(extent={{230.134,-78.5533},{250.134,-58.5533}})));
    equation
      connect(flange_b, index.flange_a2) annotation (Line(points={{166.134,-70.5533},{166.134,-104.553},{148.134,-104.553},{148.134,-178.553},{154.134,-178.553},{154.134,-178.153}}, color={0,0,0}));
      connect(flange_b, middle.flange_a2) annotation (Line(points={{166.134,-70.5533},{166.134,-104.553},{176.134,-104.553},{176.134,-178.153},{180.134,-178.153}}, color={0,0,0}));
      connect(flange_b, ring.flange_a2) annotation (Line(points={{166.134,-70.5533},{166.134,-104.553},{202.134,-104.553},{202.134,-178.553},{206.134,-178.553},{206.134,-178.153}}, color={0,0,0}));
      connect(flange_b, baby.flange_a2) annotation (Line(points={{166.134,-70.5533},{166.134,-104.553},{228.134,-104.553},{228.134,-178.153},{232.134,-178.153}}, color={0,0,0}));
      connect(flange_b1, index.flange_a1) annotation (Line(points={{200.134,-68.5533},{200.134,-100.553},{150.134,-100.553},{150.134,-172.353},{154.134,-172.353}}, color={0,0,0}));
      connect(flange_b1, middle.flange_a1) annotation (Line(points={{200.134,-68.5533},{200.134,-100.553},{178.134,-100.553},{178.134,-172.353},{180.134,-172.353}}, color={0,0,0}));
      connect(flange_b1, ring.flange_a1) annotation (Line(points={{200.134,-68.5533},{200.134,-100.553},{204.134,-100.553},{204.134,-172.553},{206.134,-172.553},{206.134,-172.353}}, color={0,0,0}));
      connect(baby.flange_a1, flange_b1) annotation (Line(points={{232.134,-172.353},{230.134,-172.353},{230.134,-100.553},{200.134,-100.553},{200.134,-68.5533}}, color={0,0,0}));
      connect(flange_b2, index.flange_a) annotation (Line(points={{240.134,-68.5533},{240.134,-96.5533},{152.134,-96.5533},{152.134,-166.153},{154.134,-166.153}}, color={0,0,0}));
      connect(middle.flange_a, flange_b2) annotation (Line(points={{180.134,-166.153},{180.134,-96.5533},{240.134,-96.5533},{240.134,-68.5533}}, color={0,0,0}));
      connect(ring.flange_a, flange_b2) annotation (Line(points={{206.134,-166.153},{206.134,-96.5533},{240.134,-96.5533},{240.134,-68.5533}}, color={0,0,0}));
      connect(baby.flange_a, flange_b2) annotation (Line(points={{232.134,-166.153},{232.134,-96.5533},{240.134,-96.5533},{240.134,-68.5533}}, color={0,0,0}));
      connect(palm.frame_a1, middle.frame_a) annotation (Line(points={{189.334,-185.153},{189.334,-182.553},{189.934,-182.553}}, color={95,95,95}, thickness=0.5));
      connect(palm.frame_a2, ring.frame_a) annotation (Line(points={{216.334,-185.153},{216.334,-184.553},{216.134,-184.553},{216.134,-182.553},{215.934,-182.553}}, color={95,95,95}, thickness=0.5));
      connect(baby.frame_a, palm.frame_a3) annotation (Line(points={{241.934,-182.553},{241.934,-184.553},{242.134,-184.553},{242.134,-184.753},{240.934,-184.753}}, color={95,95,95}, thickness=0.5));
      connect(index.frame_a, palm.frame_a) annotation (Line(points={{163.934,-182.553},{163.934,-184.553},{166.134,-184.553},{166.134,-184.953},{163.934,-184.953}}, color={95,95,95}, thickness=0.5));
      connect(wrist.frame_a1, palm.frame_a4) annotation (Line(points={{204.134,-316.553},{203.534,-316.553},{203.534,-286.553}}, color={95,95,95}, thickness=0.5));
      connect(wrist.frame_a, world.frame_b) annotation (Line(points={{204.134,-336.553},{204.134,-377.553},{204.134,-377.553},{204.134,-386.553}}, color={95,95,95}, thickness=0.5));
      connect(dIP.flange_a, flange_b2) annotation (Line(points={{92.1337,-92.7531},{110.134,-92.7531},{110.134,-0.553284},{242.134,-0.553284},{242.134,-68.5533},{240.134,-68.5533}}, color={0,0,0}));
      connect(pIP.flange_a, flange_b1) annotation (Line(points={{92.1337,-131.753},{132.134,-131.753},{132.134,-22.5533},{200.134,-22.5533},{200.134,-68.5533}}, color={0,0,0}));
      connect(mCP.flange_a, flange_b) annotation (Line(points={{92.1337,-172.553},{140.134,-172.553},{140.134,-70.5533},{166.134,-70.5533}}, color={0,0,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Polygon(points={{-68,74},{-67,-70},{65,2},{65,2},{-68,74}}, lineColor={0,0,0}, fillColor={255,255,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=0)}));
    end Handfold;

    model Wave
      inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n(displayUnit="1") = {0,0,-1}, axisLength(displayUnit="cm") = 0.1, axisDiameter(displayUnit="cm") = 0.04) annotation (Placement(transformation(extent={{-10.0001,-10},{10,10}}, rotation=90, origin={8,-205})));
      Finger.Middle middle
        annotation (Placement(transformation(extent={{-16,9},{4,29}})));
      Finger.Ring ring
        annotation (Placement(transformation(extent={{10,9},{30,29}})));
      Finger.Baby baby
        annotation (Placement(transformation(extent={{36,9},{56,29}})));
      Finger.Index index(fixedShape(length=0.02, width=0.01, height=0.01))
        annotation (Placement(transformation(extent={{-42,9},{-22,29}})));
      Palm palm annotation (Placement(transformation(extent={{-42,-95},{-22,-75}})));
      Wrist wrist(fixedShape(length=0.07)) annotation (Placement(transformation(extent={{-2,-145},{18,-125}})));
      Control_system.Wrist wrist1 annotation (Placement(transformation(extent={{-124,-31},{-104,-11}})));
    equation
      connect(palm.frame_a1, middle.frame_a) annotation (Line(points={{-6.8,6.4},{-6.8,9},{-6.2,9}}, color={95,95,95}, thickness=0.5));
      connect(palm.frame_a2, ring.frame_a) annotation (Line(points={{20.2,6.4},{20.2,5},{19.2,5},{19.2,9},{19.8,9}}, color={95,95,95}, thickness=0.5));
      connect(baby.frame_a, palm.frame_a3) annotation (Line(points={{45.8,9},{45.8,9},{49.4,9},{49.4,6.8},{44.8,6.8}}, color={95,95,95}, thickness=0.5));
      connect(index.frame_a, palm.frame_a) annotation (Line(points={{-32.2,9},{-31.4,9},{-31.4,5},{-31.4,6.6},{-32.2,6.6}}, color={95,95,95}, thickness=0.5));
      connect(wrist.frame_a1, palm.frame_a4) annotation (Line(points={{8,-125},{8,-95},{7.4,-95}}, color={95,95,95}, thickness=0.5));
      connect(wrist.frame_a, world.frame_b) annotation (Line(points={{8,-145},{8,-145},{8,-195},{8,-195}}, color={95,95,95}, thickness=0.5));
      connect(wrist1.flange_a, wrist.flange_a) annotation (Line(points={{-104,-21},{-72,-21},{-72,-135},{-2,-135}}, color={0,0,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Polygon(points={{-62,71.0001},{-61,-73},{71,-0.9999},{71,-0.9999},{-62,71.0001}}, lineColor={0,0,0}, fillColor={255,255,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=0)}));
    end Wave;

    model Shocker
      inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n(displayUnit="1") = {0,0,-1}, axisLength(displayUnit="cm") = 0.1, axisDiameter(displayUnit="cm") = 0.04) annotation (Placement(transformation(extent={{-10.0001,-10},{10,10}}, rotation=90, origin={88.0576,-401.851})));
      Finger.Middle middle annotation (Placement(transformation(extent={{64.0576,-187.851},{84.0576,-167.851}})));
      Finger.Ring ring annotation (Placement(transformation(extent={{90.0576,-187.851},{110.058,-167.851}})));
      Finger.Baby baby annotation (Placement(transformation(extent={{116.058,-187.851},{136.058,-167.851}})));
      Finger.Index index(fixedShape(length=0.02, width=0.01, height=0.01)) annotation (Placement(transformation(extent={{38.0576,-187.851},{58.0576,-167.851}})));
      Palm palm annotation (Placement(transformation(extent={{38.0576,-291.851},{58.0576,-271.851}})));
      Wrist wrist(fixedShape(length=0.07)) annotation (Placement(transformation(extent={{78.0576,-341.851},{98.0576,-321.851}})));
      Control_system.MCP mCP annotation (Placement(transformation(extent={{-43.9424,-187.851},{-23.9424,-167.851}})));
      Control_system.PIP pIP annotation (Placement(transformation(extent={{-43.9424,-147.851},{-23.9424,-127.851}})));
      Control_system.DIP dIP annotation (Placement(transformation(extent={{-43.9424,-107.851},{-23.9424,-87.8508}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{40.0576,-85.8508},{60.0576,-65.8508}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1 annotation (Placement(transformation(extent={{74.0576,-83.8508},{94.0576,-63.8508}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b2 annotation (Placement(transformation(extent={{114.058,-83.8508},{134.058,-63.8508}})));
    equation
      connect(flange_b, ring.flange_a2) annotation (Line(points={{50.0576,-75.8508},{50.0576,-109.851},{86.0576,-109.851},{86.0576,-183.851},{90.0576,-183.851},{90.0576,-183.451}}, color={0,0,0}));
      connect(flange_b1, ring.flange_a1) annotation (Line(points={{84.0576,-73.8508},{84.0576,-105.851},{88.0576,-105.851},{88.0576,-177.851},{90.0576,-177.851},{90.0576,-177.651}}, color={0,0,0}));
      connect(ring.flange_a, flange_b2) annotation (Line(points={{90.0576,-171.451},{90.0576,-101.851},{124.058,-101.851},{124.058,-73.8508}}, color={0,0,0}));
      connect(palm.frame_a1, middle.frame_a) annotation (Line(points={{73.2576,-190.451},{73.2576,-187.851},{73.8576,-187.851}}, color={95,95,95}, thickness=0.5));
      connect(palm.frame_a2, ring.frame_a) annotation (Line(points={{100.258,-190.451},{100.258,-189.851},{100.058,-189.851},{100.058,-187.851},{99.8578,-187.851}}, color={95,95,95}, thickness=0.5));
      connect(baby.frame_a, palm.frame_a3) annotation (Line(points={{125.858,-187.851},{125.858,-189.851},{126.058,-189.851},{126.058,-190.051},{124.858,-190.051}}, color={95,95,95}, thickness=0.5));
      connect(index.frame_a, palm.frame_a) annotation (Line(points={{47.8576,-187.851},{47.8576,-189.851},{50.0576,-189.851},{50.0576,-190.251},{47.8576,-190.251}}, color={95,95,95}, thickness=0.5));
      connect(wrist.frame_a1, palm.frame_a4) annotation (Line(points={{88.0576,-321.851},{87.4576,-321.851},{87.4576,-291.851}}, color={95,95,95}, thickness=0.5));
      connect(wrist.frame_a, world.frame_b) annotation (Line(points={{88.0576,-341.851},{88.0576,-382.851},{88.0576,-382.851},{88.0576,-391.851}}, color={95,95,95}, thickness=0.5));
      connect(dIP.flange_a, flange_b2) annotation (Line(points={{-23.9424,-98.0509},{-5.94243,-98.0509},{-5.94243,-5.8508},{126.058,-5.8508},{126.058,-73.8508},{124.058,-73.8508}}, color={0,0,0}));
      connect(pIP.flange_a, flange_b1) annotation (Line(points={{-23.9424,-137.051},{16.0576,-137.051},{16.0576,-27.8508},{84.0576,-27.8508},{84.0576,-73.8508}}, color={0,0,0}));
      connect(mCP.flange_a, flange_b) annotation (Line(points={{-23.9424,-177.851},{24.0576,-177.851},{24.0576,-75.8508},{50.0576,-75.8508}}, color={0,0,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Polygon(points={{-62,71.9997},{-61,-72},{71,-0.0003},{71,-0.0003},{-62,71.9997}}, lineColor={0,0,0}, fillColor={255,255,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=0)}));
    end Shocker;
  end Example;

  model Control_system
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false)));
    model MCP
      Modelica.Blocks.Sources.KinematicPTP2 path(q_end={2}, qd_max={5}, qdd_max={5}, startTime=0, q_begin={0}) annotation (Placement(transformation(extent={{0.207489,2.5461},{20.2075,22.5461}})));
      Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Utilities.PathToAxisControlBus pathToAxis1(nAxis=1, axisUsed=1) annotation (Placement(transformation(extent={{42.2075,2.5461},{62.2075,22.5461}})));
      Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Utilities.AxisType1 axis1(w=4590, ratio=-105, c=43, cd=0.005, Rv0=0.4, Rv1=(0.13/160), kp=1, ks=1, Ts=1) annotation (Placement(transformation(extent={{80.2075,2.5461},{100.207,22.5461}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{134,4},{154,24}}), iconTransformation(extent={{90,-10},{110,10}})));
    equation
      connect(path.q, pathToAxis1.q) annotation (Line(points={{21.2075,20.5461},{40.2075,20.5461},{40.2075,20.5461}}, color={0,0,127}));
      connect(path.qd, pathToAxis1.qd) annotation (Line(points={{21.2075,15.5461},{40.2075,15.5461},{40.2075,15.5461}}, color={0,0,127}));
      connect(path.qdd, pathToAxis1.qdd) annotation (Line(points={{21.2075,9.5461},{40.2075,9.5461},{40.2075,9.5461}}, color={0,0,127}));
      connect(path.moving, pathToAxis1.moving) annotation (Line(points={{21.2075,4.5461},{40.2075,4.5461},{40.2075,4.5461}}, color={255,0,255}));
      connect(axis1.axisControlBus, pathToAxis1.axisControlBus) annotation (Line(points={{80.2075,12.5461},{75.2075,12.5461},{75.2075,12.5461},{62.2075,12.5461}}, color={255,204,51}, thickness=0.5));
      connect(flange_a, axis1.flange) annotation (Line(points={{144,14},{102,14},{102,12.5461},{100.207,12.5461}}, color={0,0,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{18,76},{46,-72}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{46,-72},{-78,-62}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{46,-14},{-78,-4}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{46,32},{-78,42}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0)}));
    end MCP;

    model PIP
      Modelica.Blocks.Sources.KinematicPTP2 path2(q_end={2.5}, qd_max={5}, qdd_max={5}, startTime=0, q_begin={0}) annotation (Placement(transformation(extent={{5.32532,-12.041},{25.3253,7.95901}})));
      Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Utilities.PathToAxisControlBus pathToAxis3(nAxis=1, axisUsed=1) annotation (Placement(transformation(extent={{51.3253,-12.041},{71.3253,7.95901}})));
      Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Utilities.AxisType1 axis3(w=4590, ratio=-105, c=43, cd=0.005, Rv0=0.4, Rv1=(0.13/160), kp=1, ks=1, Ts=1) annotation (Placement(transformation(extent={{87.3253,-10.041},{107.325,9.95901}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{130,-10},{150,10}}), iconTransformation(extent={{90,-2},{110,18}})));
    equation
      connect(pathToAxis3.q, path2.q) annotation (Line(points={{49.3253,5.95901},{32.3253,5.95901},{32.3253,5.95901},{26.3253,5.95901}}, color={0,0,127}));
      connect(path2.qd, pathToAxis3.qd) annotation (Line(points={{26.3253,0.959015},{39.0643,0.959015},{39.0643,0.959015},{49.3253,0.959015}}, color={0,0,127}));
      connect(path2.qdd, pathToAxis3.qdd) annotation (Line(points={{26.3253,-5.04099},{35.3253,-5.04099},{35.3253,-6.04099},{40.8033,-6.04099},{40.8033,-5.04099},{49.3253,-5.04099}}, color={0,0,127}));
      connect(pathToAxis3.moving, path2.moving) annotation (Line(points={{49.3253,-10.041},{39.0643,-10.041},{39.0643,-10.041},{26.3253,-10.041}}, color={255,0,255}));
      connect(axis3.axisControlBus, pathToAxis3.axisControlBus) annotation (Line(points={{87.3253,-0.0409851},{77.3253,-0.0409851},{77.3253,-2.04099},{71.3253,-2.04099}}, color={255,204,51}, thickness=0.5));
      connect(flange_a, axis3.flange) annotation (Line(points={{140,0},{107.325,0},{107.325,-0.040995}}, color={0,0,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{30,78},{58,-70}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{58,-70},{-66,-60}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{58,-12},{-66,-2}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{58,34},{-66,44}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,-100},{100,100}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0)}));
    end PIP;

    model DIP
      Modelica.Blocks.Sources.KinematicPTP2 path1(q_end={1}, qd_max={5}, qdd_max={5}, startTime=0, q_begin={0}) annotation (Placement(transformation(extent={{-19.7106,-6.92316},{0.289444,13.0768}})));
      Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Utilities.PathToAxisControlBus pathToAxis2(nAxis=1, axisUsed=1) annotation (Placement(transformation(extent={{26.2894,-6.92316},{46.2894,13.0768}})));
      Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Utilities.AxisType1 axis2(w=4590, ratio=-105, c=43, cd=0.005, Rv0=0.4, Rv1=(0.13/160), kp=1, ks=1, Ts=1) annotation (Placement(transformation(extent={{62.2894,-4.92316},{82.2894,15.0768}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{126,-4},{146,16}}), iconTransformation(extent={{90,-12},{110,8}})));
    equation
      connect(pathToAxis2.q, path1.q) annotation (Line(points={{24.2894,11.0768},{8.28944,11.0768},{8.28944,11.0768},{1.28944,11.0768}}, color={0,0,127}));
      connect(path1.qd, pathToAxis2.qd) annotation (Line(points={{1.28944,6.07681},{9.28944,6.07681},{9.28944,7.07684},{14.2894,7.07684},{14.2894,6.07681},{24.2894,6.07681}}, color={0,0,127}));
      connect(path1.qdd, pathToAxis2.qdd) annotation (Line(points={{1.28944,0.076826},{9.28944,0.076826},{9.28944,1.07684},{14.2894,1.07684},{14.2894,0.076826},{24.2894,0.076826}}, color={0,0,127}));
      connect(pathToAxis2.moving, path1.moving) annotation (Line(points={{24.2894,-4.92316},{14.7894,-4.92316},{14.7894,-4.92316},{1.28944,-4.92316}}, color={255,0,255}));
      connect(axis2.axisControlBus, pathToAxis2.axisControlBus) annotation (Line(points={{62.2894,5.07682},{52.2894,5.07682},{52.2894,3.07682},{46.2894,3.07682}}, color={255,204,51}, thickness=0.5));
      connect(flange_a, axis2.flange) annotation (Line(points={{136,6},{82.2894,6},{82.2894,5.07682}}, color={0,0,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{28,78},{56,-69.999}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{56,-70},{-68.0005,-60}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{56,-12},{-68.0005,-2}}, lineColor={0,0,255}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{56,34},{-68.0005,44}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-100,-100},{100,100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0)}));
    end DIP;

    model Wrist
      Modelica.Blocks.Sources.Sine sine(amplitude=2, f=2, phase=0.17453292519943, offset=0, startTime=0) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=-90, origin={32.7567,-26.5984})));
      Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(VaNominal=dcpmData.VaNominal, IaNominal=dcpmData.IaNominal, wNominal=dcpmData.wNominal, TaNominal=dcpmData.TaNominal, Ra=dcpmData.Ra, TaRef=dcpmData.TaRef, La=dcpmData.La, Jr=dcpmData.Jr, useSupport=false, Js=dcpmData.Js, frictionParameters=dcpmData.frictionParameters, coreParameters=dcpmData.coreParameters, strayLoadParameters=dcpmData.strayLoadParameters, brushParameters=dcpmData.brushParameters, TaOperational=293.15, alpha20a=dcpmData.alpha20a, phiMechanical(fixed=true), wMechanical(fixed=true), ia(fixed=true)) annotation (Placement(transformation(extent={{22.7567,-104.598},{42.7567,-84.5984}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (Placement(transformation(extent={{42.7567,-70.5984},{22.7567,-50.5984}})));
      Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(origin={-15.2433,-34.5984}, extent={{-10,-10},{10,10}}, rotation=270)));
      parameter Modelica.Electrical.Machines.Utilities.ParameterRecords.DcPermanentMagnetData dcpmData "DC machine data" annotation (Placement(transformation(extent={{22.7567,-134.598},{42.7567,-114.598}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{98,-104},{118,-84}}), iconTransformation(extent={{90,-10},{110,10}})));
    equation
      connect(signalVoltage.p, dcpm.pin_ap) annotation (Line(points={{42.7567,-60.5984},{42.7567,-74.5984},{38.7567,-74.5984},{38.7567,-84.5984}}, color={0,0,255}));
      connect(signalVoltage.n, ground.p) annotation (Line(points={{22.7567,-60.5984},{12.7567,-60.5984},{12.7567,-34.5984},{-5.2433,-34.5984}}, color={0,0,255}));
      connect(dcpm.pin_an, signalVoltage.n) annotation (Line(points={{26.7567,-84.5984},{26.7567,-74.5984},{22.7567,-74.5984},{22.7567,-60.5984}}, color={0,0,255}));
      connect(sine.y, signalVoltage.v) annotation (Line(points={{32.7567,-37.5984},{32.7567,-48.5984},{32.7567,-48.5984}}, color={0,0,127}));
      connect(flange_a, dcpm.flange) annotation (Line(points={{108,-94},{42.7567,-94},{42.7567,-94.5982}}, color={0,0,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false)), Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,-100},{100,100}}, lineColor={0,0,255}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.None, lineThickness=-0.25, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-32,56},{34,38}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-4,-6},{6,-74}}, lineColor={0,0,0}, fillColor={0,0,255}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=0, borderPattern=BorderPattern.None, radius=0),Rectangle(extent={{-20,18},{20,10}}, lineColor={0,0,0}, fillColor={0,0,0}, pattern=LinePattern.Solid, fillPattern=FillPattern.Solid, lineThickness=1, borderPattern=BorderPattern.None, radius=0)}));
    end Wrist;
  end Control_system;
end BionicHand;
