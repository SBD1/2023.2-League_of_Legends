-----------------------------------------------------------------
CREATE TRIGGER FUNCTION check_existencia_tank() RETURNS trigger AS $check_existencia_tank$

BEGIN
    PERFORM * FROM Itens_de_Tank WHERE id_item = NEW.id_item
    IF FOUND THEN
        RAISE EXCEPTION 'Este Item já existe na tabela de tank'
    END IF;
    RETURN NEW;
END;

$check_existencia_tank$ LANGUAGE plpgsql;

CREATE TRIGGER check_existencia
BEFORE UPDATE OR INSERT ON Itens_de_lutador AND Itens_de_mago
FOR EACH ROW EXECUTE PROCEDURE check_existencia_tank();

-----------------------------------------------------------------
CREATE TRIGGER FUNCTION check_existencia_lutador() RETURNS trigger AS $check_existencia_lutador$

BEGIN
    PERFORM * FROM Itens_de_lutador WHERE id_item = NEW.id_item
    IF FOUND THEN
        RAISE EXCEPTION 'Este Item já existe na tabela de lutador'
    END IF;
    RETURN NEW;
END;

$check_existencia_lutador$ LANGUAGE plpgsql;

CREATE TRIGGER check_existencia_2
BEFORE UPDATE OR INSERT ON Itens_de_Tank AND Itens_de_mago
FOR EACH ROW EXECUTE PROCEDURE check_existencia_lutador();

----------------------------------------------------------------
CREATE TRIGGER FUNCTION check_existencia_mago() RETURNS trigger AS $check_existencia_mago$

BEGIN
    PERFORM * FROM Itens_de_mago WHERE id_item = NEW.id_item
    IF FOUND THEN
        RAISE EXCEPTION 'Este Item já existe na tabela de mago'
    END IF;
    RETURN NEW;
END;

$check_existencia_mago$ LANGUAGE plpgsql;

CREATE TRIGGER check_existencia_3
BEFORE UPDATE OR INSERT ON Itens_de_Tank AND Itens_de_lutador
FOR EACH ROW EXECUTE PROCEDURE check_existencia_mago();

----------------------------------------------------------------
CREATE TRIGGER FUNCTION check_compra_item() RETURNS trigger AS $check_compra_item$

BEGIN
    SELECT gold FROM PC WHERE id_personagem = personagem_id;
    IF gold >= preco_item THEN
        UPDATE PC SET gold = gold - preco_item WHERE id_personagem = personagem_id;
        UPDATE PC SET slot_item + 1 WHERE id_personagem = personagem_id;
        SELECT 'Compra realizada com sucesso' AS mensagem;
    ELSE
        SELECT 'Dinheiro insuficiente para comprar o item' AS mensagem;
    END IF;
END;

$check_compra_item$ LANGUAGE plpgsql;

CREATE TRIGGER check_compra
BEFORE UPDATE OR INSERT ON PC
FOR EACH ROW EXECUTE PROCEDURE check_compra_item();

----------------------------------------------------------------
CREATE FUNCTION personagem_existe() RETURNS trigger AS $personagem_existe$

BEGIN
	PERFORM * FROM Personagem where id_personagem = NEW.id_personagem;
	IF FOUND THEN 
		RAISE EXCEPTION 'Este personagem já existe!';
	END IF;
	RETURN NEW;
END;
$personagem_existe$ LANGUAGE plpgsql;

CREATE TRIGGER personagem_existe
BEFORE INSERT ON Personagem 
FOR EACH ROW EXECUTE PROCEDURE personagem_existe();

-----------------------------------------------------------------
CREATE FUNCTION check_nivel_missao() RETURNS trigger AS $check_nivel_missao$

BEGIN
    SELECT P.nome_personagem, M.descricao AS descricao_missao, M.nivel_necessario 
    FROM Personagem P JOIN Missoes M ON P.id_npc = M.id_npc
    WHERE P.id_personagem = 'id_personagem' AND M.id_missao = 'id_missao' AND P.nivel >= M.nivel_necessario;
    IF M.nivel_necessario < P.nivel
        RAISE EXCEPTION 'Voce nao tem nivel para a missao'
    END IF;
    RETURN missoes;
END;
$check_nivel_missao$ LANGUAGE plpgsql;

CREATE TRIGGER check_nivel_missao
BEFORE INSERT OR UPDATE missoes
FOR EACH ROW EXECUTE PROCEDURE check_nivel_missao();
