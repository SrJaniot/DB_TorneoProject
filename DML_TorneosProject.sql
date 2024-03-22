-- DML CREADO POR ESTEBAN FRANCISCO JANIOT RIVERA, VANESSA SANABRIA

-- DML PARA LA TABLA CIUDAD-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT fun_insert_ciudad('bucaramanga','ciudad bucaramanga departamento santander');
SELECT fun_insert_ciudad('bogota','ciudad bogota departamento BOGOTA');
SELECT fun_insert_ciudad('medellin','ciudad medellin departamento antioquia');
SELECT fun_insert_ciudad('cali','ciudad cali departamento valle del cauca');
SELECT fun_insert_ciudad('barranquilla','ciudad barranquilla departamento atlantico');
SELECT fun_insert_ciudad('cartagena','ciudad cartagena departamento bolivar');
SELECT fun_insert_ciudad('cucuta','ciudad cucuta departamento norte de santander');
SELECT fun_insert_ciudad('soledad','ciudad soledad departamento atlantico');
SELECT fun_insert_ciudad('ibague','ciudad ibague departamento tolima');
SELECT fun_insert_ciudad('Floridablanca','ciudad floridablanca departamento santander');
SELECT fun_insert_ciudad('villavicencio','ciudad villavicencio departamento meta');
SELECT fun_insert_ciudad('bello','ciudad bello departamento antioquia');
SELECT fun_insert_ciudad('pereira','ciudad pereira departamento risaralda');
SELECT fun_insert_ciudad('valledupar','ciudad valledupar departamento cesar');
SELECT fun_insert_ciudad('manizales','ciudad manizales departamento caldas');
SELECT fun_insert_ciudad('monteria','ciudad monteria departamento cordoba');
SELECT fun_insert_ciudad('neiva','ciudad neiva departamento huila');
SELECT fun_insert_ciudad('envigado','ciudad envigado departamento antioquia');
SELECT fun_insert_ciudad('pasto','ciudad pasto departamento nariño');
SELECT fun_insert_ciudad('buenaventura','ciudad buenaventura departamento valle del cauca');
SELECT fun_insert_ciudad('piedecuesta','ciudad piedecuesta departamento santander');

--SELECT * FROM tab_ciudad;

-- DML PARA LA TABLA TIPODOCUMENTO-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT fun_insert_tipodocumento('cedula','documento de identidad colombiano');
SELECT fun_insert_tipodocumento('pasaporte','documento de identidad internacional');
SELECT fun_insert_tipodocumento('tarjeta de identidad','documento de identidad colombiano');
SELECT fun_insert_tipodocumento('cedula de extranjeria','documento de identidad colombiano');

--SELECT * FROM tab_tipodocumento;

