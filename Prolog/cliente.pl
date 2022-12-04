:- include('mensagens.pl').
:- include('utils.pl').

menuCliente:-
    writeln("\n----------Menu do Cliente----------\n"),
    writeln("1 - Listar veículos disponíves\n"),
    writeln("2 - Escolher veículo\n"),
    writeln("3 - Pesquisar veículos\n"),
    writeln("4 - Voltar para o menu principal\n"),
    writeln("Opção: ").