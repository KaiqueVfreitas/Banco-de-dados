import pyodbc

dados_conexao = (
    "Driver={SQL Server};"
    "Server=DESKTOP-50AO08I"
    "Database=bdPythonSQL;"
)

conexao = pyodbc.connect(dados_conexao)
print("Conexão Bem Sucedida")
