# aws

Esta pasta contém notas sobre meus estudos sobre AWS, selecionada como meu primeiro serviço em nuvem. As notas são voltadas a recursos interessantes de engenharia de dados

## Alguns Serviços
### Amazon S3
- Serviço de armazenamento, adequado para armazenar dados brutos e processados
- Permite integração com outros serviços AWS e é amplamente utilizado para armazenamento de objetos

### AWS Glue Data Catalog
- Serviço para catalogar e gerenciar dados em diversos armazenamentos
- Cria um catálogo de metadados unificado e ajuda na descoberta e organização de dados em diferentes fontes

### AWS Glue Job
- Serviço gerenciado de ETL para transformação e movimentação de dados entre diferentes fontes e destinos
- Útil para transformar e limpar dados brutos antes de armazená-los em um data warehouse ou data lake

### Amazon EMR: processamento de dados
- Serviço de cluster de Hadoop gerencia na AWS para processamento distribuído de grandes volumes de dados usando Spark
- Util para processar dados brutos e transformá-lo em formatos mais amigáveis para análise

### Amazon Redshift: consultas analíticas
- Serviço de Data Warehousing para armazenar e analisar grandes volumes de dados de maneira rápida e escalável
- Utilizado para análise de dados de negócios e tomada de decisões baseadas em dados

### AWS Lambda
- Serviço de computação severless para executar código em resposta a eventos, como mudanças em dados armazenados no S3
- processamento em tempo real

### AWS Setp Functions
- Serviço para criar e executar workflows complexos, incluindo pipeline de dados
- Utilizado para orquestrar pipelines de dados

## Arquitetura Usual
![Exemplo de Arquitetura](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*NOTduD49NFsTcV7QITQ9rg.png)
