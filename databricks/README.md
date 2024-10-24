# Databricks

- Databricks pode ser vista como uma plataforma de dados per si, onde não é necessário se preocupar com cada componente da arquitetura de dados
- não é um _cloud provider_, mas trabalha sobre a infraestrutura de um
- O Databricks pode ser uma plataforma muito útil para otimizar tempo e custos de desenvolvimento de pipelines de dados, pois ele já possui muitas ferramentas prontas para uso, sendo possível se preocupar apenas com a lógica do pipeline

## Conceitos
- Computação: _clusters spark_ que são gerenciados pelo Databricks, mas alocados em um _cloud provider_
    - é efêmero, ou seja, é criado quando necessário e destruído quando não é mais necessário
- Storage: _Data Lakehouse_ onde os dados são armazenados para poderem ser acessados pelos _clusters spark_

- Computações realizam operações de I/O nos storages