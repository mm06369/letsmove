

class User{
  String? name;
  int? age;
  String? plan;
  double? bmi;

  User({this.name, this.age, this.plan, this.bmi});

  updatePlan(String newPlan){
    plan = newPlan;
  }
}