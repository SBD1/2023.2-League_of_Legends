import psycopg2

def conectar_banco():
    try:
        conn = psycopg2.connect(
            database ="League_of_legends",
            user ="seu_usuario_local",
            password ="sua_senha_criada",
            host ="localhost",
            port ="5432"
        )



        return conn
    except psycopg2.Error as e:
        print("Erro ao conectar ao banco de dados:", e)
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

def exibir_npcs_sala(conn, id_sala):
    cursor = conn.cursor()
    cursor.execute("SELECT id_npc, funcao FROM NPC WHERE id_npc IN (SELECT id_personagem FROM PC WHERE id_sala = %s)", (id_sala,))
    npcs = cursor.fetchall()
    if npcs:
        print("\nNPCs na sala:")
        for npc in npcs:
            print(f"ID: {npc[0]}, Função: {npc[1]}")
    else:
        print("Não há NPCs nesta sala.")

def exibir_info_item_tank(conn, id_sala):
    cursor = conn.cursor()
    cursor.execute("SELECT id_item, nome_item, preco_item, dano_item, vida_adicional FROM Itens_de_Tank ")
    item = cursor.fetchone()
    if item:
        print(f"ID do Item: {item[1]}")
        print(f"Nome: {item[2]}")
        print(f"Preço: {item[3]}")
        print(f"Dano: {item[4]}")
        print(f"Vida adicional: {item[5]}")
    else:
        print("Itens não encontrados!")

def exibir_info_item_mago(conn, id_sala):
    cursor = conn.cursor()
    cursor.execute("SELECT id_item, nome_item, preco_item, dano_item, dano_magico_adicional FROM Itens_de_mago ")
    item = cursor.fetchone()
    if item:
        print(f"ID do Item: {item[1]}")
        print(f"Nome: {item[2]}")
        print(f"Preço: {item[3]}")
        print(f"Dano: {item[4]}")
        print(f"Dano magico adicional: {item[5]}")
    else:
        print("Itens não encontrados!")

def exibir_info_item_lutador(conn, id_sala):
    cursor = conn.cursor()
    cursor.execute("SELECT id_item, nome_item, preco_item, dano_item, dano_fisico_adicional FROM Itens_de_lutador ")
    item = cursor.fetchone()
    if item:
        print(f"ID do Item: {item[1]}")
        print(f"Nome: {item[2]}")
        print(f"Preço: {item[3]}")
        print(f"Dano: {item[4]}")
        print(f"Dano fisico adicional: {item[5]}")
    else:
        print("Itens não encontrados!")

def comprar_item(conn, nome_loja, id_sala, id_personagem, id_item):
    cursor = conn.cursor()
    cursor.execute("SELECT preco_item FROM Item WHERE id_sala = %s AND id_item = %s", (id_sala, id_item))
    preco = cursor.fetchone()
    if preco:
        preco = preco[0]
        cursor.execute("SELECT energia FROM Personagem WHERE id_personagem = %s", (id_personagem,))
        energia = cursor.fetchone()[0]
        if energia >= preco:
            cursor.execute("UPDATE Personagem SET energia = energia - %s WHERE id_personagem = %s", (preco, id_personagem))
            print("Item comprado com sucesso!")
        else:
            print("Você não tem energia suficiente para comprar este item.")
    else:
        print("Item não encontrado nesta loja.")

def jogo():
    conn = conectar_banco()
    if conn:

        print("Bem-vindo ao jogo League of Legends - Terminal Edition!")
        
        while True:
            print("\nEscolha uma ação:")
            print("1. Ver informações do personagem")
            print("2. Ver NPCs na sala")
            print("3. Comprar item em uma loja")
            print("4. Sair")
            
            escolha = input("Escolha uma opção: ")
            
            if escolha == "1":
                id_personagem = input("Digite o ID do personagem: ")
                exibir_info_personagem(conn, id_personagem)
            elif escolha == "2":
                id_sala = input("Digite o ID da sala: ")
                exibir_npcs_sala(conn, id_sala)
            elif escolha == "3":
                nome_loja = input("Digite o nome da loja: ")
                id_sala = input("Digite o ID da sala: ")
                id_personagem = input("Digite o ID do personagem: ")
                id_item = input("Digite o ID do item que deseja comprar: ")
                comprar_item(conn, nome_loja, id_sala, id_personagem, id_item)
            elif escolha == "4":
                print("Obrigado por jogar! Até mais!")
                break
            else:
                print("Escolha inválida. Tente novamente.")
        
        conn.close()


if __name__ == "__main__":
    jogo()
