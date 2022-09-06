-- public.categoria definition

-- Drop table

-- DROP TABLE public.categoria;

CREATE TABLE public.categoria (
	id int4 NOT NULL,
	tipo varchar(255) NULL,
	data_criacao timestamp NULL,
	CONSTRAINT categoria_pkey PRIMARY KEY (id)
);


-- public.desconto definition

-- Drop table

-- DROP TABLE public.desconto;

CREATE TABLE public.desconto (
	id int4 NOT NULL,
	percentual int4 NULL,
	description text NULL,
	data_validade date NOT NULL DEFAULT CURRENT_DATE,
	data_criacao timestamp NULL,
	CONSTRAINT desconto_pkey PRIMARY KEY (id)
);


-- public.produto definition

-- Drop table

-- DROP TABLE public.produto;

CREATE TABLE public.produto (
	id int4 NOT NULL,
	nome varchar(255) NOT NULL,
	quantidade int4 NOT NULL,
	valor numeric NOT NULL,
	descricao varchar(255) NULL,
	desconto_id int4 NULL,
	data_criacao timestamp NULL,
	CONSTRAINT chave PRIMARY KEY (id),
	CONSTRAINT produto_desconto_id_fkey FOREIGN KEY (desconto_id) REFERENCES public.desconto(id)
);


-- public.produto_categoria definition

-- Drop table

-- DROP TABLE public.produto_categoria;

CREATE TABLE public.produto_categoria (
	produto_id int4 NOT NULL,
	categoria_id int4 NOT NULL,
	CONSTRAINT chavecategoria FOREIGN KEY (categoria_id) REFERENCES public.categoria(id),
	CONSTRAINT chaveproduto FOREIGN KEY (produto_id) REFERENCES public.produto(id)
);