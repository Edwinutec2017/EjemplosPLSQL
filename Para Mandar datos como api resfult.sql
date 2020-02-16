create or replace procedure SL_DEPARTAMENTO
AS 
departamento_cursor SYS_REFCURSOR;
 OPTION_NOT_FOUND EXCEPTION;
begin 
  savepoint prev;
OPEN departamento_cursor FOR
SELECT DP.ID_DEPARTAMENTO AS CODIGO,DP.NOMBRE_DEPARTAMENTO AS NOMBRE FROM DEPARTAMENTO DP;
  APEX_JSON.open_object;
        APEX_JSON.write('departamentos', departamento_cursor);
    APEX_JSON.close_object;
    COMMIT;
EXCEPTION 
    WHEN OPTION_NOT_FOUND THEN
         HTP.print(SQLERRM);
    WHEN OTHERS THEN
         HTP.print(SQLERRM);
end SL_DEPARTAMENTO;