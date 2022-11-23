module Dono where


menuDono:: IO()
menuDono  = do
    putStr("\n----------Menu do Dono----------\n")
    putStr("1 - Cadastrar funcionário\n")
    putStr("2 - Cadastrar carro\n")
    putStr("2 - Excluir funcionário\n")
    putStr("3 - Gerência de finanças\n")
    putStr("4 - Visualizar funcionários ativos\n")
    putStr("5 - Voltar para o menu principal\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamadaDono op

chamadaDono:: Int -> IO()
chamadaDono op 
    | op == 1 = do 
        putStr ""
        menuDono
    | op == 2 = do 
        putStr ""
        menuDono
    | op == 3 = do 
        putStr ""
        menuDono
    | op == 4 = do 
        putStr ""
        menuDono
    | op == 5 = putStr ""
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuDono 