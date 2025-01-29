import 'dart:async';
import 'dart:convert'; // Para lidar com o JSON
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Pacote para animações Lottie

// Exemplo de JSON (agora um Map diretamente)
const Map<String, String> successJSON = {
  "message": "Success! Operação realizada com sucesso!",
  "type": "success",
  "image":
      "assets/animations/successfully-done.json", // Caminho para a animação Lottie
};

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late String message;
  late String type;
  late String animationPath;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
    Timer(const Duration(milliseconds: 2800), () {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }

  // Carregar dados do JSON
  void _loadJsonData() {
    setState(() {
      message = successJSON['message'] ?? ''; // Pega a mensagem
      type = successJSON['type'] ?? ''; // Pega o tipo
      animationPath =
          successJSON['image'] ?? ''; // Pega o caminho da animação Lottie
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: message.isEmpty
            ? CircularProgressIndicator() // Mostra um carregando até o JSON ser processado
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Usa o Lottie para exibir animação
                  Lottie.asset(
                    animationPath,
                    height: 150, // Altura da animação
                    width: 150, // Largura da animação
                  ),
                  SizedBox(height: 20),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
