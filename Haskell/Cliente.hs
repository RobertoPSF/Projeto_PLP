module Cliente where
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
    chamadaCliente op menuPrincipal


chamadaCliente:: Int -> (IO()) -> IO()
chamadaCliente op menuPrincipal
    | op == 1 = putStr ""
    | op == 2 = putStr ""
    | op == 3 = putStr ""
    | op == 4 = menuPrincipal
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuCliente menuPrincipal

