import Cliente
import Dono
import Funcionario
import Mensagens
import qualified Mensagens


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
    chamadaPrincipal op main

chamadaPrincipal:: Int -> (IO()) -> IO()
chamadaPrincipal op 
        | op == 1 = Cliente.cliente main
        | op == 2 = MenuDono.menuDono
        | op == 3 = MenuFuncionario.menuFuncionario
        | op == 4 = putStr("Até a próxima!\n")
        | otherwise = do
            putStr("Opção inválida, digite novamente\n")
            main