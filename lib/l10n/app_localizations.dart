import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Smart Text Tools',
      'home': 'Home',
      'settings': 'Settings',
      'tools_available': 'tools available',
      'general': 'General',
      'language': 'Language',
      'theme': 'Theme',
      'support': 'Support',
      'rate_app': 'Rate App',
      'share_app': 'Share App',
      'feedback': 'Send Feedback',
      'legal': 'Legal',
      'privacy': 'Privacy Policy',
      'terms': 'Terms of Service',
      'about': 'About',
      'version': 'Version',
      'extract_text': 'Image to Text',
      'extract_subtitle': 'Extract text from photos',
      'char_counter': 'Character Counter',
      'char_subtitle': 'Count chars, words & lines',
      'case_converter': 'Case Converter',
      'case_subtitle': 'Upper, lower & more',
      'remove_spaces': 'Remove Spaces',
      'remove_spaces_sub': 'Clean extra whitespace',
      'reverse_text': 'Reverse Text',
      'reverse_subtitle': 'Mirror your text',
      'remove_duplicates': 'Remove Duplicates',
      'remove_duplicates_sub': 'Delete repeated lines',
      'sort_text': 'Sort Text',
      'sort_subtitle': 'Sort lines A→Z or Z→A',
      'word_counter': 'Word Counter',
      'word_sub': 'Words, paragraphs & time',
      'remove_lines': 'Remove Line Breaks',
      'remove_lines_sub': 'Join lines together',
      'text_replacer': 'Text Replacer',
      'text_replacer_sub': 'Find & replace text',
      'case_alternator': 'Case Alternator',
      'case_alternator_sub': 'aLtErNaTiNg CaSe',
      'light_mode': 'Light',
      'dark_mode': 'Dark',
      'system_mode': 'System',
      'copy': 'Copy',
      'copied': 'Copied!',
      'share': 'Share',
      'paste': 'Paste',
      'clear': 'Clear',
      'input_hint': 'Enter your text here...',
      'output_label': 'Output',
      'process': 'Process',
      'extracting': 'Extracting text...',
      'select_image': 'Select Image',
      'gallery': 'Gallery',
      'camera': 'Camera',
      'no_image': 'No image selected',
    },
    'vi': {
      'app_title': 'Công cụ Văn bản',
      'home': 'Trang chủ',
      'settings': 'Cài đặt',
      'tools_available': 'công cụ khả dụng',
      'general': 'Chung',
      'language': 'Ngôn ngữ',
      'theme': 'Giao diện',
      'support': 'Hỗ trợ',
      'rate_app': 'Đánh giá ứng dụng',
      'share_app': 'Chia sẻ ứng dụng',
      'feedback': 'Gửi phản hồi',
      'legal': 'Pháp lý',
      'privacy': 'Chính sách bảo mật',
      'terms': 'Điều khoản dịch vụ',
      'about': 'Giới thiệu',
      'version': 'Phiên bản',
      'extract_text': 'Hình ảnh sang Văn bản',
      'extract_subtitle': 'Trích xuất văn bản từ ảnh',
      'char_counter': 'Đếm ký tự',
      'char_subtitle': 'Đếm ký tự, từ & dòng',
      'case_converter': 'Chuyển đổi kiểu chữ',
      'case_subtitle': 'Hoa, thường & hơn thế',
      'remove_spaces': 'Xóa khoảng trắng',
      'remove_spaces_sub': 'Làm sạch khoảng trắng thừa',
      'reverse_text': 'Đảo ngược văn bản',
      'reverse_subtitle': 'Phản chiếu văn bản của bạn',
      'remove_duplicates': 'Xóa dòng trùng',
      'remove_duplicates_sub': 'Xóa các dòng bị lặp lại',
      'sort_text': 'Sắp xếp văn bản',
      'sort_subtitle': 'Sắp xếp A→Z hoặc Z→A',
      'word_counter': 'Đếm từ chuyên sâu',
      'word_sub': 'Từ, đoạn văn & thời gian đọc',
      'remove_lines': 'Xóa xuống dòng',
      'remove_lines_sub': 'Nối các dòng lại với nhau',
      'text_replacer': 'Tìm & Thay thế',
      'text_replacer_sub': 'Tìm và thay thế văn bản',
      'case_alternator': 'Chữ xen kẽ',
      'case_alternator_sub': 'cHữ xEn kẼ nHư nÀy',
      'light_mode': 'Sáng',
      'dark_mode': 'Tối',
      'system_mode': 'Hệ thống',
      'copy': 'Sao chép',
      'copied': 'Đã chép!',
      'share': 'Chia sẻ',
      'paste': 'Dán',
      'clear': 'Xóa',
      'input_hint': 'Nhập văn bản của bạn tại đây...',
      'output_label': 'Kết quả',
      'process': 'Xử lý',
      'extracting': 'Đang trích xuất văn bản...',
      'select_image': 'Chọn hình ảnh',
      'gallery': 'Thư viện',
      'camera': 'Máy ảnh',
      'no_image': 'Chưa chọn hình ảnh',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
