# NationalDex

NationalDex é uma Pokedex que utiliza a PokéApi

![](https://github.com/VitoRicardo/Documentation-Resources/blob/main/NationalDex/NationalDex%20Gif.gif)

## Resumo & Motivos

Esse projeto foi criado com o intuito de desenvolver meus conhecimentos em Flutter, tendo em vista que a criação de Pokedex são comumente utilizadas
para aprender a trabalhar com APIs, além disso decide usar padrão BLoC para gerência de estado:
  - Compreensão da estrutura padrão de uma API
  - Conversão dos dados fornecidos pela API para uma estrutura Mapeável
  - Implementação do Padrão BLoC sem auxilio de bibliotecas
  - Implementação de Imagens em Cache

## Tecnologias Utilizadas 

**Gerencia de Estado do próprio Flutter seguindo padrão BLoC:**
  - Apesar do Flutter possuir excelentes pacotes que auxiliem na implementação do padrão BLoC foi escolhido apenas seguir seu padrão de implementação,
    tendo em vista que essa gerência de estado pode ser feita apenas com componentes nativos do flutter, portanto é necessário conhecer a lógica por
    trás desse padrão antes de utilizar qualquer biblioteca que o implemente.
    
**Utilização do Pacote Dio:**
  - O pacote utilizado para obter os dados da API foi o pacote [DIO](https://pub.dev/packages/dio), tendo em vista sua ampla utilização pela comunidade
    e sua fácil utilização.


    

  
