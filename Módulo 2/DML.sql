-- inserção de dados

INSERT INTO Mapa (Nome, Tamanho)
VALUES ('Summuners Rift', 5);

INSERT INTO Sala (Id_sala, nome_mapa, Regiao)
VALUES 
    (1, 'Spawn', 'Floreta'),
    (2, 'Inferior', 'Rota'),
    (3, 'Meio', 'Rota'),
    (4, 'Jungle', 'Floreta'),
    (5, 'Topo', 'Rota');


INSERT INTO Personagem (id_personagem, nome_personagem, especie, classe, vida, nivel, energia, dano, forca, cura, historia)
VALUES 
  (10, 'Jinx', 'Humana', 'Atiradora', 60, 3, 70, 10, 55, 30, 'Uma criminosa impulsiva e maníaca de Zaun, Jinx vive para disseminar o caos sem se preocupar com as consequências.'),
  (20, 'Zed', 'Humana', 'Assasino', 55, 3, 80, 15, 65, 35, 'O homem conhecido como Zed, ex-membro da honorável Ordem Kinkou, agora é líder de um bando de assassinos.'),
  (30, 'Annie', 'Humana', 'Mago', 40, 3, 70, 15, 70, 30, 'Perigosa, mas adoravelmente precoce, Annie é uma pequena maga com imenso poder piromaníaco.'),
  (40, 'Dr.Mundo', 'Humana', 'Tank', 95, 3, 60, 70, 70, 55, 'Dr. Mundo enche-se de produtos químicos, curando instantaneamente uma porcentagem da própria Vida perdida.'),
  (50, 'Sett', 'Humoide', 'Lutador', 80, 3, 65, 80, 70, 40, 'Com aparência humanoide, Sett é considerado um colosso e suas habilidades serão baseadas em seu ataque básico.');


INSERT INTO PC (id_pc, id_sala, id_personagem, slot_item, nome_conta)
VALUES (1, 1, 10, 4, 60, 3, 70, 10, 55, 30,'user');

INSERT INTO NPC (id_npc, funcao)
VALUES 
  (100, 'Atirar e matar o PC, impedindo que avance'),
  (200, 'Causar feridas com suas laminas e matar o PC, impedindo que avance'),
  (300, 'Causar dano magico e matar o PC, impedindo que avance'),
  (400, 'Tankar e matar o PC, impedindo que avance'),
  (500, 'Causar dano de ataque e matar o PC, impedindo que avance');

INSERT INTO Loja (nome_loja, nome_area, id_sala, qtd_itens)
VALUES ('Loja de Itens', 'Spawn', 1, 8);

INSERT INTO Area_de_Recuperacao (nome_area, id_sala, recuperacao_vida_por_seg, recuperacao_energia_por_seg)
VALUES ('Spawn', 1, 20, 20);

INSERT INTO Itens_de_Tank (id_item, nome_item, nome_area, id_sala, preco_item, dano_item, vida_adicional)
VALUES
  (2000, 'Escudo Relicári', 'Floresta', 1, 60, 5, 10),
  (8000, 'Escudo de Doran', 'Floresta', 1, 65, 5, 15);

INSERT INTO Itens_de_mago (id_item, nome_item, nome_area, id_sala, preco_item, dano_item, dano_magico_adicional)
VALUES
  (3000, 'Anel de Doran', 'Floresta', 1, 90, 15, 5),
  (4000, 'Lacre Sombrio', 'Floresta', 1, 90, 15, 5),
  (5000, 'Gume do Ladrão Arcano', 'Floresta', 1, 65, 8, 3);

INSERT INTO Itens_de_lutador (id_item, nome_item, nome_area, id_sala, preco_item, dano_item, dano_fisico_adicional)
VALUES
  (1000, 'Foice Espectral', 'Floresta', 1, 50, 10, 5),
  (6000, 'Lâmina de Doran', 'Floresta', 1, 65, 8, 5),
  (7000, 'Espada Longa', 'Floresta', 1, 90, 20, 5),
  
INSERT INTO Habilidades (id_habilidade, nome_habilidade, descricao, custo_de_energia)
VALUES (110, 'Voar', 'O personagem adquire a habilidade de voar', 10);

INSERT INTO Instancia (id_instancia, id_npc, nome_area, funcao_inst)
VALUES (120, 20, 'Floresta', 'informarcao');

INSERT INTO Boss (id_boss, recompensa, nome_area)
VALUES (30, '100 moedas', 'Deserto');

INSERT INTO Missoes (id_missao, id_npc, descricao, nivel_necessario)
VALUES (160, 20, 'mate 5 inimigos', 4);
