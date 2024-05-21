import dash
from dash import dcc, html
import dash_bootstrap_components as dbc
import pandas as pd
import pyodbc
import plotly.express as px

#Integração ao banco de dados
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'  
    'SERVER=DESKTOP-QQL8NG8\\SQLSERVERDEV;'  
    'DATABASE=PythonSQL;' 
    'Trusted_Connection=yes;'
)

# Consulta SQL para obter os dados
query = """
SELECT cliente, produto, data_venda, preco, quantidade
FROM Vendas
"""

# Carregando os dados em um DataFrame
df = pd.read_sql(query, conn)

# Processamento dos dados
df['data_venda'] = pd.to_datetime(df['data_venda'])
df['lucro'] = df['preco'] * df['quantidade']
df['bimestre'] = df['data_venda'].dt.to_period('2M').astype(str)
df['trimestre'] = df['data_venda'].dt.to_period('Q').astype(str)

# Produto mais vendido e menos vendido por quantidade
produto_mais_vendido = df.groupby('produto')['quantidade'].sum().idxmax()
quantidade_mais_vendido = df.groupby('produto')['quantidade'].sum().max()

produto_menos_vendido = df.groupby('produto')['quantidade'].sum().idxmin()
quantidade_menos_vendido = df.groupby('produto')['quantidade'].sum().min()

# Lucro por trimestre
lucro_trimestre = df.groupby('trimestre')['lucro'].sum().reset_index()

# Percentual de vendas por produto
percentual_vendas = df.groupby('produto')['quantidade'].sum().reset_index()
percentual_vendas['percentual'] = (percentual_vendas['quantidade'] / percentual_vendas['quantidade'].sum()) * 100
vendas_bimestre = df.groupby('bimestre')['quantidade'].sum().reset_index()
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Define o layout da aplicação
app.layout = dbc.Container([
    dbc.Row([
        dbc.Col([
            dbc.Card([
                dbc.CardHeader("Produto Mais Vendido", style={'textAlign': 'center'}),
                dbc.CardBody([
                    html.H5(produto_mais_vendido, className="card-title", style={'textAlign': 'center'}),
                    html.P(f"Quantidade: {quantidade_mais_vendido}", className="card-text", style={'textAlign': 'center'}),
                ]),
            ], className="mb-4", color="success", inverse=True),
            dbc.Card([
                dbc.CardHeader("Produto Menos Vendido", style={'textAlign': 'center'}),
                dbc.CardBody([
                    html.H5(produto_menos_vendido, className="card-title", style={'textAlign': 'center'}),
                    html.P(f"Quantidade: {quantidade_menos_vendido}", className="card-text", style={'textAlign': 'center'}),
                ]),
            ], color="danger", inverse=True),
            dcc.Graph(
                figure=px.pie(percentual_vendas, values='quantidade', names='produto', title="Percentual de Vendas por Produto")
                .update_layout(width=550, height=600)
            )
        ], width=4),
        dbc.Col([
            dbc.Row([
                dbc.Col([
                    dcc.Graph(
                        figure=px.bar(lucro_trimestre, x='trimestre', y='lucro', title="Lucro por Trimestre")
                    ),
                ], width=12, className="mb-4")
            ]),
            dbc.Row([
                dbc.Col([
                    dcc.Graph(
                        figure=px.line(vendas_bimestre, x='bimestre', y='quantidade', title="Crescimento das Vendas por Bimestre")
                    ),
                ], width=14)
            ]),
        ], width=8),
    ], justify="center"),
], fluid=True)

if __name__ == '__main__':
    app.run_server(debug=True)