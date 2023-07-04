import 'package:crud_firebase/colors.dart';
import 'package:crud_firebase/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Form(
            key: _keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage('assets/avatar1.png'),
                ),
                SizedBox(height: 10),
                Text(
                  "Vamos a iniciar sesión",
                  style: GoogleFonts.montserrat(
                    color: AppColors.FontColorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 310,
                  height: 40,
                  child: TextFormField(
                    validator: (valor){
                      if (valor!.isEmpty) {
                        return 'llena el campo';
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    style:
                        GoogleFonts.montserrat(color: AppColors.FontColorWhite),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: AppColors.FontColorBlue,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Email",
                      hintStyle: GoogleFonts.montserrat(
                        color: AppColors.FontColorWhite,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 310,
                  height: 40,
                  child: TextFormField(
                    validator: (valor){
                      if (valor!.isEmpty) {
                        return 'llena el campo';
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    obscureText: hidePassword,
                    style:
                        GoogleFonts.montserrat(color: AppColors.FontColorWhite),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: AppColors.FontColorBlue,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Contraseña",
                      hintStyle: GoogleFonts.montserrat(
                        color: AppColors.FontColorWhite,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Icon(
                          hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.FontColorWhite,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/mini_rectangle.png',
                            width: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Recordarme",
                            style: GoogleFonts.montserrat(
                              color: AppColors.FontColorWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "¿Olvide mi contraseña?",
                      style: GoogleFonts.montserrat(
                        color: AppColors.FontColorWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 295,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.FontColorPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (
                            context,
                          ) =>
                                  SplashScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Completa todos los campos'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Iniciar sesión",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿No tienes cuenta?",
                      style: GoogleFonts.montserrat(
                        color: AppColors.FontColorWhite,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Registrate",
                        style: GoogleFonts.montserrat(
                          color: AppColors.FontColorPurple,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
