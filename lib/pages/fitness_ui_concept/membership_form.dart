

import 'package:fitness_app_ui/components/bmi_widget.dart';
import 'package:fitness_app_ui/components/custom_text_field.dart';
import 'package:fitness_app_ui/components/user_photo.dart';
import 'package:fitness_app_ui/pages/rapid_api_exercise_demo/choose_exercise.dart';
import 'package:fitness_app_ui/pages/fitness_ui_concept/select_plan.dart';
import 'package:flutter/material.dart';

class Membershipform extends StatefulWidget{

  @override
  State<Membershipform> createState() => _MembershipformState();
}

class _MembershipformState extends State<Membershipform> {

  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode ageFocus = FocusNode();
  final FocusNode weightFocus = FocusNode();
  final FocusNode heightFocus = FocusNode();
  bool _bodyDataPresent = false;

  void unFocusFields(){
    nameFocus.unfocus();
    ageFocus.unfocus();
    weightFocus.unfocus();
  }

@override
Widget build(BuildContext context){

  final TextEditingController nameController = TextEditingController();

  return GestureDetector(
    onTap: (){
      unFocusFields();
    },
    child: Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Virtual Membership Form",
                  textAlign: TextAlign.left,
                  style:  TextStyle(
                    fontSize: 22,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w700,
                  ),
                  ),
                  const SizedBox(height: 50,),
                  UserPhoto(),
                  const SizedBox(height: 50,),
                  CustomTextField(hintText: "Enter your name", textController: nameController,focusNode: nameFocus,),
                  CustomTextField(hintText: "Enter your age", textController: ageController,focusNode: ageFocus,),
                  CustomTextField(hintText: "Enter your weight", textController: weightController,focusNode: weightFocus,),
                  CustomTextField(hintText: "Enter your height", textController: weightController,focusNode: heightFocus,),
                  const SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 30.0,),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 151, 73, 230),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 50.0,
                          // padding: const EdgeInsets.all(25.0),
                          onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => SelectPlan()));
                             Navigator.push(context, MaterialPageRoute(builder: (_) => const SelectPlan()));
                          },
                          child: const Text("Proceed", style: TextStyle(color: Colors.white),),
                        )
                      ),
                
                  
                ],
              ),
            ),
          ),
        ),
    ),
  );
}

@override
void initState(){
  super.initState();
}

}