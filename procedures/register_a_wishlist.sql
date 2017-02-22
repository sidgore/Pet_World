create or replace procedure
register_a_wishlist(cu_id in number, breed_id in number)
is
  not_a_registered_breed exception;
  not_a_registered_person exception;
  cust_id number(5);
  anim_id number(5);
  br_id number(5);
  req_id number(5);
  req_count number(2);
begin
  begin
    select b_id
    into br_id
    from breed
    where b_id = breed_id;
  exception
    when no_data_found then
      raise not_a_registered_breed;
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

       select max(request_id)
       into req_id
       from request;
       insert into request values(req_id+1,cust_id, breed_id,null,'P');
       dbms_output.put_line('Your request as a wishlist for breed id: '||br_id||' is registered.');
       dbms_output.put_line('Request number is: '||(req_id+1));
       commit;

exception
  when not_a_registered_breed then
    dbms_output.put_line('No Breed with the mentioned Breed Id is present in the Database.');
  when not_a_registered_person then
    dbms_output.put_line('Entered Customer id is not valid.');
  when others then
    dbms_output.put_line(SQLERRM);
end;