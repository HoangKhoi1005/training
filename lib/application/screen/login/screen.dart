part of application;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  /// Use case
  final userServiceConfig = DevUserServiceConfig();
  late final userService = UserService(config: userServiceConfig);
  late final userRepository = UserRepositoryImpl(userService: userService);
  late final presenter = Presenter();
  late final login = Login(
    userRepository: userRepository,
    myApplication: presenter,
  );

  void goHome(User user) {
    final location = '/home';
    final router = GoRouter.of(context);
    router.go(location);
  }

  void onLogin() async {
    final formState = _formKey.currentState;
    if (formState != null) {
      final isValid = formState.validate();
      if (isValid) {
        formState.save();
        final phone = phoneController.text;
        final password = passwordController.text;
        final user = await login(userName: phone, password: password);
        goHome(user);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 44,
                  horizontal: 44,
                ),
                child: Image.asset(
                  AssetImage.loginBanner,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Numéro de téléphone',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un numéro de téléphone';
                    }
                    if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                      return 'Veuillez entrer un numéro de téléphone valide';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: colorScheme.primary,
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un mot de passe';
                    }
                    if (value.length < 6) {
                      return 'Le mot de passe doit comporter au moins 6 caractères';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        double.infinity,
                        48,
                      ),
                    ),
                    onPressed: onLogin,
                    child: Text(
                      'Connexion',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
