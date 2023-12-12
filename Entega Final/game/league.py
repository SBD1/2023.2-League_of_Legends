import psycopg2
import random


def conectar_banco():
    try:
        conn = psycopg2.connect(
            database ="League_of_legends",
            user ="seu_usuario_criado",
            password ="sua_sennha_criada",
            host ="localhost",
            port ="5432"
        )



        return conn
    except psycopg2.Error as e:
        print("Erro ao conectar ao banco de dados:", e)
        return None
    

def criar_novo_personagem(conn):
    cursor = conn.cursor()
    
    print("Criando um novo personagem:")
    id = int(input("Digite o ID do personagem: "))
    nome = input("Digite o nome do personagem: ")
    especie = input("Digite a espécie do personagem: ")
    classe = input("Digite a classe do personagem: ")
    vida = int(input("Digite a quantidade de vida do personagem: "))
    nivel = int(input("Digite o nível do personagem: "))
    energia = int(input("Digite a quantidade de energia do personagem: "))
    dano = int(input("Digite o dano do personagem: "))
    forca = int(input("Digite a força do personagem: "))
    cura = int(input("Digite a cura do personagem: "))
    historia = input("Digite a história do personagem: ")
    
    try:
        cursor.execute("INSERT INTO Personagem (id_personagem, nome_personagem, especie, classe, vida, nivel, energia, dano, forca, cura, historia) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                       (id, nome, especie, classe, vida, nivel, energia, dano, forca, cura, historia))
        conn.commit()
        print("Novo personagem criado com sucesso!")
    except psycopg2.Error as e:
        conn.rollback()
        print("Erro ao criar o novo personagem:", e)


def carregar_personagem_existente(conn):
    cursor = conn.cursor()
    
    print("Carregando um personagem existente:")
    id_personagem = input("Digite o ID do personagem que deseja carregar: ")
    cursor.execute("SELECT * FROM Personagem WHERE id_personagem = %s", (id_personagem,))
    personagem = cursor.fetchone()
    if personagem:
        print("\nPersonagem carregado com sucesso!")
        print(f"Informações do personagem:")
        print(f"Nome: {personagem[1]}")
        print(f"Espécie: {personagem[2]}")
        print(f"Classe: {personagem[3]}")

        return id_personagem
    else:
        print("Personagem não encontrado.")
        return None


def exibir_info_personagem(conn, id_personagem):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Personagem WHERE id_personagem = %s", (id_personagem,))
    personagem = cursor.fetchone()
    if personagem:
        print("Informações do personagem:")
        print(f"Nome: {personagem[1]}")
        print(f"Espécie: {personagem[2]}")
        print(f"Classe: {personagem[3]}")
        print(f"Vida: {personagem[4]}")
        print(f"Nível: {personagem[5]}")
        print(f"Energia: {personagem[6]}")
        print(f"Dano: {personagem[7]}")
        print(f"Força: {personagem[8]}")
        print(f"Cura: {personagem[9]}")
        print(f"História: {personagem[10]}")
    else:
        print("Personagem não encontrado!")


def obter_detalhes_personagem(conn, id_personagem):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Personagem WHERE id_personagem = %s", (id_personagem,))
    personagem = cursor.fetchone()
    return personagem 



def realizar_batalha(monstro, vida_jogador, vida_monstro):
    print(f"Nome do monstro: {monstro[1]}")
    print(f"Espécie: {monstro[2]}")
    print(f"Classe: {monstro[3]}")
    print(f"Vida do jogador: {vida_jogador}")
    print(f"Vida do monstro: {vida_monstro}\n")

    while vida_jogador > 0 and vida_monstro > 0:

        ataque_jogador = random.randint(1, 70)
        ataque_monstro = random.randint(1, 70)

        vida_jogador -= ataque_monstro
        vida_monstro -= ataque_jogador

        print(f"Você atacou o monstro causando {ataque_jogador} de dano.")
        print(f"O monstro atacou você causando {ataque_monstro} de dano.")
        print(f"Sua vida: {vida_jogador}")
        print(f"Vida do monstro: {vida_monstro}\n")

        escolha = input("Digite 1 para continuar para a próxima etapa ou 2 para desistir do combate: ")

        if escolha == "2":
            return False 

    return vida_jogador > 0


def listar_personagens_predefinidos(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Personagem WHERE id_personagem BETWEEN 10 AND 50 ORDER BY id_personagem")
    personagens = cursor.fetchall()
    
    print("\nPersonagens disponíveis para seleção:")
    for personagem in personagens:
        print(f"{personagem[0]}. {personagem[1]} - Espécie: {personagem[2]}, Classe: {personagem[3]}")
    
    escolha = int(input("Escolha o ID do personagem para a batalha: "))
    if escolha in [10, 20, 30, 40, 50]:
        return escolha
    else:
        print("Escolha inválida.")
        return None

 
def escolher_personagem_predefinido(conn):
    id_personagem_jogador = None
    while id_personagem_jogador is None:
        id_personagem_jogador = listar_personagens_predefinidos(conn)
    return id_personagem_jogador


def entrar_loja(conn, id_personagem):
    while True:
        print("\nBem-vindo à Loja!")
        print("Escolha uma opção:")
        print("1. Comprar itens de Tank")
        print("2. Comprar itens de Mago")
        print("3. Comprar itens de Lutador")
        print("4. Voltar para a escolha de rotas")

        escolha = input("Escolha uma opção da loja: ")

        if escolha == "1":
            comprar_item(conn, id_personagem, "Itens_de_Tank")
        elif escolha == "2":
            comprar_item(conn, id_personagem, "Itens_de_mago")
        elif escolha == "3":
            comprar_item(conn, id_personagem, "Itens_de_lutador")
        elif escolha == "4":
            print("Voltando para a escolha de rotas...")
            break
        else:
            print("Opção inválida. Tente novamente.")


def comprar_item(conn, id_personagem, tipo_item):
    cursor = conn.cursor()

    cursor.execute(f"SELECT * FROM {tipo_item}")
    itens = cursor.fetchall()

    print("\nItens disponíveis para compra:")
    for item in itens:
        print(f"{item[0]}. {item[1]} - Preço: {item[2]}, Atributo Adicional: {item[3]}")

    escolha_item = input("Escolha o número do item que deseja comprar (ou 'voltar'): ")

    if escolha_item.lower() == "voltar":
        return

    try:
        escolha_item = int(escolha_item)
        item_escolhido = next(item for item in itens if item[0] == escolha_item)

        preco_item = item_escolhido[2]
        atributo_adicional = item_escolhido[3]

        cursor.execute("SELECT energia, dano FROM Personagem WHERE id_personagem = %s", (id_personagem,))
        dados_personagem = cursor.fetchone()
        energia_atual = dados_personagem[0]
        dano_jogador = dados_personagem[1]

        if energia_atual >= preco_item:
            energia_restante = energia_atual - preco_item
            dano_item_fixo = atributo_adicional

            if tipo_item == "Itens_de_mago" or tipo_item == "Itens_de_lutador":
                dano_adicional_randomico = random.randint(1, item_escolhido[4])
                dano_item_total = dano_item_fixo + dano_adicional_randomico
                print(f"Quantidade fixa de dano do jogador após a compra: {dano_item_fixo}")
                print(f"Quantidade de dano randômico possível de obter: {dano_adicional_randomico}")
            else:
                vida_adicional = random.randint(1, item_escolhido[4])
                dano_item_total = vida_adicional
                print(f"Quantidade de cura adicional: {vida_adicional}")

            cursor.execute(f"UPDATE Personagem SET energia = %s, dano = dano + %s WHERE id_personagem = %s",
                           (energia_restante, dano_item_total, id_personagem))

            conn.commit()
            print("Item comprado com sucesso!")
        else:
            print("Você não possui energia suficiente para comprar este item.")

    except ValueError:
        print("Escolha inválida. Tente novamente.")
    except StopIteration:
        print("Item não encontrado.")


def escolher_monstro_para_batalha(conn, id_personagem, id_monstro_rota):
    cursor = conn.cursor()

    monstros_ids = [100, 200, 300, 400, 500]
    id_monstro = random.choice(monstros_ids)

    cursor.execute("SELECT * FROM Personagem WHERE id_personagem = %s", (id_monstro,))
    monstro = cursor.fetchone()

    if monstro:
        print(f"Você encontrou {monstro[1]} no seu caminho, {monstro[10]} \nDerrote-o para continuar ou fuja!")

        vida_monstro = monstro[4]
        personagem_jogador = obter_detalhes_personagem(conn, id_personagem)

        vida_jogador = personagem_jogador[4]

        vitoria_jogador = realizar_batalha(monstro, vida_jogador, vida_monstro)

        if not vitoria_jogador:
            print("Você desistiu do combate ou foi derrotado!")
        else:
            print("\nVocê venceu a batalha! O que deseja fazer agora?")
            print("1 - Prosseguir para a batalha final pelo Nexus")
            print("2 - Sair")
            escolha_final = input("Escolha uma opção: ")

            if escolha_final == "1":
                batalha_final(conn, id_personagem)
                print("Obrigado por jogar! Até mais!")
                exit()
                
            elif escolha_final == "2":
                print("Obrigado por jogar! Até mais!")
                exit()
                
                
            else:
                print("Escolha inválida. Tente novamente.")

def batalha_final(conn, id_personagem):
    cursor = conn.cursor()

    monstros_ids = [100, 200, 300, 400, 500]
    id_monstro_final = random.choice(monstros_ids)

    cursor.execute("SELECT * FROM Personagem WHERE id_personagem = %s", (id_monstro_final,))
    monstro_final = cursor.fetchone()

    if monstro_final:
        print(f"Prepare-se para a batalha final contra {monstro_final[1]}, {monstro_final[10]}!\n")
        vida_monstro_final = monstro_final[4]
        personagem_jogador = obter_detalhes_personagem(conn, id_personagem)
        vida_jogador = personagem_jogador[4]

        vitoria_jogador = realizar_batalha(monstro_final, vida_jogador, vida_monstro_final)

        if not vitoria_jogador:
            print("Você foi derrotado na batalha final!")
        else:
           print("Parabéns! Você venceu a batalha final e conquistou o Nexus, agora você é detentor de um dos Cristais mais poderosos de toda Runeterra, use-o com sabedoria. FIM!")
            
          

def jogo():
    conn = conectar_banco()
    if conn:
        print("Bem-vindo ao jogo League of Legends - Terminal Edition!")
        print("\nSummoner's Rift está localizado em uma remota floresta entre Freljord e as Montanhas Ironspine. Summoner's Rift é um dos poucos locais em Valoran onde a energia mágica está em sua maior concentração, fazendo com que seja muito procurado para buscar esforços mágicos. A energia mágica é tão grande que transformou a vida selvagem local. De sapos gigantes à lobos com duas cabeças, bem como a residência de espécies como camaleões, patos coelhos com chifres e borboletas. Este lugar também atraiu a presença de um Dragão. O Rift é surpreendido pelo ressurgimento do Barão Na'Shor, uma grande Serpente/Minhoca que grande parte acreditava estar morta há séculos. Ele tem a sua corrupção afetando a terra em volta dele")
        id_personagem = None
        id_monstro_rota = None

        while True:
            print("\nEscolha uma ação:")
            if id_personagem:
                print("1. Ver informações do personagem")
                print("2. Avançar pela rota superior")
                print("3. Avançar pela rota inferior")
                print("4. Avançar pela rota do meio")
                print("5. Entrar na loja para comprar itens")
                print("6. Sair")
            else:
                print("1. Criar novo personagem")
                print("2. Carregar um personagem existente")
                print("3. Escolher um personagem disponível para a batalha")
                print("4. Sair")
            
            escolha = input("Escolha uma opção: ")
            
            if id_personagem:
                if escolha == "1":
                    exibir_info_personagem(conn, id_personagem)
                elif escolha == "2":
                    print("Avançando pela rota superior...")
                    print("Quando a escuridão abraça Summoner's Rift, o cenário majestoso da rota superior revela-se como um campo de batalha impiedoso, onde os guerreiros mais resistentes e destemidos se encontram.")
                    id_monstro_rota = escolher_monstro_para_batalha(conn, id_personagem, id_monstro_rota)
                elif escolha == "3":
                    print("Avançando pela rota inferior...")
                    print("A rota inferior permanece como um cenário dinâmico, palco de incontáveis contendas, onde cada embate contribui para a epopeia que é Summoner's Rift. No coração deste campo de batalha, a história continua a se desenrolar, aguardando os próximos heróis que ousarão deixar sua marca neste reino de desafios e glória.")
                    id_monstro_rota = escolher_monstro_para_batalha(conn, id_personagem, id_monstro_rota)
                elif escolha == "4":
                    print("Avançando pela rota do meio...")
                    print("Ao entardecer, quando a luminosidade do dia se dissipa e dá lugar ao crepúsculo, a rota do meio emerge como o epicentro de estratégia e confronto em Summoner's Rift.")
                    id_monstro_rota = escolher_monstro_para_batalha(conn, id_personagem, id_monstro_rota)
                elif escolha == "5":
                    print("Entrando na loja para comprar itens...")
                    print("Escolha o tipo de item para comprar:")
                    print("1. Itens de Tank")
                    print("2. Itens de Mago")
                    print("3. Itens de Lutador")
                    escolha_tipo_item = input("Escolha um tipo de item: ")

                    if escolha_tipo_item == "1":
                        comprar_item(conn, id_personagem, "Itens_de_Tank")
                    elif escolha_tipo_item == "2":
                        comprar_item(conn, id_personagem, "Itens_de_mago")
                    elif escolha_tipo_item == "3":
                        comprar_item(conn, id_personagem, "Itens_de_lutador")
                    else:
                        print("Opção inválida. Voltando ao menu principal.")
                elif escolha == "6":
                    print("Obrigado por jogar! Até mais!")
                    break
                else:
                    print("Escolha inválida. Tente novamente.")
            else:
                if escolha == "1":
                    criar_novo_personagem(conn)
                elif escolha == "2":
                    id_personagem = carregar_personagem_existente(conn)
                elif escolha == "3":
                    id_personagem = escolher_personagem_predefinido(conn)
                elif escolha == "4":
                    print("Obrigado por jogar! Até mais!")
                    break
                else:
                    print("Escolha inválida. Tente novamente.")
        
        conn.close()

if __name__ == "__main__":
    jogo()
