import 'package:flutter/material.dart';
import 'screens/multas/lista.dart';
import 'package:intl/intl.dart';

void main() => runApp(const BibliotecaApp());

class BibliotecaApp extends StatelessWidget {
  const BibliotecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = "pt_BR";
    return MaterialApp(
      title: 'Biblioteca',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Ativa o estilo Material 3, mais atual e com suporte aos widgets modernos
        useMaterial3: true,

        // Paleta gerada a partir de um marrom, lembrando capas de livros antigos
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown, // Cor principal do app
        ),

        // Define a cor principal do aplicativo para widgets que ainda usam essa propriedade
        primaryColor: Colors.brown.shade800,

        // Tema para a AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown.shade800, // Fundo da AppBar
          foregroundColor: Colors.white, // Texto e ícones na AppBar
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Tema para botões elevados
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown.shade600, // Cor de fundo do botão
            foregroundColor: Colors.white, // Cor do texto/ícones no botão
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Tema para o FloatingActionButton (FAB)
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber.shade700, // Cor do botão flutuante
          foregroundColor: Colors.brown.shade900, // Cor do ícone
        ),

        // Tema para campos de texto (TextField, por exemplo)
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(), // Define borda padrão
        ),
      ),
      home: const ListaMultas(),
    );
  }
}
