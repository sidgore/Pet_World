create or replace procedure 
show_my_request_info(cust_id integer) 
is
  cursor my_request(id integer) is
  select r.request_id, 
         C.C_FNAME,
         C.C_LNAME,
         b.b_animal,
         a.a_age, 
         a_color, 
         decode(a.a_gender,'F','Female','M','Male','-') a_gender, 
         decode(r.approval_status,'P','Pending','Y','Approved','N','Rejected','-') approval_status
  from request r, animal a, breed b, customer c
  where a.a_id = r.animal_id
  and a.breed_id = b.b_id
  and C.C_ID = R.REQUESTER_ID
  and C.C_ID = id;

  request_rec my_request%rowtype;
begin
  open my_request(cust_id);
  fetch my_request into request_rec;
  if (my_request%found) then
     dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------');
     dbms_output.put_line(rpad(' Request Id', 15)||rpad('First Name', 25)||rpad('Last Name', 25)||rpad('Animal', 15)||rpad('Animal Age', 15)||rpad('Color', 15)||rpad('Gender', 10)||rpad('Approval Status', 20));
     dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------');
    loop
    dbms_output.put_line(' '||rpad(to_char(request_rec.request_id),15)||
                         rpad(request_rec.c_fname,25)||
                         rpad(request_rec.c_lname,25)||
                         rpad(request_rec.b_animal,15)||
                         rpad(to_char(request_rec.a_age),15)||
                         rpad(request_rec.a_color,15)||
                         rpad(request_rec.a_gender,10)||
                         rpad(request_rec.approval_status,15));
    fetch my_request into request_rec;
    exit when (my_request%notfound);
    end loop;
  else
    dbms_output.put_line('There is no request mada by you till present.');
  end if;
exception
  when others then
    dbms_output.put_line(SQLERRM);
end;