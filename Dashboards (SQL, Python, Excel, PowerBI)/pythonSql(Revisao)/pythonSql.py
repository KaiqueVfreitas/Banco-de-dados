import pyodbc

dados_conexao = (
    "Driver={SQL Server};"
    "Server=DESKTOP-50AO08I;"
    "Database=PythonSQL;"
)

conexao = pyodbc.connect(dados_conexao)
print("Conexão Bem Sucedida")
