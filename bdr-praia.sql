CREATE TABLE chat (
  idchat INTEGER   NOT NULL ,
  nome_chat VARCHAR(35),
PRIMARY KEY(idchat));




CREATE TABLE evento (
  idevento INTEGER   NOT NULL ,
  nome_evento VARCHAR(55),
PRIMARY KEY(idevento));




CREATE TABLE chamada (
  idchamada INTEGER   NOT NULL ,
  duracao TIME    ,
  dataChamada DATE   ,
  participantes INT    ,
  estado BOOL      ,
PRIMARY KEY(idchamada));




CREATE TABLE cargo (
  idcargo INTEGER   NOT NULL ,
  nome VARCHAR(35)      ,
PRIMARY KEY(idcargo));




CREATE TABLE mensagem (
  idmensagem INTEGER   NOT NULL,
  chat_idchat INTEGER   NOT NULL,
  imagem BLOB,
  texto VARCHAR(35),
PRIMARY KEY(idmensagem),
  FOREIGN KEY(chat_idchat)
    REFERENCES chat(idchat));


CREATE INDEX fk_mensagem ON mensagem (chat_idchat);


CREATE INDEX IFK_Rel_21 ON mensagem (chat_idchat);


CREATE TABLE usuario (
  idusuario INTEGER   NOT NULL ,
  cargo_idcargo INTEGER   NOT NULL ,
  nome VARCHAR(55)    ,
  email VARCHAR(55)    ,
  nascimento DATE      ,
PRIMARY KEY(idusuario)  ,
  FOREIGN KEY(cargo_idcargo)
    REFERENCES cargo(idcargo));


CREATE INDEX fk_cargo ON usuario (cargo_idcargo);


CREATE INDEX IFK_possui ON usuario (cargo_idcargo);


CREATE TABLE historico_mensagem (
  idhistoricoM INTEGER   NOT NULL ,
  mensagem_idmensagem INTEGER   NOT NULL   ,
PRIMARY KEY(idhistoricoM)  ,
  FOREIGN KEY(mensagem_idmensagem)
    REFERENCES mensagem(idmensagem));


CREATE INDEX fk_mensagem ON historico_mensagem (mensagem_idmensagem);


CREATE INDEX IFK_possui ON historico_mensagem (mensagem_idmensagem);


CREATE TABLE historico_chamada (
  idhistoricoC INTEGER   NOT NULL ,
  chamada_idchamada INTEGER   NOT NULL   ,
PRIMARY KEY(idhistoricoC)  ,
  FOREIGN KEY(chamada_idchamada)
    REFERENCES chamada(idchamada));


CREATE INDEX fk_chamada ON historico_chamada (chamada_idchamada);


CREATE INDEX IFK_possui ON historico_chamada (chamada_idchamada);


CREATE TABLE amizade (
  id_amigo INTEGER   NOT NULL ,
  usuario_idusuario INTEGER   NOT NULL   ,
PRIMARY KEY(id_amigo, usuario_idusuario)    ,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario),
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario));


CREATE INDEX fk_usuario ON amizade (usuario_idusuario);
CREATE INDEX fk_usuario2 ON amizade (usuario_idusuario);


CREATE INDEX IFK_possui ON amizade (usuario_idusuario);
CREATE INDEX IFK_possui ON amizade (usuario_idusuario);


CREATE TABLE Sala (
  idSala INTEGER   NOT NULL ,
  evento_idevento INTEGER   NOT NULL ,
  chat_idchat INTEGER   NOT NULL ,
  dataCriacao DATE    ,
  criador VARCHAR(35)    ,
  nomeSala VARCHAR(35)      ,
PRIMARY KEY(idSala)    ,
  FOREIGN KEY(chat_idchat)
    REFERENCES chat(idchat),
  FOREIGN KEY(evento_idevento)
    REFERENCES evento(idevento));


CREATE INDEX fk_chat ON Sala (chat_idchat);
CREATE INDEX fk_evento ON Sala (evento_idevento);


CREATE INDEX IFK_tem ON Sala (chat_idchat);
CREATE INDEX IFK_Rel_13 ON Sala (evento_idevento);


CREATE TABLE Sala_chamada (
  Sala_idSala INTEGER   NOT NULL ,
  chamada_idchamada INTEGER   NOT NULL   ,
PRIMARY KEY(Sala_idSala, chamada_idchamada)    ,
  FOREIGN KEY(Sala_idSala)
    REFERENCES Sala(idSala),
  FOREIGN KEY(chamada_idchamada)
    REFERENCES chamada(idchamada));


CREATE INDEX fk_sala ON Sala_chamada (Sala_idSala);
CREATE INDEX fk_chamada ON Sala_chamada (chamada_idchamada);


CREATE INDEX IFK_realiza ON Sala_chamada (Sala_idSala);
CREATE INDEX IFK_possui ON Sala_chamada (chamada_idchamada);


CREATE TABLE sala_usuario (
  Sala_idsala INTEGER   NOT NULL ,
  usuario_idusuario INTEGER   NOT NULL   ,
PRIMARY KEY(Sala_idsala, usuario_idusuario)    ,
  FOREIGN KEY(Sala_idsala)
    REFERENCES Sala(idsala),
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario));


CREATE INDEX fk_sala ON sala_usuario (Sala_idsala);
CREATE INDEX fk_usuario ON sala_usuario (usuario_idusuario);


CREATE INDEX IFK_possui ON sala_usuario (Sala_idsala);
CREATE INDEX IFK_possui ON sala_usuario (usuario_idusuario);



