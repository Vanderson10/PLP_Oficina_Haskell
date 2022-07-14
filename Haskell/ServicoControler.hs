module ServicoControler where

import Database
import Servico

salvarServico :: Int -> String -> String -> Int -> String -> IO()
salvarServico clienteID modelo placa mecanicoID status = do
    dados <- Database.connect
    let codAtual = (Database.servicoID dados) + 1
    let servico = Servico codAtual clienteID modelo placa mecanicoID status
    let servicos = Database.servicos dados
    Database.entityToFile servico "servico.txt" "sId.txt"
    let new = dados {Database.servicos = servicos ++ [servico], Database.servicoID = codAtual}
    putStr "Serviço cadastrado com sucesso!"
