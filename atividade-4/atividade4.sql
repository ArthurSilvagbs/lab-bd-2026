insert into usuario(nome, email, senha) values(
	"Arthur Silva",
    "arthur.gsilva@a.ucb.br",
    "senha123"
);

insert into editora(nome , cidade, estado, pais) values(
	"UCB",
    "Brasília",
    "Distrito Federal",
    "Brasil"
);

insert into autor(nome, ano_nascimento, apresentacao) values(
	"J.K. Rowling",
    1965,
    "Autora da serie de livros Harry Potter"
);

insert into autor(nome, ano_nascimento, ano_morte, apresentacao) values(
	"J. R. R. Tolkien",
    1892,
    1973,
    "Autor da serie de livros de Senhor dos Aneis e do universo da Terra Média"
);

insert into livro(id_usuario, id_autor, id_editora, id_categoria, titulo, ano_publicacao) values (
	1, 
    1,
    1,
    1,
    "O Senhor dos Anéis: O Retorno do Rei",
    1955
);

insert into livro(id_usuario, id_autor, id_editora, id_categoria, titulo, ano_publicacao) values (
	1, 
    2,
    1,
    1,
    "Harry Potter e as Relíquias da Morte",
    2007
); 
/*
Adicionei todos os livros de harry potter e o senhor dos aneis.
OBS: deu uma dó de deletar pq deu um pequeno trabalho pra adicionar :(
*/

insert into categoria(nome, descricao) values(
	"Filosofia",
    "Livros com o tema de filosofia"
);

select * from livro 
where id_autor = (select id_autor from autor where nome = 'J.K. Rowling');

select * from livro 
where id_categoria = (select id_categoria from categoria where nome = 'Filosofia');

update categoria set nome = "Censurado" where nome = "Filosofia";

delete from livro where categoia = "Censurado";

select * from autor;