import pyodbc
from datetime import datetime

dados_conexao = (
    "Driver={SQL Server};"
    "Server=DESKTOP-QQL8NG8\SQLSERVERDEV;"
    "Database=PythonSQL;"
)

conexao = pyodbc.connect(dados_conexao)
print("Conexão Bem Sucedida")

cursor = conexao.cursor()

def converter_data(data):
    return datetime.strptime(data, '%d/%m/%Y').strftime('%Y-%m-%d')

def validar_data(data):
    data_formatada = datetime.strptime(data, '%d/%m/%Y')
    data_minima = datetime(2019, 10, 10)
    data_maxima = datetime(2024, 1, 1)
    return data_minima <= data_formatada < data_maxima

def cadastrar_produto(cliente=None):
    if cliente is None:
        cliente = input("Nome do cliente: ")

    while True:
        produto = input("Produto comprado: ")
        data_venda = input("Data da venda (dd/mm/yyyy): ")
        if validar_data(data_venda):
            data_venda_formatada = converter_data(data_venda)
            break
        else:
            print("Data inválida! A data deve ser igual ou maior que 10/10/2019 e menor que 01/01/2024.")

    preco = float(input("Preço unitário: "))
    quantidade = int(input("Quantidade: "))

    comandoInsert = """
    INSERT INTO Vendas (cliente, produto, data_venda, preco, quantidade)
    VALUES (?, ?, ?, ?, ?)
    """

    cursor.execute(comandoInsert, (cliente, produto, data_venda_formatada, preco, quantidade))
    conexao.commit()

    print("Dados inseridos com sucesso!")

cliente = input("Nome do cliente: ")
cadastrar_produto(cliente)

while True:
    continuar = input("Deseja cadastrar outro produto para o mesmo cliente? (s/n): ").strip().lower()
    if continuar != 's':
        break
    cadastrar_produto(cliente)

cursor.close()
conexao.close()
