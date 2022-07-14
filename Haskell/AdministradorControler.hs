module AdministradorControler where

import Database
import Control.Concurrent
import Utils
import ClienteControler
import ServicoControler

-- type Interaction = (Int -> IO())

-- registrarMecanico :: (Int -> IO()) -> IO()
-- registrarMecanico adminInteracao = do
--     idMecanico <- getString "Digite o Id do mecânico: "
--     nomeMecanico <- getString "Digite o nome do mecânico: " 
--     contatoMecanico <- getString "Digite o contato do mecânico: "

--     criarMecanico (read idMecanico) nomeMecanico contatoMecanico
--     threadDelay 1000000

--     clearScreen
--     adminInteracao
    
    
registrarServico ::IO()
registrarServico = do
    idCliente <- getString "Digite o id do cliente: " 
    modeloAutomovel <- getString "Digite o modelo do automóvel: "
    placaAutomovel <- getString "Digite a placa do automóvel: "
    idMecanico <- getString "Digite o Id do mecânico responsável: "
    status <- getString "Digite o status do serviço: "

    salvarServico (read idCliente) modeloAutomovel placaAutomovel (read idMecanico) status
    threadDelay 1000000

    clearScreen

registrarCliente ::IO()
registrarCliente = do
    nomeCliente <- getString "Digite o nome do cliente: "
    contatoCliente <- getString "Digite o contato do cliente: "
    
    salvarCliente nomeCliente contatoCliente
    threadDelay 1000000

    clearScreen
