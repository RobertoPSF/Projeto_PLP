module Utils where
import Text.Printf
import Mensagens
import Data.List
import System.IO
import GHC.Float (int2Double)


split:: Char -> String -> String -> [String]
split _ [] temp
    | temp == "" = []
    | otherwise = [temp]
split x (h:t) temp = if h /= x then do
    split x t (temp ++ [h])
    else temp : split x t ""


escreveCarros:: [String] -> IO()
escreveCarros [] = do putStrLn ""
escreveCarros (h:t) = do
    let carro = split '/' h ""
    printf "\nCódigo: %s\n" (carro!!0)
    printf "Nome: %s\n" (carro!!1)
    printf "Ano: %s\n" (carro!!2)
    printf "Cor: %s\n" (carro!!3)
    printf "Preço fixo: R$ %.2f\n" (read (carro!!4):: Double)
    printf "Tarifa diária: %s%%\n" (carro!!5)
    printf "Tarifa mensal: %s%%\n" (carro!!6)
    printf "Disponível: %s\n" (carro!!7)
    escreveCarros t


escreveCarrosDisponiveis:: [String] -> IO()
escreveCarrosDisponiveis [] = putStrLn ""
escreveCarrosDisponiveis (h:t) = do
    let carro = split '/' h ""
    if carro!!7 == "sim" then do 
        printf "\nCódigo: %s\n" (carro!!0)
        printf "Nome: %s\n" (carro!!1)
        printf "Ano: %s\n" (carro!!2)
        printf "Cor: %s\n" (carro!!3)
        printf "Preço fixo: R$ %.2f\n" (read (carro!!4):: Double)
        printf "Tarifa diária: %s%%\n" (carro!!5)
        printf "Tarifa mensal: %s%%\n" (carro!!6)
        escreveCarrosDisponiveis t
    else escreveCarrosDisponiveis t


escreveClientes:: [String] -> IO()
escreveClientes [] = putStrLn ""
escreveClientes (h:t) = do
    let cliente = split '/' h ""
    printf "\nCódigo: %s\n" (cliente!!0)
    printf "Nome: %s\n" (cliente!!1)
    printf "CPF: %s\n" (cliente!!2)
    printf "Idade: %s\n" (cliente!!3)
    printf "Carro alugado: %s\n" (cliente!!4)
    escreveClientes t


procuraVeiculoValor:: [String] -> Int -> Int -> IO()
procuraVeiculoValor [] _ _ = putStr Mensagens.carroNaoEncontrado
procuraVeiculoValor (h:t) id tempo = do
    let carro = split '/' h ""
    if (read (carro!!0):: Int) == id then do
        printf "Nome: %s\n" (carro!!1)
        printf "Ano: %s\n" (carro!!2)
        printf "Cor: %s\n" (carro!!3)
        let diario = (read (carro!!4):: Double) * (read (carro!!5):: Double) * int2Double tempo
        let mensal = (read (carro!!4):: Double) * (read (carro!!6):: Double) * int2Double tempo
        printf "Aluguel diário: R$ %.2f\n" diario
        printf "Aluguel mensal: R$ %.2f\n" mensal
    else procuraVeiculoValor t id tempo


procuraClienteIndice:: [String] -> [String] -> Int -> Int -> IO()
procuraClienteIndice _ [] _ _ = putStr Mensagens.clienteNaoEncontrado
procuraClienteIndice lista (h:t) id cont = do
    let cliente =  split '/' h ""
    if (read (cliente!!0):: Int) == id then removeCliente lista cont
    else procuraClienteIndice lista t id (cont + 1)


removeCliente:: [String] -> Int -> IO()
removeCliente clientes indice = do
    let lista = take indice clientes ++ drop (1 + indice) clientes
    let linhas = unlines lista
    arq <- openFile "arquivos/clientes.txt" WriteMode
    hPutStr arq linhas
    hFlush arq
    hClose arq
    putStr ""
    putStrLn "Cliente excluído com sucesso."


atualizaClienteCarro:: [String] -> [String] -> [String] -> Int -> Int -> IO()
atualizaClienteCarro [] _ _ _ _ = putStr Mensagens.clienteNaoEncontrado
atualizaClienteCarro (h:t) clientes cliente indice idCliente = do
    let linha = split '/' h ""
    if (read (linha!!0):: Int) == idCliente then do
        let clienteS = cliente!!0 ++ "/" ++ cliente!!1 ++ "/" ++ cliente!!2 ++ "/" ++ cliente!!3 ++ "/" ++ cliente!!4
        let lista = take indice clientes ++ [clienteS] ++ drop (1 + indice) clientes
        let linhas = unlines lista

        arq <- openFile "arquivos/clientes.txt" WriteMode
        hPutStr arq linhas
        hFlush arq
        hClose arq
        putStr ""
    else atualizaClienteCarro t clientes cliente (indice + 1) idCliente


