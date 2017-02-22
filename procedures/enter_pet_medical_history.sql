create or replace procedure
enter_pet_medical_history(anim_id integer, vacc_type varchar, vacc_date varchar, disease varchar)
is
 animal_id integer(5);
begin
  
  select count(a_id)
  into animal_id
  from animal
  where a_id = anim_id;
  
  if(animal_id>0) then
    insert into medical_history values(vacc_type,to_date(vacc_date,'dd-mon-yyyy'),disease,anim_id);
  else
    dbms_output.put_line('Cannot find a pet with the mentioned id.');
  end if;
  commit;

exception
  when others then
    dbms_output.put_line(SQLERRM);
end;