import 'package:flutter/material.dart';
import 'package:lab09/main.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(children: [
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
                const SizedBox(height: 16,),
                Text('Sing up',
                    style: Theme.of(context).textTheme.bodyLarge)]
              ),
            ),
            const SizedBox(height: 16),


            Form(
              key: singupFormKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Name:',
                      style: Theme.of(context).textTheme.bodyLarge
                  ),
                  TextFormField(
                    validator: (value) => value != null && value.length >= 3 ? null : 'Name must be at least 3 characters',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Email:',
                      style: Theme.of(context).textTheme.bodyLarge
                  ),
                  TextFormField(
                    validator: (value) => value != null && value.contains('@') ? null : 'Enter a valid email',
                  ),
                  const SizedBox(height: 16),
                  Text(
                      'Password:',
                      style: Theme.of(context).textTheme.bodyLarge
                  ),
                  TextFormField(
                    validator: (value) => value != null && value.length >= 7 ? null : 'Password must be at least 7 characters',

                  ),
                  const SizedBox(height: 16),
                ]
            )),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  if (singupFormKey.currentState?.validate() ?? false) {

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
                child: const Text("Sing up"),
              )
            ),
            SizedBox(height: 16,),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => {
                  Navigator.pop(context)
                },
                child: const Text("Back"),
              ),
            )
          ],
        )
      )
    );
  }

}
