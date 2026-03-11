USE biblioteca_pessoal_1S2026;

CREATE TABLE Usuario (
		id_usuario INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        data_cadastro DATE NOT NULL
);

show tables;