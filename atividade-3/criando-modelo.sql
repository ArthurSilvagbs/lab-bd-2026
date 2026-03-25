-- Criação do banco de dados e tabelas da Biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca_pessoal
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE biblioteca_pessoal;

-- Tabela: Categoria
CREATE TABLE Categoria (
    id_categoria     INT          PRIMARY KEY AUTO_INCREMENT,
    nome             VARCHAR(128) NOT NULL UNIQUE,
    descricao        TEXT,
    data_cadastro    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela: Autor
CREATE TABLE Autor (
    id_autor         INT          PRIMARY KEY AUTO_INCREMENT,
    nome             VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento   YEAR,
    ano_morte        YEAR,
    apresentacao     TEXT,
    data_cadastro    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela: Editora
CREATE TABLE Editora (
    id_editora       INT          PRIMARY KEY AUTO_INCREMENT,
    nome             VARCHAR(255) NOT NULL UNIQUE,
    cidade           VARCHAR(64),
    estado           VARCHAR(64),
    pais             VARCHAR(64),
    data_cadastro    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela: Usuario
CREATE TABLE Usuario (
    id_usuario       INT          PRIMARY KEY AUTO_INCREMENT,
    nome             VARCHAR(255),
    email            VARCHAR(255) UNIQUE,
    senha            VARCHAR(255),
    data_cadastro    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela: Livro
CREATE TABLE Livro (
    id_livro         INT          PRIMARY KEY AUTO_INCREMENT,
    id_usuario       INT,
    id_autor         INT,
    id_editora       INT,
    id_categoria     INT,
    titulo           VARCHAR(255),
    sinopse          TEXT,
    ano_publicacao   YEAR,
    lido             BOOLEAN      DEFAULT FALSE,
    data_cadastro    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_livro_usuario
        FOREIGN KEY (id_usuario)   REFERENCES Usuario(id_usuario)
        ON DELETE CASCADE,

    CONSTRAINT fk_livro_autor
        FOREIGN KEY (id_autor)     REFERENCES Autor(id_autor)
        ON DELETE RESTRICT,

    CONSTRAINT fk_livro_editora
        FOREIGN KEY (id_editora)   REFERENCES Editora(id_editora)
        ON DELETE RESTRICT,

    CONSTRAINT fk_livro_categoria
        FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
        ON DELETE RESTRICT
);
