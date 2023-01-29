:- use_module(library(csv)).


lerCSV(FilePath, File):- csv_read_file(FilePath, File).


procuraCliente(_, [], false).
procuraCliente(ID, [row(ID, _, _, _, _)|_], true).
procuraCliente(ID, [_|T], Existe):- procuraCliente(ID, T, Existe).


existeCliente(ID, FilePath, R):-
    lerCSV(FilePath, File),
    procuraCliente(ID, File, R).


procuraCarro(_, [], false).
procuraCarro(ID, [row(ID, _, _, _, _, _, _, _)|_], true).
procuraCarro(ID, [_|T], Existe):- procuraCarro(ID, T, Existe).

existeCarro(ID, FilePath, R):-
    lerCSV(FilePath, File),
    procuraCarro(ID, File, R).


pesquisaCarroModelo(Nome, FilePath):-
    lerCSV(FilePath, File),
    exibirCarrosModelo(Nome, File).

exibirCarrosModelo(_, []).
exibirCarrosModelo(Nome, [row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T]):-
    exibeCarro([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|_]), exibirCarrosModelo(Nome, T).
exibirCarrosModelo(Nome, [_|T]):- exibirCarrosModelo(Nome, T).

pesquisaCarroAno(Ano, FilePath):-
    lerCSV(FilePath, File),
    exibirCarrosAno(Ano, File).

exibirCarrosAno(_, []).
exibirCarrosAno(Ano, [row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T]):-
    exibeCarro([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|_]), exibirCarrosAno(Ano, T).
exibirCarrosAno(Ano, [_|T]):- exibirCarrosAno(Ano, T).

pesquisaCarroCor(Cor, FilePath):-
    lerCSV(FilePath, File),
    exibirCarrosCor(Cor, File).

exibirCarrosCor(_, []).
exibirCarrosCor(Cor, [row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T]):-
    exibeCarro([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|_]), exibirCarrosCor(Cor, T).
exibirCarrosCor(Cor, [_|T]):- exibirCarrosCor(Cor, T).

exibeCarro([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|_]):-
    write('\nCodigo: '), writeln(ID),
    write('Nome: '), writeln(Nome),
    write('Ano: '), writeln(Ano),
    write('Cor: '), writeln(Cor),
    write('Valor fixo: R$'), format('~2f', Preco), nl,
    write('Tarifa diaria: '), write(Diaria), writeln('%'),
    write('Tarifa mensal: '), write(Mensal), writeln('%'),
    write('Disponivel: '), writeln(Disp).


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


exibirCarrosAuxDisp([], _).
exibirCarrosAuxDisp([row(ID, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T], Disp):-
    write('Codigo: '), writeln(ID),
    write('Nome: '), writeln(Nome),
    write('Ano: '), writeln(Ano),
    write('Cor: '), writeln(Cor),
    write('Valor fixo: R$'), format('~2f', Preco), nl,
    write('Tarifa diaria: '), write(Diaria), writeln('%'),
    write('Tarifa mensal: '), write(Mensal), writeln('%'),
    nl, exibirCarrosAuxDisp(T, Disp).
exibirCarrosAuxDisp([_|T], Disp):- exibirCarrosAuxDisp(T, Disp).


exibirCarrosDisp(FilePath):-
    lerCSV(FilePath, File),
    exibirCarrosAuxDisp(File, sim).


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


escreveCarroClienteAux([], _, _, []).
escreveCarroClienteAux([row(Id, Nome, CPF, Idade, _)|T], Id, IdCarro, [row(Id, Nome, CPF, Idade, IdCarro)|T]).
escreveCarroClienteAux([H|T], Id, IdCarro, [H|Out]) :- escreveCarroClienteAux(T, Id, IdCarro, Out).


escreveCarroCliente(FilePath, Id, IdCarro):-
   lerCSV(FilePath, File),
   escreveCarroClienteAux(File, Id, IdCarro, Saida),
   csv_write_file(FilePath, Saida).


calculaTotal([row(ID, _, _, _, Preco, Diaria, Mensal, _)|_], ID, Tipo, Tempo, Total):-
    (member(d, Tipo) -> calculaDiaria(Preco, Diaria, Tempo, T), Total = T; 
    calculaMensal(Preco, Mensal, Tempo, T), Total = T).
calculaTotal([_|T], IdCarro, Tipo, Tempo, Total):- calculaTotal(T, IdCarro, Tipo, Tempo, Total).


salvarNosCarros([ID, Nome, Ano, Cor, Preco, Diaria, Mensal, _]):-
    salvarCarro('arquivos/carros.csv', ID, Nome, Ano, Cor, Preco, Diaria, Mensal, nao).


salvarNosClientes([ID, Nome, CPF, Idade, _], IdCarro):-
    salvarCliente('arquivos/clientes.csv', ID, Nome, CPF, Idade, IdCarro).


escolherCarroCliente(IdCliente, IdCarro, Tipo, Tempo):-
    lerCSV('arquivos/carros.csv', Carros),
    calculaTotal(Carros, IdCarro, Tipo, Tempo, Total),
    salvarContrato('arquivos/contratos.csv', IdCliente, IdCarro, Tipo, Total),
    escreveDisponibilidadeCarro('arquivos/carros.csv', IdCarro, i),
    escreveCarroCliente('arquivos/clientes.csv', IdCliente, IdCarro).


mudaPrecoCarroAux([], _, _, []).
mudaPrecoCarroAux([row(Id, Nome, Ano, Cor, _, Diaria, Mensal, Disp)|T], Id, Preco, [row(Id, Nome, Ano, Cor, Preco, Diaria, Mensal, Disp)|T]).
mudaPrecoCarroAux([H|T], Id, Preco, [H|Out]) :- mudaPrecoCarroAux(T, Id, Preco, Out).


mudaPrecoCarro(FilePath, Id, Preco):-
   lerCSV(FilePath, File),
   mudaPrecoCarroAux(File, Id, Preco, Saida),
   csv_write_file(FilePath, Saida).
