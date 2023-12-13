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
            IF FOUND THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
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
            IF FOUND THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
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
        SELECT CHAR_LENGTH(wtel_jugador) INTO TAMANIO_NUM_TELEFONO;  
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
CREATE OR REPLACE FUNCTION fun_insert_datosPersonales(WULTIMOID tab_datosPersonales.id_datos%TYPE,wnombre_jugador tab_datosPersonales.nombre_jugador%TYPE,
                             wedad_jugador tab_datosPersonales.edad_jugador%TYPE,
                             wtel_jugador tab_datosPersonales.tel_jugador%TYPE,wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE,
                             wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE,wid_ciudad tab_datosPersonales.id_ciudad%type) RETURNS BOOLEAN AS
$$
    DECLARE
        wnombre_jugador_aux tab_datosPersonales.nombre_jugador%TYPE;
        wcorreo_jugador_aux tab_datosPersonales.correo_jugador%TYPE;

    BEGIN
        SELECT UPPER(wnombre_jugador) INTO wnombre_jugador_aux;
        SELECT LOWER(wcorreo_jugador) INTO wcorreo_jugador_aux;


        RAISE NOTICE 'NOMBRE: %',wnombre_jugador_aux;
        RAISE NOTICE 'EDAD: %',wedad_jugador;
        RAISE NOTICE 'TELEFONO: %',wtel_jugador;
        RAISE NOTICE 'CORREO: %',wcorreo_jugador_aux;
        RAISE NOTICE 'FOTO: %',wfoto_perfil_jugador;
        RAISE NOTICE 'ID CIUDAD: %',wid_ciudad;

         
        
      
        IF fun_validar_datosPersonales_insert(wnombre_jugador_aux, wedad_jugador,wtel_jugador,wcorreo_jugador_aux,wfoto_perfil_jugador,wid_ciudad) THEN
            RAISE NOTICE 'ATRIBUTOS INSERTADOS CORRECTAMENTE';
            INSERT INTO tab_datosPersonales VALUES (WULTIMOID,wnombre_jugador_aux, wedad_jugador,wtel_jugador,wcorreo_jugador_aux,wfoto_perfil_jugador,wid_ciudad);
            IF FOUND THEN
                RAISE NOTICE 'ATRIBUTOS INSERTADOS CORRECTAMENTE';
                RETURN TRUE;
            ELSE
                RAISE NOTICE 'ATRIBUTOS INSERTADOS INCORRECTAMENTE';
                RETURN FALSE;
            END IF;
        ELSE
            RAISE NOTICE 'ATRIBUTOS INSERTADOS INCORRECTAMENTE';
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;

--FUNCIONES PARA LA TABLA tab_jugador -------------------------------------------------------------------------------------------------------------------------------------------------------------
--VALIDAR ATRIBUTOS DE LA TABLA tab_jugador

CREATE OR REPLACE FUNCTION fun_validar_jugador_insert(wid_datos tab_jugador.id_datos%TYPE, wnickname_jugador tab_jugador.nickname_jugador%TYPE,
                             wliga_jugador tab_jugador.liga_jugador%TYPE,wlink_cuenta_jugador tab_jugador.link_cuenta_jugador%TYPE,
                             wid_game tab_jugador.id_game%TYPE) RETURNS BOOLEAN AS
