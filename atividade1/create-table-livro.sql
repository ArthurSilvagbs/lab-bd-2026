CREATE TABLE Livro (
		id_livro INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
        titulo VARCHAR(255) NOT NULL,
        sinopse TEXT NOT NULL,
        autor VARCHAR(128) NOT NULL,
		editora VARCHAR(128) NOT NULL,
        categoria VARCHAR(128),
        ano_publicacao YEAR NOT NULL
);