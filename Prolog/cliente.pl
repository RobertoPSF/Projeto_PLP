:- include('mensagens.pl').
:- include('utils.pl').

menuCliente:-
    writeln('\n----------Menu do Cliente----------\n'),
    write('1 - Listar veiculos disponives\n'),
    write('2 - Escolher veiculo\n'),
    write('3 - Pesquisar veiculos\n'),
    write('4 - Voltar para o menu principal\n'),
    write('Opcao: '),
    read(op),
    chamadaCliente(op),
    halt.

chamadaCliente(1):-
    veiculosDisponiveis,
    menuCliente.
chamadaCliente(2):-
    escolherVeiculoCliente,
    menuCliente.
chamadaCliente(3):-
    menuPesquisaVeiculos, 
    menuCliente.
chamadaCliente(4):- halt.
chamadaCliente(_):-
    opcaoInvalida, 
    menuCliente.

veiculosDisponiveis:- halt.

escolherVeiculoCliente:- halt.

menuPesquisaVeiculos:- halt.