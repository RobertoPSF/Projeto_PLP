import Cliente
import Dono
import Funcionario
import Mensagens


main:: IO()
main = do
    putStr("\n----------Bem vindo ao sistema de Aluguel de Carros----------\n")
    putStr("Escolha uma opção para navegar no sistema:\n")
    putStr("1 - Menu do cliente\n")
    putStr("2 - Menu do dono\n")
    putStr("3 - Menu do funcionário\n")
    putStr("4 - Sair\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamadaPrincipal op

chamadaPrincipal:: Int -> IO()
chamadaPrincipal op
        | op == 1 = do
            Cliente.menuCliente
            main
        | op == 2 = do
            Dono.menuDono
            main
        | op == 3 = do
            Funcionario.menuFuncionario
            main
        | op == 4 = putStr("Até a próxima!\n")
        | otherwise = do
            putStr("Opção inválida, digite novamente\n")
            main