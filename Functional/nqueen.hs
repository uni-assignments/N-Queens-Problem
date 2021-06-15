import System.Environment (getArgs)

-- Estrutura rainha, possui inteiros representando a linha e coluna onde esta foi colocada
data Rainha = Rainha { x :: Int, y :: Int} deriving (Eq)

-- Representação de onde cada rainha está
instance Show Rainha where show (Rainha x y) = " Rainha: (" ++ show x ++ "," ++ show y ++ ") "


-- verifica se o posicionamento é valido
ataque :: Rainha -> Rainha -> Bool
ataque (Rainha x1 y1) (Rainha x2 y2)
    -- caso esteja na mesma diagonal
    | abs (x1 - x2) == abs (y1 - y2) = True
    -- caso esteja na mesma coluna ou linha
    | (x1 == x2) || (y1 == y2)       = True
    | otherwise                      = False


-- verificamos se a rainha pode ser colocada na posição
posicao_valida :: Rainha -> [Rainha] -> Bool
posicao_valida try []     = True
posicao_valida try (r:rainhas) 
    = if try `ataque` r
      then False
      else posicao_valida try rainhas


-- gera todas as possiveis configurações das 4 rainhas
nRainhas :: Int -> [[Rainha]]
nRainhas n = map reverse $ nRainhas' n where
    nRainhas' 0 = [[]]
    nRainhas' i =
        let anterior  = nRainhas' (i - 1)
            valida = [Rainha (i - 1) y | y <- [0 .. n - 1]]
        in [r:rainhas | rainhas <- anterior, r <- valida, posicao_valida r rainhas]


-- imprime cada rainha
printQs :: [[Rainha]] -> IO ()
printQs []     = putChar '\n'
printQs (s:solucoes) = do
    putStrLn $ show s
    printQs solucoes


-- MAIN
main :: IO ()
main = do
    args <- getArgs
    let n = 4
    printQs $ nRainhas n