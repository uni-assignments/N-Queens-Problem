import System.Environment
import Data.List

posicao_valida :: Int -> [Int] -> Bool
posicao_valida rainha_atual rainhas_no_tabuleiro = and [ nao_existe_conflito rainha rainha_atual n
                        | (n,rainha) <- zip [1..] rainhas_no_tabuleiro]
    where 
        nao_existe_conflito :: Int -> Int -> Int -> Bool
        nao_existe_conflito r1 r2 n 
            | (r1 == r2) || (abs(r1 - r2) == n)  = False
            | otherwise = True


ndamas :: Int -> [[Int]]
ndamas n = solucao n []
    where
        solucao :: Int -> [Int] -> [[Int]]
        solucao 0 rainhas = [rainhas]
        solucao n rainhas = concat [ solucao (n-1) (rainha:rainhas)
                            | rainha <- posicoes, posicao_valida rainha rainhas ]
        posicoes = [1..n]

main :: IO()
main = do
    let rainhas = ndamas (4)
    putStrLn (show "Solucoes:")
    mapM_ tabuleiro rainhas

tabuleiro = putStrLn . impressao
impressao tab = concatMap showLine tab ++ bordas_horizontais
    where
        showLine q = bordas_horizontais ++ "|" ++ parede (q-1) ++ " R |" ++ parede (4-q) ++ "\n" 
        parede k = concat (replicate k "   |")
        bordas_horizontais = "-----------------" ++ "\n"
