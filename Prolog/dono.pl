:- include('utils.pl').
:- include('funcionario.pl').

menuDono:-
    writeln("\n----------Menu do Dono----------\n"),
    writeln("1 - Cadastrar funcionário\n"),
    writeln("2 - Cadastrar carro\n"),
    writeln("3 - Excluir funcionário\n"),
    writeln("4 - Gerência de finanças\n"),
    writeln("5 - Visualizar funcionários ativos\n"),
    writeln("6 - Visualizar clientes ativos\n"),
    writeln("7 - Voltar para o menu principal\n"),
    writeln("Opção: ").