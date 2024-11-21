import 'package:flutter/material.dart';
import 'app.dart';
import 'init_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfig();
  runApp(const MamazYogaApp());
}