-- DML PARA LA TABLA GAME-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT fun_insert_game('league of legends','juego de estrategia en tiempo real',5,'https://static.wikia.nocookie.net/leagueoflegendsoficial/images/8/8c/LOL_Logo.png/revision/latest?cb=20180119195439&path-prefix=es');
SELECT fun_insert_game('valorant','juego de disparos en primera persona',5,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Valorant_logo.svg/1200px-Valorant_logo.svg.png');
SELECT fun_insert_game('counter strike','juego de disparos en primera persona',5,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/CS-GO_Logo.svg/1200px-CS-GO_Logo.svg.png');
SELECT fun_insert_game('dota 2','juego de estrategia en tiempo real',5,'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Dota_2_logo.svg/1200px-Dota_2_logo.svg.png');
SELECT fun_insert_game('overwatch','juego de disparos en primera persona',7,'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Overwatch_circle_logo.svg/1200px-Overwatch_circle_logo.svg.png');

--SELECT * FROM tab_game;

-- DML PARA LAS TABLAS DATOSPERSONALES MAS JUGADOR------------------------------------------------------------------------------------------------------------------------------------------------------------- 
SELECT fun_insert_jugador_datospersonales('esteban janiot',24,'3152901731','estebanjaniot10@gmail.com','https://fotodeesteban.com',1,1,'1098825375',
                                          'señor janiot','oro','https://www.op.gg/summoners/lan/Señor%20Janiot-LAN',1);
SELECT fun_insert_jugador_datospersonales('Christian Torres',24,'3146808848','christianalexis399@gmail.com','https://fotodechristian.com',1,
                                          'Halomip','Esmeralda ','https://www.op.gg/summoners/lan/Halomip-LAN',1);
SELECT fun_insert_jugador_datospersonales('Vanessa Sanabria',24,'3052295353','vanessa.sanabriia@gmail.com','https://fotodechristian.com',1,
                                          'señora janiot','challenger ','https://www.op.gg/summoners/Señora%20Janiot-LAN',1);
SELECT fun_insert_jugador_datospersonales('prueba1',24,'1234567890','prueba.1@gmail.com','https://fotodechristian.com',1,
                                          'prueba1','bronce ','https://www.op.gg/summoners/lan/prueba1-LAN',1);
SELECT fun_insert_jugador_datospersonales('prueba2',24,'1234567890','prueba.2@gmail.com','https://fotodechristian.com',1,
                                          'prueba2','bronce ','https://www.op.gg/summoners/lan/prueba1-LAN',1);
SELECT fun_insert_jugador_datospersonales('prueba3',24,'1234567890','prueba.3@gmail.com','https://fotodechristian.com',1,
                                          'prueba3','bronce ','https://www.op.gg/summoners/lan/prueba1-LAN',1);
SELECT fun_insert_jugador_datospersonales('prueba4',24,'1234567890','prueba.4@gmail.com','https://fotodechristian.com',1,
                                          'prueba4','bronce ','https://www.op.gg/summoners/lan/prueba1-LAN',1);
SELECT fun_insert_jugador_datospersonales('prueba5',24,'1234567890','prueba.5@gmail.com','https://fotodechristian.com',1,
                                          'prueba5','bronce ','https://www.op.gg/summoners/lan/prueba1-LAN',1);
SELECT fun_insert_jugador_datospersonales('prueba6',24,'1234567890','prueba.6@gmail.com','https://fotodechristian.com',1,
                                          'prueba6','bronce ','https://www.op.gg/summoners/lan/prueba1-LAN',1);




--SELECT * FROM tab_jugador;
--SELECT * FROM tab_datospersonales;

-- BUSCAR ID A PARTIR DEL CORREO 
SELECT fun_retornar_id_jugador('mapovin590@tospage.com');


-- DML PARA LA TABLA EQUIPO-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT fun_insert_equipo('teaM SRJANIOT','equipo de league of legends','https://fotodeequipo.com',1,1,'SIN HASH'); --se puede
SELECT fun_insert_equipo('teaM SRaJANIOT','equipo de valorant','https://fotodeequipo.com',2,1,'SIN HASH'); -- se puede
SELECT fun_insert_equipo('teaM SRHALOMIP','equipo de league of legends','https://fotodeequipo.com',1,1,'SIN HASH'); -- se puede

--SELECT * FROM tab_equipo;

--DML PARA LA TABLA EVENTO-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT fun_insert_evento('evento frikifest','descripcion',TIMESTAMP '2024-12-24 23:59:59',TIMESTAMP '2024-12-25 23:59:59',
                        'https://fotodetorneo.com','500.000 PESOS','300.000 PESOS','200.000 PESOS','https://videodeexplicacion.com',100,100000,
                        'prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba');

--SELECT * FROM tab_evento;

-- DML PARA LA TABLA TORNEO-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT fun_insert_torneo('League of mini','torneo de league of legends de 8 equipos',TIMESTAMP '2024-12-24 23:59:59',TIMESTAMP '2024-12-25 23:59:59',
                        'https://fotodetorneo.com','500.000 PESOS','300.000 PESOS','200.000 PESOS','https://videodeexplicacion.com',8,100000,1,
                        'prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba',1);
SELECT fun_insert_torneo('League of flash','torneo de league of legends de 16 equipos',TIMESTAMP '2024-12-24 23:59:59',TIMESTAMP '2024-12-25 23:59:59',
                        'https://fotodetorneo.com','500.000 PESOS','300.000 PESOS','200.000 PESOS','https://videodeexplicacion.com',16,100000,1);
SELECT fun_insert_torneo('League of low','torneo de league of legends de 32 equipos',TIMESTAMP '2024-12-24 23:59:59',TIMESTAMP '2024-12-25 23:59:59',
                        'https://fotodetorneo.com','500.000 PESOS','300.000 PESOS','200.000 PESOS','https://videodeexplicacion.com',32,100000,1);						


--SELECT * FROM tab_torneo;
--SELECT * FROM tab_match;





-- PRUEBAS VINCULAR JUGADOR A EQUIPO-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT fun_insert_jugador_equipo(1,2);
SELECT fun_validar_hash_equipo(2,'PNNfFt0vOfRlfwuGRauseBboLzDfSdIyBf9cSLv5VzT6lWMQI21rZMdtoVHvmOg34yP3axqAeJqKaWftS23pkgXoDJFkKrOcN4CP');
SELECT fun_insert_jugador_equipo_HASH(2,'PNNfFt0vOfRlfwuGRauseBboLzDfSdIyBf9cSLv5VzT6lWMQI21rZMdtoVHvmOg34yP3axqAeJqKaWftS23pkgXoDJFkKrOcN4CP',12);

--SELECT * FROM tab_equipo;
--SELECT * FROM tab_jugador;
--SELECT * FROM tab_jugador_equipo;



--PRUEBAS VINCULAR EQUIPO A TORNEO------------------------------------------------------------------------------------------------------------------------------------------------------------- 
SELECT fun_insert_equipo_torneo(2,1,1);
--OJO CORREGIR DE QUE ESTEBAN NO SE PUEDA ENFRENTAR CONTRA ESTEBAN.

--SELECT * FROM tab_equipo_torneo;


--FUNCION QUE ME RETORNA EQUIPOFULL----------------------------------------------------------
SELECT fun_get_equipoFULL(1);


--FUNCION QUE ME RETORNA JUGADOR_PERFIL----------------------------------------------------------
SELECT fun_get_jugador_ID_PERFIL(1);


--FUNCION PARA INSERTAR TIKET-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT fun_insert_asistencia_evento(1,1,'HASH');


