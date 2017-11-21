-- Parte 1

-- Questão 1 Ok!

select
 t.relname as table_name,
 i.relname as index_name,
 a.attname as column_name
from
 pg_class t,
 pg_class i,
 pg_index ix,
 pg_attribute a
where
 t.oid = ix.indrelid
 and i.oid = ix.indexrelid
 and a.attrelid = t.oid
 and a.attnum = ANY(ix.indkey)
 and t.relkind = 'r'
 and t.relname not like 'pg%'
order by
 t.relname,
 i.relname;
 
 select * from pg_indexes where indexname not like 'pg%';
 
 -- Questão 2

 create or replace function remove_indexes(table_name varchar(100)) returns void as $$
 begin
 	delete from pg_catalog.pg_indexes where tablename = table_name;
 end; $$ LANGUAGE plpgsql; remove_indexes('Album');
 
 -- Questão 3 OK!
 
 select r.table_name, u.column_name
from information_schema.constraint_column_usage u
inner join information_schema.referential_constraints fk
    on u.constraint_catalog = fk.unique_constraint_catalog
    and u.constraint_schema = fk.unique_constraint_schema
    and u.constraint_name = fk.unique_constraint_name
inner join information_schema.key_column_usage r
    on r.constraint_catalog = fk.constraint_catalog
    and r.constraint_schema = fk.constraint_schema
    and r.constraint_name = fk.constraint_name;
    
-- Questão 4
    
-- Parte 2
    
-- Questão 1
    
    