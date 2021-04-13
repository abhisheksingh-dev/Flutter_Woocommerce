import 'package:flutter/material.dart';
import 'package:that_vogue/api/apiService.dart';
import 'package:that_vogue/helper/formHelper.dart';
import 'package:that_vogue/helper/progressHUD.dart';
import 'package:that_vogue/models/customers.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  APIService apiService;
  CustomerModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  @override
  void initState() {
    apiService = new APIService();
    model = new CustomerModel();
    super.initState();
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: true,
        title: Text("Sign Up"),
      ),
      body: ProgressHUD(
        child: Form(
          key: globalKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormHelper.fieldLabel("First Name"),
                      FormHelper.textInput(
                        context,
                        model.firstName,
                        (value) {
                          this.model.firstName = value;
                        },
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Please enter First Name";
                          } else
                            return null;
                        },
                      ),
                      FormHelper.fieldLabel("Last Name"),
                      FormHelper.textInput(
                        context,
                        model.lastName,
                        (value) {
                          this.model.lastName = value;
                        },
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Please enter Last Name";
                          } else
                            return null;
                        },
                      ),
                      FormHelper.fieldLabel("Email id"),
                      FormHelper.textInput(
                        context,
                        model.email,
                        (value) {
                          this.model.email = value;
                        },
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Please enter Last Name";
                          } else
                            return null;
                        },
                      ),
                      FormHelper.fieldLabel("Password"),
                      FormHelper.textInput(
                        context,
                        model.password,
                        (value) {
                          this.model.password = value;
                        },
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Please enter Last Name";
                          } else
                            return null;
                        },
                        obscureText: hidePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Colors.blue,
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: FormHelper.saveButton(
                          "Register",
                          () {
                            if (validateAndSave()) {
                              print(model.toJson());
                              setState(() {
                                isApiCallProcess = true;
                              });

                              apiService.createCustomer(model).then((ret) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                if (ret) {
                                  FormHelper.showMessage(
                                    context,
                                    "WooCommerce App",
                                    "Registration Sucess",
                                    "ok",
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                } else {
                                  FormHelper.showMessage(
                                    context,
                                    "WooCommerce App",
                                    "Email id Already Registered",
                                    "ok",
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }
}