$$

     DECLARE ID_DATOS_ENCONTRADA tab_jugador.id_datos%TYPE;
     DECLARE DATOS_ENCONTRADA BOOLEAN := FALSE;
     DECLARE TAMANIO_NICKNAME INTEGER;
     DECLARE TAMANIO_LIGAJUGADOR INTEGER;
     DECLARE ID_GAME_ENCONTRADA tab_jugador.id_datos%TYPE;
     DECLARE GAME_ENCONTRADA BOOLEAN := FALSE;


    BEGIN
        SELECT a.id_datos INTO ID_DATOS_ENCONTRADA FROM tab_datosPersonales a WHERE a.id_datos = wid_datos;
        IF ID_DATOS_ENCONTRADA IS NOT NULL THEN
             DATOS_ENCONTRADA = TRUE;
        END IF;
        SELECT CHAR_LENGTH(wnickname_jugador)INTO TAMANIO_NICKNAME;
        SELECT CHAR_LENGTH(wliga_jugador)INTO TAMANIO_LIGAJUGADOR;
        SELECT id_game INTO ID_GAME_ENCONTRADA FROM tab_game WHERE tab_game.id_game = wid_game;
        IF ID_GAME_ENCONTRADA IS NOT NULL THEN
             GAME_ENCONTRADA = TRUE;
        END IF;

        --ESTE IF TIENE QUE VALIDAR : DATOS_ENCONTRADA=TRUE,  TAMANIO_NICKNAME>2  TAMANIO_LIGAJUGADOR>2,  GAME_ENCONTRADA=TRUE 
        IF DATOS_ENCONTRADA=TRUE AND TAMANIO_NICKNAME>2 AND TAMANIO_LIGAJUGADOR>2 AND GAME_ENCONTRADA=TRUE  THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;



--FUNCION PARA INSERTAR DATOS EN LA TABLA tab_jugador CON PARAMETROS DE ENTRADA mas la tabla tab_datosPersonales
CREATE OR REPLACE FUNCTION fun_insert_jugador_datospersonales(wnombre_jugador tab_datosPersonales.nombre_jugador%TYPE, wedad_jugador tab_datosPersonales.edad_jugador%TYPE,
                             wtel_jugador tab_datosPersonales.tel_jugador%TYPE,wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE,
                             wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE,wid_ciudad tab_datosPersonales.id_ciudad%type,

                             wnickname_jugador tab_jugador.nickname_jugador%TYPE,
                             wliga_jugador tab_jugador.liga_jugador%TYPE,wlink_cuenta_jugador tab_jugador.link_cuenta_jugador%TYPE,
                             wid_game tab_jugador.id_game%TYPE) RETURNS BOOLEAN AS
$$
   DECLARE ULTIMOID_DATOSPERSONALES INTEGER;
   DECLARE ULTIMOID_JUGADOR INTEGER;
       
    BEGIN
        SELECT funcion_Retorna_ultmoid('tab_datosPersonales','id_datos') INTO ULTIMOID_DATOSPERSONALES;
        IF fun_insert_datosPersonales(ULTIMOID_DATOSPERSONALES,wnombre_jugador, wedad_jugador,wtel_jugador,wcorreo_jugador,wfoto_perfil_jugador,wid_ciudad) THEN
           RAISE NOTICE 'DATOS PERSONALES ATRIBUTOS INSERTADOS CORRECTAMENTE';
            IF fun_validar_jugador_insert(ULTIMOID_DATOSPERSONALES, wnickname_jugador,wliga_jugador,wlink_cuenta_jugador,wid_game) THEN
                RAISE NOTICE 'JUGADOR ATRIBUTOS INSERTADO CORRECTAMENTE';
                -- ANTES DE INSERTAR CONVERTIR A MAYUSCULA
                SELECT UPPER(wnickname_jugador) INTO wnickname_jugador;
                SELECT UPPER(wliga_jugador) INTO wliga_jugador;
                SELECT LOWER(wlink_cuenta_jugador) INTO wlink_cuenta_jugador;
                SELECT funcion_Retorna_ultmoid('tab_jugador','id_jugador') INTO ULTIMOID_JUGADOR;
                INSERT INTO tab_jugador VALUES (ULTIMOID_JUGADOR,ULTIMOID_DATOSPERSONALES, wnickname_jugador,wliga_jugador,TRUE,wlink_cuenta_jugador,wid_game);
                IF FOUND THEN
                    RETURN TRUE;
                ELSE
                    RETURN FALSE;
                END IF;
            ELSE
                RAISE NOTICE 'JUGADOR ATRIBUTOS INSERTADO INCORRECTAMENTE';
                DELETE FROM tab_datosPersonales WHERE tab_datosPersonales.id_datos = ULTIMOID_DATOSPERSONALES;
                RAISE NOTICE 'DATOS PERSONALES ELIMINADOS CORRECTAMENTE';
                RETURN FALSE;
            END IF;
        ELSE
            RAISE NOTICE 'DATOS PERSONALES ATRIBUTOS INSERTADOS INCORRECTAMENTE';
            RETURN FALSE;
        END IF;
    END;      
