:- include('mensagens.pl').
:- import('utils.pl').

menuFuncionario:-
    writeln('\n---------Menu do Funcionario----------\n'),
    write('1 - Veículos disponiveis\n'),
    write('2 - Escolher veiculo para um cliente\n'),
    write('3 - Mudar disponibilidade de um carro\n'),
    write('4 - Exibir clientes cadastrados\n'),
    write('5 - Excluir clientes do sistema\n'),
    write('6 - Calcular valor do veiculo\n'),
    write('7 - Voltar para o menu principal\n'),
    write('Opcao: '),
    read(op),
    chamadaPrincipal(op),
    halt.

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
chamadaFuncionario(7):- halt.
chamadaFuncionario(_):- opcaoInvalida,
    menuFuncionario.

veiculosDisponiveis:- halt.

escolherVeiculo:- halt.

mudarDisponibilidadeCarro:- halt.

clientesCadastrados:- halt.

excluirCliente:- halt.

valorVeiculo:- halt.