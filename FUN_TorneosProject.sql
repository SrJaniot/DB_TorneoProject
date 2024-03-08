--FUNCIONES CREADAS POR ESTEBAN FRANCISCO JANIOT RIVERA, VANESSA SANABRIA
--CREADAS PARA EL PROYECTO DE TORNEOS

--FUNCIONES VALIDADORAS DE PARAMETROS DE ENTRADA PARA LA INSERCION DE DATOS EN LAS TABLAS
--VALIDADORAS TRUE=CORRECTO, FALSE=INCORRECTO


-- ALL VARCHAR VA EN MAYUSCULA MENOS FOTOS Y ARCHIVOS

--DROPEOS DE TRIGGERS SI EXISTEN-------------------------------------------------------------------------------------------------------------------------------------------------------------   
DROP TRIGGER IF EXISTS tri_delete_tabla_ciudad ON tab_ciudad;
DROP TRIGGER IF EXISTS tri_actividad_tabla_ciudad ON tab_ciudad;
DROP TRIGGER IF EXISTS tri_delete_tabla_game ON tab_game;
DROP TRIGGER IF EXISTS tri_actividad_tabla_game ON tab_game;
DROP TRIGGER IF EXISTS tri_delete_tabla_datosPersonales ON tab_datosPersonales;
DROP TRIGGER IF EXISTS tri_actividad_tabla_datosPersonales ON tab_datosPersonales;
DROP TRIGGER IF EXISTS tri_delete_tabla_jugador ON tab_jugador;
DROP TRIGGER IF EXISTS tri_actividad_tabla_jugador ON tab_jugador;
DROP TRIGGER IF EXISTS tri_delete_tabla_equipo ON tab_equipo;
DROP TRIGGER IF EXISTS tri_actividad_tabla_equipo ON tab_equipo;
DROP TRIGGER IF EXISTS tri_delete_tabla_torneo ON tab_torneo;
DROP TRIGGER IF EXISTS tri_actividad_tabla_torneo ON tab_torneo;
DROP TRIGGER IF EXISTS tri_crear_match_torneo ON tab_torneo;
DROP TRIGGER IF EXISTS tri_delete_tabla_match ON tab_match;
DROP TRIGGER IF EXISTS tri_actividad_tabla_match ON tab_match;
DROP TRIGGER IF EXISTS tri_delete_tabla_jugador_equipo ON tab_jugador_equipo;
DROP TRIGGER IF EXISTS tri_actividad_tabla_jugador_equipo ON tab_jugador_equipo;
DROP TRIGGER IF EXISTS tri_delete_tabla_equipo_torneo ON tab_equipo_torneo;
DROP TRIGGER IF EXISTS tri_actividad_tabla_equipo_torneo ON tab_equipo_torneo;
DROP TRIGGER IF EXISTS tri_delete_tabla_jugador_torneo ON tab_jugador_torneo;
DROP TRIGGER IF EXISTS tri_actividad_tabla_jugador_torneo ON tab_jugador_torneo;
DROP TRIGGER IF EXISTS tri_delete_tabla_equipo_match ON tab_equipo_match;
DROP TRIGGER IF EXISTS tri_actividad_tabla_equipo_match ON tab_equipo_match;
DROP TRIGGER IF EXISTS tri_delete_tabla_jugador_match ON tab_jugador_match;
DROP TRIGGER IF EXISTS tri_actividad_tabla_jugador_match ON tab_jugador_match;
DROP TRIGGER IF EXISTS tri_delete_tabla_jugador_equipo_match ON tab_jugador_equipo_match;
DROP TRIGGER IF EXISTS tri_actividad_tabla_jugador_equipo_match ON tab_jugador_equipo_match;
DROP TRIGGER IF EXISTS tri_delete_tabla_jugador_equipo_torneo ON tab_jugador_equipo_torneo;


--DROPEO DE FUNCIONES SI EXISTEN-------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS fun_validar_ciudad_insert(wnom_ciudad tab_ciudad.nom_ciudad%TYPE, wdesc_ciudad tab_ciudad.desc_ciudad%TYPE);
DROP FUNCTION IF EXISTS fun_insert_ciudad(wnom_ciudad tab_ciudad.nom_ciudad%TYPE, wdesc_ciudad tab_ciudad.desc_ciudad%TYPE);
DROP FUNCTION IF EXISTS fun_validar_game_insert(wnom_game tab_game.nom_game%TYPE, wdesc_game tab_game.desc_game%TYPE,
                             wtamanio_equipos tab_game.tamanio_equipos%TYPE,wfoto_logo_game tab_game.foto_logo_game%TYPE);
DROP FUNCTION IF EXISTS fun_insert_game(wnom_game tab_game.nom_game%TYPE, wdesc_game tab_game.desc_game%TYPE,
                                wtamanio_equipos tab_game.tamanio_equipos%TYPE,wfoto_logo_game tab_game.foto_logo_game%TYPE);
DROP FUNCTION IF EXISTS fun_validar_datosPersonales_insert(wnombre_jugador tab_datosPersonales.nombre_jugador%TYPE, wedad_jugador tab_datosPersonales.edad_jugador%TYPE,
                                wtel_jugador tab_datosPersonales.tel_jugador%TYPE,wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE,
                                wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE,wid_ciudad tab_datosPersonales.id_ciudad%type);
DROP FUNCTION IF EXISTS fun_insert_datosPersonales(WULTIMOID tab_datosPersonales.id_datos%TYPE,wnombre_jugador tab_datosPersonales.nombre_jugador%TYPE,
                                wedad_jugador tab_datosPersonales.edad_jugador%TYPE,
                                wtel_jugador tab_datosPersonales.tel_jugador%TYPE,wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE,
                                wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE,wid_ciudad tab_datosPersonales.id_ciudad%type);   
DROP FUNCTION IF EXISTS fun_validar_jugador_insert(wid_datos tab_jugador.id_datos%TYPE, wnickname_jugador tab_jugador.nickname_jugador%TYPE,
                                wliga_jugador tab_jugador.liga_jugador%TYPE,wlink_cuenta_jugador tab_jugador.link_cuenta_jugador%TYPE,
                                wid_game tab_jugador.id_game%TYPE);
DROP FUNCTION IF EXISTS fun_insert_jugador_datospersonales(wnombre_jugador tab_datosPersonales.nombre_jugador%TYPE, wedad_jugador tab_datosPersonales.edad_jugador%TYPE,
                                wtel_jugador tab_datosPersonales.tel_jugador%TYPE,wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE,
                                wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE,wid_ciudad tab_datosPersonales.id_ciudad%type,

                                wnickname_jugador tab_jugador.nickname_jugador%TYPE,
                                wliga_jugador tab_jugador.liga_jugador%TYPE,wlink_cuenta_jugador tab_jugador.link_cuenta_jugador%TYPE,
                                wid_game tab_jugador.id_game%TYPE);
