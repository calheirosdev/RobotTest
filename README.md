# Desafio técnico – Analista de Testes
Nome(autor): Thiago Calheiros de Lima

# Sobre o Projeto
Criar um projeto em robot e cucumber usando Page objects (precisamos executar o script através da feature);

Ø Passo a passo para o teste automático:

1- Entrar no site http://sampleapp.tricentis.com/101/app.php

2- Preencher o formulário, aba “Enter Vehicle Data” e pressione next

3- Preencher o formulário, aba “Enter Insurant Data” e pressione next

4- Preencher o formulário, aba “Enter Product Data” e pressione next

5- Preencher o formulário, aba “Select Price Option” e pressione next

6- Preencher o formulário, aba “Send Quote” e pressione Send

7- Verificar a mensagem “Sending e-mail success!” na tela

Ø Disponibilizar o projeto no repositório GIT e enviar o caminho para cacordeiro@ccee.org.br

# Observações
Utilizei a súite de teste do Robot com a feature automobile_insurance com a linguagem Gherkin BDD, realizar a integração do cucumber(o framework) não é usual e possuem propostas diferentes como por exemplo https://medium.com/@ikurtulan97/cucumber-vs-robot-framework-a43e68408dcf

Tive o entendimento e realizei o desafio pensando em Robot + PageObjects + BDD

# O Page Objects
A pasta de páginas contém os localizadores e as funções que são chamadas pelos casos de teste (na pasta tests)
pages/ contém funcionalidades comuns usadas por outros objetos de página, não foi preciso criar uma utils visando que tenho uma só feature.
resources.robot é usado para abrir o http://sampleapp.tricentis.com/101/app.php e maximizar a janela do navegador
# Tests
O Projeto consiste na feature automobile_insurance
 O Cenário criado é deacordo com os passos do teste.

Para rodar use o comando "robot -d results tests"
Adicionei o video TestVideo da execução.

# Report
A pasta results contém o  report.html que mostra os resultados das ultimas execuções.
