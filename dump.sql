-- 1 - Você acaba de conseguir fechar um freela pra gerir um banco de dados de uma aplicação e 
-- a primeira demanda é trabalhar na tabela de usuários. Sabendo que essa tabela é a principal tabela desse banco de dados.
create table usuarios (
		id serial,
		nome text not null,
		idade smallint,
		email varchar(50),
		senha varchar(8) not null
		);


-- 2 - Após criar a tabela, chegou a hora de inserir os registros conforme solicitado pelo cliente. 
-- Seguindo a tabela abaixo cadastre todos os registros.
insert into usuarios (nome, idade, email, senha)
values ('Aretha Montgomery', 30, 'auge.id.ante@odioAliquam.com', 'a0B13OL'),
('Camden H. Bartlett', 15, 'turpis.vitae.purus@risusDuisa.ca', 'p3P96F3Q'),
('Raja W. Coffey', 30, '	raja.feugiat@nonummy.com', 's5F51T7L'),
('Elton D. Olsen', 29, 'auctor@duiFuscediam.edu', 'k5X25B0R'),
('Shelley E. Frederick', 20, 'raja.feugiat@nonummy.com', 'u2D18F6E');


-- 3 - Após ter inserido os registros na tabela usuarios, foi identificado que o registro que possui 
-- o e-mail raja.feugiat@nonummy.com informou seu nome errado. Faça uma atualização nesse registro alterando o nome 
-- para Raja W. Coffey Thomas.
update usuarios set nome = 'Raja W. Coffey Thomas' where email = 'raja.feugiat@nonummy.com';


-- 4 - O cliente percebeu que na tabela enviada anteriormente para inserir os usuários no banco de dados 
-- tinha um problema. Dois registros possui o mesmo e-mail e ao atualizar o nome do registro de e-mail 
-- raja.feugiat@nonummy.com essa alteração acabou afetando os dois registros que possui o mesmo e-mail. 
-- Isso precisa ser resolvido urgentemente e a solução é alterar o campo e-mail para não permitir e-mails duplicados, 
-- nem que seja necessário apagar todos os registros com o mesmo e-mail. Para alterar a tabela usuarios execute o código sql abaixo, 
-- porém, antes é necessário excluir um dos dois registros duplicados para evitar erro ao tentar alterar a tabela.
delete usuarios where id = 3;
alter table usuarios add constraint email_unique_usuarios unique(email);


-- 5 - Ufa!! Ainda bem que o problema foi resolvido. O cliente acabou de mandar outra tabela com mais cadastros para 
-- serem inseridos na tabela usuarios.
alter table usuarios add column situacao boolean default true;
insert into usuarios (nome, idade, email, senha, situacao) values
('Jermaine G. Sellers', 16, 'ligula.Nullam@tortordictum.co.uk', 'o2P56U9U', true),
('James D. Kennedy', 23, 'amet@Nulladignissim.com', 'q6B78V3V', true),
('Amelia S. Harris', 29, 'nec.metus.facilisis@vitaealiquet.edu', 'l4S64Y3A', true),
('Joel M. Hartman', 18, 'montes.nascetur@odiotristique.co.uk', 'c4Q27D7O', true),
('Elmo K. Greer', 18, 'risus.Duis@eget.ca', 'e3P92I7R', true);


-- 6 - A solicitação anterior não era a toa. O cliente acabou de mandar o primeiro usuario que ele precisa 
-- inativar. Sendo assim, você precisa atualizar o registro que possui o e-mail montes.nascetur@odiotristique.co.uk 
-- alterando a situação dele para falso.
update usuarios set situacao = false where email = 'montes.nascetur@odiotristique.co.uk';


-- 7 - Temos uma outra pequena demanda. O registro que possui o e-mail risus.Duis@eget.ca solicitou alteração da sua senha para k9P31H1O.
alter table usuarios drop column idade, add column data_nascimento date;
update usurarios set senha = 'k9P31H1O' where email = 'risus.Duis@eget.ca';


-- 8 - Nesse momento, foi solicitado de cada usuário que enviasse a data de nascimento para que fosse atualizada no banco 
-- de dados e até o momento apenas dois enviaram. Faça a atualização dos respectivos registros:

-- a) O registro que possui o e-mail auctor@duiFuscediam.edu nasceu em 1991-09-29; 
update usuarios set data_nascimento = '1991-09-29' where email = 'auctor@duiFuscediam.edu';
-- b) O registro que possui o e-mail nec.metus.facilisis@vitaealiquet.edu nasceu em 1988-11-02;
update usuarios set data_nascimento = '1988-11-02' where email = 'nec.metus.facilisis@vitaealiquet.edu'


-- 9 - Depois de tanto solicitar a data de nascimento para os usuários e até o momento somente dois enviaram, 
-- o cliente resolveu excluir definitivamente todos os registros que estão sem a data de nascimento. Esse Job precisa 
-- ser feito com muito cuidado, portanto, prossiga com cautela.
delete from usuarios where data_nascimento is null;
alter table usuarios alter column data_nascimento set not null;


-- 10 - Agora que a tabela de usuários parece ter ficado pronta, restaram apenas dois registros pendente de cadastro. 
-- Cadastre os registros a seguir para concluir seu Job.
insert into usuarios (nome, email, senha, situacao, data_nascimento) values
('Tate I. Dean', 'Nunc@etmagnis.edu', 'd3V25D6Y', true, '1989-05-01'),
('Arsenio K. Harmon', 'adipiscing.elit@turpis.com', 'm3T58S0C', true, '985-10-23');