DROP FUNCTION IF EXISTS fun_validar_equipo_insert(wnom_equipo tab_equipo.nom_equipo%TYPE, 
                                wid_game tab_equipo.id_game%TYPE);
DROP FUNCTION IF EXISTS fun_insert_equipo(wnom_equipo tab_equipo.nom_equipo%TYPE, wdesc_equipo tab_equipo.desc_equipo%TYPE,
                                wfoto_equipo tab_equipo.foto_equipo%TYPE,wlider_equipo tab_equipo.lider_equipo%TYPE,wid_game tab_equipo.id_game%TYPE);
DROP FUNCTION IF EXISTS fun_validar_torneo_insert(wnom_torneo tab_torneo.nom_torneo%TYPE, wdesc_torneo tab_torneo.desc_torneo%TYPE,
                                wfecha_inicio_torneo tab_torneo.fecha_inicio_torneo%TYPE,wfecha_fin_torneo tab_torneo.fecha_fin_torneo%TYPE,
                                wfoto_torneo tab_torneo.foto_torneo%TYPE,wpremio_torneo_1 tab_torneo.premio_torneo_1%TYPE,
                                wpremio_torneo_2 tab_torneo.premio_torneo_2%TYPE,wpremio_torneo_3 tab_torneo.premio_torneo_3%TYPE,
                                wvideo_explica_torneo tab_torneo.video_explica_torneo%TYPE,wcantidad_equipos tab_torneo.cantidad_equipos%TYPE,
                                wvalor_dinero_torneo tab_torneo.valor_dinero_torneo%TYPE,
                                wid_game tab_torneo.id_game%TYPE  );
DROP FUNCTION IF EXISTS fun_insert_torneo(wnom_torneo tab_torneo.nom_torneo%TYPE, wdesc_torneo tab_torneo.desc_torneo%TYPE,
                                wfecha_inicio_torneo tab_torneo.fecha_inicio_torneo%TYPE,wfecha_fin_torneo tab_torneo.fecha_fin_torneo%TYPE,
                                wfoto_torneo tab_torneo.foto_torneo%TYPE,wpremio_torneo_1 tab_torneo.premio_torneo_1%TYPE,
                                wpremio_torneo_2 tab_torneo.premio_torneo_2%TYPE,wpremio_torneo_3 tab_torneo.premio_torneo_3%TYPE,
                                wvideo_explica_torneo tab_torneo.video_explica_torneo%TYPE,wcantidad_equipos tab_torneo.cantidad_equipos%TYPE,
                                wvalor_dinero_torneo tab_torneo.valor_dinero_torneo%TYPE,
                                wid_game tab_torneo.id_game%TYPE  );
DROP FUNCTION IF EXISTS fun_validar_match_insert(wid_torneo tab_match.id_torneo%TYPE, wid_equipo1 tab_match.id_equipo1%TYPE,
                                wid_equipo2 tab_match.id_equipo2%TYPE,wfecha_match tab_match.fecha_match%TYPE,
                                wvideo_match tab_match.video_match%TYPE,wganador_match tab_match.ganador_match%TYPE,
                                wperdedor_match tab_match.perdedor_match%TYPE);
DROP FUNCTION IF EXISTS fun_insert_match(wid_torneo tab_match.id_torneo%TYPE, wid_equipo1 tab_match.id_equipo1%TYPE,
                                wid_equipo2 tab_match.id_equipo2%TYPE,wfecha_match tab_match.fecha_match%TYPE,
                                wvideo_match tab_match.video_match%TYPE,wganador_match tab_match.ganador_match%TYPE,
                                wperdedor_match tab_match.perdedor_match%TYPE); 
DROP FUNCTION IF EXISTS fun_validar_jugador_equipo_insert(wid_jugador tab_jugador_equipo.id_jugador%TYPE, wid_equipo tab_jugador_equipo.id_equipo%TYPE);
DROP FUNCTION IF EXISTS fun_insert_jugador_equipo(wid_jugador tab_jugador_equipo.id_jugador%TYPE, wid_equipo tab_jugador_equipo.id_equipo%TYPE);
DROP FUNCTION IF EXISTS fun_validar_equipo_torneo_insert(wid_equipo tab_equipo_torneo.id_equipo%TYPE, wid_torneo tab_equipo_torneo.id_torneo%TYPE);
DROP FUNCTION IF EXISTS fun_insert_equipo_torneo(wid_equipo tab_equipo_torneo.id_equipo%TYPE, wid_torneo tab_equipo_torneo.id_torneo%TYPE);
DROP FUNCTION IF EXISTS fun_crear_match_torneo();
DROP FUNCTION IF EXISTS fun_act_tabla();



-------------------------------------------------------------------------------------------------------------------------------------------------

--FUNCION IMPORTANTE QUE SE USARA EN TODO LADO: MI AUTO INCREMENTABLE ;)
--FUNCION PRYMARY KEY (CONSECUTIVO) para cualquier tabala solo poniendo el nombre de la 
--tabala en comillas y el atrivuto que hace referencia a la primary key en los parametros de la funcion
--SELECT funcion_Retorna_ultmoid('game','id_game');

CREATE OR REPLACE FUNCTION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)RETURNS INTEGER AS

$$ DECLARE ULTIMOID INTEGER;
	BEGIN
		  EXECUTE 'SELECT MAX  ('||wnom_columna_id||')  FROM ' || wnom_tabla INTO ULTIMOID ;
		
		--RAISE NOTICE '%',ULTIMOID;
		IF ULTIMOID IS NULL  THEN
			ULTIMOID=1;
			--RAISE NOTICE '%',ULTIMOID;
			RETURN ULTIMOID;	
		ELSE
		ULTIMOID=ULTIMOID+1;
		--RAISE NOTICE '%',ULTIMOID
		RETURN ULTIMOID;
		
		END IF ;
	END;

$$
LANGUAGE PLPGSQL;





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
    DECLARE CORREO_ENCONTRADO tab_datosPersonales.correo_jugador%TYPE;
     DECLARE CORREO_DUPLICADO BOOLEAN := FALSE;


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
        wcorreo_jugador = LOWER(wcorreo_jugador);

        SELECT correo_jugador INTO CORREO_ENCONTRADO FROM tab_datosPersonales WHERE tab_datosPersonales.correo_jugador = wcorreo_jugador;
        IF CORREO_ENCONTRADO IS NOT NULL THEN
             CORREO_DUPLICADO = TRUE;
             RAISE NOTICE 'CORREO DUPLICADO';
        END IF;


        --ESTE IF TIENE QUE VALIDAR : TAMANIONOMBRE>2, WEDAD_JUGADOR=>18  TAMANIO_NUM_TELEFONO=10,ES_CORREO=TRUE, CIUDAD_ENCONTRADA=TRUE , CORREO_DUPLICADO=FALSE
        IF TAMANIO_NOMBRE>2 AND wedad_jugador>=18 AND TAMANIO_NUM_TELEFONO=10 AND ES_CORREO AND CIUDAD_ENCONTRADA AND CORREO_DUPLICADO=FALSE  THEN
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
     DECLARE NICKNAME_ENCONTRADO tab_jugador.nickname_jugador%TYPE;
     DECLARE NICKNAME_DUPLICADO BOOLEAN := FALSE;



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
        wnickname_jugador = UPPER(wnickname_jugador);

        SELECT nickname_jugador INTO NICKNAME_ENCONTRADO FROM tab_jugador WHERE tab_jugador.nickname_jugador = wnickname_jugador;

        

        IF NICKNAME_ENCONTRADO IS NOT NULL THEN
             NICKNAME_DUPLICADO = TRUE;
             RAISE NOTICE 'NICKNAME DUPLICADO';
        END IF;

        --ESTE IF TIENE QUE VALIDAR : DATOS_ENCONTRADA=TRUE,  TAMANIO_NICKNAME>2  TAMANIO_LIGAJUGADOR>2,  GAME_ENCONTRADA=TRUE, NICKNAME_DUPLICADO=FALSE
        IF DATOS_ENCONTRADA=TRUE AND TAMANIO_NICKNAME>2 AND TAMANIO_LIGAJUGADOR>2 AND GAME_ENCONTRADA=TRUE AND NICKNAME_DUPLICADO=FALSE  THEN
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




--FUNCION PARA RETORNAR EL ID DE UN JUGADOR A PARTIR DEL CORREO
CREATE OR REPLACE FUNCTION fun_retornar_id_jugador(wcorreo_jugador tab_datosPersonales.correo_jugador%TYPE) RETURNS INTEGER AS
$$
    DECLARE ID_JUGADOR INTEGER;
    BEGIN
        SELECT tab_datosPersonales.id_datos INTO ID_JUGADOR FROM tab_datosPersonales WHERE tab_datosPersonales.correo_jugador = wcorreo_jugador;
        IF ID_JUGADOR IS NOT NULL THEN
            RETURN ID_JUGADOR;
        ELSE
            RETURN NULL;
        END IF;
    END;
$$
LANGUAGE plpgsql;


--FUNCIONES PARA LA TABLA tab_equipo -------------------------------------------------------------------------------------------------------------------------------------------------------------
--VALIDAR ATRIBUTOS DE LA TABLA tab_equipo
CREATE OR REPLACE FUNCTION fun_validar_equipo_insert(wnom_equipo tab_equipo.nom_equipo%TYPE, 
                            wlider_equipo tab_equipo.lider_equipo%TYPE,wid_game tab_equipo.id_game%TYPE) RETURNS BOOLEAN AS
$$     
        DECLARE TAMANIO_NOMBRE INTEGER;
        DECLARE NOMBRE_EQUIPO_ENCONTRADO tab_equipo.nom_equipo%TYPE;
        DECLARE EQUIPO_ENCONTRADO BOOLEAN := FALSE;
        DECLARE ID_GAME_ENCONTRADA tab_equipo.id_game%TYPE;
        DECLARE GAME_ENCONTRADA BOOLEAN := FALSE;

        DECLARE ID_LIDER_ENCONTRADO_TABJUGADOR tab_jugador.id_jugador%TYPE;
        DECLARE LIDER_ENCONTRADO BOOLEAN := FALSE;

        DECLARE ID_LIDER_ENCONTRADO_TABEQUIPO tab_equipo.lider_equipo%TYPE;
        DECLARE LIDER_ENCONTRADO_EQUIPO BOOLEAN := FALSE;
    
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
            --VALIDAR QUE EL LIDER EXISTA EN LA TABLA JUGADOR
            SELECT id_jugador INTO ID_LIDER_ENCONTRADO_TABJUGADOR FROM tab_jugador WHERE tab_jugador.id_jugador = wlider_equipo;
            IF ID_LIDER_ENCONTRADO_TABJUGADOR IS NOT NULL THEN
                LIDER_ENCONTRADO = TRUE;
            END IF;
            --VALIDAR QUE EL LIDER NO ESTE EN OTRO EQUIPO
            SELECT id_equipo INTO ID_LIDER_ENCONTRADO_TABEQUIPO FROM tab_equipo WHERE tab_equipo.lider_equipo = wlider_equipo;
            IF ID_LIDER_ENCONTRADO_TABEQUIPO IS NOT NULL THEN
                LIDER_ENCONTRADO_EQUIPO = TRUE;
            END IF;

            
    
            --ESTE IF TIENE QUE VALIDAR : TAMANIO_NOMBRE>2,  GAME_ENCONTRADA=TRUE , EQUIPO_ENCONTRADO = FALSE
            IF TAMANIO_NOMBRE>2 AND GAME_ENCONTRADA=TRUE AND EQUIPO_ENCONTRADO=FALSE AND LIDER_ENCONTRADO=TRUE AND LIDER_ENCONTRADO_EQUIPO=FALSE THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
        END;
$$
LANGUAGE plpgsql;


--FUNCION PARA INSERTAR DATOS EN LA TABLA tab_equipo CON PARAMETROS DE ENTRADA
--defienendo el retorno de la funcion PARA DESPUES CONVERTIRLO EN JSON

DROP TYPE IF EXISTS equipo_result;
CREATE TYPE equipo_result AS (
    id_equipo INTEGER,
    resultado BOOLEAN
);
CREATE OR REPLACE FUNCTION fun_insert_equipo(wnom_equipo tab_equipo.nom_equipo%TYPE, wdesc_equipo tab_equipo.desc_equipo%TYPE,
                            wfoto_equipo tab_equipo.foto_equipo%TYPE,wlider_equipo tab_equipo.lider_equipo%TYPE,wid_game tab_equipo.id_game%TYPE,
                            whash_equipo tab_equipo.hash_equipo%TYPE) RETURNS json AS
$$
    DECLARE
        RETORNO equipo_result;
        wnom_equipo_aux tab_equipo.nom_equipo%TYPE;
        wfoto_equipo_aux tab_equipo.foto_equipo%TYPE;
        ULTIMOID INTEGER;
        TAMANIO_EQUIPO tab_equipo.tamanio_equipo%TYPE;
    BEGIN
        IF fun_validar_equipo_insert(wnom_equipo,wlider_equipo,wid_game) THEN
            SELECT funcion_Retorna_ultmoid('tab_equipo','id_equipo') INTO ULTIMOID;
            SELECT tab_game.tamanio_equipos INTO TAMANIO_EQUIPO FROM tab_game WHERE tab_game.id_game = wid_game;
            SELECT UPPER(wnom_equipo) INTO wnom_equipo_aux;
            SELECT LOWER(wfoto_equipo) INTO wfoto_equipo_aux;
            INSERT INTO tab_equipo VALUES (ULTIMOID,wnom_equipo_aux, wdesc_equipo,wfoto_equipo_aux,wid_game,TRUE,TAMANIO_EQUIPO,wlider_equipo,0,whash_equipo);
            IF FOUND THEN
                RETORNO.id_equipo := ULTIMOID;
                RETORNO.resultado := TRUE;
                RETURN row_to_json(RETORNO);
            ELSE
                RETORNO.id_equipo := NULL;
                RETORNO.resultado := FALSE;
                RETURN row_to_json(RETORNO);
            END IF;
        ELSE
            RETORNO.id_equipo := NULL;
            RETORNO.resultado := FALSE;
            RETURN row_to_json(RETORNO);
        END IF;
    END;
$$
LANGUAGE plpgsql;


--FUNCIONES PARA LA TABLA tab_torneo -------------------------------------------------------------------------------------------------------------------------------------------------------------
--VALIDAR ATRIBUTOS DE LA TABLA tab_torneo
CREATE OR REPLACE FUNCTION fun_validar_torneo_insert(wnom_torneo tab_torneo.nom_torneo%TYPE, wdesc_torneo tab_torneo.desc_torneo%TYPE,
                            wfecha_inicio_torneo tab_torneo.fecha_inicio_torneo%TYPE,wfecha_fin_torneo tab_torneo.fecha_fin_torneo%TYPE,
                            wfoto_torneo tab_torneo.foto_torneo%TYPE,wpremio_torneo_1 tab_torneo.premio_torneo_1%TYPE,
                            wpremio_torneo_2 tab_torneo.premio_torneo_2%TYPE,wpremio_torneo_3 tab_torneo.premio_torneo_3%TYPE,
                            wvideo_explica_torneo tab_torneo.video_explica_torneo%TYPE,wcantidad_equipos tab_torneo.cantidad_equipos%TYPE,
                            wvalor_dinero_torneo tab_torneo.valor_dinero_torneo%TYPE,
                            wid_game tab_torneo.id_game%TYPE  ) RETURNS BOOLEAN AS
$$
    DECLARE TAMANIO_NOMBRE INTEGER;
    DECLARE NOMBRE_TORNEO_ENCONTRADO tab_torneo.nom_torneo%TYPE;
    DECLARE TORNEO_ENCONTRADO BOOLEAN := FALSE;
    DECLARE ID_GAME_ENCONTRADA tab_torneo.id_game%TYPE;
    DECLARE GAME_ENCONTRADA BOOLEAN := FALSE;
    DECLARE FECHA_INICIO DATE;
    DECLARE FECHA_FIN DATE;
    DECLARE FECHA_ACTUAL DATE;
    DECLARE FECHA_INICIO_MAYOR BOOLEAN := FALSE;
    DECLARE FECHA_FIN_MAYOR BOOLEAN := FALSE;
    DECLARE EQUIPOS_COMPLETOS_TORNEO BOOLEAN := FALSE;
    BEGIN
        SELECT UPPER(wnom_torneo) INTO wnom_torneo;
        SELECT id_game INTO ID_GAME_ENCONTRADA FROM tab_game WHERE tab_game.id_game = wid_game;
        IF ID_GAME_ENCONTRADA IS NOT NULL THEN
            GAME_ENCONTRADA = TRUE;
            SELECT nom_torneo INTO NOMBRE_TORNEO_ENCONTRADO FROM tab_torneo WHERE tab_torneo.nom_torneo = wnom_torneo AND tab_torneo.id_game = wid_game;
            IF NOMBRE_TORNEO_ENCONTRADO IS NOT NULL THEN
                TORNEO_ENCONTRADO = TRUE;
                RAISE NOTICE 'TORNEO NOMBRE DUPLICADO';
            END IF;
        END IF;
        SELECT CHAR_LENGTH(wnom_torneo)INTO TAMANIO_NOMBRE;
        SELECT CAST(wfecha_inicio_torneo AS DATE) INTO FECHA_INICIO;
        SELECT CAST(wfecha_fin_torneo AS DATE) INTO FECHA_FIN;
        SELECT CURRENT_DATE INTO FECHA_ACTUAL;
        IF FECHA_INICIO > FECHA_ACTUAL THEN
            FECHA_INICIO_MAYOR = TRUE;
        END IF;
        IF FECHA_FIN > FECHA_ACTUAL AND FECHA_FIN >= FECHA_INICIO THEN
            FECHA_FIN_MAYOR = TRUE;
        END IF;
        IF  wcantidad_equipos = 8 OR wcantidad_equipos=16 OR  wcantidad_equipos=32 THEN
            EQUIPOS_COMPLETOS_TORNEO = TRUE;
        END IF;

        --ESTE IF TIENE QUE VALIDAR : TAMANIO_NOMBRE>2,  GAME_ENCONTRADA=TRUE , TORNEO_ENCONTRADO = FALSE, FECHA_INICIO_MAYOR=TRUE, FECHA_FIN_MAYOR=TRUE, EQUIPOS_COMPLETOS_TORNEO=TRUE
        IF TAMANIO_NOMBRE>2 AND GAME_ENCONTRADA=TRUE AND TORNEO_ENCONTRADO=FALSE AND FECHA_INICIO_MAYOR=TRUE AND FECHA_FIN_MAYOR=TRUE AND EQUIPOS_COMPLETOS_TORNEO=TRUE THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE plpgsql;
 


--FUNCION PARA INSERTAR DATOS EN LA TABLA tab_torneo CON PARAMETROS DE ENTRADA
--defienendo el retorno de la funcion PARA DESPUES CONVERTIRLO EN JSON
DROP TYPE IF EXISTS torneo_result;
CREATE TYPE torneo_result AS (
    id_torneo INTEGER,
    resultado BOOLEAN
);
CREATE OR REPLACE FUNCTION fun_insert_torneo(wnom_torneo tab_torneo.nom_torneo%TYPE, wdesc_torneo tab_torneo.desc_torneo%TYPE,
                            wfecha_inicio_torneo tab_torneo.fecha_inicio_torneo%TYPE,wfecha_fin_torneo tab_torneo.fecha_fin_torneo%TYPE,
                            wfoto_torneo tab_torneo.foto_torneo%TYPE,wpremio_torneo_1 tab_torneo.premio_torneo_1%TYPE,
                            wpremio_torneo_2 tab_torneo.premio_torneo_2%TYPE,wpremio_torneo_3 tab_torneo.premio_torneo_3%TYPE,
                            wvideo_explica_torneo tab_torneo.video_explica_torneo%TYPE,wcantidad_equipos tab_torneo.cantidad_equipos%TYPE,
                            wvalor_dinero_torneo tab_torneo.valor_dinero_torneo%TYPE,
                            wid_game tab_torneo.id_game%TYPE,winformacion_general tab_torneo.informacion_general%TYPE,
                            winformacion_reglas tab_torneo.informacion_reglas%TYPE,wfoto_premio_torneo_1 tab_torneo.foto_premio_torneo_1%TYPE,
                            wfoto_premio_torneo_2 tab_torneo.foto_premio_torneo_2%TYPE, wfoto_premio_torneo_3 tab_torneo.foto_premio_torneo_3%TYPE,
                            wfoto_carta_fondo tab_torneo.foto_carta_fondo%TYPE, wfoto_carta_titulo tab_torneo.foto_carta_titulo%TYPE,
                            wfoto_carta_personaje tab_torneo.foto_carta_personaje%TYPE) RETURNS json AS

