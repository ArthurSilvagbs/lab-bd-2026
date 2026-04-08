/**  */

/** DELETA O SCHEMA DO BD SE EXISTIR */
DROP DATABASE IF EXISTS  biblioteca_pessoal_1s2026;

/** CRIA E SELECIONA UM SCHEMA DE BD */
CREATE DATABASE biblioteca_pessoal_1s2026;
USE biblioteca_pessoal_1s2026;

/** CRIA TABELAS, RELAÇÕES E RESTRIÇÕES */
CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) UNIQUE,
    descricao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE autor(
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento INT,
    ano_morte YEAR,
    apresentacao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE editora(
	id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    cidade VARCHAR(255),
    estado VARCHAR(255),
    pais VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE livro(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_autor INT,
    id_editora INT,
    id_categoria INT, 
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT,
    ano_publicacao YEAR,
    lido BOOLEAN DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	CONSTRAINT fk_usuario_livro FOREIGN KEY (id_usuario) 
    REFERENCES usuario(id_usuario)
    ON DELETE CASCADE,
    
    CONSTRAINT fk_autor_livro FOREIGN KEY (id_autor) 
    REFERENCES autor(id_autor)
    ON DELETE RESTRICT,
    
    CONSTRAINT fk_editora_livro FOREIGN KEY (id_editora) 
    REFERENCES editora(id_editora)
    ON DELETE RESTRICT,
    
    CONSTRAINT fk_categoria_livro FOREIGN KEY (id_categoria) 
    REFERENCES categoria(id_categoria)
    ON DELETE RESTRICT
);