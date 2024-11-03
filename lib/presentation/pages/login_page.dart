import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mamaz_yoga/data/data_sources/remote/login/login_remote_data_source.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_elevated_button.dart';

import '../../init_config.dart';
import '../routes/routes.gr.dart';
import '../theme/app_theme.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  static const route = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //bool _rememberMe = false;
  bool _passwordVisible = false;

  final LoginRemoteDataSource _loginRemoteDataSource =
      getIt<LoginRemoteDataSource>();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final user = await _loginRemoteDataSource.logIn(email, password);
      print(user);
      if (user != null) {
        print('Login successful: ${user.name}');
        if (!mounted) return;
        await AutoRouter.of(context).push(
          VideosRoute(),
        );
      } else {
        print('Login failed');
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
      final bool isAuthenticated =
          await _loginRemoteDataSource.isAuthenticated();
      print('Is authenticated: $isAuthenticated');
      if (isAuthenticated) {
        final userDetails = await _loginRemoteDataSource.getUser();
        if (userDetails != null) {
          print('User details: ${userDetails.name}, ${userDetails.email}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: AppTheme.textTheme.bodyMedium,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration(labelText: "* Nom d'utilisateur"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    style: AppTheme.textTheme.bodyMedium,
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      labelText: "* Mot de passe",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    }),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        // Checkbox(
                        //   activeColor: AppTheme.redColor,
                        //   value: _rememberMe,
                        //   onChanged: (bool? value) {
                        //     setState(() {
                        //       _rememberMe = value ?? false;
                        //     });
                        //   },
                        // ),
                        // Text(
                        //   'Se souvenir',
                        //   style: AppTheme.textTheme.bodyMedium
                        //       ?.copyWith(fontSize: 16),
                        // ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Mot de passe oublié',
                        style: AppTheme.textTheme.bodyMedium
                            ?.copyWith(color: AppTheme.redColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(onPressed: _login, text: 'Se connecter'),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Vous n'avez pas de compte ?",
                      style:
                          AppTheme.textTheme.bodyMedium?.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "S'inscrire",
                    style: AppTheme.textTheme.bodyMedium
                        ?.copyWith(fontSize: 15, color: AppTheme.redColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
