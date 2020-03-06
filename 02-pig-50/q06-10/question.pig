-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;

records = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:CHARARRAY, c3:CHARARRAY);
third_col = FOREACH records GENERATE c3;
third_col_b = FOREACH third_col GENERATE REPLACE(c3, '\\]', '') AS c3;
third_col_c = FOREACH third_col_b GENERATE REPLACE(c3, '\\[', '') AS c3;
third_col_d = FOREACH third_col_c GENERATE REPLACE(c3, '\\#', '') AS c3;
third_col_e = FOREACH third_col_d GENERATE REPLACE(c3, '[0-9]', '') AS c3;
div = FOREACH third_col_e GENERATE FLATTEN(TOKENIZE(c3)) AS c3;
grouped = GROUP div BY c3;
letcount = FOREACH grouped GENERATE group, COUNT(div);
STORE letcount INTO 'output' USING PigStorage(',');
fs -get output/ .;

fs -rm data.tsv;