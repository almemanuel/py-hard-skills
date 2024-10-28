import duckdb
import pandas as pd

def convert_column_type(df: pd.DataFrame, conversion: dict) -> None:
    """Converte colunas de um DataFrame para tipos específicos."""
    for dtype, columns in conversion.items():
        for column in columns:
            if dtype == 'datetime':
                df[column] = pd.to_datetime(df[column])
            else:
                df[column] = df[column].astype(dtype)


def read_query(file_path: str) -> str:
    """Lê um arquivo de texto e retorna seu conteúdo."""
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()


def read_csv(file_path: str) -> pd.DataFrame:
    """Lê um arquivo CSV e retorna um DataFrame."""
    return pd.read_csv(file_path)


def execute_query(query: str, duckdb_conn) -> pd.DataFrame:
    """Executa uma query e retorna o resultado como DataFrame."""
    return duckdb_conn.execute(query).fetchdf()


def handle_data(query_path: str, result_path: str, conn) -> None:
    """Executa uma query e salva o resultado em um arquivo CSV."""
    query = read_query(query_path)
    result = execute_query(query, conn)
    result.to_csv(result_path, decimal='.', index=False, sep=';', encoding='utf-8')


def register_table(df:pd.DataFrame, table_name:str, conn:duckdb.DuckDBPyConnection) -> None:
    """Registra um DataFrame como uma tabela no DuckDB."""
    conn.register(table_name, df)


def main():
    conn = duckdb.connect()

    routing = read_csv('script/data/routing.csv')
    routing_item = read_csv('script/data/routing_item.csv')
    service_order_item_process = read_csv('script/data/service_order_item_process.csv')
    service_order_item = read_csv('script/data/service_order_item.csv')
    service_order = read_csv('script/data/service_order.csv')

    convert_column_type(routing, {'datetime': ['accept_date', 'start_date', 'created_at']})

    register_table(routing, 'routing', conn)
    register_table(routing_item, 'routing_item', conn)
    register_table(service_order_item_process, 'service_order_item_process', conn)
    register_table(service_order_item, 'service_order_item', conn)
    register_table(service_order, 'service_order', conn)

    handle_data("script/query/service_order.sql", "script/result/service_order_result.csv", conn)
    handle_data('script/query/routing.sql', 'script/result/routing_result.csv', conn)

    conn.close()


if __name__ == '__main__':
    main()
