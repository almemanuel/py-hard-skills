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
- O padrão de acesso pode ajudar na definição do formato de armazenamento
- Big Data é definida por 4Vs: Volume, Velocidade, Variedade e Veracidade

## Armazenamento Colunar x Linha
- O armazenamento baseado em linha se baseia numa tabela SQL, onde cada linha é uma instância
- O armazenamento baseado em coluna possui duas colunas, sendo a primeira a chave e, a segunda, um par chave:valor, onde a chave é o ID do objeto
    - Costuma performar melhor do que armazenamentos baseados em linha

## Quando usar um Data Warehouse?
- DW é um tipo de banco de dados para consultas e análises eficientes de grandes quantidades de dados
- dados limpos e organizados
- ETL
- usado para armazenar e gerenciar dados de várias fontes
- é um conceito, e pode ser criado em SQL ou NoSQL, formato colunar ou baseado em linha
- é útil com grande volume de dados, necessidade de desempenho de consulta analítica, necessidade de integrar dados de várias fontes, necessidade de oferecer suporte à BI ou necessidade de dados históricos

## Quando usar um Data Lake?
- armazenamento bruto
- ELT
- repositório centralizado que permite armazenar e processar grandes quantidades de dados estruturados e não estruturados em escala
- lida com ampla variedade de tipos de dados e pode armazenar dados em sua forma bruta e não estruturada, trazendo mais flexibilidade e escalabilidade
- bancos NoSQL e tecnologias distribuídas são úteis para construção
- é útil se é necessário armazenar e processar dados brutos, armazenar e processar gandes volumes de dados, dados estruturados, não estruturados ou semiestruturados, necessidade de escalabilidade ou de um repositório de dados centralizado