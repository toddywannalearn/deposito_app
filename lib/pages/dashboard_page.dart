

import 'package:deposito_app/models/saldo_model.dart';
import 'package:deposito_app/pages/saldo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(
            icon: Icon(
                Icons.search_rounded),
            onPressed: (){},
          ),
          IconButton(
              icon: Icon(Icons.add_alert_rounded),
              onPressed: (){}),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SaldoCard(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<SaldoModel>(
                  builder: (context, saldo, child){
                    return ElevatedButton(
                        onPressed: (){
                          saldo.adicionaSaldo(10.0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Icon(Icons.attach_money_rounded),
                              Text('Depositar'),
                            ],
                          ),
                        ));
                  }),
              Consumer<SaldoModel>(
                builder: (context, saldo, child){
                  return ElevatedButton(
                      onPressed: (){
                        saldo.subtraiSaldo(10);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: [
                            Icon(Icons.autorenew_rounded),
                            Text('Transferir'),
                          ],
                        ),
                      ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}