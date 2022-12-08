:- use_module(library(csv)).


lerCSV(FilePath, File):- csv_read_file(FilePath, File).


exibirCarrosAux([]).
exibirCarrosAux([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T]):-
    write('Codigo: '), writeln(ID),
    write('Nome: '), writeln(Nome),
    write('Ano: '), writeln(Ano),
    write('Cor: '), writeln(Cor),
    write('Valor fixo: R$'), format('~2f', Preco), nl,
    write('Tarifa diaria: '), write(Diaria), writeln('%'),
    write('Tarifa mensal: '), write(Mensal), writeln('%'),
    write('Disponivel: '), writeln(Disp), nl, exibirCarrosAux(T).


exibirCarros(FilePath):-
    lerCSV(FilePath, File),
    exibirCarrosAux(File).

calculaDiaria(Preco, Diaria, Tempo, D):-
    D is (Preco * (Diaria/100)) * Tempo.

calculaMensal(Preco, Mensal, Tempo, M):-
    M is (Preco * (Mensal/100)) * Tempo.


exibirValorVeiculo([], _, _).
exibirValorVeiculo([row(Id, Nome, Ano, Cor, Preco, Diaria, Mensal, _)|_], Id, Tempo):-
    write('\nNome: '), writeln(Nome),
    write('Ano: '), writeln(Ano),
    write('Cor: '), writeln(Cor),
    calculaDiaria(Preco, Diaria, Tempo, D),
    write('Aluguel diario: R$'), format('~2f', D), nl,
    calculaMensal(Preco, Mensal, Tempo, M),
    write('Aluguel mensal: R$'), format('~2f', M),nl.
exibirValorVeiculo([_|T], Id, Tempo):- exibirValorVeiculo(T, Id, Tempo).



calculaValorVeiculo(FilePath, Id, Tempo):-
    lerCSV(FilePath, File),
    exibirValorVeiculo(File, Id, Tempo).


exibirCarrosAuxDisp([]).
exibirCarrosAuxDisp([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, sim)|T]):-
    write('Codigo: '), writeln(ID),
    write('Nome: '), writeln(Nome),
    write('Ano: '), writeln(Ano),
    write('Cor: '), writeln(Cor),
    write('Valor fixo: R$'), format('~2f', Preco), nl,
    write('Tarifa diaria: '), write(Diaria), writeln('%'),
    write('Tarifa mensal: '), write(Mensal), writeln('%'),
    nl, exibirCarrosAuxDisp(T).


exibirCarrosDisp(FilePath):-
    lerCSV(FilePath, File),
    exibirCarrosAuxDisp(File).


exibirClientesCadastradosAux([]).
exibirClientesCadastradosAux([row(ID, Nome, CPF, Idade, CarroAlugado)|T]):-
    write('Codigo: '), writeln(ID),
    write('Nome: '), writeln(Nome),
    write('CPF: '), writeln(CPF),
    write('Idade: '), writeln(Idade),
    write('Carro alugado: '), writeln(CarroAlugado),
    nl, exibirClientesCadastradosAux(T).


exibirClientesCadastrados(FilePath):-
    lerCSV(FilePath, File),
    exibirClientesCadastradosAux(File).


exibirFuncionariosAux([]).
exibirFuncionariosAux([row(ID, Nome, Salario)|T]):-
    write('Codigo: '), writeln(ID),
    write('Nome: '), writeln(Nome),
    write('Salario: R$'), format('~2f', Salario), nl,
    nl, exibirFuncionariosAux(T).


exibirFuncionarios(FilePath):-
    lerCSV(FilePath, File),
    exibirFuncionariosAux(File).


exibirContratosAux([]).
exibirContratosAux([row(IdCliente, IdCarro, Tipo, Total)|T]):-
    write('Codigo cliente: '), writeln(IdCliente),
    write('Codigo carro: '), writeln(IdCarro),
    write('Tipo: '), writeln(Tipo),
    write('Total: R$'), format('~2f', Total), nl,
    nl, exibirContratosAux(T).


exibirContratos(FilePath):-
    lerCSV(FilePath, File),
    exibirContratosAux(File).


salvarCarro(FilePath, ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp):-
    lerCSV(FilePath, File),
    append(File, [row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)], Saida),
    csv_write_file(FilePath, Saida).


salvarCliente(FilePath, ID, Nome, CPF, Idade, CarroAlugado):-
    lerCSV(FilePath, File),
    append(File, [row(ID, Nome, CPF, Idade, CarroAlugado)], Saida),
    csv_write_file(FilePath, Saida).


salvarFuncionario(FilePath, ID, Nome, Salario):-
    lerCSV(FilePath, File),
    append(File, [row(ID, Nome, Salario)], Saida),
    csv_write_file(FilePath, Saida).


