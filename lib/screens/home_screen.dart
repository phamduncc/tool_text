import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'counter_screen.dart';
import 'converter_screen.dart';
import 'spaces_screen.dart';
import 'reverse_screen.dart';
import 'duplicates_screen.dart';
import 'sort_screen.dart';
import 'word_counter_screen.dart';
import 'line_breaks_screen.dart';
import 'replacer_screen.dart';
import 'alternator_screen.dart';
import 'ocr_screen.dart';

class ToolItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget screen;
  final LinearGradient gradient;

  const ToolItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.screen,
    required this.gradient,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final List<ToolItem> tools;
  late AnimationController _staggerController;

  @override
  void initState() {
    super.initState();
    tools = [
      ToolItem(
        title: 'Character Counter',
        subtitle: 'Count chars, words & lines',
        icon: Icons.pin_rounded,
        screen: const CounterScreen(),
        gradient: AppTheme.toolGradients[0],
      ),
      ToolItem(
        title: 'Case Converter',
        subtitle: 'Upper, lower & more',
        icon: Icons.text_fields_rounded,
        screen: const ConverterScreen(),
        gradient: AppTheme.toolGradients[1],
      ),
      ToolItem(
        title: 'Remove Spaces',
        subtitle: 'Clean extra whitespace',
        icon: Icons.space_bar_rounded,
        screen: const SpacesScreen(),
        gradient: AppTheme.toolGradients[2],
      ),
      ToolItem(
        title: 'Reverse Text',
        subtitle: 'Mirror your text',
        icon: Icons.swap_horiz_rounded,
        screen: const ReverseScreen(),
        gradient: AppTheme.toolGradients[3],
      ),
      ToolItem(
        title: 'Remove Duplicates',
        subtitle: 'Delete repeated lines',
        icon: Icons.filter_alt_rounded,
        screen: const DuplicatesScreen(),
        gradient: AppTheme.toolGradients[4],
      ),
      ToolItem(
        title: 'Sort Text',
        subtitle: 'Sort lines A→Z or Z→A',
        icon: Icons.sort_by_alpha_rounded,
        screen: const SortScreen(),
        gradient: AppTheme.toolGradients[5],
      ),
      ToolItem(
        title: 'Word Counter',
        subtitle: 'Words, paragraphs & time',
        icon: Icons.analytics_rounded,
        screen: const WordCounterScreen(),
        gradient: AppTheme.toolGradients[6],
      ),
      ToolItem(
        title: 'Remove Line Breaks',
        subtitle: 'Join lines together',
        icon: Icons.wrap_text_rounded,
        screen: const LineBreaksScreen(),
        gradient: AppTheme.toolGradients[7],
      ),
      ToolItem(
        title: 'Text Replacer',
        subtitle: 'Find & replace text',
        icon: Icons.find_replace_rounded,
        screen: const ReplacerScreen(),
        gradient: AppTheme.toolGradients[8],
      ),
      ToolItem(
        title: 'Case Alternator',
        subtitle: 'aLtErNaTiNg CaSe',
        icon: Icons.format_color_text_rounded,
        screen: const AlternatorScreen(),
        gradient: AppTheme.toolGradients[9],
      ),
      ToolItem(
        title: 'Image to Text',
        subtitle: 'Extract text from photos',
        icon: Icons.document_scanner_rounded,
        screen: const OcrScreen(),
        gradient: AppTheme.toolGradients[10],
      ),
    ];

    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _staggerController.forward();
  }

  @override
  void dispose() {
    _staggerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Compact header
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 14),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: const Icon(
                        Icons.auto_fix_high_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Smart Text Tools',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${tools.length} tools available',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Tool list
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tools.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    return _ToolTile(
                      tool: tools[index],
                      index: index,
                      animation: _staggerController,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToolTile extends StatelessWidget {
  final ToolItem tool;
  final int index;
  final AnimationController animation;

  const _ToolTile({
    required this.tool,
    required this.index,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final delay = index * 0.06;
    final itemAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(delay, (delay + 0.4).clamp(0, 1), curve: Curves.easeOutCubic),
      ),
    );

    return AnimatedBuilder(
      animation: itemAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: itemAnimation.value,
          child: Transform.translate(
            offset: Offset(0, 14 * (1 - itemAnimation.value)),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => tool.screen,
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.04),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    )),
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: tool.gradient.colors.first.withValues(alpha: 0.12),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  gradient: tool.gradient,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: tool.gradient.colors.first.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(tool.icon, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 14),
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tool.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tool.subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textMuted,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Arrow
              Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.textMuted.withValues(alpha: 0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBuilder extends StatelessWidget {
  final Animation<double> animation;
  final Widget Function(BuildContext, Widget?) builder;
  final Widget? child;

  const AnimatedBuilder({
    super.key,
    required this.animation,
    required this.builder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: animation,
      builder: (context, child) => builder(context, child),
      child: child,
    );
  }
}
