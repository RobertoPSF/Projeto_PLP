module Funcionario where
import Mensagens
import System.IO
import Data.List
import Distribution.Simple (UserHooks(preConf))
import qualified Data.Text as T
import Text.Printf
import Language.Haskell.TH (arithSeqE)
import Utils

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
    | op == 1 = veiculosDisponiveis
    | op == 2 = putStr ""
    | op == 3 = clientesCadastrados
    | op == 4 = putStr ""
    | op == 5 = putStr ""
    | op == 6 = menuPrincipal
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuFuncionario menuPrincipal

veiculosDisponiveis:: IO()
veiculosDisponiveis = do
    putStr "Veículos disponíveis:\n"

    arq <- readFile "arquivos/carros.txt"
    let linhas = lines arq
    Utils.escreveCarros linhas

clientesCadastrados:: IO()
clientesCadastrados = do
    putStr "Clientes cadastrados:\n"
    
    arq <- readFile "arquivos/clientes.txt"
    let linhas = lines arq
    Utils.escreveClientes linhas

