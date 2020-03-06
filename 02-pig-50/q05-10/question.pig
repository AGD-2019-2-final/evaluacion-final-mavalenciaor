-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;
records = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:CHARARRAY, c3:CHARARRAY);
second_col = FOREACH records GENERATE c2;
second_col_b = FOREACH second_col GENERATE REPLACE(c2, '\\}', '') AS c2;
second_col_c = FOREACH second_col_b GENERATE REPLACE(c2, '\\)', '') AS c2;
second_col_d = FOREACH second_col_c GENERATE REPLACE(c2, '\\{', '') AS c2;
second_col_e = FOREACH second_col_d GENERATE REPLACE(c2, '\\(', '') AS c2;
div = FOREACH second_col_e GENERATE FLATTEN(TOKENIZE(c2)) AS c2;
grouped = GROUP div BY c2;
letcount = FOREACH grouped GENERATE group, COUNT(div);
STORE letcount INTO 'output';
fs -get output/ .;
fs -rm data.tsv;