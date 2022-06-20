import 'package:flutter/material.dart';

typedef IntValueSetters = void Function(int value);

class RangeSelectorFormField extends StatelessWidget {
  const RangeSelectorFormField(
      {Key? key,
      required this.formKey,
      required this.minValueSetter,
      required this.maxValueSetter})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final IntValueSetters minValueSetter;
  final IntValueSetters maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: 'Minimum',
                intValueSetter: minValueSetter,
              ),
              const SizedBox(
                height: 12,
              ),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
                intValueSetter: maxValueSetter,
              ),
            ],
          ),
        ));
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField(
      {Key? key, required this.labelText, required this.intValueSetter})
      : super(key: key);

  final String labelText;
  final IntValueSetters intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an interger';
        }
        return null;
      },
    );
  }
}
