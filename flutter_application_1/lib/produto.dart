//classe produto

//nome da classe e atributo
class Produto {
  final String nome;
  final int quantidade;
  final double valor;

  Produto(
    this.nome,
    this.quantidade,
    this.valor,
  );

  @override
  String toString() {
    return 'Produto{Nome: $nome, Quantidade: $quantidade, Valor: $valor}';
  }
}
