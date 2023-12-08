import psycopg2
import random


def conectar_banco():
    try:
        conn = psycopg2.connect(
            database ="League_of_legends",
            user ="bruno",
            password ="admin444",
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

def realizar_batalha(personagem_jogador, vida_jogador, vida_monstro):
    print(f"Nome do monstro: {personagem_jogador[1]}")
    print(f"Espécie: {personagem_jogador[2]}")
    print(f"Classe: {personagem_jogador[3]}")
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
            return False e
        
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


def escolher_monstro_para_batalha(conn):
    cursor = conn.cursor()
    
    monstros_ids = [100, 200, 300, 400, 500]
    id_monstro = random.choice(monstros_ids)
    
    cursor.execute("SELECT * FROM Personagem WHERE id_personagem = %s", (id_monstro,))
    monstro = cursor.fetchone()
    

    if monstro:
        print("\nVocê encontrou um oponente!")
        
        vida_monstro = monstro[4]
        personagem_jogador = obter_detalhes_personagem(conn, id_monstro)
       
 
        vida_jogador = personagem_jogador[4]
  
        vitoria_jogador = realizar_batalha(personagem_jogador, vida_jogador, vida_monstro)
        

        if not vitoria_jogador:
            print("Você desistiu do combate ou foi derrotado!")
        else:
            print("Você venceu a batalha!")
    else:
        print("Não foi possível encontrar um monstro para a batalha.")

def jogo():
    conn = conectar_banco()
    if conn:
        print("Bem-vindo ao jogo League of Legends - Terminal Edition!")
        id_personagem = None
        
        while True:
            print("\nEscolha uma ação:")
            if id_personagem:
                print("1. Ver informações do personagem")
                print("2. Avançar pela rota superior")
                print("3. Avançar pela rota inferior")
                print("4. Avançar pela rota do meio")
                print("5. Sair")
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
                    escolher_monstro_para_batalha(conn)
                elif escolha == "3":
                    print("Avançando pela rota inferior...")
                    escolher_monstro_para_batalha(conn)
                elif escolha == "4":
                    print("Avançando pela rota do meio...")
                    escolher_monstro_para_batalha(conn)
                elif escolha == "5":
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
                    id_personagem = listar_personagens_predefinidos(conn)
                elif escolha == "4":
                    print("Obrigado por jogar! Até mais!")
                    break
                else:
                    print("Escolha inválida. Tente novamente.")
        
        conn.close()

if __name__ == "__main__":
    jogo()
