
import 'package:bmi_calculator/Calculator_brain.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

enum gender{
  male,
  female,
}


class HomePage extends StatefulWidget{
  @override
  _inputPageState createState() => _inputPageState();

}

class _inputPageState extends State<HomePage>{

  Color MalecardColor = ConstInactive;
  Color FemalecardColor = ConstInactive;
  int Height = 180;
  int Weight = 60;
  int age = 30;

  gender? value;


  // void Onpressed(gender value){
  //
  //   if(value == gender.male){
  //      MalecardColor == inactive ? active :inactive;
  //
  //
  //     // if(MalecardColor == inactive){
  //     //   MalecardColor = active;
  //     //   FemalecardColor=inactive;
  //     //
  //     // }
  //     // else{
  //     //   MalecardColor = inactive;
  //     // }
  //   }
  //
  //   if(value ==gender.female){
  //     if(FemalecardColor == inactive){
  //       FemalecardColor = active;
  //       MalecardColor = inactive;
  //     }
  //     else{
  //       FemalecardColor = inactive;
  //     }
  //   }
  // }
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(

        title: Center(
          child:
        Text('Calculate your health'),
        ),


      ),

      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child:
            Row(
              children: [
                Expanded(child:
                GestureDetector(
                  onTap:(){
                    setState(() {
                      value = gender.male;
                    });
                  },
                  child: reuse(
                    colour: value == gender.male ? ConstActive : ConstInactive,
                    childWidget:iconWidget(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ) ,
                  ),
                ),
                ),
                Expanded(child: GestureDetector(
                onTap:(){
                setState(() {
                  value = gender.female;
                });
                }, child:
                reuse( colour:value == gender.female ? ConstActive : ConstInactive,
                childWidget: iconWidget(
                  icon: FontAwesomeIcons.venus,
                  text: 'FEMALE',
                ),
                ),
                ),
                ),
              ],
            ),
            ),

            Expanded(child:

            reuse( colour:ConstColour,
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Height' , style: ConstLable, ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                        Height.toString(), style: NumText
                    ),
                    Text('cm', style:ConstLable),
                  ],
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white30,
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                    value:Height.toDouble(),
                    min: 120,
                    max: 220,
                    inactiveColor: Color(0xFF8d8E98),
                    onChanged: (double newValue){
                      setState((){
                        Height = newValue.round();
                  });

                  },
                  ),
                )
              ],
            ),
            ),
            ),

            Expanded(child:
            Row(
              children: [
                Expanded(child:
                reuse( colour:ConstColour,
                childWidget:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                      Text('Weight' , style: ConstLable, ),
                     Text(Weight.toString() ,style: NumText,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         FloatingActionButton(
                           onPressed:(){
                             setState(() {
                               Weight--;
                             });
                           },
                           shape: CircleBorder(),
                           backgroundColor: Color(0xFF40414F),
                           child: Icon(Icons.remove, color: Colors.white,),
                         ),
                         SizedBox(width:12 ,),

                         FloatingActionButton(
                           onPressed:(){
                             setState(() {
                               Weight++;
                             });
                           },
                           shape: CircleBorder(),
                           backgroundColor: Color(0xFF40414F),
                           child: Icon(Icons.add, color: Colors.white,),
                         ),
                       ],
                     ),
                    ]
                  ),
                ),

                ),
                Expanded(child:
                reuse( colour:ConstColour,
                  childWidget:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight' , style: ConstLable, ),
                        Text(age.toString() ,style: NumText,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(icon: FontAwesomeIcons.minus, action: (){
                              setState(() {
                                age--;
                              });
                            }),

                            SizedBox(width: 10,),

                            CustomButton(icon: FontAwesomeIcons.plus, action: (){
                              setState(() {
                                age++;
                              });
                            }),


                          ],
                        )
                      ]
                  ),),
                ),
              ],
            ),
            ),

            GestureDetector(
              onTap: (){
                Calculation calc = Calculation(height: Height, weight: Weight);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return resultPage(
                      result: calc.getResult(),
                   calculation : calc.calcBmi(),
                    interpretation: calc.getInterpretation(),
                  );
                }));
              },
              child: Container(
                child: Center(child: Text('Calculate', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white ), )),
                color: Color(0xFFEB1555) ,
                margin: EdgeInsets.only(top:10),
                height: 60,
                width: double.infinity ,
              ),
            )
          ],
        )
    );
  }
}

class iconWidget extends StatelessWidget {


  iconWidget({
    required this.icon,
    required this.text,
});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon , size: 80, color: Colors.white30,),
        SizedBox(height: 15,),
        Text(text , style: ConstLable, ),
      ],

    );
  }
}

class reuse extends StatelessWidget {
  reuse({
    required this.colour,
     required this.childWidget,
});

  final Color colour;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
        color: colour),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback action;

  CustomButton({
    required this.icon,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.white, size: 20), // Adjust icon size
      onPressed: action, // Pass the function directly
      constraints: BoxConstraints.tightFor(width: 52, height: 52), // Adjust size
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
