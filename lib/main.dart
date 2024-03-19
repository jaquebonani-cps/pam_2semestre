import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicacao());
}

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final linkStyle = textTheme.bodyMedium?.copyWith(
      decoration: TextDecoration.underline,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Autenticação"),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Usuário",
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Entrar"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Precisa de Ajuda?", style: linkStyle),
                      Text("Cadastre-se", style: linkStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("2H3"),
              Text("PAMI"),
              Text("2024"),
            ],
          ),
        ],
      ),
    );
  }
}
