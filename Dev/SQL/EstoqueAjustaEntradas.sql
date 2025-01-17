﻿create or replace function AjusteEntrada()
returns void as
$$
Declare
	r		record;
	text_var1	text;
Begin
	for r in (
		select recno		
		  from sam0001001 
		 order by al_serial, b1_codpro)
	loop
		text_var1 := '';
	begin
		update sam0001001 set recno = r.recno where recno = r.recno;
		exception
				when raise_exception then	
					GET STACKED DIAGNOSTICS text_var1 = MESSAGE_TEXT;
			end;
			if text_var1 <> '' then
				raise notice '%', text_var1;
			end if;
	end loop;		  
end;
$$
language plpgsql;
