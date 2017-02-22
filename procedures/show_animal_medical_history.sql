create or replace procedure
show_animal_medical_history( anim_id in integer) 
is
  
  vacc_rec medical_history%rowtype;
  cursor vacc_data is
  select * 
  from medical_history
  where animal_id = anim_id
  order by VACCINATION_DATE;

begin
  open vacc_data;
  fetch vacc_data into vacc_rec;
  if(vacc_data%notfound) then
    dbms_output.put_line('Pets Medical record does not exist.');
  else
    dbms_output.put_line('-------------------------------------------------------------------');
    dbms_output.put_line(rpad(' Vaccination type', 25)||rpad('Vaccination data', 25)||rpad('Disease', 20));
    dbms_output.put_line('-------------------------------------------------------------------'); 
    loop
      dbms_output.put_line(rpad(vacc_rec.vaccination_type, 25)||
                           rpad(to_char(vacc_rec.vaccination_date,'MON DD YYYY'), 25)||
                           rpad(vacc_rec.disease, 20));
      fetch vacc_data into vacc_rec;
      exit when (vacc_data%notfound);
    end loop;
  end if;
exception
  when others then
    dbms_output.put_line(SQLERRM);
end;