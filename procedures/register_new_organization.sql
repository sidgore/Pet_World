create or replace procedure 
register_new_organization(Org_name varchar, 
                          email varchar,
                          phone number, 
                          Org_zip number,
                          Org_city varchar,
                          Org_state varchar)
is    
  z integer;
  
begin
    begin
      select zip into z
      from address
      where zip = Org_zip;
    exception
      when no_data_found then
        insert into address values(Org_zip,Org_city,Org_state);
      when too_many_rows then
        dbms_output.put_line('Inconsistancy in table address');
    end;
    select max(o_id) into z
    from organization;
    insert into organization values(z+1,Org_name,email,phone,Org_zip);
    commit;
    dbms_output.put_line('New Organization registered. Registration ID is : '||(z+1));
exception
  when others then
    dbms_output.put_line('Error while executing procedure: register_new_organization');
    dbms_output.put_line(SQLERRM);
    rollback;
end;