:- include('cliente.pl').
:- include('dono.pl').
:- include('funcionario.pl').
:- include('mensagens.pl').

main:-
    writeln('\n----------Bem vindo ao sistema de Aluguel de Carros----------\n'),
    write('Escolha uma opcao para navegar no sistema:\n'),
    write('1 - Menu do cliente\n'),
    write('2 - Menu do dono\n'),
    write('3 - Menu do funcionario\n'),
    write('4 - Sair\n'),
    write('Opcao: '),
    read(op),
    chamadaPrincipal(op),
    halt.

chamadaPrincipal(1):- 
    menuCliente,
    main.
chamadaPrincipal(2):- 
    menuDono,
    main.
chamadaPrincipal(3):- 
    menuFuncionario,
    main.
chamadaPrincipal(4):- halt.
chamadaPrincipal(_):- 
    opcaoInvalida,
    main.