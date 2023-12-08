--FUNCIONES CREADAS POR ESTEBAN FRANCISCO JANIOT RIVERA, VANESSA SANABRIA
--CREADAS PARA EL PROYECTO DE TORNEOS

--FUNCIONES VALIDADORAS DE PARAMETROS DE ENTRADA PARA LA INSERCION DE DATOS EN LAS TABLAS
--VALIDADORAS TRUE=CORRECTO, FALSE=INCORRECTO


-- ALL VARCHAR VA EN MAYUSCULA MENOS FOTOS Y ARCHIVOS


--FUNCIONES PARA LA TABLA CIUDAD tab_ciudad -------------------------------------------------------------------------------------------------------------------------------------------------------------

--VALIDAR ATRIBUTOS DE LA TABLA CIUDAD

CREATE OR REPLACE FUNCTION fun_validar_ciudad_insert(wnom_ciudad tab_ciudad.nom_ciudad%TYPE, wdesc_ciudad tab_ciudad.desc_ciudad%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE nombre_ciudad_encontrado tab_ciudad.nom_ciudad%TYPE;
    BEGIN
        SELECT UPPER(wnom_ciudad) INTO wnom_ciudad;
        SELECT nom_ciudad INTO nombre_ciudad_encontrado FROM tab_ciudad WHERE tab_ciudad.nom_ciudad = wnom_ciudad;
        IF nombre_ciudad_encontrado IS NULL THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;

--FUNCION PARA INSERTAR DATOS EN LA TABLA CIUDAD CON PARAMETROS DE ENTRADA
CREATE OR REPLACE FUNCTION fun_insert_ciudad(wnom_ciudad tab_ciudad.nom_ciudad%TYPE, wdesc_ciudad tab_ciudad.desc_ciudad%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        wnom_ciudad_aux tab_ciudad.nom_ciudad%TYPE;
        wdesc_ciudad_aux tab_ciudad.desc_ciudad%TYPE;
        ULTIMOID INTEGER;
    BEGIN
        SELECT UPPER(wnom_ciudad) INTO wnom_ciudad_aux;
        SELECT UPPER(wdesc_ciudad) INTO wdesc_ciudad_aux;
        SELECT funcion_Retorna_ultmoid('tab_ciudad','id_ciudad') INTO ULTIMOID;
        IF fun_validar_ciudad_insert(wnom_ciudad_aux, wdesc_ciudad_aux) THEN
            INSERT INTO tab_ciudad VALUES (ULTIMOID,wnom_ciudad_aux, wdesc_ciudad_aux);
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;



--FUNCIONES PARA LA TABLA GAME tab_game -------------------------------------------------------------------------------------------------------------------------------------------------------------
--VALIDAR ATRIBUTOS DE LA TABLA GAME

CREATE OR REPLACE FUNCTION fun_validar_game_insert(wnom_game tab_game.nom_game%TYPE, wdesc_game tab_game.desc_game%TYPE,
                             wtamanio_equipos tab_game.tamanio_equipos%TYPE,wfoto_logo_game tab_game.foto_logo_game%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE nombre_game_encontrado tab_game.nom_game%TYPE;
    BEGIN
        SELECT UPPER(wnom_game) INTO wnom_game;
        SELECT nom_game INTO nombre_game_encontrado FROM tab_game WHERE tab_game.nom_game = wnom_game;

        IF nombre_game_encontrado IS NULL AND (wtamanio_equipos >=1 AND wtamanio_equipos <=10) THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;

--FUNCION PARA INSERTAR DATOS EN LA TABLA GAME CON PARAMETROS DE ENTRADA
CREATE OR REPLACE FUNCTION fun_insert_game(wnom_game tab_game.nom_game%TYPE, wdesc_game tab_game.desc_game%TYPE,
                             wtamanio_equipos tab_game.tamanio_equipos%TYPE,wfoto_logo_game tab_game.foto_logo_game%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        wnom_game_aux tab_game.nom_game%TYPE;
        wdesc_game_aux tab_game.desc_game%TYPE;
        ULTIMOID INTEGER;
    BEGIN
        SELECT UPPER(wnom_game) INTO wnom_game_aux;
        SELECT UPPER(wdesc_game) INTO wdesc_game_aux;
        SELECT funcion_Retorna_ultmoid('tab_game','id_game') INTO ULTIMOID;

        IF fun_validar_game_insert(wnom_game_aux, wdesc_game_aux,wtamanio_equipos,wfoto_logo_game) THEN
            INSERT INTO tab_game VALUES (ULTIMOID,wnom_game_aux, wdesc_game_aux,wtamanio_equipos,TRUE,wfoto_logo_game);
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;













