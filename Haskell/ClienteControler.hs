module ClienteControler where

import Database
import Cliente

salvarCliente :: String -> String -> IO()
salvarCliente nome contato = do
    dados <- Database.connect
    let codAtual = (Database.clienteID dados) + 1
    let cliente = Cliente codAtual nome contato
    let clientes = Database.clientes dados
    Database.entityToFile cliente "cliente.txt" "cId.txt"
    let new = dados {Database.clientes = clientes ++ [cliente], Database.clienteID = codAtual}
    putStr "Cliente cadastrado com sucesso!"
