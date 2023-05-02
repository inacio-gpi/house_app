import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app/lib.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final LoginCubit cubit;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameInputController;
  @override
  void initState() {
    super.initState();
    _nameInputController = TextEditingController();
  }

  @override
  void dispose() {
    _nameInputController.dispose();
    super.dispose();
  }

  Future<void> _doLogin() async {
    if (_formKey.currentState!.validate()) {
      await widget.cubit.doLogin(name: _nameInputController.text);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            bloc: widget.cubit,
            listener: (context, state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.failure.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: _nameInputController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter your name',
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _doLogin,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('developed by: @inacio.gpi'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