$$
    DECLARE
        RETORNO torneo_result;
        wnom_torneo_aux tab_torneo.nom_torneo%TYPE;
        wfoto_torneo_aux tab_torneo.foto_torneo%TYPE;
        wvideo_explica_torneo_aux tab_torneo.video_explica_torneo%TYPE;
        ULTIMOID INTEGER;
        cantidad_match tab_torneo.cantidad_match%TYPE;

    BEGIN
        IF fun_validar_torneo_insert(wnom_torneo,wdesc_torneo,wfecha_inicio_torneo,wfecha_fin_torneo,wfoto_torneo,wpremio_torneo_1,
                                     wpremio_torneo_2,wpremio_torneo_3,wvideo_explica_torneo,wcantidad_equipos,wvalor_dinero_torneo,wid_game) THEN
            SELECT funcion_Retorna_ultmoid('tab_torneo','id_torneo') INTO ULTIMOID;
            SELECT UPPER(wnom_torneo) INTO wnom_torneo_aux;
            SELECT LOWER(wfoto_torneo) INTO wfoto_torneo_aux;
            SELECT LOWER(wvideo_explica_torneo) INTO wvideo_explica_torneo_aux;
            cantidad_match := wcantidad_equipos;
            
            INSERT INTO tab_torneo VALUES (ULTIMOID,wnom_torneo_aux, wdesc_torneo,wfecha_inicio_torneo,wfecha_fin_torneo,wfoto_torneo_aux,
                                           wpremio_torneo_1,wpremio_torneo_2,wpremio_torneo_3,wvideo_explica_torneo_aux,wcantidad_equipos,cantidad_match,
                                           wvalor_dinero_torneo,wid_game,1,winformacion_general,winformacion_reglas,wfoto_premio_torneo_1,
                                           wfoto_premio_torneo_2,wfoto_premio_torneo_3,wfoto_carta_fondo,wfoto_carta_titulo,wfoto_carta_personaje);
            IF FOUND THEN
                RETORNO.id_torneo := ULTIMOID;
                RETORNO.resultado := TRUE;
                RETURN row_to_json(RETORNO);
            ELSE
                RETORNO.resultado := FALSE;
                RETORNO.id_torneo := NULL;
                RETURN row_to_json(RETORNO);
            END IF;
        ELSE
            RETORNO.resultado := FALSE;
            RETORNO.id_torneo := NULL;
            RETURN row_to_json(RETORNO);
        END IF;
    END;
$$
LANGUAGE plpgsql;


