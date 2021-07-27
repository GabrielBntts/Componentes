import 'package:flutter/material.dart';

void main() => runApp(const FormularioUm());

//classe e construção da estrutura do formulario
class FormularioUm extends StatelessWidget {
  const FormularioUm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulario com Validação';
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
            backgroundColor: Colors.blueGrey,
          ),
          body: const MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

//Criando a classe correspondente ao estado do widget
//esta classe contém dados relacionados ao formulario
class MyCustomFormState extends State<MyCustomForm> {
  //cria uma chave global que identifica os estados do formulario
  //e permite a validação dos campos
  //=============================
  //ela é uma globalkey
  //formkey é uma variavel
  //leitura:

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //contruir o widget fo form usando o _fomrkey

    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            //validador q vai receber o texto q o user inseriu.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor entre com um texto';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                //validar e retornar verdadeiro se o formulario
                //é valido e retorna falso se  a condição não der match
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando Dados')),
                  );
                }
              },
              child: const Text('Enviar'),
            ),
          )
        ],
      ),
    );
  }
}
