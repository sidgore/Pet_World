create or replace procedure 
register_new_customer(firstname varchar, 
                      lastname varchar, 
                      email varchar,
                      phone number, 
                      cus_zip number,
                      cus_city varchar,
                      cus_state varchar)
is    
  z integer;
  
begin
    begin
      select zip into z
      from address
      where zip = cus_zip;
    exception
      when no_data_found then
        insert into address values(cus_zip,cus_city,cus_state);
      when too_many_rows then
        dbms_output.put_line('Inconsistancy in table address');
    end;
    select max(c_id) into z
    from customer;
    insert into customer values(z+1,firstname,lastname,email,phone,cus_zip);
    commit;
    dbms_output.put_line('New Customer registered. Registration ID is : '||(z+1));
exception
  when others then
    dbms_output.put_line('Error while executing procedure: register_new_customer');
    dbms_output.put_line(SQLERRM);
    rollback;
end;