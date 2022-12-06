:- include('mensagens.pl').
:- import('utils.pl').

menuFuncionario:-
    writeln('\n---------Menu do Funcionario----------\n'),
    write('1 - Veiculos disponiveis\n'),
    write('2 - Escolher veiculo para um cliente\n'),
    write('3 - Mudar disponibilidade de um carro\n'),
    write('4 - Exibir clientes cadastrados\n'),
    write('5 - Excluir clientes do sistema\n'),
    write('6 - Calcular valor do veiculo\n'),
    write('7 - Voltar para o menu principal\n'),
    write('Opcao: '),
    read(Opcao),
    chamadaFuncionario(Opcao).

chamadaFuncionario(1):-
    veiculosDisponiveis,
    menuFuncionario.
chamadaFuncionario(2):-
    escolherVeiculo,
    menuFuncionario.
chamadaFuncionario(3):-
    mudarDisponibilidadeCarro,
    menuFuncionario.
chamadaFuncionario(4):-
    clientesCadastrados,
    menuFuncionario.
chamadaFuncionario(5):-
    excluirCliente,
    menuFuncionario.
chamadaFuncionario(6):-
    valorVeiculo,
    menuFuncionario.
chamadaFuncionario(7):- write('').
chamadaFuncionario(_):- opcaoInvalida,
    menuFuncionario.

veiculosDisponiveis:- 
    writeln('\nVeiculos disponiveis:').

escolherVeiculo:- 
    write('\nInforme o código do cliente: '),
    write('\nInforme o código do carro: '),
    write('\nTipo de contrato (diario/mensal): '),
    write('\nQuantidade de dias/meses: ').

mudarDisponibilidadeCarro:- 
    write('\nInforme o codigo do carro: '),
    write('\nO carro esta disponivel ou indisponivel (d/i): ').

clientesCadastrados:-
    writeln('\nClientes cadastrados:').

excluirCliente:- 
    write('\nInforme o codigo do cliente: ').

valorVeiculo:- 
    write('\nInforme o codigo do carro: '),
    write('\nInforme a quantidade de dias/meses: ').