
/* JOBS */

/* DBMS_SCHEDULER_JOB */

create table log_actividades(
  id_log int not null,
  fecha date,
);

/* creacion de un JOB de tipo PLSQL */
begin
  sys.dbms_scheduler.create_job(
    job_name => 'first_job',
    job_type => 'PLSQL_BLOCK',
    job_action => 'declare
    v_conteo number :=0;
    begin
      select count(*) into v_conteo
      from log_actividades;
      insert into log_actividades values(v_conteo + 1, sysdate);
      commit;
    end;'
  start_date => systimestamp,
  repeat_interval => 'freq=secondly; interval=5',
  end_date => null,
  enabled => true /* false */,
  comments => 'log de actividades...');
end;

/* salida: PL/SQL Procedure successfully created */

/* mostrar actividades */
select * from log_actividades;

/* 
  salida:

  id_log      fecha

  1           20-jul-22 14:23:12
  2           20-jul-22 14:23:13
  3           20-jul-22 14:23:14
  4           20-jul-22 14:23:15
  5           20-jul-22 14:23:16
 */


