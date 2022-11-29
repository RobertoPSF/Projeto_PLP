module Dono where
import Utils
import System.IO
import Funcionario


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
        menuFinancas
        menuDono
    | op == 5 = do
        visualizarFuncionarios
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
    putStr "\nInforme o código do funcionário: "
    id <- readLn:: IO Int 

    putStr "Informe o nome: "
    nome <- getLine

    putStr "Salário: R$"
    salario <- readLn:: IO Double

    Utils.salvaFuncionario id nome salario

excluirFuncionario:: IO()
excluirFuncionario = do
    visualizarFuncionarios
    putStr "\nInforme o código do funcionário: "
    id <- readLn:: IO Int

    arq <- openFile "arquivos/funcionarios.txt" ReadMode
    contents <- hGetContents arq
    let linhas = lines contents
    if linhas == linhas then do
        hClose arq

        Utils.procuraFuncionarioIndice linhas linhas id 0
    else putStr ""

visualizarClientes:: IO()
visualizarClientes = do 
    putStrLn "\nClientes ativos: "

    arq <- readFile "arquivos/clientes.txt"
    let linhas = lines arq
    Utils.escreveClientes linhas

cadastrarCarro:: IO()
cadastrarCarro = do
    putStr "\nInforme o código do carro: "
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


visualizarFuncionarios:: IO()
visualizarFuncionarios = do
    putStrLn "\nFuncionários ativos: "

    arq <- readFile "arquivos/funcionarios.txt"
    let linhas = lines arq
    Utils.escreveFuncionarios linhas


menuFinancas:: IO()
menuFinancas = do
    putStrLn "\n1 - Visualizar contratos ativos"
    putStrLn "2 - Alterar preço de um carro"
    putStrLn "3 - Voltar para o menu anterior"
    putStr "Opção: "
    op <- readLn:: IO Int
    chamadaFinancas op


chamadaFinancas:: Int -> IO()
chamadaFinancas op
    | op == 1 = do
        visualizarContratos
        menuFinancas
    | op == 2 = do
        alterarPrecoCarro
        menuFinancas
    | op == 3 = putStr ""
    |otherwise = do
        putStrLn "Opção inválida, digite novamente."
        menuFinancas


visualizarContratos:: IO()
visualizarContratos = do
    putStrLn "\nContratos ativos: "

    arq <- readFile "arquivos/contratos.txt"
    let linhas = lines arq
    Utils.escreveContratos linhas


alterarPrecoCarro:: IO()
alterarPrecoCarro = do
    Funcionario.veiculosDisponiveis
    putStr "\nInforme o código do carro: "
    id <- readLn:: IO Int

    putStr "Informe o novo preço: R$"
    preco <- readLn:: IO Double

    arq <- openFile "arquivos/carros.txt" ReadMode
    contents <- hGetContents arq
    let linhas = lines contents
    if linhas == linhas then do
        hClose arq
        
        Utils.escreveNovoPreco linhas id preco
    else putStr ""
