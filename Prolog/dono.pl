:- include('utils.pl').
:- include('funcionario.pl').

menuDono:-
    writeln('\n----------Menu do Dono----------\n'),
    write('1 - Cadastrar cliente\n'),
    write('2 - Cadastrar funcionario\n'),
    write('3 - Cadastrar carro\n'),
    write('4 - Excluir funcionario\n'),
    write('5 - Gerencia de financas\n'),
    write('6 - Visualizar funcionarios ativos\n'),
    write('7 - Visualizar clientes ativos\n'),
    write('8 - Voltar para o menu principal\n'),
    write('Opcao: '),
    read(Opcao),
    chamadaDono(Opcao).

chamadaDono(1):-
    cadastrarCliente,
    menuDono.
chamadaDono(2):-
    cadastrarFuncionario,
    menuDono.
chamadaDono(3):-
    cadastrarCarro,
    menuDono.
chamadaDono(4):-
    excluirFuncionario,
    menuDono.
chamadaDono(5):-
    menuFinancas,
    menuDono.
chamadaDono(6):-
    visualizarFuncionarios,
    menuDono.
chamadaDono(7):-
    visualizarClientes,
    menuDono.
chamadaDono(8):- write('').
chamadaDono(_):-
    opcaoInvalida,
    menuDono.

cadastrarCliente:-
    write('\nInforme o codigo do cliente: '),
    read(IdCliente),
    write('Informe o nome: '),
    read(Nome),
    write('CPF: '),
    read(CPF),
    write('Idade: '),
    read(Idade),
    salvarCliente('arquivos/clientes.csv', IdCliente, Nome, CPF, Idade, 0),
    writeln('Cliente cadastrado com sucesso.').

cadastrarFuncionario:- 
    write('\nInforme o codigo do funcionario: '),
    read(Id),
    write('Informe o nome: '),
    read(Nome),
    write('Salario: R$"'),
    read(Salario),
    salvarFuncionario('arquivos/funcionarios.csv', Id, Nome, Salario),
    writeln('Funcionario cadastrado com sucesso.').

cadastrarCarro:- 
    write('\nInforme o codigo do carro: '),
    read(Id),
    write('Nome: '),
    read(Nome),
    write('Ano: '),
    read(Ano),
    write('Cor: '),
    read(Cor),
    write('Preco fixo: R$'),
    read(Preco),
    write('Tarifa diaria (porcentagem): '),
    read(Diaria),
    write('Tarifa mensal (porcentagem): '),
    read(Mensal),
    salvarCarro('arquivos/carros.csv', Id, Nome, Ano, Cor, Preco, Diaria, Mensal, sim),
    writeln('Carro cadastrado com sucesso.').

excluirFuncionario:-
    exibirFuncionarios('arquivos/funcionarios.csv'),
    write('\nInforme o codigo do funcionario: '),
    read(Id),
    removerFuncionario('arquivos/funcionarios.csv', Id),
    writeln('\nFuncionario removido com sucesso.').

menuFinancas:- 
    writeln('\n1 - Visualizar contratos ativos'),
    writeln('2 - Alterar preco de um carro'),
    writeln('3 - Voltar para o menu anterior'),
    write('Opcao: '),
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
    exibirContratos('arquivos/contratos.csv'),
    writeln('\nContratos ativos: ').

alterarPrecoCarro:-
    exibirCarros('arquivos/carros.csv'),
    write('\nInforme o codigo do carro: '),
    read(IdCarro),    
    write('Informe o novo preco: R$'),
    read(Preco),
    mudaPrecoCarro('arquivos/carros.csv', IdCarro, Preco),
    writeln('Preco alterado com sucesso.').       

visualizarFuncionarios:-
    writeln('\nFuncionarios ativos: '),
    exibirFuncionarios('arquivos/funcionarios.csv').

visualizarClientes:-
    writeln('\nClientes ativos: '),
    exibirClientesCadastrados('arquivos/clientes.csv').