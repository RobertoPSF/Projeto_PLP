module MenuCliente where
import Mensagens

menuCliente:: (IO()) -> IO()
menuCliente menuPrincipal = do
    putStr("\n----------Menu do Cliente----------\n")
    putStr("1 - Listar veículos disponíves\n")
    putStr("2 - Escolher veículo\n")
    putStr("3 - Pesquisar veículos\n")
    putStr("4 - Voltar para o menu principal\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamada op menuPrincipal


chamada:: Int -> (IO()) -> IO()
chamada op menuPrincipal
    | op == 1 =
    | op == 2 =
    | op == 3 =
    | op == 4 = menuPrincipal
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuCliente

