algoritmo "CalculadoraEletrica"
var
   opcao: inteiro
   V, C, R, P: real
   Cores: vetor[0..9] de caractere

// Procedimento que recebe a resistencia calculada e exibe o
// codigo de cores correspondente, no padrao de 4 faixas:
//   1a faixa -> 1o digito significativo
//   2a faixa -> 2o digito significativo
//   3a faixa -> multiplicador (potencia de 10)
//   4a faixa -> tolerancia (fixada em Dourado = 5%, a mais comum)

procedimento MostrarCodigoCores(Rcalc: real)
   var
      valor: real
      mult, d1, d2: inteiro
   inicio
      se (Rcalc <= 0) entao
         escreval("Nao e possivel gerar o codigo de cores para esse valor.")
      senao
         valor <- Rcalc
         mult <- 0

         // normaliza para um numero de 2 digitos (entre 10 e 99)
         enquanto (valor >= 100) faca
            valor <- valor / 10
            mult <- mult + 1
         fimenquanto

         enquanto (valor < 10) faca
            valor <- valor * 10
            mult <- mult - 1
         fimenquanto

         valor <- int(valor + 0.5)  // arredonda para o inteiro mais proximo

         // ajusta caso arredonde para 100 (ex: 99.6 -> 100)
         se (valor >= 100) entao
            valor <- valor / 10
            mult <- mult + 1
         fimse

         d1 <- int(valor / 10)
         d2 <- int(valor) - (d1 * 10)

         escreval("")
         escreval("--- CODIGO DE CORES (4 FAIXAS) ---")
         escreval("1a faixa (", d1, "): ", Cores[d1])
         escreval("2a faixa (", d2, "): ", Cores[d2])

         se (mult >= 0) e (mult <= 9) entao
            escreval("3a faixa - multiplicador (x10^", mult, "): ", Cores[mult])
         senao
            se (mult = -1) entao
               escreval("3a faixa - multiplicador (x0.1): Dourado")
            senao
               se (mult = -2) entao
                  escreval("3a faixa - multiplicador (x0.01): Prata")
               senao
                  escreval("3a faixa - multiplicador fora da faixa padrao de cores!")
               fimse
            fimse
         fimse

         escreval("4a faixa - tolerancia: Dourado (5%)")
      fimse
   fimprocedimento

// CASO 1 - Calculo da TENSAO
// Usa a Lei de Ohm: V = R x C

procedimento CalcularTensao()
   inicio
      escreval("Calculo da TENSAO (V = R x C)")
      escreva("Digite a Resistencia (ohms): ")
      leia(R)
      escreva("Digite a Corrente (amperes): ")
      leia(C)
      V <- R * C
      escreval("A Tensao e: ", V, " V")
   fimprocedimento

// CASO 2 - Calculo da CORRENTE
// Usa a Lei de Ohm: C = V / R

procedimento CalcularCorrente()
   inicio
      escreval("Calculo da CORRENTE (C = V / R)")
      escreva("Digite a Tensao (volts): ")
      leia(V)
      escreva("Digite a Resistencia (ohms): ")
      leia(R)
      se (R = 0) entao
         escreval("Erro: Resistencia nao pode ser zero!")
      senao
         C <- V / R
         escreval("A Corrente e: ", C, " A")
      fimse
   fimprocedimento

// CASO 3 - Calculo da RESISTENCIA
// Usa a Lei de Ohm: R = V / C

procedimento CalcularResistencia()
   inicio
      escreval("Calculo da RESISTENCIA (R = V / C)")
      escreva("Digite a Tensao (volts): ")
      leia(V)
      escreva("Digite a Corrente (amperes): ")
      leia(C)
      se (C = 0) entao
         escreval("Erro: Corrente nao pode ser zero!")
      senao
         R <- V / C
         escreval("A Resistencia calculada e: ", R, " ohms")

         // mostra o codigo de cores de 4 faixas
         MostrarCodigoCores(R)
      fimse
   fimprocedimento

// CASO 4 - Calculo da POTENCIA
// Formula: P = V x C

procedimento CalcularPotencia()
   inicio
      escreval("Calculo da POTENCIA (P = V x C)")
      escreva("Digite a Tensao (volts): ")
      leia(V)
      escreva("Digite a Corrente (amperes): ")
      leia(C)
      P <- V * C
      escreval("A Potencia e: ", P, " W")
   fimprocedimento

// Procedimento responsavel apenas por exibir o menu principal

procedimento MostrarMenu()
   inicio
      escreval("=== CALCULADORA DE GRANDEZAS ELETRICAS ===")
      escreval("")
      escreval("O que voce deseja calcular?")
      escreval("1 - Tensao (V)")
      escreval("2 - Corrente (C)")
      escreval("3 - Resistencia (R)")
      escreval("4 - Potencia (P)")
      escreval("5 - Sair")
      escreva("Escolha uma opcao: ")
   fimprocedimento

inicio
   // nomes das cores conforme o digito (0 a 9)
   Cores[0] <- "Preto"
   Cores[1] <- "Marrom"
   Cores[2] <- "Vermelho"
   Cores[3] <- "Laranja"
   Cores[4] <- "Amarelo"
   Cores[5] <- "Verde"
   Cores[6] <- "Azul"
   Cores[7] <- "Violeta"
   Cores[8] <- "Cinza"
   Cores[9] <- "Branco"

   // LAÇO PRINCIPAL
   // Repete o menu atÉ o usuÁrio escolher a opção 5 (Sair).
   
   repita
      MostrarMenu()
      leia(opcao)
      escreval("")

      escolha opcao

         caso 1
            CalcularTensao()

         caso 2
            CalcularCorrente()

         caso 3
            CalcularResistencia()

         caso 4
            CalcularPotencia()

         caso 5
            escreval("Encerrando o programa. Ate mais!")

         outrocaso
            escreval("Opcao invalida!")

      fimescolha

      escreval("")

   ate opcao = 5

fimalgoritmo
