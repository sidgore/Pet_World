create or replace procedure
register_new_pet(your_id integer,
                type_of_cust varchar,  --organization , --customer
                age integer,
                color varchar,
                gender varchar,
                breed number)
is
  no_such_customer exception;
  no_such_breed exception;
  max_id integer(5);
begin
  if (upper(substr(type_of_cust,0,1)) = 'O') then
      select o_id 
      into max_id
      from organization
      where o_id = your_id;
  elsif (upper(substr(type_of_cust,0,1)) = 'C') then
      select c_id 
      into max_id
      from customer
      where c_id = your_id;
  else
      raise no_such_customer;
  end if;
  
    select count(b_id)
    into max_id
    from breed
    where b_id = breed;
    if(max_id = 0) then
      raise no_such_breed;
    end if;
    
    select max(a_id)
    into max_id 
    from animal;
    
    if (upper(substr(type_of_cust,0,1)) = 'O') then
      insert into animal values(max_id+1, age, color, gender, your_id, null , breed);
      insert into adoption_history values (your_id,null,to_date(sysdate,'dd-MON-yyyy'),null,max_id+1);
    else
      insert into animal values(max_id+1, age, color, gender, null, your_id, breed);
      insert into adoption_history values (null, your_id,to_date(sysdate,'dd-MON-yyyy'),null,max_id+1);
    end if;
    dbms_output.put_line(' You pet has been registered. Pet id : '||(max_id+1));
    commit;
exception
  when no_such_customer then
    dbms_output.put_line('No such customer type exist.');
  when no_such_breed then
    dbms_output.put_line('We dont support any such kind of Breed.');
    dbms_output.put_line('Please revisit the breeds we list');
  when no_data_found then
    dbms_output.put_line('Customer record not found.');
    dbms_output.put_line('Please register your self and then put your animal for donation');
  when others then
    rollback;
    dbms_output.put_line(SQLERRM);
end;