# Ranking dos gastos dos Deputados

## Descrição do desafio

Você já ouviu falar da CEAP? A Cota para o Exercício da Atividade Parlamentar, custeia as despesas do mandato, como passagens aéreas e conta de celular. Algumas são reembolsadas, como as com os Correios, e outras são pagas por débito automático, como a compra de passagens. Nos casos de reembolso, os deputados têm três meses para apresentar os recibos. O valor mensal não utilizado fica acumulado ao longo do ano. Por esse motivo, em alguns meses o valor gasto pode ser maior que a média mensal. (Fonte: [Portal da Câmara dos Deputados](https://www2.camara.leg.br/transparencia/acesso-a-informacao/copy_of_perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar)). Através do portal da transparência, nós temos acesso a essas despesas e podemos saber como e onde os políticos estão gastando.

## Base de dados e explicações complementares

- [Fonte de dados (pegar o referente ao ano 2020 em formato CSV)](https://dadosabertos.camara.leg.br/swagger/api.html#staticfile)
- [Explicação dos campos do arquivo CSV](https://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/explicacoes-sobre-o-formato-dos-arquivos-xml)

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
- Para rodar os testes utilize o comando `docker-compose run web rspec`.
