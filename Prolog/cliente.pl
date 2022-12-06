:- include('mensagens.pl').
:- include('utils.pl').

menuCliente:-
    writeln('\n----------Menu do Cliente----------\n'),
    write('1 - Listar veiculos disponives\n'),
    write('2 - Escolher veiculo\n'),
    write('3 - Pesquisar veiculos\n'),
    write('4 - Voltar para o menu principal\n'),
    write('Opcao: '),
    read(Opcao),
    chamadaCliente(Opcao).

chamadaCliente(1):-
    veiculosDisponiveis,
    menuCliente.
chamadaCliente(2):-
    escolherVeiculoCliente,
    menuCliente.
chamadaCliente(3):-
    menuPesquisaVeiculos, 
    menuCliente.
chamadaCliente(4):- write('').
chamadaCliente(_):-
    opcaoInvalida, 
    menuCliente.

veiculosDisponiveis:- 
    writeln('\nVeiculos disponiveis:').

escolherVeiculoCliente:- 
    write('\nInforme seu codigo: '),
    write('\nInforme o codigo do carro: '),
    writeln('Tipo de contrato:'),
    writeln('1 - Diario'),
    writeln('2 - Mensal'),
    write('Quantidade de dias/meses: ').

menuPesquisaVeiculos:- 
    writeln('\nTipo de pesquisa:'),
    writeln('1 - Modelo'),
    writeln('2 - Ano'),
    writeln('3 - Cor'),
    write('Opcao: '),
    read(Op),
    opcaoPesquisa(Op).

opcaoPesquisa(1):-
    writeln('\nModelo: ').
opcaoPesquisa(2):-
    writeln('\nAno: ').
opcaoPesquisa(3):-
    writeln('\nCor: ').
opcaoPesquisa(_):-
    opcaoInvalida,
    menuPesquisaVeiculos.