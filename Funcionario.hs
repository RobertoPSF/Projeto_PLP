module MenuFuncionario where
import Mensagens

menuFuncionario:: (IO()) -> IO()
menuFuncionario menuPrincipal = do
    putStr("\n---------Menu do Funcionário----------\n")
    putStr("1 - Veículos disponíveis\n")
    putStr("2 - Escolher veículo para um cliente\n")
    putStr("3 - Exibir clientes cadastrados\n")
    putStr("4 - Excluir clientes do sistema\n")
    putStr("5 - Calcular valor do veículo\n")
    putStr("6 - Voltar para o menu principal\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamadaFuncionario op menuPrincipal

chamadaFuncionario:: Int -> (IO()) -> IO ()
chamadaFuncionario op menuPrincipal
    | op == 1 =
    | op == 2 =
    | op == 3 =
    | op == 4 =
    | op == 5 =
    | op == 6 = menuPrincipal
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuFuncionario


