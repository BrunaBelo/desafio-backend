# Ranking dos gastos dos Deputados

## Descrição do desafio

Você já ouviu falar da CEAP? A Cota para o Exercício da Atividade Parlamentar, custeia as despesas do mandato, como passagens aéreas e conta de celular. Algumas são reembolsadas, como as com os Correios, e outras são pagas por débito automático, como a compra de passagens. Nos casos de reembolso, os deputados têm três meses para apresentar os recibos. O valor mensal não utilizado fica acumulado ao longo do ano. Por esse motivo, em alguns meses o valor gasto pode ser maior que a média mensal. (Fonte: [Portal da Câmara dos Deputados](https://www2.camara.leg.br/transparencia/acesso-a-informacao/copy_of_perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar)). Através do portal da transparência, nós temos acesso a essas despesas e podemos saber como e onde os políticos estão gastando.

## Base de dados e explicações complementares

- [Fonte de dados (pegar o referente ao ano 2020 em formato CSV)](https://dadosabertos.camara.leg.br/swagger/api.html#staticfile)
- [Explicação dos campos do arquivo CSV](https://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/explicacoes-sobre-o-formato-dos-arquivos-xml)
- Ignorar linhas que não tenham no campo `sgUF` o estado que você mora. O objetivo do trabalho é focar apenas no seu estado;
- Considerar para fins de cálculos de despesa, o campo `vlrLiquido`. Esse é o valor que de fato foi debitado da cota do candidato;
- Dica para pegar a foto do político: **http://www.camara.leg.br/internet/deputado/bandep/{ideCadastro}.jpg**


## Requisitos Obrigatórios
- Possibilitar o upload do arquivo;
- Organizar os dados extraidos do arquivo em tabelas no banco de dados;
- Listagem dos deputados do seu estado;
- Mostrar o somatório dos seus gastos;
- Listar as despesas, mostrando a data(`datEmissao`), estabelecimento(`txtFornecedor`), valor(`vlrLiquido`), e link para a nota(`urlDocumento`);
- Destacar a maior despesa do candidato;
- Usar o framework Rails (utilize esse repositório como base);
- Ter uma cobertura de código;

# Requisitos bônus
Esses requisitos não são obrigatórios, mas serão levados em consideração como pontos extras no momento da avaliação.

- Exibir gráficos para melhorar a visualização dos gastos;
- Aplicação hospedada no Heroku, AWS ou similares;
- Evitar N + 1 nas queries;
- Organizar estrutura do projeto utilizando padrões de projetos;

# Critérios de avaliação

- Organização do projeto: Avalia a estrutura do projeto, documentação e uso de controle de versão;
- Coerência: Avalia se os requisitos foram atendidos;
- Boas práticas: Avalia se o projeto segue boas práticas de desenvolvimento, incluindo segurança e otimização;
- Criatividade: Avalia o quanto você "pensou fora da caixa", levando em conta soluções criativas para os problemas levantados;

### Instalação

A aplicação pode ser testada por meio do Docker:
- docker-compose up
Caso ocorra algum erro de permissão basta executar: sudo chown -R $USER:$USER .

### Criando o banco de dados
- docker-compose run web rake db:create
- docker-compose run web rake db:migrate
- docker-compose run web rake db:seed && docker-compose run web rake db:seed RAILS_ENV=test

Após, abra o navegador e acesse __localhost:3000__.

### Testando
- Para rodar os testes utilize o `docker-compose run web rspec`.
