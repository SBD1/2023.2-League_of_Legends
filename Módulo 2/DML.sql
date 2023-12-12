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
  (10, 'Jinx', 'Humana', 'Atiradora', 470, 3, 70, 10, 55, 30, 'Uma criminosa impulsiva e maníaca de Zaun, Jinx vive para disseminar o caos sem se preocupar com as consequências.'),
  (20, 'Zed', 'Humana', 'Assasino', 480, 3, 80, 15, 65, 35, 'O homem conhecido como Zed, ex-membro da honorável Ordem Kinkou, agora é líder de um bando de assassinos.'),
  (30, 'Annie', 'Humana', 'Mago', 490, 3, 70, 15, 70, 30, 'Perigosa, mas adoravelmente precoce, Annie é uma pequena maga com imenso poder piromaníaco.'),
  (40, 'Dr.Mundo', 'Humana', 'Tank', 500, 3, 60, 70, 70, 55, 'Dr. Mundo enche-se de produtos químicos, curando instantaneamente uma porcentagem da própria Vida perdida.'),
  (50, 'Sett', 'Humoide', 'Lutador', 510, 3, 65, 80, 70, 40, 'Com aparência humanoide, Sett é considerado um colosso e suas habilidades serão baseadas em seu ataque básico.');


INSERT INTO PC (id_pc, id_personagem, slot_item, gold)
VALUES (1, 10, 4, 500);

INSERT INTO NPC (id_npc, funcao)
VALUES 
  (100, 'Atirar e matar o PC, impedindo que avance'),
  (200, 'Causar feridas com suas laminas e matar o PC, impedindo que avance'),
  (300, 'Causar dano magico e matar o PC, impedindo que avance'),
  (400, 'Tankar e matar o PC, impedindo que avance'),
  (500, 'Causar dano de ataque e matar o PC, impedindo que avance');

INSERT INTO Loja (nome_loja, nome_area, id_sala, qtd_itens)
VALUES ('Loja de Itens', 'Spawn', 1, 8);

INSERT INTO Item (Id_item, id_sala)
VALUES 
    (1000, 1),
    (2000, 1),
    (3000, 1),
    (4000, 1),
    (5000, 1),
    (6000, 1),
    (7000, 1),
    (8000, 1);

INSERT INTO Area_de_Recuperacao (nome_area, id_sala, recuperacao_vida_por_seg, recuperacao_energia_por_seg)
VALUES ('Spawn', 1, 20, 20);

INSERT INTO Itens_de_Tank (id_item, nome_item, preco_item, dano_item, vida_adicional)
VALUES
  (2000, 'Escudo Relicári', 60, 5, 10),
  (8000, 'Escudo de Doran', 65, 5, 15);

INSERT INTO Itens_de_mago (id_item, nome_item, preco_item, dano_item, dano_magico_adicional)
VALUES
  (3000, 'Anel de Doran', 90, 15, 5),
  (4000, 'Lacre Sombrio', 90, 15, 5),
  (5000, 'Gume do Ladrão Arcano', 65, 8, 3);

INSERT INTO Itens_de_lutador (id_item, nome_item, preco_item, dano_item, dano_fisico_adicional)
VALUES
  (1000, 'Foice Espectral', 50, 10, 5),
  (6000, 'Lâmina de Doran', 65, 8, 5),
  (7000, 'Espada Longa', 90, 20, 5);
  
INSERT INTO Habilidades (id_habilidade, nome_habilidade, descricao, custo_de_energia)
VALUES (110, 'Voar', 'O personagem adquire a habilidade de voar', 10);

INSERT INTO Instancia (id_instancia, id_npc, nome_area, funcao_inst)
VALUES (120, 20, 'Floresta', 'informarcao');

INSERT INTO Boss (id_boss, recompensa, nome_area)
VALUES (30, '100 moedas', 'Deserto');

INSERT INTO Missoes (id_missao, id_npc, descricao, nivel_necessario)
VALUES (160, 20, 'mate 5 inimigos', 4);
