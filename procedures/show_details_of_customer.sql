create or replace procedure 
show_details_of_customer(cust_id in integer) 
is
  fname varchar(30) :=null;
  lname varchar(30) := null;
  email varchar(30);
  phone integer(10);
  zipcode integer(6);
  city varchar(30);
  state varchar(30);
  
begin
  begin
    select c_fname, c_lname, c_email, c_phone, c_zip
    into fname, lname, email, phone, zipcode
    from customer
    where c_id = cust_id;
  exception
    when no_data_found then
     begin
      select o_name, o_email, o_phone, o_zip
      into fname, email, phone, zipcode
      from organization
      where o_id = cust_id;
     end;
  end;
  
  select address.city, address.state 
  into city, state
  from address
  where zip = zipcode;
  
  dbms_output.put_line('---------------------------------------------');
  dbms_output.put_line('                  Details                    ');
  dbms_output.put_line('---------------------------------------------');
  dbms_output.put_line(' Id           :'||cust_id);
  if (lname is null) then
    dbms_output.put_line(' Type         :Organization');
    dbms_output.put_line(' Name         :'||fname);
  else
    dbms_output.put_line(' Type         :Customer'); 
    dbms_output.put_line(' First Name   :'||fname);
    dbms_output.put_line(' Last Name    :'||lname);
  end if;
  dbms_output.put_line(' Email        :'||email);
  dbms_output.put_line(' Phone        :'||phone);
  dbms_output.put_line(' Zip          :'||zipcode);
  dbms_output.put_line(' City         :'||city);
  dbms_output.put_line(' State        :'||state);
  
exception
  when no_data_found then
   dbms_output.put_line('No record exists for the customer with id :'||cust_id);
  when others then
   dbms_output.put_line(SQLERRM);
end;