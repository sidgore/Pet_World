create or replace procedure 
approve_pet_request(req_id in integer)
is
   anim_id integer(5);
   request_by_id integer(5);
   owner_id integer(5);
begin
  
  select animal_id, requester_id 
  into anim_id, request_by_id
  from request
  where request_id = req_id;
  
  select nvl(o_id,c_id)
  into owner_id
  from animal 
  where a_id = anim_id; 
  
  update request
  set approval_status='Y'
  where request_id = req_id;
  if (sql%found) then
    update animal 
    set o_id = null, c_id = request_by_id
    where a_id = anim_id;
    if(sql%found) then
        update adoption_history
        set adopter_id = request_by_id
        where pet_id = anim_id
        and (org_id = owner_id or cust_id = owner_id);
        if(sql%found) then
          insert into adoption_history values(null,request_by_id,to_date(sysdate,'dd-mon-yyyy'),null,anim_id);
          commit;
        end if;
    end if;
  end if;
  
exception
when no_data_found then
  dbms_output.put_line('No such request available');
end;