import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sergio_web/common/firestore/firestore_module.dart';
import 'package:sergio_web/common/widgets/cu_gradient_button.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';

class SendMeMessageForm extends StatefulWidget {
  const SendMeMessageForm({super.key});

  @override
  State<SendMeMessageForm> createState() => _SendMeMessageFormState();
}

class _SendMeMessageFormState extends State<SendMeMessageForm> {
  final _formKey = GlobalKey<FormState>();

  /// Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  /// Simulate Sending Message
  void _submitForm(AppLocalizations strings) {
    if (_formKey.currentState!.validate()) {
      saveContactSubmission(
          name: _nameController.text,
          email: _emailController.text,
          message: _messageController.text,
          subject: _subjectController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(strings.send_message),
        ),
      );

      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final fieldStyle = Theme.of(context).inputDecorationTheme;
    final strings = AppLocalizations.of(context)!;

    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    strings.contact_form_title,
                    style: textStyle.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: _buildFormField(
                          fieldStyle: fieldStyle,
                          textStyle: textStyle,
                          label: strings.contact_form_name_label,
                          hint: strings.contact_form_name_place_holder,
                          controller: _nameController,
                          validator: (value) => _validateName(value, strings),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildFormField(
                          fieldStyle: fieldStyle,
                          textStyle: textStyle,
                          label: strings.contact_form_email_label,
                          hint: strings.contact_form_email_place_holder,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => _validateEmail(value, strings),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    fieldStyle: fieldStyle,
                    textStyle: textStyle,
                    label: strings.contact_form_subject_label,
                    hint: strings.contact_form_subject_place_holder,
                    controller: _subjectController,
                    validator: (value) => _validateRequired(value, strings),
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    textStyle: textStyle,
                    fieldStyle: fieldStyle,
                    label: strings.contact_form_subject_body_label,
                    hint: strings.contact_form_subject_body_place_holder,
                    controller: _messageController,
                    maxLines: 6,
                    validator: (value) => _validateRequired(value, strings),
                  ),
                  const SizedBox(height: 24),
                  CUGradientButton(callback: (){
                    _submitForm(strings);
                  } , title: strings.contact_form_send_button_label),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFormField({
    required TextTheme textStyle,
    required InputDecorationTheme fieldStyle,
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyle.labelMedium,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: textStyle.bodyMedium,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: fieldStyle.hintStyle,
          ),
        ),
      ],
    );
  }

  String? _validateRequired(String? value, AppLocalizations strings) {
    if (value == null || value.isEmpty) {
      return strings.contact_validator;
    }
    return null;
  }

  String? _validateEmail(String? value, AppLocalizations strings) {
    if (value == null || value.isEmpty) {
      return strings.contact_email_empty_validator;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return strings.contact_email_validator;
    }
    return null;
  }

  String? _validateName(String? value, AppLocalizations strings) {
    return _validateRequired(value, strings);
  }
}
