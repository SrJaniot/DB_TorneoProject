--DDL CREADO POR Esteban Francisco Janiot Rivera y Jessenya Vanessa Sanabria Alvarez, 2023-12-08 4:38:00 a.m.
DROP TYPE IF EXISTS equipoFULL_result CASCADE;
DROP TYPE IF EXISTS jugador_result CASCADE;
DROP TYPE IF EXISTS jugador_perfil CASCADE;



DROP TABLE IF EXISTS tab_usuario_torneo; --TABLA INTERMEDIA
DROP TABLE IF EXISTS tab_equipo_torneo; --TABLA INTERMEDIA
DROP TABLE IF EXISTS tab_jugador_equipo; --TABLA INTERMEDIA
DROP TABLE IF EXISTS tab_usuario_evento; --TABLA INTERMEDIA
DROP TABLE IF EXISTS tab_match; --TABLA PRINCIPAL PARTIDO
DROP TABLE IF EXISTS tab_torneo; --TABLA PRINCIPAL TORNEO
DROP TABLE IF EXISTS tab_equipo; --TABLA PRINCIPAL EQUIPO
DROP TABLE IF EXISTS tab_jugador; --TABLA PRINCIPAL JUGADOR
DROP TABLE IF EXISTS tab_datosPersonales; --TABLA PRINCIPAL DATOS PERSONALES
DROP TABLE IF EXISTS tab_game; --TABLA PRINCIPAL GAME INDEPENDIENTE
DROP TABLE IF EXISTS tab_ciudad; --TABLA PRINCIPAL CIUDAD
DROP TABLE IF EXISTS tab_tipodocumento; --TABLA PRINCIPAL tipodoc
DROP TABLE IF EXISTS tab_borrados; --TABLA PRINCIPAL BORRADOS AUDITORIA
DROP TABLE IF EXISTS tab_evento; --TABLA PRINCIPAL EVENTO

--CREACION DE TABLAS------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE tab_borrados -- ELIMINADOS (LLEVA EL REGISTRO EN UNA TABLA)
(
    id_consec       INTEGER     NOT NULL CHECK(id_consec>0),
    nom_tabla       VARCHAR     NOT NULL,
    usr_delete      VARCHAR     NOT NULL,
    fec_delete      TIMESTAMP WITHOUT TIME ZONE NOT NULL,

    PRIMARY KEY(id_consec)
);

CREATE TABLE tab_ciudad -- CIUDAD
(
    id_ciudad       INTEGER     NOT NULL CHECK(id_ciudad>0),
    nom_ciudad      VARCHAR     NOT NULL,
    desc_ciudad     VARCHAR     NOT NULL,
    user_insert     VARCHAR,--     NOT NULL,
	user_update     VARCHAR,
	date_insert     TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
	date_update     TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_ciudad)
);
CREATE TABLE tab_tipodocumento -- tipodocumento
(
    id_documento       INTEGER     NOT NULL CHECK(id_documento>0),
    nom_documento      VARCHAR     NOT NULL,
    desc_documento    VARCHAR     NOT NULL,
    user_insert     VARCHAR,--     NOT NULL,
	user_update     VARCHAR,
	date_insert     TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
	date_update     TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_documento)
);

CREATE TABLE tab_game -- GAME
(
    id_game         INTEGER     NOT NULL CHECK(id_game>0),
    nom_game        VARCHAR     NOT NULL,
    desc_game       VARCHAR     NOT NULL,
    tamanio_equipos INTEGER     NOT NULL,
    estado_game     BOOLEAN     NOT NULL default TRUE, -- TRUE = ACTIVO, FALSE = INACTIVO
    foto_logo_game  VARCHAR     NOT NULL,
    user_insert     VARCHAR,--     NOT NULL,
    user_update     VARCHAR,
    date_insert     TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update     TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_game)
);

CREATE TABLE tab_datosPersonales -- DATOS PERSONALES
(
    id_datos                INTEGER     NOT NULL CHECK(id_datos>0),
    nombre_jugador          VARCHAR     NOT NULL,
    edad_jugador            INTEGER     NOT NULL,
    tel_jugador             VARCHAR     NOT NULL,
    correo_jugador          VARCHAR     NOT NULL,
    foto_perfil_jugador     VARCHAR,
    id_ciudad               INTEGER     NOT NULL CHECK(id_ciudad>0),
    id_tipo_documento       INTEGER     NOT NULL,
    num_documento           VARCHAR     NOT NULL,
    user_insert             VARCHAR,     --NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_datos),
    FOREIGN KEY(id_ciudad) REFERENCES tab_ciudad(id_ciudad),
    FOREIGN KEY(id_tipo_documento) REFERENCES tab_tipodocumento(id_documento)

    
);

