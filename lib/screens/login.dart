import 'package:test_application_4310dakp/imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp _passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>]).{8,}$',
  );
  bool passwordVisible = false;
  Icon passwordVisibilityIcon = const Icon(Icons.visibility_off);

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Call the authentication function from api_service.dart
    final completer = Completer<TokenModel?>();

    getUserAccessTokenAsync(username, password)
        .then((value) => {
              completer.complete(value),
            })
        .catchError((error) => {
              completer.completeError(error),
            });

    completer.future.then(
      (value) => {
        if (value != null)
          {
            // Authentication successful, navigate to the next screen or perform other actions
            debugPrint('Login successful'),

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Login Successful'),
                ),
              ),

            Navigator.pop(context, value),
          }
        else
          {
            // Authentication failed, handle accordingly
            debugPrint('Login failed'),

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Login Failed'),
                ),
              ),
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() => passwordVisible = !passwordVisible);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {
                if (_passwordRegex.hasMatch(_passwordController.text))
                  {
                    // Password is valid
                    debugPrint('Password is valid'),
                    _login(),
                  }
                else
                  {
                    // Password is not valid
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Password is not valid'),
                        ),
                      ),
                  }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
