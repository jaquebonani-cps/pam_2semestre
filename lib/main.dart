import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const Aplicacao());

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
    final num1Controller = TextEditingController();
    final num2Controller = TextEditingController();

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
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: "Num 1",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Text("+"),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: "Num 2",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => soma(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => subtrai(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => multiplica(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text("*"),
                ),
                ElevatedButton(
                  onPressed: () => divide(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text("/"),
                ),
                ElevatedButton(
                  onPressed: () {
                    num1Controller.text = "";
                    num2Controller.text = "";
                  },
                  child: const Text("Limpar!"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void soma(BuildContext context, String valor1, valor2) {
    final num1 = int.parse(valor1);
    final num2 = int.parse(valor2);
    final mensagem = "$num1 + $num2 = ${num1 + num2}";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  void subtrai(BuildContext context, String valor1, valor2) {
    final num1 = int.parse(valor1);
    final num2 = int.parse(valor2);
    final mensagem = "$num1 - $num2 = ${num1 - num2}";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  void multiplica(BuildContext context, String valor1, valor2) {
    final num1 = int.parse(valor1);
    final num2 = int.parse(valor2);
    final mensagem = "$num1 * $num2 = ${num1 * num2}";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  void divide(BuildContext context, String valor1, valor2) {
    final num1 = int.parse(valor1);
    final num2 = int.parse(valor2);

    if (num2 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Não existe divisão por 0"),
        ),
      );

      return;
    }

    final mensagem = "$num1 / $num2 = ${num1 / num2}";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  void limpa(TextEditingController num1, num2) {
    num1.text = "";
    num2.text = "";
  }
}
