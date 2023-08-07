# desafio v1 refeito com uso de funções 

def depositar(valor, saldo, extrato, /):
   if valor > 0:
                saldo += valor
                extrato += f"{date.today()}  Depósito: R$ {valor:.2f}\n"
                print(f"Depósito de R$ {valor:.2f} realizado com sucesso")
                return saldo, extrato
   else:
                print("Operação falhou! O valor informado é inválido.")
   return saldo, extrato

def sacar(*,valor, saldo, numero_saques, extrato):
     
    excedeu_saldo = valor > saldo

    excedeu_limite = valor > LIMITE

    excedeu_saques = numero_saques >= LIMITE_SAQUES

    if excedeu_saldo or excedeu_limite or excedeu_saques:

            print("\nOperação falhou!")
            if excedeu_saldo:
                print(f"Você não tem saldo suficiente. Seu saldo atual é de R$ {saldo:.2f}") 
            if excedeu_limite: 
                print("O valor do saque excede o limite.") 
            if excedeu_saques:
                print("Número máximo de saques diários excedido.")

    
    elif valor > 0:
        saldo -= valor
        extrato += f"{date.today()}  Saque:    R$ {valor:.2f}\n"
        print(f"Saque de R$ {valor:.2f} realizado com sucesso")
        numero_saques += 1

    else:
        print("Operação falhou! O valor informado é inválido.")
    return saldo, extrato,  numero_saques

def imprimir_extrato (saldo, /, *, extrato):
      print("\n================ EXTRATO ================")
      print("Não foram realizadas movimentações." if not extrato else extrato)
      print(f"\nSaldo: R$ {saldo:.2f}")
      print("==========================================")

def cadastrar_novo_cliente (cadastro_clientes, nome, data_nascimento, cpf, endereco):
     if  len(cadastro_clientes) == 0:
                novo_cliente = [nome, data_nascimento, cpf, endereco] 
                cadastro_clientes.append(novo_cliente)
                print("Seu cadastro foi efetuado com sucesso")
     else:
         for i in range(len(cadastro_clientes)):
            if cpf == cadastro_clientes[i][2]:
                print("Você já possui cadastro conosco. Não é possível cadastrá-lo(a) novamente")
            else:
                novo_cliente = [nome, data_nascimento, cpf, endereco] 
                cadastro_clientes.append(novo_cliente)
                print("Seu cadastro foi efetuado com sucesso") 
     return cadastro_clientes 

def cadastrar_nova_conta(cadastro_contas_correntes, cpf):
     nova_conta = ["0001", len(cadastro_contas_correntes)+1, cpf ]
     cadastro_contas_correntes.append(nova_conta)
     print(f"Sua nova conta de número {nova_conta[1]} na agência {nova_conta[0]} foi criada com sucesso")
     return cadastro_contas_correntes




     
     
      

menu = """

Favor digitar o número correspondente a operação que pretende realizar

[1] Depositar
[2] Sacar
[3] Extrato
[4] Cadastrar Novo Cliente
[5] Criar conta corrente
[6] Sair

=> """

from datetime import date

data_atual = date.today()
saldo = 0
LIMITE = 500
LIMITE_SAQUES = 3
extrato = ""
numero_saques = 0
cadastro_clientes = []
cadastro_contas_correntes = []



while True:
    

    if data_atual == date.today():

        opcao = input(menu)

        if opcao == "1":
            valor = float(input("Informe o valor do depósito: "))
            saldo, extrato = depositar(valor, saldo, extrato)        

        elif opcao == "2":
            valor = float(input("Informe o valor do saque: "))   
            saldo, extrato,  numero_saques = sacar(valor=valor, saldo=saldo, numero_saques=numero_saques, extrato=extrato)           
       
        elif opcao == "3":
            imprimir_extrato(saldo, extrato=extrato) 

        elif opcao == "4":
              nome = input("Informe o seu nome completo: ") 
              data_nascimento =  input("Informe a sua data de nascimento no formato DD/MM/AAAA: ") 
              cpf =   input("Informe os onze números do seu cpf (formato 44444444444): ") 
              logradouro =  input("De modo a cadastramos seu endereço, comece informando o seu logradouro de residência: ") 
              n_logradouro =  input("Informe o número de sua residência no logradouro: ")  
              bairro =  input("Informe o bairro onde reside: ")
              cidade = input("Informe a cidade onde reside: ")   
              estado = input("Informe a sigla do Estado onde reside: ")
              endereco = f"{logradouro}, {n_logradouro} - {bairro} - {cidade}/{estado}"
              cadastro_clientes = cadastrar_novo_cliente(cadastro_clientes, nome, data_nascimento, cpf, endereco)

        elif opcao == "5":
             info = input("Informe se já possui cadastro de cliente conosco - S ou N: ")
             if info == "N":
                  print("Favor efetuar primeiramente a operação Cadastrar Novo Cliente")
             else: #assumindo que não há erros de digitação/informação
                  cpf == input("Informe os onze números do seu cpf (formato 44444444444): ")
                  cadastro_contas_correntes = cadastrar_nova_conta(cadastro_contas_correntes, cpf)
                  


        elif opcao == "6":
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



