import 'package:flutter/material.dart';
import '../../models/multa_biblioteca.dart';
import 'formulario.dart';
import 'package:intl/intl.dart';

class ListaMultas extends StatefulWidget {
  const ListaMultas({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaMultasState();
  }
}

class ListaMultasState extends State<ListaMultas> {
  static const _tituloAppBar = "Multas da Biblioteca";

  // Registros iniciais mantidos apenas em memória.
  final List<MultaBiblioteca> _multas = [
    MultaBiblioteca(12.50, 202401),
    MultaBiblioteca(4.75, 202415),
  ];

  Future<void> _atualiza(MultaBiblioteca? multaRecebida) async {
    if (multaRecebida == null) return;

    // Aguarda 1 segundo antes de exibir o novo registro na lista.
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    setState(() {
      _multas.add(multaRecebida);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_book),
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: _multas.length,
        itemBuilder: (context, indice) {
          final multa = _multas[indice];
          return ItemMulta(multa);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          debugPrint("Botão + pressionado");
          final multaRecebida = await Navigator.push<MultaBiblioteca>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const FormularioMulta();
              },
            ),
          );
          await _atualiza(multaRecebida);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ItemMulta extends StatelessWidget {
  final MultaBiblioteca _multa;

  const ItemMulta(this._multa, {super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat formato = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );
    return Card(
      child: ListTile(
        leading: const Icon(Icons.menu_book),
        title: Text(formato.format(_multa.multa)),
        subtitle: Text('Matrícula: ${_multa.matriculaLeitor}'),
      ),
    );
  }
}
