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
