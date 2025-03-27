import 'package:flutter/material.dart';

class FlagForm extends StatelessWidget {
  const FlagForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(decoration: const InputDecoration(labelText: 'Operator ID')),
          TextFormField(decoration: const InputDecoration(labelText: 'Machine No')),
          TextFormField(decoration: const InputDecoration(labelText: 'Defect')),
          TextFormField(decoration: const InputDecoration(labelText: 'Inspected By')),
          TextFormField(decoration: const InputDecoration(labelText: 'Date of Inspection (YYYY/MM/DD)')),
          TextFormField(decoration: const InputDecoration(labelText: 'Time of Inspection (HH:mm)')),
          TextFormField(decoration: const InputDecoration(labelText: 'Supervisor in Charge')),
        ],
      ),
    );
  }
}
