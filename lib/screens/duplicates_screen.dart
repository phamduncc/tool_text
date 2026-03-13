import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../tools/text_duplicates.dart';
import '../widgets/text_input_box.dart';
import '../widgets/result_box.dart';
import '../widgets/process_button.dart';

class DuplicatesScreen extends StatefulWidget {
  const DuplicatesScreen({super.key});

  @override
  State<DuplicatesScreen> createState() => _DuplicatesScreenState();
}

class _DuplicatesScreenState extends State<DuplicatesScreen> {
  final _controller = TextEditingController();
  String _result = '';

  void _process() {
    setState(() {
      _result = TextDuplicates.removeDuplicateLines(_controller.text);
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
        title: const Text('Remove Duplicates'),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
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
                hintText: 'Enter text with duplicate lines...',
                maxLines: 10,
              ),
              const SizedBox(height: 20),
              ProcessButton(
                label: 'Remove Duplicates',
                icon: Icons.filter_alt_rounded,
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
