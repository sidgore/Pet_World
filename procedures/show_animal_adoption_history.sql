create or replace procedure
show_animal_adoption_history( anim_id in integer ) 
is

  cursor adoption_data(a_id integer) is
  select nvl(A.ORG_ID,A.CUST_ID) donor_id, 
         a.adoption_date    adoption_date, 
         C1.C_FNAME||'  '||C1.C_LNAME adopter_name 
  from adoption_history a, customer c1
  where A.ADOPTER_ID = C1.C_ID
  and A.PET_ID=a_id
  order by adoption_date;
  
  adoption_rec adoption_data%rowtype;
  donor_fname varchar(30);
  donor_lname varchar(30);
  animal_age integer(3);
  animal_color varchar(20);
  animal_gender varchar(8);
begin

  open adoption_data(anim_id);
  fetch adoption_data into adoption_rec;
  if(adoption_data%notfound) then
    dbms_output.put_line('Adoption history for the pet does not exist.');
  else
    select a_age, a_color, decode(upper(a_gender),'M','Male','F','Female','na')
    into animal_age, animal_color, animal_gender
    from animal
    where a_id = anim_id;
    
    dbms_output.put_line('Age         :'||animal_age||' yrs');
    dbms_output.put_line('Color       :'||animal_color);
    dbms_output.put_line('Gender      :'||animal_gender);
    
    dbms_output.put_line('----------------------------------------------------------------------------------------------------------------');
    dbms_output.put_line(rpad(' Owner name', 50)||rpad('Handover date', 25)||rpad('Given to', 50));
    dbms_output.put_line('----------------------------------------------------------------------------------------------------------------'); 
    loop
      donor_fname := null;
      donor_lname := null;
      begin
        select o_name into donor_fname
        from organization
        where o_id = adoption_rec.donor_id;
      exception
        when no_data_found then
          begin
            select c_fname, c_lname
            into donor_fname, donor_lname
            from customer
            where c_id = adoption_rec.donor_id;
          exception
            when others then
              dbms_output.put_line('Error fetching data from customer');
              dbms_output.put_line(SQLERRM);
          end;
        when others then
          dbms_output.put_line('Error fetching data from organization');
          dbms_output.put_line(SQLERRM);
      end;
      dbms_output.put_line(rpad(donor_fname||'  '||donor_lname, 50)||
                           rpad(to_char(adoption_rec.adoption_date,'MON DD YYYY'), 25)||
                           rpad(adoption_rec.adopter_name, 50));
      fetch adoption_data into adoption_rec;
      exit when (adoption_data%notfound);
    end loop;
  end if;
exception
  when others then
    dbms_output.put_line(SQLERRM);
end;