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

-- DML PARA LA TABLA GAME-------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT fun_insert_game('league of legends','juego de estrategia en tiempo real',5,'https://static.wikia.nocookie.net/leagueoflegendsoficial/images/8/8c/LOL_Logo.png/revision/latest?cb=20180119195439&path-prefix=es');
SELECT fun_insert_game('valorant','juego de disparos en primera persona',5,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Valorant_logo.svg/1200px-Valorant_logo.svg.png');
SELECT fun_insert_game('counter strike','juego de disparos en primera persona',5,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/CS-GO_Logo.svg/1200px-CS-GO_Logo.svg.png');
SELECT fun_insert_game('dota 2','juego de estrategia en tiempo real',5,'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Dota_2_logo.svg/1200px-Dota_2_logo.svg.png');
SELECT fun_insert_game('overwatch','juego de disparos en primera persona',7,'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Overwatch_circle_logo.svg/1200px-Overwatch_circle_logo.svg.png');

--SELECT * FROM tab_game;