$$
LANGUAGE plpgsql;


--FUNCIONES PARA LA TABLA tab_equipo -------------------------------------------------------------------------------------------------------------------------------------------------------------
--VALIDAR ATRIBUTOS DE LA TABLA tab_equipo
CREATE OR REPLACE FUNCTION fun_validar_equipo_insert(wnom_equipo tab_equipo.nom_equipo%TYPE, 
                            wid_game tab_equipo.id_game%TYPE) RETURNS BOOLEAN AS
$$     
        DECLARE TAMANIO_NOMBRE INTEGER;
        DECLARE NOMBRE_EQUIPO_ENCONTRADO tab_equipo.nom_equipo%TYPE;
        DECLARE EQUIPO_ENCONTRADO BOOLEAN := FALSE;
        DECLARE ID_GAME_ENCONTRADA tab_equipo.id_game%TYPE;
        DECLARE GAME_ENCONTRADA BOOLEAN := FALSE;
    
        BEGIN
            SELECT UPPER(wnom_equipo) INTO wnom_equipo;
            SELECT id_game INTO ID_GAME_ENCONTRADA FROM tab_game WHERE tab_game.id_game = wid_game;
            IF ID_GAME_ENCONTRADA IS NOT NULL THEN
                GAME_ENCONTRADA = TRUE;
                SELECT nom_equipo INTO NOMBRE_EQUIPO_ENCONTRADO FROM tab_equipo WHERE tab_equipo.nom_equipo = wnom_equipo AND tab_equipo.id_game = wid_game;
                IF NOMBRE_EQUIPO_ENCONTRADO IS NOT NULL THEN
                    EQUIPO_ENCONTRADO = TRUE;
                    RAISE NOTICE 'EQUIPO NOMBRE DUPLICADO';
                END IF;
            END IF;
            SELECT CHAR_LENGTH(wnom_equipo)INTO TAMANIO_NOMBRE;
            
    
            --ESTE IF TIENE QUE VALIDAR : TAMANIO_NOMBRE>2,  GAME_ENCONTRADA=TRUE , EQUIPO_ENCONTRADO = FALSE
            IF TAMANIO_NOMBRE>2 AND GAME_ENCONTRADA=TRUE AND EQUIPO_ENCONTRADO=FALSE THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
        END;
$$
LANGUAGE plpgsql;


--FUNCION PARA INSERTAR DATOS EN LA TABLA tab_equipo CON PARAMETROS DE ENTRADA
CREATE OR REPLACE FUNCTION fun_insert_equipo(wnom_equipo tab_equipo.nom_equipo%TYPE, wdesc_equipo tab_equipo.desc_equipo%TYPE,
                            wfoto_equipo tab_equipo.foto_equipo%TYPE,wid_game tab_equipo.id_game%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        wnom_equipo_aux tab_equipo.nom_equipo%TYPE;
        wfoto_equipo_aux tab_equipo.foto_equipo%TYPE;
        ULTIMOID INTEGER;
        TAMANIO_EQUIPO tab_equipo.tamanio_equipo%TYPE;
    BEGIN
        IF fun_validar_equipo_insert(wnom_equipo,wid_game) THEN
            SELECT funcion_Retorna_ultmoid('tab_equipo','id_equipo') INTO ULTIMOID;
            SELECT tab_game.tamanio_equipos INTO TAMANIO_EQUIPO FROM tab_game WHERE tab_game.id_game = wid_game;
            SELECT UPPER(wnom_equipo) INTO wnom_equipo_aux;
            SELECT LOWER(wfoto_equipo) INTO wfoto_equipo_aux;
            INSERT INTO tab_equipo VALUES (ULTIMOID,wnom_equipo_aux, wdesc_equipo,wfoto_equipo_aux,wid_game,TRUE,TAMANIO_EQUIPO,0);
            IF FOUND THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;


  
















