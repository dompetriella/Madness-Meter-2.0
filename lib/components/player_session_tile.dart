import 'package:flutter/material.dart';

class PlayerSessionTile extends StatelessWidget {
  final int id;
  final String campaignName;
  final int madnessValue;
  final int maxMadnessValue;
  const PlayerSessionTile(
      {super.key,
      required this.id,
      required this.campaignName,
      required this.madnessValue,
      required this.maxMadnessValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25), offset: Offset(3, 5))
          ],
          color: Colors.lightBlue.withOpacity(.70),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ID: $id'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Campaign Name: ${campaignName.toUpperCase()}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Madness Meter Value: $madnessValue/$maxMadnessValue'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
