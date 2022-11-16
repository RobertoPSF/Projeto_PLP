module Utils where
import qualified Data.Text as T
import Text.Printf

escreveCarros:: [String] -> IO()
escreveCarros [] = putStrLn ""
escreveCarros (h:t) = do
    let carro = T.splitOn (T.pack "/") (T.pack h)
    printf "\nCódigo:\n" (carro!!0)
    printf "Nome: %s\n" (carro!!1)
    printf "Ano: %s\n" (carro!!2)
    printf "Cor: %s\n" (carro!!3)
    escreveCarros t

escreveClientes:: [String] -> IO()
escreveClientes [] = putStrLn ""
escreveClientes (h:t) = do
    let cliente = T.splitOn (T.pack "/") (T.pack h)
    printf "Codigo: %s" (cliente!!0)
    printf "Nome: %s\n" (cliente!!1)
    printf "CPF: %s\n" (cliente!!2)
    printf "Idade: %s\n" (cliente!!3)
    escreveClientes t