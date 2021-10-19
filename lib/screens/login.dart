import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../helpers/validators.dart';
import '../const.dart';
import '../router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    @required this.scaffoldKey,
  }) : super(key: key);

  final scaffoldKey;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Login",
          semanticsLabel: 'logo',
        ),
        actions: [
          Image.asset(
            "assets/logo.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: SvgPicture.asset(
                  "assets/coffee_break.svg",
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  semanticsLabel: 'Wire Brain Coffee',
                  fit: BoxFit.fitWidth,
                ),
              ),
              ..._buildInputs(),
              ..._buildForgotPassword(),
              ..._buildLoginButton(),
              ..._buildCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInputs() {
    return <Widget>[
      TextFormField(
        key: const Key('email'),
        controller: _emailFieldController,
        decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'me@majidhajian.com',
          labelStyle: TextStyle(color: darkBrown),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: darkBrown),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: darkBrown),
          ),
        ),
        cursorColor: darkBrown,
        validator: Validators.validateEmail,
      ),
      const SizedBox(height: 30),
      TextFormField(
        key: const Key('password'),
        controller: _passwordFieldController,
        autocorrect: false,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'securepassword',
          labelText: 'Password',
          labelStyle: TextStyle(color: darkBrown),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: darkBrown),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: darkBrown),
          ),
        ),
        cursorColor: darkBrown,
        validator: Validators.validatePassword,
      ),
      const SizedBox(height: 10),
    ];
  }

  List<Widget> _buildForgotPassword() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Forgot password?",
            style: TextStyle(
              color: darkBrown,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
    ];
  }

  List<Widget> _buildLoginButton() {
    return <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(55, 15, 55, 15),
                ),
                backgroundColor: MaterialStateProperty.all(darkBrown),
              ),
              key: const Key('signIn'),
              onPressed: _onSubmitLoginButton,
              child: const Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
    ];
  }

  List<Widget> _buildCreateAccount() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don\'t have an account?",
            style: TextStyle(color: Colors.grey.shade600),
          ),
          Text(
            " Register",
            style: TextStyle(
              color: darkBrown,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      const SizedBox(height: 35),
    ];
  }

  _onSubmitLoginButton() async {
    loginInfo.isLoggedIn = true;
    context.goNamed('menu');
  }
}
