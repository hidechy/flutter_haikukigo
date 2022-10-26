import 'package:flutter/material.dart';

import '../../models/kigo.dart';

class KigoCard extends StatelessWidget {
  const KigoCard({super.key, required this.size, required this.kigo});

  final Size size;
  final Kigo kigo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.2),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height / 6,
            ),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kigo.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(kigo.yomi),
                  const Divider(),
                  Text(kigo.detail),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[900]!.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(kigo.length.toString()),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(
              kigo.category,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
