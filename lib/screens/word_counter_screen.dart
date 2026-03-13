import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../tools/text_counter.dart';
import '../widgets/text_input_box.dart';

class WordCounterScreen extends StatefulWidget {
  const WordCounterScreen({super.key});

  @override
  State<WordCounterScreen> createState() => _WordCounterScreenState();
}

class _WordCounterScreenState extends State<WordCounterScreen> {
  final _controller = TextEditingController();
  TextCounterResult _result = TextCounter.count('');

  void _onTextChanged(String text) {
    setState(() {
      _result = TextCounter.count(text);
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
        title: const Text('Word Counter'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputBox(
                controller: _controller,
                hintText: 'Start typing to see word stats...',
                maxLines: 10,
                onChanged: _onTextChanged,
              ),
              const SizedBox(height: 24),
              Text(
                'Text Statistics',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildStatsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsList() {
    final stats = [
      _StatItem('Words', '${_result.words}', Icons.text_snippet_rounded, AppTheme.toolGradients[0]),
      _StatItem('Characters', '${_result.characters}', Icons.pin_rounded, AppTheme.toolGradients[1]),
      _StatItem('Characters (no spaces)', '${_result.charactersNoSpaces}', Icons.short_text_rounded, AppTheme.toolGradients[3]),
      _StatItem('Lines', '${_result.lines}', Icons.format_line_spacing_rounded, AppTheme.toolGradients[5]),
      _StatItem('Paragraphs', '${_result.paragraphs}', Icons.subject_rounded, AppTheme.toolGradients[4]),
      _StatItem('Reading Time', _result.readingTime, Icons.timer_rounded, AppTheme.toolGradients[6]),
    ];

    return Column(
      children: stats.map((stat) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: stat.gradient.colors.first.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: stat.gradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(stat.icon, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  stat.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              Text(
                stat.value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: stat.gradient.colors.first,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _StatItem {
  final String label;
  final String value;
  final IconData icon;
  final LinearGradient gradient;

  _StatItem(this.label, this.value, this.icon, this.gradient);
}