CREATE TABLE tab_jugador -- JUGADOR
(
    id_jugador              INTEGER     NOT NULL CHECK(id_jugador>0),
    id_datos                INTEGER     NOT NULL CHECK(id_datos>0),
    nickname_jugador        VARCHAR     NOT NULL,
    liga_jugador            VARCHAR     NOT NULL,
    estado_jugador          BOOLEAN     NOT NULL default TRUE, -- TRUE = ACTIVO, FALSE = INACTIVO 
    link_cuenta_jugador     VARCHAR     NOT NULL,
    id_game                 INTEGER     NOT NULL CHECK(id_game>0),
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_jugador),
    FOREIGN KEY(id_datos) REFERENCES tab_datosPersonales(id_datos),
    FOREIGN KEY(id_game) REFERENCES tab_game(id_game)
);

CREATE TABLE tab_equipo -- EQUIPO
(
    id_equipo               INTEGER     NOT NULL CHECK(id_equipo>0),
    nom_equipo              VARCHAR     NOT NULL,
    desc_equipo             VARCHAR     NOT NULL,
    foto_equipo             VARCHAR     NOT NULL,
    id_game                 INTEGER     NOT NULL CHECK(id_game>0),
    estado_equipo           BOOLEAN     NOT NULL default TRUE, -- TRUE = ACTIVO, FALSE = INACTIVO
    tamanio_equipo          INTEGER     NOT NULL,
    lider_equipo            INTEGER     NOT NULL,
    numero_torneos_ganados  INTEGER     NOT NULL default 0,
    hash_equipo             VARCHAR     NOT NULL,
    user_insert             VARCHAR,    -- NOT NULL  ,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL ,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_equipo),
    FOREIGN KEY(id_game) REFERENCES tab_game(id_game),
    FOREIGN KEY(lider_equipo) REFERENCES tab_jugador(id_jugador)
);

CREATE TABLE tab_evento -- EVENTO
(
    id_evento               INTEGER     NOT NULL CHECK(id_evento>0),
    nom_evento              VARCHAR     NOT NULL,
    desc_evento             VARCHAR     NOT NULL,
    fecha_inicio_evento     TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    fecha_fin_evento        TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    foto_evento             VARCHAR     NOT NULL,
    premio_evento_1         VARCHAR     NOT NULL,
    premio_evento_2         VARCHAR     NOT NULL,
    premio_evento_3         VARCHAR     NOT NULL,
    video_explica_evento    VARCHAR     NOT NULL,
    cantidad_personas       INTEGER     NOT NULL,
    valor_dinero_evento     INTEGER     NOT NULL,
    estado_evento           INTEGER     NOT NULL default 1, -- 1 = inscirbir, 2  = cerrado
    --variables extras
    informacion_general     VARCHAR     NOT NULL,
    informacion_reglas      VARCHAR     NOT NULL,
    foto_premio_evento_1    VARCHAR     NOT NULL,
    foto_premio_evento_2    VARCHAR     NOT NULL,
    foto_premio_evento_3    VARCHAR     NOT NULL,
    foto_carta_fondo        VARCHAR     NOT NULL,
    foto_carta_titulo       VARCHAR     NOT NULL,
    foto_carta_personaje    VARCHAR     NOT NULL,
    --variables de auditoria
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_evento)
);


CREATE TABLE tab_torneo -- TORNEO
(
    id_torneo               INTEGER     NOT NULL CHECK(id_torneo>0),
    nom_torneo              VARCHAR     NOT NULL,
    desc_torneo             VARCHAR     NOT NULL,
    fecha_inicio_torneo     TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    fecha_fin_torneo        TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    foto_torneo             VARCHAR     NOT NULL,
    premio_torneo_1         VARCHAR     NOT NULL,
    premio_torneo_2         VARCHAR     NOT NULL,
    premio_torneo_3         VARCHAR     NOT NULL,
    video_explica_torneo    VARCHAR     NOT NULL,
    cantidad_equipos        INTEGER     NOT NULL,
    cantidad_match          INTEGER     NOT NULL,
    valor_dinero_torneo     INTEGER     NOT NULL,
    id_game                 INTEGER     NOT NULL CHECK(id_game>0),
    estado_torneo           INTEGER     NOT NULL default 1, -- 1 = ACTIVO, 2 = EN JUEGO , 3 = FINALIZADO
    --variables extras
    informacion_general     VARCHAR     NOT NULL,
    informacion_reglas      VARCHAR     NOT NULL,
    foto_premio_torneo_1    VARCHAR     NOT NULL,
    foto_premio_torneo_2    VARCHAR     NOT NULL,
    foto_premio_torneo_3    VARCHAR     NOT NULL,
    foto_carta_fondo        VARCHAR     NOT NULL,
    foto_carta_titulo       VARCHAR     NOT NULL,
    foto_carta_personaje    VARCHAR     NOT NULL,
    id_evento               INTEGER     NOT NULL CHECK(id_evento>0),
    --variables de auditoria
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_torneo),
    FOREIGN KEY(id_game) REFERENCES tab_game(id_game),
    FOREIGN KEY(id_evento) REFERENCES tab_evento(id_evento)
);


