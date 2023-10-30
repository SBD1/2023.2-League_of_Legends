-- Cria as tabelas do projeto

CREATE TABLE Inferior (
	nome_area char(8) PRIMARY KEY,
	id_sala int,
	tamanho int NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Meio (
	nome_area char(4) PRIMARY KEY,
	id_sala int, 
	tamanho int NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Topo (
	nome_area char(4) PRIMARY KEY,
	id_sala int, 
	tamanho int NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Spawn (
	nome_area char(5) PRIMARY KEY,
	id_sala int, 
	tamanho int NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Personagem (
	id_personagem int PRIMARY KEY,
	nome_personagem varchar(35) NOT NULL,
	especie varchar(25) NOT NULL,
	classe varchar(25) NOT NULL,
	vida int NOT NULL,
	nivel int NOT NULL,
	energia int NOT NULL,
	dano int NOT NULL,
	forca int NOT NULL,
	historia varchar(1000)
);

CREATE TABLE PC (
	id_pc int PRIMARY KEY,
	id_sala int, 
	id_personagem int,
	nome_conta varchar(20) NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala),
	FOREIGN KEY (id_personagem) REFERENCES Personagem (id_personagem) 
);

CREATE TABLE NPC (
	id_npc int,
	nome_npc varchar(35), 
	funcao varchar(100) NOT NULL,
	FOREIGN KEY (id_npc) REFERENCES Personagem (id_personagem) 
);



CREATE TABLE Jungle (
	nome_area char(6) PRIMARY KEY,
	id_sala int, 
	id_boss int,
	tamanho int NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala),
	FOREIGN KEY (id_boss) REFERENCES Personagem (id_personagem)
	 
);

CREATE TABLE Area_de_Combate (
	nome_area_inferior char(8),
	nome_area_meio char(4),
	nome_area_topo char(4),
	id_sala int, 
	tamanho int NOT NULL,
	FOREIGN KEY (nome_area_inferior) REFERENCES Inferior (nome_area),  
	FOREIGN KEY (nome_area_meio) REFERENCES Meio (nome_area), 
	FOREIGN KEY (nome_area_topo) REFERENCES Topo (nome_area),   
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Area_de_Recuperacao (
	nome_area_spawn char(5),
	id_sala int, 
	tamanho int NOT NULL,
	cura int NOT NULL,
	FOREIGN KEY (nome_area_spawn) REFERENCES Spawn (nome_area),
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Loja (
	nome_loja varchar(35) PRIMARY KEY,
	nome_area char(5),
	id_sala int, 
	qtd_itens int NOT NULL,
	FOREIGN KEY (nome_area) REFERENCES Spawn (nome_area),
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Item (
	id_item int PRIMARY KEY,
	nome_item varchar(35),
	id_sala int, 
	nome_area_spawn char(5),
	nome_area_jungle char(6),
	preco_item int NOT NULL,
	dano_item int NOT NULL,	
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala),
	FOREIGN KEY (nome_area_spawn) REFERENCES Spawn (nome_area),
	FOREIGN KEY (nome_area_jungle) REFERENCES Jungle (nome_area)
	
);

CREATE TABLE Habilidades (
	id_habilidade int PRIMARY KEY,
	nome_habilidade varchar(25) NOT NULL,
	descricao varchar(100) NOT NULL,
	custo_de_energia int NOT NULL
);

CREATE TABLE Instancia (
	id_instancia int PRIMARY KEY,
	id_npc int,
	local varchar(25) NOT NULL,
	funcao_inst varchar(50),
	FOREIGN KEY (id_npc) REFERENCES Personagem (id_personagem)
);

CREATE TABLE Boss (
	id_boss int,
	recompensa varchar(35) NOT NULL,
	FOREIGN KEY (id_boss) REFERENCES Personagem (id_personagem)
);

CREATE TABLE Itens_de_Tank (
	id_item int,
	nome_item varchar(25) NOT NULL,
	vida_adicional int NOT NULL
);

CREATE TABLE Itens_de_mago (
	id_item int,
	nome_item varchar(25) NOT NULL,
	dano_magico_adicional int NOT NULL
);

CREATE TABLE Itens_de_lutador (
	id_item int,
	nome_item varchar(25) NOT NULL,
	dano_fisico_adicional int NOT NULL
);
