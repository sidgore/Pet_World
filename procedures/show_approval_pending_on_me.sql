create or replace procedure 
show_approval_pending_on_me(cust_id integer) 
is
  cursor my_request(id integer) is
  select r.request_id, 
         b.b_animal,
         a.a_age, 
         a_color, 
         a.a_gender, 
         decode(r.approval_status,'P','Pending','-') approval_status
  from request r, animal a, breed b
  where a.a_id = r.animal_id
  and r.approval_status = 'P'
  and a.breed_id = b.b_id  and a.o_id = id or a.c_id = id;

  request_rec my_request%rowtype;
begin
  open my_request(cust_id);
  fetch my_request into request_rec;
  if (my_request%found) then
     dbms_output.put_line('--------------------------------------------------------------------------------------------');
     dbms_output.put_line(rpad(' Request Id', 15)||rpad('Animal', 15)||rpad('Animal Age', 15)||rpad('Color', 25)||rpad('Gender', 10)||rpad('Approval Status', 20));
     dbms_output.put_line('--------------------------------------------------------------------------------------------');
    loop
    dbms_output.put_line(' '||rpad(to_char(request_rec.request_id),15)||
                         rpad(request_rec.b_animal,15)||
                         rpad(to_char(request_rec.a_age),15)||
                         rpad(request_rec.a_color,25)||
                         rpad(request_rec.a_gender,10)||
                         rpad(request_rec.approval_status,15));
    fetch my_request into request_rec;
    exit when (my_request%notfound);
    end loop;
  else
    dbms_output.put_line('No pending approval request exists for you');
  end if;
exception
  when others then
    dbms_output.put_line(SQLERRM);
end;