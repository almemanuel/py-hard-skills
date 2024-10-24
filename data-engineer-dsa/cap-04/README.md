# Armazenamento e Processamento Distribuído
- O armazenamento é, provavelmente, a parte mais negligenciada de um pipeline de dados, mas é uma das mais importantes
- Os tipos de arquivo e o armazenamento desempenham um papel crucial na eficiência do pipeline
- O trabalho de um engenheiro de dados começa e termina com o armazenamento de dados

## Por que o armazenamento de dados é importante?
- Os dados residem em arquivos armazenados em um disco físico ou outra mídia de armazenamento
- a forma como os dados serão armazenados afetará diretamente a eficiência do pipeline
- um engenheiro de dados deve saber construir uma arquiteura de armazenamento eficiente

## Os padrões de acesso definem o tipo de armazenamento
- Quantos sistemas precisarão de acesso à camada de armazenamento de dados?
- Com que frequência os sistemas acessarão o armazenamento de dados?
- Qual é o volume de dados que esses sistemas estarão lendo?
- Quanta lógica será aplicada por esses sistemas aos dados?
- Como o sistema acessa tecnicamente os dados?

## Armazenamento SQL/NoSQL ou armazenamento de arquivos?
- O armazenamento SQL é tabular e é usado para armazenar dados estruturados
    - Usa-se SGDBs para armazenamento SQL
    - É utilizado, principalmente, para consultas e análises frequentes
- O armazenamento NoSQL surgiu no Big Data para permitir o armazenamento de dados sem esquema
    - É utilizado para armazenar dados não estruturados
    - JSON, XML, colunar, etc
    - Orientados a performance e facilidade de uso
    - SGDBs NoSQL: Cassandra, MongoDB, Redis, DynamoDB, etc