:- include('utils.pl').
:- include('funcionario.pl').

menuDono:-
    writeln('\n----------Menu do Dono----------\n'),
    write('1 - Cadastrar funcionario\n'),
    write('2 - Cadastrar carro\n'),
    write('3 - Excluir funcionario\n'),
    write('4 - Gerencia de financas\n'),
    write('5 - Visualizar funcionários ativos\n'),
    write('6 - Visualizar clientes ativos\n'),
    write('7 - Voltar para o menu principal\n'),
    write('Opção: '),
    read(op),
    chamadaCliente(op),
    halt.

chamadaDono(1):-
    cadastrarFuncionario,
    menuDono.
chamadaDono(2):-
    cadastrarCarro,
    menuDono.
chamadaDono(3):-
    excluirFuncionario,
    menuDono.
chamadaDono(4):-
    menuFinancas,
    menuDono.
chamadaDono(5):-
    visualizarFuncionarios,
    menuDono.
chamadaDono(6):-
    visualizarClientes,
    menuDono.
chamadaDono(7):- halt.
chamadaDono(_):-
    opcaoInvalida,
    menuDono.

cadastrarFuncionario:- halt.

cadastrarCarro:- halt.

excluirFuncionario:- halt.

menuFinancas:- halt.

visualizarFuncionarios:- halt.

visualizarClientes:- halt.