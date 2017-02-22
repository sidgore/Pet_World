create or replace procedure 
show_animals_for_a_breed (breed integer)
is
 
  animal_rec animal%rowtype;

  cursor animal_data is
  select * 
  from animal
  where breed_id = breed
  and a_id not in (
                      select animal_id 
                      from request 
                      where approval_status <> 'Y')
  order by a_id;  


begin

  open animal_data;
  fetch animal_data into animal_rec;
  if(animal_data%notfound) then 
      dbms_output.put_line('  No records available for this breed. Try a different breed. ');
  else
      dbms_output.put_line('-------------------------------------------------------------------');
      dbms_output.put_line(rpad(' Animal Id', 15)||rpad('Age', 15)||rpad('Color', 20)||rpad('Gender', 10));
      dbms_output.put_line('-------------------------------------------------------------------');
      loop
        exit when (animal_data%notfound);
        dbms_output.put_line(rpad(to_char(animal_rec.a_id), 15)||rpad(to_char(animal_rec.a_age), 15)||
                              rpad(animal_rec.a_color, 20)||rpad(animal_rec.a_gender, 10));
        fetch animal_data into animal_rec;
      end loop;
  end if;
  close animal_data;
exception
  when others then
   dbms_output.put_line(SQLERRM);
end;