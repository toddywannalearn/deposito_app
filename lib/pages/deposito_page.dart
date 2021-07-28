import 'package:deposito_app/models/saldo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositoPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depósito'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: '0.00'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  _criaDeposito(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Depositar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
              ),
              Container(
                child: Text(
                    'Os valores depositados em dias não úteis estarão disponiveis na conta no próximo dia útil.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _criaDeposito(context) {
    final double valor = double.tryParse(_textEditingController.text);
    final depositoValido = _validaDeposito(valor);

    if (depositoValido) {
      _atualizaEstado(context, valor);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text('Depósito realizado com sucesso'),
              children: [
                Icon(Icons.check_circle_outline_rounded,
                    size: 60.0, color: Colors.green),
                SimpleDialogOption(
                  child: OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                    ),
                    child: Text('OK!'),
                  ),
                  onPressed: (){
                    _textEditingController.value = TextEditingValue.empty;
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text('Atenção!! Informe um valor válido'),
              children: [
                Icon(Icons.error_outline_rounded,
                    size: 60.0, color: Colors.red),
              ],
            );
          });
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor){
    Provider.of<SaldoModel>(context, listen: false).adicionaSaldo(valor);
  }
}
