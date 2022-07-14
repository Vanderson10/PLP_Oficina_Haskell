import Database
import Utils
import Chat
import System.Exit
import AdministradorControler

main = do
    start

start ::IO()
start = do
  putStr menu
    
  option <- getString "Opção: "

  let opc = read option

  if opc == 1 then do 
    clearScreen
    adminInteracao
  else if opc == 2 then do
    clearScreen
    putStr mechanOptions
    -- opcM <- getLine
    -- mechanInteracion (read opcM)
  else if opc == 3 then do
    clearScreen
    opcC <- getString "Digite seu id: "
    clientInteraction (read opcC)
    
  else if opc == 4 then do
    putStr "\nVolte sempre!\n"
  else
    putStr "\nOpção Inválida\n"

adminInteracao::IO()
adminInteracao = do

  clearScreen
  putStr adminOptions
  op <- getString "Operaçao: "
  let opcAdmin = read op

  if opcAdmin == 1 then do
    -- registerMechanic adminInteracao
    start
  else if opcAdmin == 2 then do
    registrarCliente
  else if opcAdmin == 3 then do
    start
  else if opcAdmin == 4 then do
    registrarServico
  else
    start

clientInteraction::Int -> IO()
clientInteraction idClient = do

  putStr clientOptions
  op <- getLine
  let opcClient = read op

  if opcClient == 1 then do
    start
  else
    start
