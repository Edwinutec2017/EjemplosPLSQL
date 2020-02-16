
/*restringcion operaciones de eliminacion y actualizacion a la tabla bitacora */
create or replace TRIGGER TT_RESTRICION
BEFORE DELETE OR UPDATE ON BITACORA
FOR EACH ROW
BEGIN 
if DELETING THEN
   If :Old.ID_BITACORA > 1 then
   Raise_Application_Error(-20099, 'No se puede Ejecutar la operacion Eliminacion.');
  END IF;
End If;
if UPDATING then
  If :Old.ID_BITACORA > 1 then
   Raise_Application_Error(-20099, 'No se puede Ejecutar la operacion Actualizacion.');
  END IF;
end if;
END;