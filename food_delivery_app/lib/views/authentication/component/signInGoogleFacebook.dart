import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class SignInGGFB extends StatelessWidget {
  const SignInGGFB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //sign in google button
        Container(
          alignment: Alignment.center,
          width: Dimensions.screenWidth / 2.8,
          height: Dimensions.screenHeight / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15 - 5),
            border: Border.all(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon of google
              Image.asset('assets/images/ic_google.png'),
              SizedBox(
                width: Dimensions.widthPadding15,
              ),
              //google txt
              Text(
                'Google',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: Dimensions.font24 - 4,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          width: Dimensions.widthPadding15,
        ),

        //sign in facebook button
        Container(
          alignment: Alignment.center,
          width: Dimensions.screenWidth / 2.8,
          height: Dimensions.screenHeight / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15 - 5),
            border: Border.all(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //facebook icon
              Image.asset('assets/images/ic_facebook.png'),
              SizedBox(
                width: Dimensions.widthPadding15,
              ),

              //facebook txt
              Text(
                'Facebook',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: Dimensions.font24 - 4,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
