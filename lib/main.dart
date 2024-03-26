import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() => runApp(const Aplicacao());

final formatter = NumberFormat.currency(
  locale: "pt_BR",
  symbol: "R\$",
);

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final valorController = TextEditingController();
    final taxaController = TextEditingController();
    final pagamentoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: valorController,
              decoration: const InputDecoration(
                labelText: "Valor",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: decimalNumber(),
            ),
            TextField(
              controller: taxaController,
              decoration: const InputDecoration(
                labelText: "Taxa de Juros",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              controller: pagamentoController,
              decoration: const InputDecoration(
                labelText: "Quantidade Pagamentos",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            ElevatedButton(
              onPressed: () => calcular(context, valorController.text,
                  taxaController.text, pagamentoController.text),
              child: const Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }

  void calcular(BuildContext context, String v, t, p) {
    final valor = double.parse(v);
    final taxa = double.parse(t);
    final pagto = int.parse(p);

    final juros = valor * (taxa / 100) * pagto;
    final total = valor + juros;

    final mensagem =
        "${formatter.format(valor)} emprestado em $pagto parcelas = ${formatter.format(total)}";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  List<TextInputFormatter> decimalNumber() => [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text;

          if (text.isEmpty) {
            return newValue;
          } else if (double.tryParse(text) == null) {
            return oldValue;
          } else {
            return newValue;
          }
        }),
      ];
}
