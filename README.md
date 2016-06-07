# ACME

## Enunciado do problema:
Desenvolver um sistema de vendas de passagens aéreas da companhia ACME.
O sistema deve prover telas para a pesquisa de vôos em datas determinadas, seleção do vôo escolhido e aquisição de passagens.

A aquisição de uma passagem implica na identificação do passageiro (nome) e do documento que será usado na hora do embarque (RG, CPF ou passaporte para vôos nacionais e passaporte para vôos internacionais).
Toda a aquisição de passagem implica na geração de um “número localizador”.

A companhia ACME só permite a escolha do assento no momento do “check­in”.
Check­in de cada vôo abre 72 horas antes do vôo.
O sistema deve apresentar uma tela de check­in que permite o acesso ao vôo a partir do número localizador.
Para realizar o check­in o usuário deverá fazer a reserva do assento. Esta tela deve, obrigatoriamente, apresentar o mapa de assentos.

A fim de simular corretamente as situações das reservas, deve ser possível alterar manualmente a data do sistema.

O sistema deve disponibilizar uma tela que permite consultar as passagens adquiridas a partir do número localizador.
Junto com os dados da passagem deve ser informado o “status” da passagem:

*  Pendente (passagem adquirida para vôo futuro)
* Check­in aberto (passagem adquirida para vôo que já está com check­in aberto)
* Check­in ok (passagem adquirida e checkin feito)
* Utilizada (check­in feito e data do vôo passada)
* Não usada (passageiro adquiriu a passagem e não fez check­in – vôo já ocorreu)

Todos os acessos ao sistema são feitos mediante identificação de usuário e senha.

No momento da aquisição das passagens podem ser oferecidas promoções para o comprador.
Estas promoções podem variar conforme a quantidade de passagens já adquiridas ou qualquer outro critério.
Novos tipos de promoções podem ser criados a qualquer momento.

Não existe a necessidade de criar telas de cadastramento de rotas, vôos, aeronaves, dados de usuário etc.
Estas informações devem ser previamente carregadas no banco de dados, a partir dos dados presentes na pasta dat do projeto.

## Base de dados:

O sistema deve fazer uso de uma base de dados externa, ou seja, não embutida, de modo a disponibilizar o requisito cliente­servidor do sistema e a possibilidade de acesso concorrente.
O banco deve ser previamente carregado com pelo menos 100 usuários diferentes. 
Também devem ter sido previamente carregados pelo menos 300 vôos para no mínimo 5 localidades diferentes (com por exemplo, 3 frequências diárias).
Deve haver reservas para pelo menos 60% dos vôos cadastrados e pelo menos um dos vôos deve estar com 95% de ocupação.
Deve ser utilizado um banco de dados relacional e deve ser usada uma estratégia otimista de acesso a dados para as telas de compra de passagens e reserva de assentos.

## Requisitos:

Os seguintes itens são obrigatórios na implementação do sistema:

* Arquitetura multicamada (pelo menos 3).
* Interface gráfica.
* Uso dos padrões de projeto explorados em sala de aula, sendo obrigatoriamente:
* Uso do padrão “MVC” na camada de interface gráfica.
* Uso do padrão “Facade” para isolar a camada de domínio da camada de
interface.
* Uso do padrão arquitetural “Domain Model” na camada de domínio; o Uso do padrão “DAO” na camada de persistência.
* Implementação em Java.
* Tratamento correto do encapsulamento de exceções entre as camadas.
