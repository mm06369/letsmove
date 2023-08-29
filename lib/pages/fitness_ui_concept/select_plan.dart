


import 'package:fitness_app_ui/components/plan_card.dart';
import 'package:flutter/material.dart';

import 'tabs/tabs.dart';


class SelectPlan extends StatelessWidget {
  const SelectPlan({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Select Membership Plans",
                      textAlign: TextAlign.left,
                      style:  TextStyle(
                        fontSize: 22,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                      const SizedBox(height: 50,),
                      PlanCard(title: "Basic Plan", onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Tabs()));
                      },),
                      PlanCard(title: "Standard Plan", onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Tabs()));
                      },),
                      PlanCard(title: "Premium Plan", onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Tabs()));
                      },),
                      
              ],
            ),
          ),
        ),
      ),
    );
  }
}