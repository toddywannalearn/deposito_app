

import 'package:flutter/cupertino.dart';

class SaldoModel extends ChangeNotifier{
  double valor;

  SaldoModel(this.valor);

  void adicionaSaldo(valor){
    this.valor += valor;

    notifyListeners();
  }

  void subtraiSaldo(valor){
    this.valor -= valor;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}