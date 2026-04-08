CREATE TABLE Livro (
		id_livro INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
        titulo VARCHAR(255) NOT NULL,
        sinopse TEXT NOT NULL,
        autor VARCHAR(128) NOT NULL,
		editora VARCHAR(128) NOT NULL,
        categoria VARCHAR(128),
        ano_publicacao YEAR NOT NULL
);

ALTER TABLE livro ADD COLUMN status_leitura VARCHAR(255);
ALTER TABLE livro DROP status_leitura;
ALTER TABLE livro MODIFY status_leitura BOOLEAN DEFAULT(0);

DESCRIBE livro;
ALTER TABLE livro ADD CONSTRAINT check_status_livro CHECK (status_leitura IN (0, 1) );

ALTER TABLE livro
ADD COLUMN id_usuario INT, 
ADD CONSTRAINT fk_livro_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) 
ON DELETE CASCADE;


