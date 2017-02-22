create or replace procedure
request_a_pet(cu_id in number, pet_reg_id in number)
is
  not_a_registered_animal exception;
  not_a_registered_person exception;
  cust_id number(5);
  anim_id number(5);
  breed_id number(5);
  req_id number(5);
  req_count number(2);
begin
  begin
    select a_id, breed_id
    into anim_id, breed_id
    from animal
    where a_id = pet_reg_id;
  exception
    when no_data_found then
      raise not_a_registered_animal;
  end;
  
  begin
    select c_id
    into cust_id
    from customer
    where c_id = cu_id;
  exception
    when no_data_found then
      raise not_a_registered_person;
  end;

  select count(request_id)
  into req_count
  from request
  where requester_id = cu_id
  and approval_status = 'P';
  if (req_count=0) then
    begin
     select request_id
     into req_id
     from request
     where animal_id = anim_id
     and upper(approval_status) = 'Y';
     dbms_output.put_line('This animal is no longer available for adoption. Please try a different one.');
   exception
     when no_data_found then
       select max(request_id)
       into req_id
       from request;
       insert into request values(req_id+1,cust_id, breed_id, anim_id,'P');
       dbms_output.put_line('Your request for animal id: '||anim_id||' is registered.');
       dbms_output.put_line('Request number is: '||(req_id+1));
       commit;
   end;
  else 
    dbms_output.put_line('A customer at a time can raise only one request.');
    dbms_output.put_line('More than one requests are not allowed');
  end if;
exception
  when not_a_registered_animal then
    dbms_output.put_line('No animal with the mentioned Animal Id is present in the Database.');
  when not_a_registered_person then
    dbms_output.put_line('Entered Customer id is not valid.');
  when others then
    dbms_output.put_line(SQLERRM);
end;