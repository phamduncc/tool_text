import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../tools/text_alternator.dart';
import '../widgets/text_input_box.dart';
import '../widgets/result_box.dart';
import '../widgets/process_button.dart';

class AlternatorScreen extends StatefulWidget {
  const AlternatorScreen({super.key});

  @override
  State<AlternatorScreen> createState() => _AlternatorScreenState();
}

class _AlternatorScreenState extends State<AlternatorScreen> {
  final _controller = TextEditingController();
  String _result = '';

  void _process() {
    setState(() {
      _result = TextAlternator.alternateCase(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Alternator'),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextInputBox(
                controller: _controller,
                hintText: 'Enter text for alternating case...',
              ),
              const SizedBox(height: 20),
              ProcessButton(
                label: 'Alternate Case',
                icon: Icons.format_color_text_rounded,
                onPressed: _process,
              ),
              const SizedBox(height: 20),
              ResultBox(result: _result),
            ],
          ),
        ),
      ),
    );
  }
}
