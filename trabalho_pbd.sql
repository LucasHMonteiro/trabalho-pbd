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
 
 select R.TABLE_NAME, U.COLUMN_NAME
from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE u
inner join INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS FK
    on U.CONSTRAINT_CATALOG = FK.UNIQUE_CONSTRAINT_CATALOG
    and U.CONSTRAINT_SCHEMA = FK.UNIQUE_CONSTRAINT_SCHEMA
    and U.CONSTRAINT_NAME = FK.UNIQUE_CONSTRAINT_NAME
inner join INFORMATION_SCHEMA.KEY_COLUMN_USAGE R
    ON R.CONSTRAINT_CATALOG = FK.CONSTRAINT_CATALOG
    AND R.CONSTRAINT_SCHEMA = FK.CONSTRAINT_SCHEMA
    AND R.CONSTRAINT_NAME = FK.CONSTRAINT_NAME;
    
-- Questão 4
    
-- Parte 2
    
-- Questão 1
    
    