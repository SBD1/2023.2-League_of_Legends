-- inserção de dados

INSERT INTO Mapa (Nome, Tamanho)
VALUES ('League of Legends', 5);

INSERT INTO Sala (Id_sala, nome_mapa, Regiao)
VALUES (1, 'League of Legends', 'Deserto');

INSERT INTO Personagem (id_personagem, nome_personagem, especie, classe, vida, nivel, energia, dano, forca, cura, historia)
VALUES 
  (10, 'Kitana', 'Humana', 'Assasina', 85, 3, 90, 10, 55, 80, 'Assassina de 10.000 anos e princesa da Exoterra'),
  (20, 'Mileena', 'Humana', 'Assasina', 50, 2, 34, 5, 90, 67, 'Mileena é um clone da princesa Kitana feita por Shang Tsung para Shao Kahn feita para substituir a princesa'),
  (30, 'Jade', 'Humana', 'Assasina', 40, 4, 40, 15, 20, 60, 'Jade é amiga de longa data de Kitana, e é uma das assassinas e espiã pessoal de Shao Kahn');

INSERT INTO PC (id_pc, id_sala, id_personagem, nome_conta)
VALUES (100, 1, 10, 'user');

INSERT INTO NPC (id_npc, funcao)
VALUES (20, 'ajudar o PC a lutar');

INSERT INTO Loja (nome_loja, local, id_sala, qtd_itens)
VALUES ('Loja de ferramentas', 'Cidade', 1, 18);

INSERT INTO Area_de_Recuperacao (nome_mapa, id_sala, recuperacao_vida_por_seg, recuperacao_energia_por_seg)
VALUES ('League of Legends', 1, 8, 5);

INSERT INTO Item (id_item, nome_item, local, id_sala, preco_item, dano_item)
VALUES
  (1000, 'Espada', 'Floresta', 1, 50, 10),
  (2000, 'Pocao', 'Deserto', 1, 60, 40),
  (3000, 'Feitico', 'Cidas', 1, 90, 50);

INSERT INTO Habilidades (id_habilidade, nome_habilidade, descricao, custo_de_energia)
VALUES (110, 'Voar', 'O personagem adquire a habilidade de voar', 20);

INSERT INTO Instancia (id_instancia, id_npc, local, funcao_inst)
VALUES (120, 20, 'Floresta', 'informarcao');

INSERT INTO Boss (id_boss, recompensa, local)
VALUES (30, '100 moedas', 'Deserto');

INSERT INTO Itens_de_Tank (id_item, nome_item, vida_adicional)
VALUES (2000, 'Pocao', 30);

INSERT INTO Itens_de_mago (id_item, nome_item, dano_magico_adicional)
VALUES (3000, 'Feitico', 40);

INSERT INTO Itens_de_lutador (id_item, nome_item, dano_fisico_adicional)
VALUES (1000, 'Espaca', 25);

INSERT INTO Missoes (id_missao, id_npc, descricao, nivel_necessario)
VALUES (160, 20, 'mate 5 inimigos', 4);
