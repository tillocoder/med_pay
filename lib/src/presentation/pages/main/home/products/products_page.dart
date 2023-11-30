import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,

        ),
      ],
    ),
  );
}
