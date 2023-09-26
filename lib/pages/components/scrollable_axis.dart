import 'package:flutter/material.dart';

class HorizontalScrollableAxis extends StatelessWidget {

  String truncateTextDesc(String text) {
  print(text.length);
  if (text.length > 23) {
    return text.substring(0,23) + ' ...';
  } else {
    return text;
  }
}

 String truncateTextTitle(String text) {
  print(text.length);
  if (text.length > 23) {
    return text.substring(0,23) + ' ...';
  } else {
    return text;
  }
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildElement("45 Degree Side Bend", "Waist | Body weight | Obliques" , "Cable Curl (female)", "Upper Arms | Cable | Biceps Brachii"),
          const SizedBox(
            width: 5,
          ),
          _buildElement("Air Twisting Crunch (female)", "Waist | Body weight", "Dumbbell Shrug", "Back | Dumbbell | Trapezius Upper Fibers"),
          const SizedBox(
            width: 5, 
          ),
          _buildElement("Alternate Heel Touchers", "Waist | Body weight | Obliques" , "Alternate Lying Floor Leg Raise", "Waist | Body weight | Rectus Abdominis"),
        ],
      ),
    );
  }

  Widget _buildElement(String title1, String description1, String title2, String description2) {
    return Column(
      children: [
        Container(
          width: 290,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.4), // Shadow color
        spreadRadius: 0, // Spread radius
        blurRadius: 2, // Blur radius
        offset:const  Offset(0, 3), // Offset to create the bottom shadow
      ),],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset("assets/categories/ex_icon.png", width: 50, height: 50,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(truncateTextTitle(title1), style: const TextStyle(fontFamily: 'Poppins'),),
                     Text(truncateTextDesc(description1), style: const TextStyle(fontFamily: 'Poppins', fontSize: 12))
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 290,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.4), // Shadow color
        spreadRadius: 0, // Spread radius
        blurRadius: 2, // Blur radius
        offset:const  Offset(0, 3), // Offset to create the bottom shadow
      ),],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset("assets/categories/ex_icon.png", width: 50, height: 50,),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(truncateTextTitle(title2), style: const TextStyle(fontFamily: 'Poppins'),),
                    Text(truncateTextDesc(description2), style: const TextStyle(fontFamily: 'Poppins'))
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 5,),
      ],
    );
  }
}
