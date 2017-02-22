create or replace procedure 
show_available_breeds 
is
  breed_rec breed%rowtype;
  
  cursor all_breeds is
  select * 
  from breed
  order by b_id;
begin

  open all_breeds;
  dbms_output.put_line('-----------------------------------------------------');
  dbms_output.put_line(rpad(' Breed Id', 15)||rpad('Animal', 15)||rpad('Breed', 20));
  dbms_output.put_line('-----------------------------------------------------');
  loop
    fetch all_breeds into breed_rec;
    exit when (all_breeds%notfound);
    dbms_output.put_line(rpad(to_char(breed_rec.b_id), 15)||rpad(to_char(breed_rec.b_animal), 15)||rpad(breed_rec.b_breed, 20));
  end loop;
  close all_breeds;

exception
  when others then
   dbms_output.put_line(SQLERRM);
end;