module Funcionario where
import Mensagens
import System.IO
import Data.List
import Distribution.Simple (UserHooks(preConf))
import qualified Data.Text as T
import Text.Printf
import Language.Haskell.TH (arithSeqE)
import Utils

menuFuncionario::IO()
menuFuncionario = do
    putStr("\n---------Menu do Funcionário----------\n")
    putStr("1 - Veículos disponíveis\n")
    putStr("2 - Escolher veículo para um cliente\n")
    putStr("3 - Exibir clientes cadastrados\n")
    putStr("4 - Excluir clientes do sistema\n")
    putStr("5 - Calcular valor do veículo\n")
    putStr("6 - Voltar para o menu principal\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamadaFuncionario op
    
    

chamadaFuncionario:: Int -> IO ()
chamadaFuncionario op
    | op == 1 = do
        veiculosDisponiveis
        menuFuncionario 
    | op == 2 = do
        escolherVeiculo
        menuFuncionario 
    | op == 3 = do
        clientesCadastrados
        menuFuncionario 
    | op == 4 = do
        excluirCliente
        menuFuncionario 
    | op == 5 = do
        valorVeiculo
        menuFuncionario 
    | op == 6 = putStr ""
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuFuncionario

veiculosDisponiveis:: IO()
veiculosDisponiveis = do
    putStr "Veículos disponíveis:\n"

    arq <- readFile "arquivos/carros.txt"
    let linhas = lines arq
    Utils.escreveCarrosDisponiveis linhas

clientesCadastrados:: IO()
clientesCadastrados = do
    putStr "Clientes cadastrados:\n"
    
    arq <- readFile "arquivos/clientes.txt"
    let linhas = lines arq
    Utils.escreveClientes linhas

valorVeiculo:: IO()
valorVeiculo = do
    veiculosDisponiveis

    putStr "Informe o código do carro:"
    id <- readLn:: IO Int
    putStr "Informe a quantidade de dias/meses:"
    tempo <- readLn:: IO Int

    arq <- readFile "arquivos/carros.txt"
    let linhas = lines arq
    Utils.procuraVeiculoValor linhas id tempo

excluirCliente:: IO()
excluirCliente = do
    clientesCadastrados

    putStr "Informe o código do cliente: "
    id <- readLn:: IO Int

    arq <- readFile "arquivos/clientes.txt"
    
    let linhas = lines arq
    Utils.procuraClienteIndice linhas linhas id 0

escolherVeiculo:: IO()
escolherVeiculo = do
    veiculosDisponiveis
    clientesCadastrados

    putStr "Informe o código do cliente: "
    idCliente <- readLn:: IO Int

    putStr "Informe o código do carro:"
    idCarro <- readLn:: IO Int

    putStr "Tipo de contrato: "
    contrato <- getLine

    putStr "Quantidade de dias/meses: "
    tempo <- readLn:: IO Int

    arqClientes <- openFile "arquivos/clientes.txt" ReadMode
    contents <- hGetContents arqClientes
    let clientes = lines contents
    if clientes == clientes then do
        hClose arqClientes

        arqCarros <- openFile "arquivos/carros.txt" ReadMode
        contents2 <- hGetContents arqCarros
        let carros = lines contents2

        if carros == carros then 
            Utils.escolherCarroCliente clientes idCliente carros idCarro contrato tempo
        else putStr ""
        
    else putStr ""