salvarContrato(FilePath, IdCliente, IdCarro, Tipo, Total):-
    lerCSV(FilePath, File),
    append(File, [row(IdCliente, IdCarro, Tipo, Total)], Saida),
    csv_write_file(FilePath, Saida).


removerCarroCSV([], _, []).
removerCarroCSV([row(Id, _, _, _, _, _, _, _)|T], Id, T).
removerCarroCSV([H|T], Id, [H|Out]) :- removerCarroCSV(T, Id, Out).


removerCarro(FilePath, Id):-
   lerCSV(FilePath, File),
   removerCarroCSV(File, Id, Saida),
   csv_write_file(FilePath, Saida).


removerClienteCSV([], _, []).
removerClienteCSV([row(Id, _, _, _, _)|T], Id, T).
removerClienteCSV([H|T], Id, [H|Out]) :- removerClienteCSV(T, Id, Out).


removerCliente(FilePath, Id):-
   lerCSV(FilePath, File),
   removerClienteCSV(File, Id, Saida),
   csv_write_file(FilePath, Saida).


removerFuncionarioCSV([], _, []).
removerFuncionarioCSV([row(Id, _, _)|T], Id, T).
removerFuncionarioCSV([H|T], Id, [H|Out]) :- removerFuncionarioCSV(T, Id, Out).


removerFuncionario(FilePath, Id):-
   lerCSV(FilePath, File),
   removerFuncionarioCSV(File, Id, Saida),
   csv_write_file(FilePath, Saida).


procuraCarro([], _, _).
procuraCarro(([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|_], ID, Carro)):-
    Carro = row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp).
procuraCarro(([H|T], ID, [H|Out])):- procuraCarro(T, ID, Out).


procuraCliente([], _, _).
procuraCliente(([row(ID, Nome, CPF, Idade, CarroAlugado)|_], ID, Cliente)):-
    Cliente = row(ID, Nome, CPF, Idade, CarroAlugado).
procuraCliente(([_|T], ID, Cliente)):- procuraCliente(T, ID, Cliente).


calculaTotal(row(_, _, _, _, Preco, Diaria, _, _), diario, Tempo, Total):-
    calculaDiaria(Preco, Diaria, Tempo, T),
    Total = T.


calculaTotal(row(_, _, _, _, Preco, _, Mensal, _), mensal, Tempo, Total):-
    calculaDiaria(Preco, Mensal, Tempo, T),
    Total = T.


salvarNosCarros([ID, Nome, Ano, Cor, Preco, Diaria, Mensal, _]):-
    salvarCarro('arquivos/carros.csv', ID, Nome, Ano, Cor, Preco, Diaria, Mensal, nao).


salvarNosClientes([ID, Nome, CPF, Idade, _], IdCarro):-
    salvarCliente('arquivos/clientes.csv', ID, Nome, CPF, Idade, IdCarro).


escolherCarroCliente(Clientes, Carros, IdCliente, IdCarro, Tipo, Tempo):-
    writeln('aqui'),
    procuraCarro(Carros, IdCarro, Carro),
    writeln('aqui2'),
    procuraCliente(Clientes, IdCliente, Cliente),
    writeln('aqui3'),
    calculaTotal(Carro, Tipo, Tempo, Total),
    salvarContrato('arquivos/contratos.csv', IdCliente, IdCarro, Tipo, Total),
    escreveDisponibilidadeCarro('arquivos/carros.csv', IdCarro, i),
    salvarNosClientes(Cliente, IdCarro).


escreveDisponibilidadeAux([], _, _, []).
escreveDisponibilidadeAux([row(Id, Nome, Ano, Cor, Preco, Diaria, Mensal, _)|T], Id, Disp, [row(Id, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T]).
escreveDisponibilidadeAux([H|T], Id, Disp, [H|Out]) :- escreveDisponibilidadeAux(T, Id, Disp, Out).


escreveDisponibilidadeCarro(FilePath, Id, i):-
   lerCSV(FilePath, File),
   escreveDisponibilidadeAux(File, Id, nao, Saida),
   csv_write_file(FilePath, Saida).
escreveDisponibilidadeCarro(FilePath, Id, d):-
   lerCSV(FilePath, File),
   escreveDisponibilidadeAux(File, Id, sim, Saida),
   csv_write_file(FilePath, Saida).


mudaPrecoCarroAux([], _, _, []).
mudaPrecoCarroAux([row(Id, Nome, Ano, Cor, _, Diaria, Mensal, Disp)|T], Id, Preco, [row(Id, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T]).
mudaPrecoCarroAux([H|T], Id, Preco, [H|Out]) :- mudaPrecoCarroAux(T, Id, Preco, Out).


mudaPrecoCarro(FilePath, Id, Preco):-
   lerCSV(FilePath, File),
   mudaPrecoCarroAux(File, Id, Preco, Saida),
   csv_write_file(FilePath, Saida).