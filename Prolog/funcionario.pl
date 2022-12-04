:- include('mensagens.pl').
:- import('utils.pl').

menuFuncionario:-
    writeln("\n---------Menu do Funcionário----------\n"),
    writeln("1 - Veículos disponíveis\n"),
    writeln("2 - Escolher veículo para um cliente\n"),
    writeln("3 - Mudar disponibilidade de um carro\n"),
    writeln("4 - Exibir clientes cadastrados\n"),
    writeln("5 - Excluir clientes do sistema\n"),
    writeln("6 - Calcular valor do veículo\n"),
    writeln("7 - Voltar para o menu principal\n"),
    writeln("Opção: ").