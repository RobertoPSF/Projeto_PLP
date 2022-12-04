:- include('cliente.pl').
:- include('dono.pl').
:- include('funcionario.pl').
:- include('mensagens.pl').

main:-
    writeln("\n----------Bem vindo ao sistema de Aluguel de Carros----------\n"),
    writeln("Escolha uma opção para navegar no sistema:\n"),
    writeln("1 - Menu do cliente\n"),
    writeln("2 - Menu do dono\n"),
    writeln("3 - Menu do funcionário\n"),
    writeln("4 - Sair\n"),
    writeln("Opção: ").