-- FUNCION QUE ME PERMITE VINCULAR UN JUGADOR A UN EQUIPO EN tab_jugador_equipo
CREATE OR REPLACE FUNCTION fun_insert_jugador_equipo(wid_jugador tab_jugador_equipo.id_jugador%TYPE,
                                 wid_equipo tab_jugador_equipo.id_equipo%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        ULTIMOID INTEGER;
        ID_JUGADOR_ENCONTRADO tab_jugador_equipo.id_jugador%TYPE;
        JUGADOR_ENCONTRADO BOOLEAN := FALSE;
        ID_EQUIPO_ENCONTRADO tab_jugador_equipo.id_equipo%TYPE;
        EQUIPO_ENCONTRADO BOOLEAN := FALSE;
        ID_JUGADOR_EQUIPO_ENCONTRADO tab_jugador_equipo.id_jugador%TYPE;
        JUGADOR_EQUIPO_ENCONTRADO BOOLEAN := FALSE;
        TAMANIO_EQUIPO tab_equipo.tamanio_equipo%TYPE;
        CANTIDAD_JUGADORES_EQUIPO INTEGER;
        CANTIDAD_JUGADORES_EQUIPO_MAYOR BOOLEAN := FALSE;
        ID_GAME_JUGADOR tab_jugador.id_game%TYPE;
        ID_GAME_EQUIPO tab_equipo.id_game%TYPE;
        GAME_IGUALES BOOLEAN := FALSE;
        JUGADOR_EQUIPO_ENCONTRADO_OTRO BOOLEAN := FALSE;
        ID_JUGADOR_EQUIPO_ENCONTRADO_OTRO tab_jugador_equipo.id_jugador%TYPE;
    BEGIN
        SELECT funcion_Retorna_ultmoid('tab_jugador_equipo','id_jugador_equipo') INTO ULTIMOID;
        --valida si el jugador existe
        SELECT id_jugador INTO ID_JUGADOR_ENCONTRADO FROM tab_jugador WHERE tab_jugador.id_jugador = wid_jugador;
        IF ID_JUGADOR_ENCONTRADO IS NOT NULL THEN
            JUGADOR_ENCONTRADO = TRUE;
        END IF;
        --valida si el equipo existe
        SELECT id_equipo INTO ID_EQUIPO_ENCONTRADO FROM tab_equipo WHERE tab_equipo.id_equipo = wid_equipo;
        IF ID_EQUIPO_ENCONTRADO IS NOT NULL THEN
            EQUIPO_ENCONTRADO = TRUE;
        END IF;
        --valida si el jugador ya esta en el equipo
        SELECT id_jugador INTO ID_JUGADOR_EQUIPO_ENCONTRADO FROM tab_jugador_equipo WHERE tab_jugador_equipo.id_jugador = wid_jugador AND tab_jugador_equipo.id_equipo = wid_equipo;
        IF ID_JUGADOR_EQUIPO_ENCONTRADO IS NOT NULL THEN
            JUGADOR_EQUIPO_ENCONTRADO = TRUE;
        END IF;
        --valida si el jugador ya esta en otro equipo
        SELECT id_jugador INTO ID_JUGADOR_EQUIPO_ENCONTRADO_OTRO FROM tab_jugador_equipo WHERE tab_jugador_equipo.id_jugador = wid_jugador;
        IF ID_JUGADOR_EQUIPO_ENCONTRADO_OTRO IS NOT NULL THEN
            JUGADOR_EQUIPO_ENCONTRADO_OTRO = TRUE;
        END IF;
        

        SELECT tab_equipo.tamanio_equipo INTO TAMANIO_EQUIPO FROM tab_equipo WHERE tab_equipo.id_equipo = wid_equipo;
        SELECT COUNT(*) INTO CANTIDAD_JUGADORES_EQUIPO FROM tab_jugador_equipo WHERE tab_jugador_equipo.id_equipo = wid_equipo;
        IF CANTIDAD_JUGADORES_EQUIPO >= TAMANIO_EQUIPO THEN
            CANTIDAD_JUGADORES_EQUIPO_MAYOR = TRUE;
        END IF; 
        SELECT tab_jugador.id_game INTO ID_GAME_JUGADOR FROM tab_jugador WHERE tab_jugador.id_jugador = wid_jugador;
        SELECT tab_equipo.id_game INTO ID_GAME_EQUIPO FROM tab_equipo WHERE tab_equipo.id_equipo = wid_equipo;
        IF ID_GAME_JUGADOR = ID_GAME_EQUIPO THEN
            GAME_IGUALES = TRUE;
        END IF;



        IF JUGADOR_ENCONTRADO AND EQUIPO_ENCONTRADO AND NOT JUGADOR_EQUIPO_ENCONTRADO AND NOT JUGADOR_EQUIPO_ENCONTRADO_OTRO AND NOT CANTIDAD_JUGADORES_EQUIPO_MAYOR AND GAME_IGUALES THEN
            INSERT INTO tab_jugador_equipo VALUES (ULTIMOID,wid_jugador,wid_equipo,TRUE);
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


--FUNCION QUE PERMINTE VINCULAR UN EQUIPO A UN TORNEO EN tab_equipo_torneo
CREATE OR REPLACE FUNCTION fun_insert_equipo_torneo(wid_equipo tab_equipo_torneo.id_equipo%TYPE,
                                 wid_torneo tab_equipo_torneo.id_torneo%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        ULTIMOID INTEGER;
        ID_EQUIPO_ENCONTRADO tab_equipo_torneo.id_equipo%TYPE;
        EQUIPO_ENCONTRADO BOOLEAN := FALSE;
        ID_TORNEO_ENCONTRADO tab_equipo_torneo.id_torneo%TYPE;
        TORNEO_ENCONTRADO BOOLEAN := FALSE;
        ID_EQUIPO_TORNEO_ENCONTRADO tab_equipo_torneo.id_equipo%TYPE;
        EQUIPO_TORNEO_ENCONTRADO BOOLEAN := FALSE;
        TAMANIO_JUGADORES_EQUIPO tab_equipo.tamanio_equipo%TYPE;
        TAMANIO_JUGADORES_GAME tab_game.tamanio_equipos%TYPE;
        cantidad_equipos tab_torneo.cantidad_equipos%TYPE;
        CANTIDAD_EQUIPOS_TORNEO INTEGER;
        CANTIDAD_EQUIPOS_TORNEO_MAYOR BOOLEAN := FALSE;
        ID_GAME_EQUIPO tab_equipo.id_game%TYPE;
        ID_GAME_TORNEO tab_torneo.id_game%TYPE;
        GAME_IGUALES BOOLEAN := FALSE;
    BEGIN
        SELECT funcion_Retorna_ultmoid('tab_equipo_torneo','id_equipo_torneo') INTO ULTIMOID;
        --valida si el equipo existe
        SELECT id_equipo INTO ID_EQUIPO_ENCONTRADO FROM tab_equipo WHERE tab_equipo.id_equipo = wid_equipo;
        IF ID_EQUIPO_ENCONTRADO IS NOT NULL THEN
            EQUIPO_ENCONTRADO = TRUE;
        END IF;
        --valida si el torneo existe
        SELECT id_torneo INTO ID_TORNEO_ENCONTRADO FROM tab_torneo WHERE tab_torneo.id_torneo = wid_torneo;
        IF ID_TORNEO_ENCONTRADO IS NOT NULL THEN
            TORNEO_ENCONTRADO = TRUE;
        END IF;
        --valida si el equipo ya esta en el torneo
        SELECT id_equipo INTO ID_EQUIPO_TORNEO_ENCONTRADO FROM tab_equipo_torneo WHERE tab_equipo_torneo.id_equipo = wid_equipo AND tab_equipo_torneo.id_torneo = wid_torneo;
        IF ID_EQUIPO_TORNEO_ENCONTRADO IS NOT NULL THEN
            EQUIPO_TORNEO_ENCONTRADO = TRUE;
        END IF;

        --VALIDACIONES DE CANTIDAD DE EQUIPOS EN EL TORNEO Y TAMANIO DE EQUIPO EN EL TORNEO
        SELECT tab_equipo.id_game INTO ID_GAME_EQUIPO FROM tab_equipo WHERE tab_equipo.id_equipo = wid_equipo;

        SELECT COUNT(*) INTO TAMANIO_JUGADORES_EQUIPO FROM tab_jugador_equipo WHERE tab_jugador_equipo.id_equipo = wid_equipo;
        SELECT tab_game.tamanio_equipos INTO TAMANIO_JUGADORES_GAME FROM tab_game WHERE tab_game.id_game = ID_GAME_EQUIPO;


        SELECT tab_torneo.cantidad_equipos INTO cantidad_equipos FROM tab_torneo WHERE tab_torneo.id_torneo = wid_torneo;
        SELECT COUNT(*) INTO CANTIDAD_EQUIPOS_TORNEO FROM tab_equipo_torneo WHERE tab_equipo_torneo.id_torneo = wid_torneo;
        IF CANTIDAD_EQUIPOS_TORNEO >= cantidad_equipos THEN
            CANTIDAD_EQUIPOS_TORNEO_MAYOR = TRUE;
        END IF;
        SELECT tab_equipo.id_game INTO ID_GAME_EQUIPO FROM tab_equipo WHERE tab_equipo.id_equipo = wid_equipo;
        SELECT tab_torneo.id_game INTO ID_GAME_TORNEO FROM tab_torneo WHERE tab_torneo.id_torneo = wid_torneo;
        IF ID_GAME_EQUIPO = ID_GAME_TORNEO THEN
            GAME_IGUALES = TRUE;
        END IF;

        RAISE NOTICE 'EQUIPO ENCONTRADO: %',EQUIPO_ENCONTRADO;
        RAISE NOTICE 'TORNEO ENCONTRADO: %',TORNEO_ENCONTRADO;
        RAISE NOTICE 'EQUIPO TORNEO ENCONTRADO: %',EQUIPO_TORNEO_ENCONTRADO;
        RAISE NOTICE 'CANTIDAD_EQUIPOS_TORNEO_MAYOR: %',CANTIDAD_EQUIPOS_TORNEO_MAYOR;
        RAISE NOTICE 'GAME_IGUALES: %',GAME_IGUALES;
        RAISE NOTICE 'TAMANIO_JUGADORES_EQUIPO: %',TAMANIO_JUGADORES_EQUIPO;
        RAISE NOTICE 'TAMANIO_JUGADORES_GAME: %',TAMANIO_JUGADORES_GAME;



        IF EQUIPO_ENCONTRADO AND TORNEO_ENCONTRADO AND NOT EQUIPO_TORNEO_ENCONTRADO AND NOT CANTIDAD_EQUIPOS_TORNEO_MAYOR AND 
        GAME_IGUALES AND TAMANIO_JUGADORES_EQUIPO=TAMANIO_JUGADORES_GAME THEN
            INSERT INTO tab_equipo_torneo VALUES (ULTIMOID,wid_equipo,wid_torneo,TRUE);
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




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCION PARA ACTUALIZAR PARAMETROS
-- FUNCION PARA ACTUALIZAR LA FOTO DE PERFIL DE UN JUGADOR
CREATE OR REPLACE FUNCTION fun_actualizar_foto_jugador(wid_jugador tab_datosPersonales.id_datos%TYPE, wfoto_perfil_jugador tab_datosPersonales.foto_perfil_jugador%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        ID_DATOS_ENCONTRADA tab_datosPersonales.id_datos%TYPE;
        DATOS_ENCONTRADA BOOLEAN := FALSE;
    BEGIN
        SELECT a.id_datos INTO ID_DATOS_ENCONTRADA FROM tab_datosPersonales a WHERE a.id_datos = wid_jugador;
        IF ID_DATOS_ENCONTRADA IS NOT NULL THEN
            DATOS_ENCONTRADA = TRUE;
        END IF;
        IF DATOS_ENCONTRADA THEN
            UPDATE tab_datosPersonales SET foto_perfil_jugador = wfoto_perfil_jugador WHERE tab_datosPersonales.id_datos = wid_jugador;
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
LANGUAGE PLPGSQL;








   

  




























------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
--FUNCIONES PARA LOS TRIGGERS-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
--FUNCION PARA TRIGGER QUE ME PERMITE LLEVAR EL CONTROL DE CUAL USUARIO HIZO ALGUNA ACTIVIDAD DE MOVIMIENTO DE DISCO EN CUALQUIER TABLA.
--PARA INSERT Y UPDATE EL TRIGGER TIENE QUE SER "BEFORE"
--PARA DELETE EL TRIGGER TIENE QUE SER "AFTER"
--REQUISITOS PARA PODER CREAR ESTA FUNCION:
--*HABER CREADO ANTES LA FUNCION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)
CREATE OR REPLACE FUNCTION fun_act_tabla() RETURNS "trigger" AS
$$
    DECLARE wid_consec tab_borrados.id_consec%TYPE;
    BEGIN
    /*
    NEW Y OLD SON VARIABLES DE POSTGRES  QUE ACTUAN DIRECTAMENTE EN EL REGISTRO QUE SE ESTA MANIPULANDO, EJEMPLO:
    SI PODEMOS VER CUANDO ES INSERT "NEW" ESTA MANIPULANDO DIRECTAMENTE UNA COLUMNA DE LA TABLA QUE ESTE MANEJANDO 
    EL TRIGGER (CUANDO SE CREA EL TRIGGER SE LE DICE A CUAL TABLA Y QUE METODO VA A TRABAJAR ). Y COMO VEMOS,
    EL ESTA GUARDANDO EN ESA COLUMNA DEL REGISTRO NEW.user_insert = CURRENT_USER; NEW.date_insert  = CURRENT_TIMESTAMP;
    EL USUARIO Y FECHA QUE VA A INSERTAR (TENIENDO ENCUNTA QUE EL TRIGGER LO USAREMOS COM UN "BEFORE INSERT") ANTES DE
    INSERTARLO. 
    */
        IF TG_OP = 'INSERT' THEN
           NEW.user_insert = CURRENT_USER;
           NEW.date_insert  = CURRENT_TIMESTAMP;
           RETURN NEW;
        END IF;
        IF TG_OP = 'UPDATE' THEN
           NEW.user_update = CURRENT_USER;
           NEW.date_update= CURRENT_TIMESTAMP;
           RETURN NEW;
        END IF;
        IF TG_OP = 'DELETE' THEN
            SELECT funcion_Retorna_ultmoid('tab_borrados','id_consec') INTO wid_consec;
            INSERT INTO tab_borrados VALUES(wid_consec,TG_RELNAME,CURRENT_USER,CURRENT_TIMESTAMP);
            --TG_RELNAME RETORNA EL NOMBRE DE LA TABLA (VARCHAR) EN LA QUE SE ESTE TRABAJANDO EN EL TRIGGER
            RETURN OLD; 
        END IF;
    END;
$$
LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCION PARA TRIGGER QUE ME PERMITE CREAR TODOS LOS MATCH DEL TORNEO CUANDO SE CREA UN TORNEO NUEVO EN LA TABLA tab_torneo (POST INSERT TORNEO)
--REQUISITOS PARA PODER CREAR ESTA FUNCION:
--*HABER CREADO ANTES LA FUNCION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)
CREATE OR REPLACE FUNCTION fun_crear_match_torneo() RETURNS "trigger" AS
$$
    DECLARE ULTIMOID INTEGER;
    DECLARE wid_torneo tab_match.id_torneo%TYPE := NEW.id_torneo;
    DECLARE wnom_match tab_match.nom_match%TYPE;
    DECLARE wdesc_match tab_match.desc_match%TYPE;
    DECLARE wFecha_match tab_match.fecha_match%TYPE;

    BEGIN
        FOR i IN 1..NEW.cantidad_match LOOP
            SELECT funcion_Retorna_ultmoid('tab_match','id_match') INTO ULTIMOID;
            wnom_match := 'Match '||i;
            wdesc_match := 'Match NUMERO '||i;
            wFecha_match := NEW.fecha_inicio_torneo;
            INSERT INTO tab_match (id_match,id_torneo,nom_match,desc_match,Fecha_match) VALUES (ULTIMOID,wid_torneo,wnom_match,wdesc_match,wFecha_match);
        END LOOP;
        RETURN NEW;
    END;
$$
LANGUAGE PLPGSQL;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--FUNCION PARA TRIGGER QUE ME PERMITE LLENAR LA TABLA tab_jugador_equipo CUANDO SE CREA UN EQUIPO NUEVO EN LA TABLA tab_equipo (POST INSERT EQUIPO)
--REQUISITOS PARA PODER CREAR ESTA FUNCION:
--*HABER CREADO ANTES LA FUNCION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)
CREATE OR REPLACE FUNCTION fun_INSERTALIDER() RETURNS "trigger" AS
$$
    DECLARE
        result BOOLEAN; -- o el tipo de dato que devuelve fun_insert_jugador_equipo
    BEGIN
        --IMPRIMIR VARIABLES OLD


        SELECT fun_insert_jugador_equipo(NEW.lider_equipo,NEW.id_equipo) INTO result;
        IF result THEN
            RAISE NOTICE 'JUGADOR LIDER INSERTADO CORRECTAMENTE';
            RETURN NEW;
        ELSE
            RAISE NOTICE 'JUGADOR LIDER INSERTADO INCORRECTAMENTE';
            RETURN NULL;
        END IF;
        
        -- luego puedes hacer algo con "result" si es necesario
        RETURN NEW;
    END;
