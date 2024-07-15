import 'package:app_shoes_ecommerce/core/utilities/media_query.dart';
import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
            child: Image.asset('${AssetPath.imagePath}error.png'),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'OPP',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
