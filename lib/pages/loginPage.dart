import 'package:flutter/material.dart';
import 'toDoPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SharedPreferences loginData;
  bool newUser;

  void initState() {
    super.initState();
    check_if_already_login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Usuário:",
                  hintText: "Digite o nome do usuário"),
              controller: _controllerLogin,
              validator: (String text) {
                if (text.isEmpty) {
                  return "Informe o nome do usuário";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Senha:",
                  hintText: "Digite sua senha"),
              obscureText: true,
              controller: _controllerSenha,
              validator: (String text) {
                if (text.isEmpty) {
                  return "Informe a sua senha";
                }
                if (text.length < 4) {
                  return "A senha precisa ter ao menos 4 dígitos";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 46,
              child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    bool formOk = _formKey.currentState.validate();
                    if (!formOk) {
                      return;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaginaListaDeTarefas()),
                      );
                    }
                    print("Login " + _controllerLogin.text);
                    print("Senha " + _controllerSenha.text);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void check_if_already_login() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);

    print(newUser);
  }

  void dispose() {
    _controllerLogin.dispose();
    _controllerSenha.dispose();
    super.dispose();
  }
}
