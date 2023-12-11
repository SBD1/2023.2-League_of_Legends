CREATE TABLE Mapa (
	Nome varchar(35) PRIMARY KEY,
	Tamanho int NOT NULL
);

CREATE TABLE Sala (
	id_sala int PRIMARY KEY,
	nome_mapa varchar (35),
	Regiao varchar(30) NOT NULL,
	FOREIGN KEY (nome_mapa) REFERENCES Mapa (Nome)
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
	dano_extra int,
	forca int NOT NULL,
	cura int NOT NULL,
	historia varchar(1000)
);

CREATE TABLE PC (
	id_pc int PRIMARY KEY,
	id_sala int, 
	id_personagem int,
	gold int,
	vida int,
	nivel int,
	energia int,
	dano int,
	forca int,
	cura int,
	slot_item int,
	nome_conta varchar(20) NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala),
	FOREIGN KEY (id_personagem) REFERENCES Personagem (id_personagem) 
);

CREATE TABLE NPC (
	id_npc int,
	funcao varchar(100) NOT NULL,
	FOREIGN KEY (id_npc) REFERENCES Personagem (id_personagem) 
);

CREATE TABLE Loja (
	nome_loja varchar(35) PRIMARY KEY,
	nome_area varchar(15) NOT NULL,
	id_sala int, 
	qtd_itens int NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala) 
);

CREATE TABLE Area_de_Recuperacao (
	nome_mapa varchar(35),
	id_sala int,
	recuperacao_vida_por_seg int NOT NULL,
	recuperacao_energia_por_seg int NOT NULL,
	FOREIGN KEY (nome_mapa) REFERENCES Mapa (Nome),
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala)
);
	

CREATE TABLE Item (
	id_item int PRIMARY KEY,
	nome_item varchar(35) NOT NULL,
	nome_area varchar(15) NOT NULL,
	id_sala int, 
	preco_item int NOT NULL,
	dano_item int NOT NULL,	
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala)
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
	nome_area varchar(25) NOT NULL,
	funcao_inst varchar(50),
	FOREIGN KEY (id_npc) REFERENCES Personagem (id_personagem)
);

CREATE TABLE Boss (
	id_boss int,
	recompensa varchar(35) NOT NULL,
	nome_area varchar(15) NOT NULL,
	FOREIGN KEY (id_boss) REFERENCES Personagem (id_personagem)
);

CREATE TABLE Itens_de_Tank (
	id_item int PRIMARY KEY,
	nome_item varchar(35) NOT NULL,
	nome_area varchar(15) NOT NULL,
	id_sala int, 
	preco_item int NOT NULL,
	dano_item int NOT NULL,	
	vida_adicional int NOT NULL,
	FOREIGN KEY (id_item) REFERENCES Item (id_item)
);

CREATE TABLE Itens_de_mago (
	id_item int PRIMARY KEY,
	nome_item varchar(35) NOT NULL,
	nome_area varchar(15) NOT NULL,
	id_sala int, 
	preco_item int NOT NULL,
	dano_item int NOT NULL,	
	dano_magico_adicional int NOT NULL,
	FOREIGN KEY (id_item) REFERENCES Item (id_item)
);

CREATE TABLE Itens_de_lutador (
	id_item int PRIMARY KEY,
	nome_item varchar(35) NOT NULL,
	nome_area varchar(15) NOT NULL,
	id_sala int, 
	preco_item int NOT NULL,
	dano_item int NOT NULL,	
	dano_fisico_adicional int NOT NULL,
	FOREIGN KEY (id_item) REFERENCES Item (id_item)
);

CREATE TABLE Missoes (
	id_missao int PRIMARY KEY,
	id_npc int,
	descricao varchar(100) NOT NULL,
	nivel_necessario int NOT NULL,
	FOREIGN KEY (id_npc) REFERENCES Personagem (id_personagem)
);
