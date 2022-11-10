import MenuCliente
import MenuDono
import MenuFuncionario

menuPrincipal:: IO()
menuPrincipal = do
    putStr("\n----------Bem vindo ao sistema de Aluguel de Carros----------\n")
    putStr("Escolha uma opção para navegar no sistema:\n")
    putStr("1 - Menu do cliente\n")
    putStr("2 - Menu do dono\n")
    putStr("3 - Menu do funcionário\n")
    putStr("4 - Sair\n")
    op <- getLine
    | op == 1 = MenuCliente.menuCliente
    | op == 2 = MenuDono.menuDono
    | op == 3 = MenuFuncionario.menuFuncionario
    | op == 4 = 
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuPrincipal