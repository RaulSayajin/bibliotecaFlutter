import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/multa_biblioteca.dart';

class FormularioMulta extends StatefulWidget {
  const FormularioMulta({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormularioMultaState();
  }
}

class FormularioMultaState extends State<FormularioMulta> {
  final TextEditingController _controladorCampoMatricula =
      TextEditingController();
  final TextEditingController _controladorCampoMulta = TextEditingController();

  static const _tituloAppBar = 'Registrando multa';
  static const _rotuloCampoMulta = 'Valor da multa';
  static const _dicaCampoMulta = '0,00';

  static const _rotuloCampoMatricula = 'Matrícula do leitor';
  static const _dicaCampoMatricula = '000000';
  static const _textoBotaoConfirmar = 'Registrar';

  @override
  void dispose() {
    _controladorCampoMatricula.dispose();
    _controladorCampoMulta.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoMatricula,
              rotulo: _rotuloCampoMatricula,
              dica: _dicaCampoMatricula,
              icone: Icons.badge,
            ),

            Editor(
              controlador: _controladorCampoMulta,
              rotulo: _rotuloCampoMulta,
              dica: _dicaCampoMulta,
              icone: Icons.attach_money,
            ),

            ElevatedButton(
              onPressed: _criaMulta,
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criaMulta() {
    final int? matricula = int.tryParse(_controladorCampoMatricula.text.trim());
    // Aceita a vírgula do padrão brasileiro ("12,50"), já que o
    // double.tryParse só reconhece o ponto como separador decimal.
    final double? multa = double.tryParse(
      _controladorCampoMulta.text.trim().replaceAll(',', '.'),
    );

    if (matricula == null || multa == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe uma matrícula e um valor de multa válidos.'),
        ),
      );
      return;
    }

    final multaCriada = MultaBiblioteca(multa, matricula);
    debugPrint('$multaCriada');
    Navigator.pop(context, multaCriada);
  }
}
