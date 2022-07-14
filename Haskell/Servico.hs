module Servico where

-- import Cliente
-- import Funcionario

import TypeClasses
import Data.List.Split

type ServicoID = Int
type ClientID = Int
type ModeloVeiculo = String
type PlacaVeiculo = String
type FuncID = Int
type Status = String

data Servico = Servico { 
    cod :: ServicoID,
    clienteID :: ClientID,
    modelo :: ModeloVeiculo,
    placa :: PlacaVeiculo,
    mecanicoID :: FuncID,
    status :: Status
  }

instance Entity Servico where
  entityId servico = Servico.cod servico

instance Show Servico where
   show (Servico cod clienteID modelo placa mecanicoID status) = "\n-----------------------\n" ++
                                              "ID: " ++ (show cod) ++ "\n" ++
                                              "ID do Cliente: " ++ (show clienteID) ++ "\n" ++
                                              "Modelo do veículo: " ++ modelo ++ "\n" ++
                                              "Placa do veículo: " ++ placa ++ "\n" ++
                                              "ID do mecânico responsável pelo serviço: " ++ (show mecanicoID) ++ "\n" ++
                                              "Status do serviço: " ++ status ++ 
                                              "\n-----------------------\n"

instance Stringfy Servico where
  toString (Servico cod clienteID modelo placa mecanicoID status) = show cod ++ "," ++
                                                  show clienteID ++ "," ++
                                                  modelo ++ "," ++
                                                  placa ++ "," ++
                                                  show mecanicoID ++ "," ++
                                                  status

instance Read Servico where
  readsPrec _ str = do
  let l = splitOn "," str
  let cod = read (l !! 0) :: ServicoID
  let clienteID = read (l !! 1) :: ClientID
  let modelo = l !! 2
  let placa = l !! 3
  let mecanicoID = read (l !! 4) :: FuncID
  let status = l !! 5
  [(Servico cod clienteID modelo placa mecanicoID status, "")]