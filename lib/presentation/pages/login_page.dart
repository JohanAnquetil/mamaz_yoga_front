import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/auth/models/signin_req_params.dart';
import '../../domain/auth/usescases/sign_in.dart';
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
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
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
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 70),
                loginTitle('Veuillez vous identifier'),
                const SizedBox(height: 40),
                _userNameTextField(),
                const SizedBox(height: 40),
                _passwordUserField(),
                const SizedBox(height: 40),
                _signInButton(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                              "https://mamazyoga.com/yoga-en-ligne-prenatal-postnatal/mot-de-passe-oublie/"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: Text(
                        'Mot de passe oublié',
                        style: AppTheme.textTheme.bodyMedium
                            ?.copyWith(color: AppTheme.redColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
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
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://mamazyoga.com/tarifs/'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
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

  TextFormField _userNameTextField() => TextFormField(
        style: AppTheme.textTheme.bodyMedium,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.redColor)),
            labelText: "* Nom d'utilisateur",
            errorStyle: TextStyle(color: AppTheme.redColor, fontSize: 15)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre email';
          }
          return null;
        },
      );

  TextFormField _passwordUserField() => TextFormField(
      style: AppTheme.textTheme.bodyMedium,
      controller: _passwordController,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        labelText: "* Mot de passe",
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.redColor)),
        errorStyle: const TextStyle(color: AppTheme.redColor, fontSize: 15),
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
          return 'Veuillez entrer votre mot de passe';
        }
        return null;
      });

  Widget loginTitle(String title) => Row(
        children: [
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: AppTheme.textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

  Widget _signInButton() => SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.goldColor,
          ),
          onPressed: _onPressedTap,
          child: const Text(
            'Se connecter',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

  Future<void> _onPressedTap() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String email = _emailController.text;
    String password = _passwordController.text;
    print('in on Pressed Tap');
    print(email);
    print(password);
    var response = await getIt<SigninUseCase>().call(
      params: SigninReqParams(
        username: email,
        password: password,
      ),
    );
    response.fold(
        (onFailure) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(onFailure))),
        (onSuccess) => AutoRouter.of(context).push(const HomeRoute()));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
