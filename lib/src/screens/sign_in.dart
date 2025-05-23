import 'package:flutter/material.dart';

class Credentials {
  final String username;
  final String password;

  Credentials(this.username, this.password);
}

class SignInScreen extends StatefulWidget {
  final ValueChanged<Credentials> onSignIn;

  const SignInScreen({required this.onSignIn, super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreenState();

}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
          child: Card(
            child: Container(
              constraints: BoxConstraints.loose(const Size(800, 600)),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign in',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    controller: _usernameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    controller: _passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextButton(
                        onPressed: () async {
                          widget.onSignIn(
                              Credentials(
                                  _usernameController.value.text,
                                  _passwordController.value.text
                              )
                          );
                        },
                        child: const Text('Sign in')),
                  )
                ],
              ),
            ),
          ),
        ),
      );

}