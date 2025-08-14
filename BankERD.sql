select a.*,c.c_name
from bank_account a
join bank_customer c on a.a_c_no = c.c_no;

select c.*, a.a_no from bank_customer c
join bank_account a on c.c_no = a.a_c_no
where c_no = '730423-1000001';