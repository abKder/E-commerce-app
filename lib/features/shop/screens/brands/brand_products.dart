import 'package:e_commerce/common/styles/padding.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(showBackArrow: true,title: Text('Apple', style: Theme.of(context).textTheme.headlineSmall)),


      body: SingleChildScrollView(
        child: Padding(padding: APadding.screenPadding,
        child: Column(
          children: [

          ],
        ),),
      ),
    );
  }
}