CREATE TABLE tab_match --Match (partidas del arbol)
(
    id_match                INTEGER     NOT NULL CHECK(id_match>0),
    id_torneo               INTEGER     NOT NULL CHECK(id_torneo>0),
    id_equipo1              INTEGER     CHECK(id_equipo1>0),
    id_equipo2              INTEGER     CHECK(id_equipo2>0),
    estado_match            BOOLEAN     NOT NULL default TRUE, -- TRUE = ACTIVO, FALSE = INACTIVO
    nom_match               VARCHAR     NOT NULL,
    desc_match              VARCHAR     NOT NULL,
    Fecha_match             TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    resultado_match         VARCHAR     ,
    ganador_match           INTEGER     ,
    perdedor_match          INTEGER     ,
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_match),
    FOREIGN KEY(id_torneo) REFERENCES tab_torneo(id_torneo),
    FOREIGN KEY(id_equipo1) REFERENCES tab_equipo(id_equipo),
    FOREIGN KEY(id_equipo2) REFERENCES tab_equipo(id_equipo),
    FOREIGN KEY(ganador_match) REFERENCES tab_equipo(id_equipo),
    FOREIGN KEY(perdedor_match) REFERENCES tab_equipo(id_equipo)
  
);

CREATE TABLE tab_jugador_equipo -- TABLA INTERMEDIA JUGADOR EQUIPO
(
    id_jugador_equipo       INTEGER     NOT NULL CHECK(id_jugador_equipo>0),
    id_jugador              INTEGER     NOT NULL CHECK(id_jugador>0),
    id_equipo               INTEGER     NOT NULL CHECK(id_equipo>0),
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_jugador_equipo),
    FOREIGN KEY(id_jugador) REFERENCES tab_jugador(id_jugador),
    FOREIGN KEY(id_equipo) REFERENCES tab_equipo(id_equipo)
);

CREATE TABLE tab_equipo_torneo -- TABLA INTERMEDIA EQUIPO TORNEO
(
    id_equipo_torneo        INTEGER     NOT NULL CHECK(id_equipo_torneo>0),
    id_equipo               INTEGER     NOT NULL CHECK(id_equipo>0),
    id_torneo               INTEGER     NOT NULL CHECK(id_torneo>0),
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_equipo_torneo),
    FOREIGN KEY(id_equipo) REFERENCES tab_equipo(id_equipo),
    FOREIGN KEY(id_torneo) REFERENCES tab_torneo(id_torneo)
);

CREATE TABLE tab_usuario_torneo -- TABLA INTERMEDIA USUARIO TORNEO
(
    id_usuario_torneo       INTEGER     NOT NULL CHECK(id_usuario_torneo>0),
    id_torneo               INTEGER     NOT NULL CHECK(id_torneo>0),
    id_datos_persona        INTEGER     NOT NULL CHECK(id_datos_persona>0),
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_usuario_torneo),
    FOREIGN KEY(id_torneo) REFERENCES tab_torneo(id_torneo),
    FOREIGN KEY(id_datos_persona) REFERENCES tab_datosPersonales(id_datos)
);

CREATE TABLE tab_usuario_evento
(
    id_usuario_evento       INTEGER     NOT NULL CHECK(id_usuario_evento>0),
    id_evento               INTEGER     NOT NULL CHECK(id_evento>0),
    id_datos_persona        INTEGER     NOT NULL CHECK(id_datos_persona>0),
    hash_usuario_evento     VARCHAR     NOT NULL,
    asistencia              BOOLEAN     NOT NULL default FALSE, -- TRUE = ASISTIO, FALSE = NO ASISTIO
    user_insert             VARCHAR,--     NOT NULL,
    user_update             VARCHAR,
    date_insert             TIMESTAMP WITHOUT TIME ZONE,-- NOT NULL,
    date_update             TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY(id_usuario_evento),
    FOREIGN KEY(id_evento) REFERENCES tab_evento(id_evento),
    FOREIGN KEY(id_datos_persona) REFERENCES tab_datosPersonales(id_datos)
);



















