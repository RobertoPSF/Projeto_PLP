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
    escolherVeiculoParaCliente,
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
    writeln('\nVeiculos disponiveis:'), 
    exibirCarrosDisp('arquivos/carros.csv').

escolherVeiculoParaCliente:-
    clientesCadastrados,
    write('\nInforme o codigo do cliente: '),
    read(IdCliente),
    lerCSV('arquivos/clientes.csv', Clientes),

    veiculosDisponiveis,
    write('\nInforme o codigo do carro: '),
    read(IdCarro),
    lerCSV('arquivos/carros.csv', Carros),

    write('Tipo de contrato (diario/mensal): '),
    read(Tipo),
    write('Quantidade de dias/meses: '),
    read(Tempo),

    escolherCarroCliente(Clientes, Carros, IdCliente, IdCarro, Tipo, Tempo),
    writeln('Carro alugado com sucesso!').

mudarDisponibilidadeCarro:-
    exibirCarros('arquivos/carros.csv'),
    write('\nInforme o codigo do carro: '),
    read(IdCarro),
    write('O carro esta disponivel ou indisponivel (d/i): '),
    read(Disp),
    escreveDisponibilidadeCarro('arquivos/carros.csv', IdCarro, Disp),
    writeln('Disponibilidade alterada.').

clientesCadastrados:-
    writeln('\nClientes cadastrados:'),
    exibirClientesCadastrados('arquivos/clientes.csv').

excluirCliente:-
    exibirClientesCadastrados('arquivos/clientes.csv'),
    write('\nInforme o codigo do cliente: '),
    read(Id),
    removerCliente('arquivos/clientes.csv', Id),
    writeln('Cliente excluido com sucesso').

valorVeiculo:-
    writeln('\nCarros disponiveis:'),
    exibirCarros('arquivos/carros.csv'),
    write('\nInforme o codigo do carro: '),
    read(Id),
    write('Informe a quantidade de dias/meses: '),
    read(Tempo),
    calculaValorVeiculo('arquivos/carros.csv', Id, Tempo).