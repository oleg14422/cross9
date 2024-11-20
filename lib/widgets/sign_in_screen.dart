import 'package:flutter/material.dart';
import 'package:lab09/main.dart';
import './reset_password_screen.dart';
import './signup_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                width: 200,
              ),
            ),
            const SizedBox(height: 16),
            Form(
                key: singinFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email:',
                      style: Theme.of(context).textTheme.bodyLarge
                  ),
                  TextFormField(
                    validator: (value) => value != null && value.contains('@') ? null : 'Enter a valid email',
                  ),
                  const SizedBox(height: 16),
                  Text('Password:',
                      style: Theme.of(context).textTheme.bodyLarge
                  ),
                  TextFormField(
                    validator: (value) => value != null && value.length >= 7 ? null : 'Password must be at least 7 characters',

                  ),

                ],
            )),

            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text("Sign up"),
                    ),
                  )
                )
              ],
            ),



            // TODO: Add some widgets here
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => {
                        if (singinFormKey.currentState?.validate() ?? false) {
                        showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return const AlertDialog(
                              title: Text('Message'),
                              content: Text("Форма валідна 🎉🎉🎉"),
                            );
                          },
                        )
                        } else {
                          // Якщо форма не валідна, виводимо повідомлення про помилку
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form is invalid')),
                          )
                        }

                      },
                      child: const Text("Login"),
                    ),
                  ),
                ),


                const SizedBox(width: 16.0),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text("Reset password"),
                    )
                  )
                )
              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
