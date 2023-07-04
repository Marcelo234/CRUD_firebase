import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crud_firebase/colors.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _keyForm = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool isPasswordMatch() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    return password == confirmPassword;
  }

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
                Icon(
                  Icons.person_add,
                  size: 64,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  "¡Hola!, Registrate para comenzar",
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
                    validator: (valor) {
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
                      hintText: "Nombre",
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
                    validator: (valor) {
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
                    validator: (valor) {
                      if (valor!.isEmpty) {
                        return 'llena el campo';
                      }
                      return null;
                    },
                    controller: passwordController,
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
                Container(
                  width: 310,
                  height: 40,
                  child: TextFormField(
                    validator: (valor) {
                      if (valor!.isEmpty) {
                        return 'llena el campo';
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    cursorColor: Colors.white,
                    obscureText: hideConfirmPassword,
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
                      hintText: "Confirmar contraseña",
                      hintStyle: GoogleFonts.montserrat(
                        color: AppColors.FontColorWhite,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideConfirmPassword = !hideConfirmPassword;
                          });
                        },
                        child: Icon(
                          hideConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.FontColorWhite,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Visibility(
                  visible: !isPasswordMatch(),
                  child: Text(
                    "Las contraseñas no coinciden",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
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
                                LoginPage(),
                          ),
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
                      "Registrarse",
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
                      "¿Ya tienes una cuenta?",
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
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Iniciar sesión",
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
