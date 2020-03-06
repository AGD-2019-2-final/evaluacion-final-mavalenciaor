-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u
--    WHERE color = 'blue' OR firstname LIKE 'K%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put data.csv;
selected_data = FOREACH u GENERATE firstname, SUBSTRING(firstname, 0, 1) AS fn_f, color AS color;
filtered_data = FILTER selected_data BY (fn_f == 'K') OR (color == 'blue');
final_data = FOREACH filtered_data GENERATE firstname, color;
STORE final_data INTO 'output' USING PigStorage(',');
fs -get output/ .;
fs -rm data.csv;