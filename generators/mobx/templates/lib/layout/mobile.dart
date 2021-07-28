import 'package:flutter/material.dart';
import 'package:<%= appsName %>/widgets/progress_indicator_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileLayout extends StatelessWidget {
  final Widget? leftChild;
  final Widget? rightChild;
  final Widget? topChild;
  final Widget? bottomChild;
  final Widget? loginChild;
  final bool? showProgress;

 const MobileLayout({Key? key,
  this.loginChild,
      this.leftChild,
      this.rightChild,
      this.topChild,
      this.bottomChild,
      this.showProgress
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
          OrientationLayoutBuilder(
            landscape: (context) => Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: _buildLeftSide(leftChild!),
                ),
                Expanded(
                  flex: 1,
                  child: _buildRightSide(rightChild!),
                ),
              ],
            ),
            portrait: (context) => Center(child: _buildRightSide(rightChild!)),
          ),
          Visibility(
            visible: showProgress!,
            child: CustomProgressIndicatorWidget(),
          )
        ]);
  }

   Widget _buildLeftSide(Widget child) => SizedBox.expand(
          child: child
      );

  Widget _buildRightSide(Widget child) => Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: child
          ),
        ),
      );
}