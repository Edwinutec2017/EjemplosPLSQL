/*crear una tabla bitacora que guardar la cantidad de 
usuarios y a que id de hizo la modificacion*/
CREATE OR REPLACE TRIGGER TT_BITACORA
FOR UPDATE OR INSERT  ON PERSONA
COMPOUND TRIGGER
    cantidad INT;
    idreg INT;
    accion varchar(50);
AFTER EACH ROW IS
    BEGIN
if UPDATING then 
idreg := :OLD.ID_PERSONA;
accion := 'Update';
end if;
IF INSERTING THEN
idreg := :new.ID_PERSONA;
accion := 'Insert';
END IF;
END AFTER EACH ROW;
AFTER STATEMENT IS
BEGIN
select count(*) INTO cantidad from PERSONA;
INSERT INTO BITACORA(TIPOTRX,TOTALCLIENTES,ID_CLIENTEBT) 
VALUES(accion,cantidad,idreg);
END AFTER STATEMENT;
END;