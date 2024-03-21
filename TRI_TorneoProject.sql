--TRIGGERS CREADOS POR ESTEBAN FRANCISCO JANIOT RIVERA, VANESSA SANABRIA 2023

--TRIGGERS---------------------------------------------------------------------------------------------------------------------------------------

--DROP TRIGGER IF EXISTS tri_delete_tabla_ciudad ON tab_tipodocumento;
--DROP TRIGGER IF EXISTS tri_actividad_tabla_ciudad ON tab_tipodocumento;

-- TRIGGER PARA tab_ciudad --------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_ciudad AFTER DELETE ON tab_ciudad
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_ciudad BEFORE INSERT OR UPDATE ON tab_ciudad
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA tab_tipodocumento --------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_tipodocumento AFTER DELETE ON tab_tipodocumento
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_tipodocumento  BEFORE INSERT OR UPDATE ON tab_tipodocumento
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA tab_game ----------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_game AFTER DELETE ON tab_game
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_game BEFORE INSERT OR UPDATE ON tab_game
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA tab_datosPersonales ------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_datosPersonales AFTER DELETE ON tab_datosPersonales
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_datosPersonales BEFORE INSERT OR UPDATE ON tab_datosPersonales
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA tab_jugador --------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_jugador AFTER DELETE ON tab_jugador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_jugador BEFORE INSERT OR UPDATE ON tab_jugador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA tab_equipo ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_equipo AFTER DELETE ON tab_equipo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_equipo BEFORE INSERT OR UPDATE ON tab_equipo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

DROP TRIGGER IF EXISTS tri_delete_tabla_equipo_fun_INSERTALIDER ON tab_equipo;

CREATE OR REPLACE TRIGGER tri_fun_INSERTALIDER AFTER INSERT ON tab_equipo
FOR EACH ROW EXECUTE PROCEDURE fun_INSERTALIDER();





-- TRIGGER PARA tab_torneo ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_torneo AFTER DELETE ON tab_torneo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_torneo BEFORE INSERT OR UPDATE ON tab_torneo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_crear_match_torneo AFTER INSERT  ON tab_torneo
FOR EACH ROW EXECUTE PROCEDURE fun_crear_match_torneo();

-- TRIGGER PARA tab_match ----------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_match AFTER DELETE ON tab_match
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_match BEFORE INSERT OR UPDATE ON tab_match
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA tab_jugador_equipo -------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_jugador_equipo AFTER DELETE ON tab_jugador_equipo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_jugador_equipo BEFORE INSERT OR UPDATE ON tab_jugador_equipo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA tab_equipo_torneo --------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_equipo_torneo AFTER DELETE ON tab_equipo_torneo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_actividad_tabla_equipo_torneo BEFORE INSERT OR UPDATE ON tab_equipo_torneo
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-------------------------------------------------------------------------------------------------------------------------------------------------


