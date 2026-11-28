/* bd_ifitness_logico: */

CREATE TABLE Usuario (
    Id_CPF varchar(11) PRIMARY KEY,
    Nome varchar(50),
    Senha varchar(40),
    Email varchar(40),
    Telefone varchar(20),
    Data_nascimento DATE,
    Tipo varchar(255),
    Ativo BOOLEAN,
    Criado_em DATETIME
);

CREATE TABLE Planos (
    Id_Plano int PRIMARY KEY,
    nome varchar(20),
    valor_mensal DECIMAL(5,2),
    Fidelidade_meses int,
    Convidados_mes int,
    Beneficios varchar(120),
    Ativo_Planos int
);

CREATE TABLE Matriculas (
    Id_Matricula int PRIMARY KEY,
    Data_inicio DATETIME,
    Data_fim DATETIME,
    Status_matriculas BOOLEAN,
    fk_Usuario_Id_CPF varchar(11),
    fk_Planos_Id_Plano int
);

CREATE TABLE Modalidades (
    Id_Modalidades int PRIMARY KEY,
    Nome varchar(50),
    Descricao varchar(120),
    Ativa BOOLEAN
);

CREATE TABLE Grade_Horarios (
    Id_GradeHorario int PRIMARY KEY,
    Dia_semana int(7),
    Hora_inicio TIME,
    Hora_fim TIME,
    Vagas_maximas int(500),
    fk_Usuario_Id_CPF varchar(11),
    fk_Modalidades_Id_Modalidades int
);

CREATE TABLE Agendamentos_experimentais (
    ID_AgendamentosExpe int PRIMARY KEY,
    Nome_lead varchar(50),
    Status_agendamentoExpe BOOLEAN,
    Turno_preferido varchar(12),
    Criado_em_AgendamentosExpe DATETIME,
    fk_Modalidades_Id_Modalidades int
);

CREATE TABLE Avaliacoes_Fisicas (
    Id_AvaliacaoFisica int PRIMARY KEY,
    data_avaliacao DATETIME,
    peso_kg DECIMAL(5,2),
    altura_m DECIMAL(3,2),
    IMC DECIMAL(5,2),
    percentual_gordura DECIMAL(4,2),
    observacoes varchar(120),
    fk_aluno_CPF varchar(11),
    fk_instrutor_CPF varchar(11)
);

CREATE TABLE Fichas_Treino (
    Id_FichaTreino int PRIMARY KEY,
    Titulo varchar(50),
    Objetivo varchar(120),
    data_criacao DATETIME,
    Ativa_FichasTreinos BOOLEAN,
    fk_aluno_CPF varchar(11),
    fk_instrutor_CPF varchar(11)
);

CREATE TABLE Exercicios (
    Id_Exercicios int PRIMARY KEY,
    Nome_exercicio varchar(50),
    Grupo_muscular varchar(50)
);

CREATE TABLE Depoimentos (
    Id_depoimento int PRIMARY KEY,
    nome_exibicao varchar(50),
    texto varchar(120),
    Aprovado BOOLEAN,
    nota DECIMAL(4,2),
    Criado_em_depoimento DATETIME,
    fk_Usuario_Id_CPF varchar(11)
);

CREATE TABLE item_ficha_contem (
    series int,
    repeticoes int,
    descanso_segundos int,
    observacao varchar(120),
    fk_Exercicios_Id_Exercicios int,
    fk_Fichas_Treino_Id_FichaTreino int
);
 
ALTER TABLE Matriculas ADD CONSTRAINT FK_Matriculas_2
    FOREIGN KEY (fk_Usuario_Id_CPF)
    REFERENCES Usuario (Id_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Matriculas ADD CONSTRAINT FK_Matriculas_3
    FOREIGN KEY (fk_Planos_Id_Plano)
    REFERENCES Planos (Id_Plano)
    ON DELETE CASCADE;
 
ALTER TABLE Grade_Horarios ADD CONSTRAINT FK_Grade_Horarios_2
    FOREIGN KEY (fk_Usuario_Id_CPF)
    REFERENCES Usuario (Id_CPF)
    ON DELETE SET NULL;
 
ALTER TABLE Grade_Horarios ADD CONSTRAINT FK_Grade_Horarios_3
    FOREIGN KEY (fk_Modalidades_Id_Modalidades)
    REFERENCES Modalidades (Id_Modalidades)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamentos_experimentais ADD CONSTRAINT FK_Agendamentos_experimentais_2
    FOREIGN KEY (fk_Modalidades_Id_Modalidades)
    REFERENCES Modalidades (Id_Modalidades)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacoes_Fisicas ADD CONSTRAINT FK_Avaliacoes_Fisicas_2
    FOREIGN KEY (fk_aluno_CPF, fk_instrutor_CPF)
    REFERENCES Usuario (Id_CPF, Id_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Fichas_Treino ADD CONSTRAINT FK_Fichas_Treino_2
    FOREIGN KEY (fk_aluno_CPF, fk_instrutor_CPF)
    REFERENCES Usuario (Id_CPF, Id_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Depoimentos ADD CONSTRAINT FK_Depoimentos_2
    FOREIGN KEY (fk_Usuario_Id_CPF)
    REFERENCES Usuario (Id_CPF)
    ON DELETE SET NULL;
 
ALTER TABLE item_ficha_contem ADD CONSTRAINT FK_item_ficha_contem_1
    FOREIGN KEY (fk_Exercicios_Id_Exercicios)
    REFERENCES Exercicios (Id_Exercicios);
 
ALTER TABLE item_ficha_contem ADD CONSTRAINT FK_item_ficha_contem_2
    FOREIGN KEY (fk_Fichas_Treino_Id_FichaTreino)
    REFERENCES Fichas_Treino (Id_FichaTreino);