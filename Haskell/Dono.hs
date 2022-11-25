module Dono where
import Utils
import System.IO


menuDono:: IO()
menuDono  = do
    putStr("\n----------Menu do Dono----------\n")
    putStr("1 - Cadastrar funcionário\n")
    putStr("2 - Cadastrar carro\n")
    putStr("3 - Excluir funcionário\n")
    putStr("4 - Gerência de finanças\n")
    putStr("5 - Visualizar funcionários ativos\n")
    putStr("6 - Visualizar clientes ativos\n")
    putStr("7 - Voltar para o menu principal\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamadaDono op

chamadaDono:: Int -> IO()
chamadaDono op 
    | op == 1 = do 
        cadastrarFuncionario
        menuDono
    | op == 2 = do 
        cadastrarCarro
        menuDono
    | op == 3 = do 
        excluirFuncionario
        menuDono
    | op == 4 = do 
        putStr ""
        menuDono
    | op == 5 = do
        putStr ""
        menuDono
    | op == 6 = do
        visualizarClientes
        menuDono
    | op == 7 = putStr ""
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuDono


cadastrarFuncionario:: IO()
cadastrarFuncionario = do
    putStr "Informe o código do funcionário: "
    id <- readLn:: IO Int 

    putStr "Informe o nome: "
    nome <- getLine

    putStr "Salário: R$"
    salario <- readLn:: IO Double

    Utils.salvaFuncionario id nome salario

excluirFuncionario:: IO()
excluirFuncionario = do
    putStr "Informe o código do funcionário: "
    id <- readLn:: IO Int

    arq <- openFile "arquivos/funcionarios.txt" ReadMode
    contents <- hGetContents  arq
    let linhas = lines contents
    if linhas == linhas then do
        hClose arq

        Utils.procuraFuncionarioIndice linhas linhas id 0
    else putStr ""

visualizarClientes:: IO()
visualizarClientes = do 
    putStr "Clientes ativos: "

    arq <- readFile "arquivos/clientes.txt"
    let linhas = lines arq
    Utils.escreveClientes linhas

cadastrarCarro:: IO()
cadastrarCarro = do
    putStr "Informe o código do carro: "
    id <- readLn:: IO Int
    putStr "Nome: "
    nome <- getLine
    putStr "Ano: "
    ano <- getLine
    putStr "Cor: "
    cor <- getLine
    putStr "Preço fixo: R$"
    fixo <- readLn:: IO Double
    putStr "Tarifa diária (porcentagem): "
    diaria <- readLn:: IO Double
    putStr "Tarifa mensal (porcentagem): "
    mensal <- readLn:: IO Double
    Utils.salvaCarro id nome ano cor fixo diaria mensal "sim"
