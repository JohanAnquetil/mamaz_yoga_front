import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'app.dart';
import 'init_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfig();
  Intl.defaultLocale = 'fr_FR';
  initializeDateFormatting();
  runApp(const MamazYogaApp());
}
