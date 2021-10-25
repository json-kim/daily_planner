import 'package:flutter/material.dart';

import 'components/body.dart';

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