$$
LANGUAGE PLPGSQL;















------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCIONES GET PARA OBTENER DATOS DE VARIAS TABLAS-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
--FUNCION PARA OBTENER LOS DATOS DE LA TABLA tab_equipo y los datos de los jugadores que pertenecen a ese equipo
--REQUISITOS PARA PODER CREAR ESTA FUNCION:
--*HABER CREADO ANTES LA FUNCION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)
--defienendo el retorno de la funcion PARA DESPUES CONVERTIRLO EN JSON



DROP TYPE IF EXISTS equipoFULL_result CASCADE;
DROP TYPE IF EXISTS jugador_result CASCADE;

CREATE TYPE jugador_result AS (
    JUGADOR tab_jugador,
    FOTO_PERFIL VARCHAR
);

CREATE TYPE equipoFULL_result AS (
    EQUIPO tab_equipo,
    JUGADORES jugador_result[]
);

CREATE OR REPLACE FUNCTION fun_get_equipoFULL(wid_equipo tab_equipo.id_equipo%TYPE) RETURNS json AS
$$
    BEGIN
        RETURN (
            SELECT row_to_json(equipoFULL_result) 
            FROM (
                SELECT 
                    tab_equipo.*,
                    array_agg(
                        (SELECT r FROM (SELECT tab_jugador.*, tab_datosPersonales.foto_perfil_jugador) r)
                    ) AS jugadores 
                FROM 
                    tab_equipo
                    INNER JOIN tab_jugador_equipo ON tab_equipo.id_equipo = tab_jugador_equipo.id_equipo
                    INNER JOIN tab_jugador ON tab_jugador_equipo.id_jugador = tab_jugador.id_jugador
                    INNER JOIN tab_datosPersonales ON tab_jugador.id_datos = tab_datosPersonales.id_datos
                WHERE 
                    tab_equipo.id_equipo = wid_equipo 
                GROUP BY
                    tab_equipo.id_equipo
            ) equipoFULL_result
        );
    END;
