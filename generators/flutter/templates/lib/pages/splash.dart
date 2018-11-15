import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/logo-jhipster.svg', 
                width: MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.height/4,)
      ),
    );
  }
}
