menu = """

Favor digitar o número correspondente a operação que pretende realizar

[1] Depositar
[2] Sacar
[3] Extrato
[4] Sair

=> """

from datetime import date

data_atual = date.today()
saldo = 0
LIMITE = 500
LIMITE_SAQUES = 3
extrato = ""
numero_saques = 0



while True:
    

    if data_atual == date.today():

        opcao = input(menu)

        if opcao == "1":
            valor = float(input("Informe o valor do depósito: "))

            if valor > 0:
                saldo += valor
                extrato += f"{date.today()}  Depósito: R$ {valor:.2f}\n"
                print(f"Depósito de R$ {valor:.2f} realizado com sucesso")

            else:
                print("Operação falhou! O valor informado é inválido.")

        elif opcao == "2":
           
            valor = float(input("Informe o valor do saque: "))

            excedeu_saldo = valor > saldo

            excedeu_limite = valor > LIMITE

            excedeu_saques = numero_saques >= LIMITE_SAQUES

            if excedeu_saldo or excedeu_limite or excedeu_saques:

                    print("\nOperação falhou!")
                    if excedeu_saldo:
                        print("Você não tem saldo suficiente.") 
                    if excedeu_limite: 
                        print("O valor do saque excede o limite.") 
                    if excedeu_saques:
                        print("Número máximo de saques excedido.")

            
            elif valor > 0:
                saldo -= valor
                extrato += f"{date.today()}  Saque:    R$ {valor:.2f}\n"
                print(f"Saque de R$ {valor:.2f} realizado com sucesso")
                numero_saques += 1

            else:
                print("Operação falhou! O valor informado é inválido.")

        elif opcao == "3":
            print("\n================ EXTRATO ================")
            print("Não foram realizadas movimentações." if not extrato else extrato)
            print(f"\nSaldo: R$ {saldo:.2f}")
            print("==========================================")

        elif opcao == "4":
            print("\nObrigado por utilizar nossos serviços. Até breve.\n")
            continue

        elif opcao == "328y":
            # opcao não conhecida pelo usuário para parada/manutencao do sistema
            break

        else:
            print("Operação inválida, por favor selecione novamente a operação desejada.")
   
    else:
        data_atual = date.today()
        numero_saques = 0



