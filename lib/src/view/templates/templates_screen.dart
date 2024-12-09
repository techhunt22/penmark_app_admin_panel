import 'package:flutter/material.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Header
            Text("TemplatesScreen"),



        ],

      ),

    )

    ,

    );
  }
}