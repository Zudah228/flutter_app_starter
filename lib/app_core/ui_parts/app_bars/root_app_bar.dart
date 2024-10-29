import 'package:flutter/material.dart';

import '../../../app/home/home_page.dart';

class RootAppBar extends AppBar {
  RootAppBar({super.key, super.title})
      : super(
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    HomePage.route(),
                    (_) => false,
                  );
                },
                icon: const Icon(Icons.home),
              );
            },
          ),
        );
}
