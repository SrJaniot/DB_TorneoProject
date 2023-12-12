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


--FUNCIONES PARA LA TABLA tab_datosPersonales -------------------------------------------------------------------------------------------------------------------------------------------------------------
--VALIDAR ATRIBUTOS DE LA TABLA tab_datosPersonales

CREATE OR REPLACE FUNCTION fun_validar_datosPersonales_insert(wnombre_jugador tab_datosPersonales.nombre_jugador%TYPE, wedad_jugador tab_datosPersonales.edad_jugador%TYPE,
                             wtel_jugador tab_datosPersonales.tel_jugador%TYPE,wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE,
                             wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE,wid_ciudad tab_datosPersonales.id_ciudad%type) RETURNS BOOLEAN AS
$$
     DECLARE TAMANIO_NOMBRE INTEGER;
     DECLARE TAMANIO_NUM_TELEFONO INTEGER;
     DECLARE ES_CORREO BOOLEAN;
     DECLARE ID_CIUDAD_ENCONTRADA tab_ciudad.id_ciudad%TYPE;
     DECLARE CIUDAD_ENCONTRADA BOOLEAN := FALSE;

    BEGIN
        SELECT CHAR_LENGTH(wnombre_jugador)INTO TAMANIO_NOMBRE;
        SELECT CHAR_LENGTH(CAST(wtel_jugador AS CHAR)) INTO TAMANIO_NUM_TELEFONO;  
        IF REGEXP_LIKE(wcorreo_jugador, '[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}') THEN
            ES_CORREO := TRUE;
        ELSE
            ES_CORREO := FALSE;
        END IF;
        SELECT id_ciudad INTO ID_CIUDAD_ENCONTRADA FROM tab_ciudad WHERE tab_ciudad.id_ciudad = wid_ciudad;
        IF ID_CIUDAD_ENCONTRADA IS NOT NULL THEN
             CIUDAD_ENCONTRADA = TRUE;
        END IF;


        --ESTE IF TIENE QUE VALIDAR : TAMANIONOMBRE>2, WEDAD_JUGADOR=>18  TAMANIO_NUM_TELEFONO=10,ES_CORREO=TRUE, CIUDAD_ENCONTRADA=TRUE 
        IF TAMANIO_NOMBRE>2 AND wedad_jugador>=18 AND TAMANIO_NUM_TELEFONO=10 AND ES_CORREO AND CIUDAD_ENCONTRADA  THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;


--FUNCION PARA INSERTAR DATOS EN LA TABLA tab_datosPersonales CON PARAMETROS DE ENTRADA
CREATE OR REPLACE FUNCTION fun_insert_datosPersonales(wnombre_jugador tab_datosPersonales.nombre_jugador%TYPE, wedad_jugador tab_datosPersonales.edad_jugador%TYPE,
                             wtel_jugador tab_datosPersonales.tel_jugador%TYPE,wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE,
                             wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE,wid_ciudad tab_datosPersonales.id_ciudad%type) RETURNS BOOLEAN AS
$$
    DECLARE
        wnombre_jugador_aux tab_datosPersonales.nombre_jugador%TYPE;
        wtel_jugador_aux tab_datosPersonales.tel_jugador%TYPE;
        wcorreo_jugador_aux tab_datosPersonales.correo_jugador%TYPE;
        wfoto_perfil_jugador_aux tab_datosPersonales.foto_perfil_jugador%TYPE;
        ULTIMOID INTEGER;
    BEGIN
        SELECT UPPER(wnombre_jugador) INTO wnombre_jugador_aux;
        SELECT CAST(wtel_jugador AS CHAR) INTO wtel_jugador_aux;
        SELECT LOWER(wcorreo_jugador) INTO wcorreo_jugador_aux;
        SELECT funcion_Retorna_ultmoid('tab_datosPersonales','id_datosPersonales') INTO ULTIMOID;
        IF fun_validar_datosPersonales_insert(wnombre_jugador_aux, wedad_jugador,wtel_jugador_aux,wcorreo_jugador_aux,wfoto_perfil_jugador,wid_ciudad) THEN
            INSERT INTO tab_datosPersonales VALUES (ULTIMOID,wnombre_jugador_aux, wedad_jugador,wtel_jugador_aux,wcorreo_jugador_aux,wfoto_perfil_jugador,wid_ciudad);
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;





  
















