module MenuDono where


menuDono:: (IO()) -> IO()
menuDono menuPrincipal = do
    putStr("\n----------Menu do Dono----------\n")
    putStr("1 - Cadastrar funcionário\n")
    putStr("2 - Excluir funcionário\n")
    putStr("3 - Gerência de finanças\n")
    putStr("4 - Visualizar funcionários ativos\n")
    putStr("5 - Voltar para o menu principal\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamadaDono op menuPrincipal

chamadaDono:: Int -> (IO()) -> IO()
chamadaDono op menuPrincipal
    | op == 1 =
    | op == 2 =
    | op == 3 =
    | op == 4 =
    | op == 5 = menuPrincipal
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuDono