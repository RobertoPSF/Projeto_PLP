module Cliente where
import Mensagens
import Utils
import System.IO
import Mensagens

menuCliente:: IO()
menuCliente  = do
    putStr("\n----------Menu do Cliente----------\n")
    putStr("1 - Listar veículos disponíves\n")
    putStr("2 - Escolher veículo\n")
    putStr("3 - Pesquisar veículos\n")
    putStr("4 - Voltar para o menu principal\n")
    putStr("Opção: ")
    op <- readLn:: IO Int
    chamadaCliente op



chamadaCliente:: Int -> IO()
chamadaCliente op 
    | op == 1 = do 
        veiculosDisponiveis
        menuCliente
    | op == 2 = do 
        putStr ""
        escolherVeiculoCliente
        menuCliente
    | op == 3 = do 
        putStr ""
        menuCliente
    | op == 4 = putStr ""
    | otherwise = do
        putStr("Opção inválida, digite novamente\n")
        menuCliente

escolherVeiculoCliente:: IO()
escolherVeiculoCliente = do
    veiculosDisponiveis
    clientesCadastrados

    putStr "\nInforme o código do cliente: "
    idCliente <- readLn:: IO Int

    putStr "Informe o código do carro: "
    idCarro <- readLn:: IO Int

    putStr "Tipo de contrato:\n"
    putStr "1 - Diário\n"
    putStr "2 - Mensal\n"
    tipoContrato <- readLn :: IO Int

    putStr "Quantidade de dias/meses: "
    tempo <- readLn:: IO Int

    arqClientes <- openFile "arquivos/clientes.txt" ReadMode
    contents <- hGetContents arqClientes
    let clientes = lines contents

    if Utils.procuraCliente clientes idCliente == [] then do 
        putStr Mensagens.clienteNaoEncontrado
        hClose arqClientes
    else do
        if clientes == clientes then do
            hClose arqClientes

            arqCarros <- openFile "arquivos/carros.txt" ReadMode
            contents2 <- hGetContents arqCarros
            let carros = lines contents2

            if Utils.procuraCarro carros idCarro == [] then do
                putStr Mensagens.carroNaoEncontrado
                hClose arqCarros
            else do
                if carros == carros then do
                    hClose arqCarros

                    Utils.escolherCarroCliente clientes idCliente carros idCarro (if tipoContrato == 1 then "diario" else "mensal") tempo
                else putStr ""
        
        else putStr ""

menuPesquisaVeiculos:: IO()
menuPesquisaVeiculos = do
    putStr "Tipo de pesquisa:\n"
    putStr "1 - Modelo\n"
    putStr "2 - Ano\n"
    putStr "3 - Cor\n"
    op <- readLn:: IO Int

    opcaoPesquisa op

opcaoPesquisa:: Int -> IO()
opcaoPesquisa op = do
    arqCarros <- openFile "arquivos/carros.txt" ReadMode
    contents2 <- hGetContents arqCarros
    let carros = lines contents2

    if op > 3 || op < 1 then putStr "Opção inválida\n"
    else do
        if op == 1 then putStr "Modelo: "
        else if op == 2 then putStr "Ano: "
        else putStr "Cor: "
        element <- getLine
        escreveCarroElem carros element op
        hClose arqCarros

escreveCarroElem:: [String] -> String -> Int -> IO()
escreveCarroElem [] _ _ = putStrLn ""
escreveCarroElem (h:t) element index = do
    let carro = split '/' h ""
    if (carro!!index == element) then do 
        printf "\nCódigo: %s\n" (carro!!0)
        printf "Nome: %s\n" (carro!!1)
        printf "Ano: %s\n" (carro!!2)
        printf "Cor: %s\n" (carro!!3)
        printf "Preço fixo: R$ %.2f\n" (read (carro!!4):: Double)
        printf "Tarifa diária: %s%%\n" (carro!!5)
        printf "Tarifa mensal: %s%%\n" (carro!!6)
        printf "Disponível: %s\n" (carro!!7)
        escreveCarroElem t element index
    else escreveCarroElem t element index

clientesCadastrados:: IO()
clientesCadastrados = do
    putStrLn "\nClientes cadastrados:"
    
    arq <- readFile "arquivos/clientes.txt"
    let linhas = lines arq
    Utils.escreveClientes linhas

veiculosDisponiveis:: IO()
veiculosDisponiveis = do
    putStrLn "\nVeículos disponíveis:"

    arq <- readFile "arquivos/carros.txt"
    let linhas = lines arq
    Utils.escreveCarrosDisponiveis linhas