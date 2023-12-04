-- Obter informações sobre os boss's e as recompensas associadas a eles:

SELECT B.id_boss, B.recompensa, B.nome_area
FROM Boss B;

-- Listar os itens específicos para cada tipo de personagem (tank, mago, lutador):

SELECT T.id_item AS id_item_tank, I.vida_adicional
FROM Itens_de_Tank T
JOIN Item I ON T.id_item = I.id_item;

SELECT M.id_item AS id_item_mago, I.dano_magico_adicional
FROM Itens_de_Mago M
JOIN Item I ON M.id_item = I.id_item;

SELECT L.id_item AS id_item_lutador, I.dano_fisico_adicional
FROM Itens_de_Lutador L
JOIN Item I ON L.id_item = I.id_item;

-- Listar todos os NPCs e a função deles:

SELECT id_npc, funcao
FROM NPC;

-- Verifica se o personagem tem gold suficiente para comprar o item
SELECT
    P.nome_personagem,
    I.nome_item,
    P.gold AS gold_personagem,
    I.preco_item
FROM Personagem P
JOIN Item I ON P.id_sala = I.id_sala
WHERE
    P.id_personagem = 'id_personagem'
    AND I.id_item = 'id_item'
    AND P.gold >= I.preco_item;

-- Verifica se o personagem tem energia suficiente para a habilidade
SELECT
    P.nome_personagem,
    H.nome_habilidade,
    H.custo_de_energia AS custo_energia_habilidade,
    P.energia
FROM
    Personagem P
JOIN
    Habilidades H ON P.id_personagem = H.id_habilidade
WHERE
    P.id_personagem = 'id_personagem'
    AND H.id_habilidade = 'id_habilidade'
    AND P.energia >= H.custo_de_energia;

-- Verifica se a vida do personagem está em 100
SELECT nome_personagem, vida
FROM Personagem
WHERE
    id_personagem = 'id_personagem'
    AND vida = 100;

-- Verifica se o personagem tem nível suficiente para a missão
SELECT
    P.nome_personagem,
    M.descricao AS descricao_missao,
    M.nivel_necessario
FROM
    Personagem P
JOIN
    Missoes M ON P.id_npc = M.id_npc
WHERE
    P.id_personagem = 'id_personagem'
    AND M.id_missao = 'id_missao'
    AND P.nivel >= M.nivel_necessario;


-- obter detalhes do personagem junto com a sala em que estão:

SELECT P.nome_personagem, S.nome_mapa, S.Regiao
FROM Personagem AS P
JOIN PC ON P.id_personagem = PC.id_personagem
JOIN Sala AS S ON PC.id_sala = S.Id_sala;


-- obter detalhes dos itens disponíveis na loja

SELECT L.nome_loja, I.nome_item, I.preco_item
FROM Loja AS L
JOIN Item AS I ON L.id_sala = I.id_sala;



-- obter informações sobre as missões e os NPCs responsáveis por elas

SELECT m.id_missao, m.descricao, m.nivel_necessario, n.funcao AS npc_funcao
FROM Missoes m
JOIN NPC n ON m.id_npc = n.id_npc;



-- obter informações sobre as habilidades dos personagens:

SELECT p.nome_personagem, h.nome_habilidade, h.descricao, h.custo_de_energia
FROM Personagem p
JOIN Habilidades h ON p.id_personagem = h.id_habilidade;


-- obter detalhes das áreas de recuperação disponíveis no mapa:

SELECT A.nome_mapa, A.recuperacao_vida_por_seg, A.recuperacao_energia_por_seg
FROM Area_de_Recuperacao AS A;
