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
    writeln('\nVeiculos disponiveis:'),
    exibirCarrosDisp('arquivos/carros.csv').

escolherVeiculoCliente:-
    clientesCadastrados,
    write('\nInforme seu codigo: '),
    read(IdCliente),
    existeCliente(IdCliente, 'arquivos/clientes.csv', R),
    (R == true -> veiculosDisponiveis,
    write('\nInforme o codigo do carro: '),
    read(IdCarro),

    writeln('Tipo de contrato:'),
    writeln('1 - Diario'),
    writeln('2 - Mensal'),
    read(Tipo),
    write('Quantidade de dias/meses: '),
    read(Tempo),
    
    (Tipo =:= 1 -> escolherCarroCliente(IdCliente, IdCarro, 'diario', Tempo); escolherCarroCliente(IdCliente, IdCarro, 'mensal', Tempo)),
    writeln('Carro alugado com sucesso!');
    writeln('Cliente nao existe!')).

menuPesquisaVeiculos:- 
    writeln('\nTipo de pesquisa:'),
    writeln('1 - Modelo'),
    writeln('2 - Ano'),
    writeln('3 - Cor'),
    write('Opcao: '),
    read(Op),
    opcaoPesquisa(Op).

opcaoPesquisa(1):-
    writeln('\nModelo: '),
    read(Modelo),
    pesquisaCarroModelo(Modelo, 'arquivos/carros.csv').
opcaoPesquisa(2):-
    writeln('\nAno: '),
    read(Ano),
    pesquisaCarroAno(Ano, 'arquivos/carros.csv').
opcaoPesquisa(3):-
    writeln('\nCor: '),
    read(Cor),
    pesquisaCarroCor(Cor, 'arquivos/carros.csv').
opcaoPesquisa(_):-
    opcaoInvalida,
    menuPesquisaVeiculos.

