:- include('utils.pl').
:- include('funcionario.pl').

menuDono:-
    writeln('\n----------Menu do Dono----------\n'),
    write('1 - Cadastrar funcionario\n'),
    write('2 - Cadastrar carro\n'),
    write('3 - Excluir funcionario\n'),
    write('4 - Gerencia de financas\n'),
    write('5 - Visualizar funcionarios ativos\n'),
    write('6 - Visualizar clientes ativos\n'),
    write('7 - Voltar para o menu principal\n'),
    write('Opcao: '),
    read(Opcao),
    chamadaDono(Opcao).

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
chamadaDono(7):- write('').
chamadaDono(_):-
    opcaoInvalida,
    menuDono.

cadastrarFuncionario:- 
    write('\nInforme o codigo do funcionario: '),
    write('\nInforme o nome: '),
    write('\nSalario: R$"').

cadastrarCarro:- 
    write('\nInforme o codigo do carro: '),
    write('\nNome: '),
    write('\nAno: '),
    write('\nCor: '),
    write('\nPreco fixo: R$'),
    write('\nTarifa diaria (porcentagem): '),
    write('\nTarifa mensal (porcentagem): ').   

excluirFuncionario:- 
    write('\nInforme o codigo do funcionario: ').

menuFinancas:- 
    writeln('\n1 - Visualizar contratos ativos'),
    writeln('2 - Alterar preço de um carro'),
    writeln('3 - Voltar para o menu anterior'),
    write('Opcao: ')
    read(Op),
    chamadaFinancas(Op).
    
chamadaFinancas(1):-
    visualizarContratos,
    menuFinancas.
chamadaFinancas(2):-
    alterarPrecoCarro,
    menuFinancas.
chamadaFinancas(3):- write('').
chamadaFinancas(_):- 
    opcaoInvalida,
    menuFinancas.

visualizarContratos:-
    writeln('\nContratos ativos: ').

alterarPrecoCarro:-
    write('\nInforme o codigo do carro: '),    
    write('\nInforme o novo preco: R$').        

visualizarFuncionarios:- 
    write('\nFuncionarios ativos: ').

visualizarClientes:- 
    write('\nClientes ativos: ').