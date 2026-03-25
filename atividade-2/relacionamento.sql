-- criar_tabela_categoria.sql
CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome         VARCHAR(128) NOT NULL UNIQUE,
    descricao    TEXT,
    data_cadastro    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- criar_tabela_autor.sql
CREATE TABLE Autor (
    id_autor         INT PRIMARY KEY AUTO_INCREMENT,
    nome             VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento   YEAR,
    ano_morte        YEAR,
    apresentacao     TEXT,
    data_cadastro    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- criar_tabela_editora.sql
CREATE TABLE Editora (
    id_editora       INT PRIMARY KEY AUTO_INCREMENT,
    nome             VARCHAR(255) NOT NULL UNIQUE,
    cidade           VARCHAR(64),
    estado           VARCHAR(64),
    pais             VARCHAR(64),
    data_cadastro    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- alterar_tabela_usuario.sql
ALTER TABLE Usuario
    MODIFY COLUMN data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN   data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- alterar_tabela_livro.sql
-- Remover colunas antigas
ALTER TABLE Livro
    DROP COLUMN autor,
    DROP COLUMN editora,
    DROP COLUMN categoria;

-- Adicionar novas colunas e FKs
ALTER TABLE Livro
    ADD COLUMN id_usuario   INT            AFTER id_livro,
    ADD COLUMN id_autor     INT            AFTER id_usuario,
    ADD COLUMN id_editora   INT            AFTER id_autor,
    ADD COLUMN id_categoria INT            AFTER id_editora,
    ADD COLUMN data_cadastro    TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN data_atualizacao TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Chaves estrangeiras
ALTER TABLE Livro
    ADD CONSTRAINT fk_livro_usuario
        FOREIGN KEY (id_usuario)   REFERENCES Usuario(id_usuario)
        ON DELETE CASCADE,

    ADD CONSTRAINT fk_livro_autor
        FOREIGN KEY (id_autor)     REFERENCES Autor(id_autor)
        ON DELETE RESTRICT,

    ADD CONSTRAINT fk_livro_editora
        FOREIGN KEY (id_editora)   REFERENCES Editora(id_editora)
        ON DELETE RESTRICT,

    ADD CONSTRAINT fk_livro_categoria
        FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
        ON DELETE RESTRICT;