atualizaCarroDisposicao:: [String] -> [String] -> [String] -> Int -> Int -> IO()
atualizaCarroDisposicao [] _ _ _ _ = putStr Mensagens.carroNaoEncontrado
atualizaCarroDisposicao (h:t) carros carro indice idCarro = do
    let linha = split '/' h ""
    if (read (linha!!0):: Int) == idCarro then do
        let carroS = carro!!0 ++ "/" ++ carro!!1 ++ "/" ++ carro!!2 ++ "/" ++ carro!!3 ++ "/" ++ carro!!4 ++ "/" ++ carro!!5 ++ "/" ++ carro!!6 ++ "/" ++ carro!!7
        let lista = take indice carros ++ [carroS] ++ drop (1 + indice) carros
        let linhas = unlines lista

        arq <- openFile "arquivos/carros.txt" WriteMode
        hPutStr arq linhas
        hFlush arq
        hClose arq
        putStr ""
    else atualizaCarroDisposicao t carros carro (indice + 1) idCarro


escolherCarroCliente:: [String] -> Int -> [String] -> Int -> String -> Int -> IO()
escolherCarroCliente clientes idCliente carros idCarro contrato tempo = do

    let cliente = escreveClienteCarro (procuraCliente clientes idCliente) idCarro
    atualizaClienteCarro clientes clientes cliente 0 idCliente

    let carro = escreveIndisponivel (procuraCarro carros idCarro)
    atualizaCarroDisposicao carros carros carro 0 idCarro

    if contrato == "diario" then do
        let total = contratoDiario carros idCarro tempo
        let linha = show idCliente ++ "/" ++ show idCarro ++ "/" ++ contrato ++ "/" ++ show total ++ "\n"
        appendFile "arquivos/contratos.txt" (linha)
        putStr "Carro alugado para cliente."
    else do
        let total = contratoMensal carros idCarro tempo
        let linha = show idCliente ++ "/" ++ show idCarro ++ "/" ++ contrato ++ "/" ++ show total ++ "\n"
        appendFile "arquivos/contratos.txt" (linha)
        putStr "Carro alugado para cliente."


escreveIndisponivel:: [String] -> [String]
escreveIndisponivel linha = take 7 linha ++ ["nao"]


escreveDisponivel:: [String] -> [String]
escreveDisponivel linha = take 7 linha ++ ["sim"]


escreveClienteCarro:: [String] -> Int -> [String]
escreveClienteCarro linha id = take 4 linha ++ [show id]

tiraClienteCarro:: [String] -> [String]
tiraClienteCarro linha = take 4 linha ++ ["0"]


contratoMensal:: [String] -> Int ->  Int -> Double
contratoMensal [] _ _ = 0
contratoMensal (h:t) id tempo = do
    let carro = split '/' h ""
    if (read (carro!!0):: Int) == id then
        (read (carro!!4):: Double) + (read (carro!!6):: Double) * int2Double tempo
    else contratoMensal t id tempo


contratoDiario:: [String] -> Int -> Int -> Double
contratoDiario [] _ _ = 0
contratoDiario (h:t) id tempo = do
    let carro = split '/' h ""
    if (read (carro!!0):: Int) == id then
        (read (carro!!4):: Double) + (read (carro!!5):: Double) * int2Double tempo
    else contratoMensal t id tempo


procuraCarro:: [String] -> Int -> [String]
procuraCarro [] _ = []
procuraCarro (h:t) id = do
    let carro = split '/' h ""
    if (read (carro!!0):: Int) == id then
        carro
    else procuraCarro t id


procuraCliente:: [String] -> Int -> [String]
procuraCliente [] _ = []
procuraCliente (h:t) id = do
    let cliente = split '/' h ""
    if (read (cliente!!0):: Int) == id then
        cliente
    else procuraCliente t id


mudarDisponibilidadeDoCarro::[String] -> Int -> String -> IO()
mudarDisponibilidadeDoCarro carros idCarro disp = do
    if disp == "i" then do
        let carro = escreveIndisponivel (procuraCarro carros idCarro)
        atualizaCarroDisposicao carros carros carro 0 idCarro
        putStr "O carro agora está indisponível\n"
    else do
        let carro = escreveDisponivel (procuraCarro carros idCarro)
        atualizaCarroDisposicao carros carros carro 0 idCarro
        putStr "O carro agora está disponível\n"