$$
LANGUAGE PLPGSQL;


--FUNCION PARA OBTENER LOS DATOS DE LA TABLA tab_jugador y la foto de perfil de la tabla tab_datosPersonales
--REQUISITOS PARA PODER CREAR ESTA FUNCION:
--*HABER CREADO ANTES LA FUNCION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)
--defienendo el retorno de la funcion PARA DESPUES CONVERTIRLO EN JSON
DROP TYPE IF EXISTS jugador_perfil;
CREATE TYPE jugador_perfil AS (
    JUGADOR tab_jugador,
    foto_perfil VARCHAR,
    foto_equipo VARCHAR,
    id_equipo INTEGER,
    nombre_equipo VARCHAR
);

CREATE OR REPLACE FUNCTION fun_get_jugador_ID_PERFIL(wid_jugador tab_jugador.id_jugador%TYPE) RETURNS json AS
$$
    BEGIN
        RETURN (
            SELECT row_to_json(jugador_perfil) 
            FROM (
                SELECT 
                    tab_jugador.id_jugador, 
                    tab_jugador.id_datos,
                    tab_jugador.nickname_jugador,
                    tab_jugador.liga_jugador,
                    tab_jugador.link_cuenta_jugador,
                    tab_jugador.id_game,
                    tab_jugador.estado_jugador,
                    tab_datosPersonales.foto_perfil_jugador AS foto_perfil,
                    COALESCE(tab_equipo.foto_equipo, 'SIN EQUIPO') AS foto_equipo,
                    tab_equipo.id_equipo,
                    tab_equipo.nom_equipo
                FROM tab_jugador
                LEFT JOIN tab_datosPersonales ON tab_jugador.id_datos = tab_datosPersonales.id_datos
                LEFT JOIN tab_jugador_equipo ON tab_jugador.id_jugador = tab_jugador_equipo.id_jugador
                LEFT JOIN tab_equipo ON tab_jugador_equipo.id_equipo = tab_equipo.id_equipo
                WHERE tab_jugador.id_jugador = wid_jugador
            ) jugador_perfil
        );
    END;
$$
LANGUAGE PLPGSQL;


-- FUNCION QUE VALIDA EL HASH DEL EQUIPO Y EL ID DEL EQUIPO EXISTAN EN LA TABLA tab_equipo
CREATE OR REPLACE FUNCTION fun_validar_hash_equipo(wid_equipo tab_equipo.id_equipo%TYPE,wid_hash_equipo tab_equipo.hash_equipo%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        ID_EQUIPO_ENCONTRADO tab_equipo.id_equipo%TYPE;
        HASH_EQUIPO_ENCONTRADO BOOLEAN := FALSE;
    BEGIN
        SELECT tab_equipo.id_equipo INTO ID_EQUIPO_ENCONTRADO FROM tab_equipo WHERE tab_equipo.id_equipo = wid_equipo AND tab_equipo.hash_equipo = wid_hash_equipo LIMIT 1;
        IF FOUND  THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$
LANGUAGE PLPGSQL;




-- FUNCION QUE ME PERMITE INSERTAR UN JUGADOR EN LA TABLA tab_jugador_equipo SIEMPRE Y CUANDO EL HASH DEL EQUIPO SEA IGUAL AL HASH QUE SE ENVIA Y EL ID DEL EQUIPO SEA IGUAL AL ID QUE SE ENVIA
CREATE OR REPLACE FUNCTION fun_insert_jugador_equipo_HASH(wid_equipo tab_equipo.id_equipo%TYPE ,
                                                wid_hash_equipo tab_equipo.hash_equipo%TYPE,wid_jugador tab_jugador_equipo.id_jugador%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE
        RETORNO BOOLEAN;
        HASH_ID_EQUIPO_VALIDO BOOLEAN;
    BEGIN
        --VALIDAR QUE EXISTA EL EQUIPO CON EL ID Y EL HASH
        SELECT fun_validar_hash_equipo(wid_equipo,wid_hash_equipo) INTO HASH_ID_EQUIPO_VALIDO;
        IF HASH_ID_EQUIPO_VALIDO THEN
            SELECT fun_insert_jugador_equipo(wid_jugador,wid_equipo) INTO RETORNO;
            IF RETORNO THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
        ELSE
            RETURN FALSE;
        END IF;     
        
       
    END;

$$
LANGUAGE PLPGSQL;