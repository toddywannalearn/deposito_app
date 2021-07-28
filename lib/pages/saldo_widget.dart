import 'package:deposito_app/models/saldo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.only(
            right: 15.0, left: 15.0, top: 25.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'saldo em conta',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
            ),
            Consumer<SaldoModel>(
              builder: (context, valor, child) {
                return Text(
                  valor.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
            ),
            SizedBox(
              child: Container(
                color: Colors.white,
              ),
              height: 0.5,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'conferir extrato',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    iconSize: 14,
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Extrato clicado')));
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
