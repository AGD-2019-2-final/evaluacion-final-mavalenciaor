-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;
records = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:BAG{t:tuple(v:CHARARRAY)}, c3:MAP[]);
combs = FOREACH records GENERATE FLATTEN(c2.v), FLATTEN(c3);
combs_filt = FOREACH combs GENERATE ($0) AS c1, ($1) AS c2;
grouped = GROUP combs_filt BY (c1, c2);
final_count = FOREACH grouped GENERATE group, COUNT(combs_filt);
STORE final_count INTO 'output';
fs -get output/ .;
fs -rm data.tsv;