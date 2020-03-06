--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta en SQL.
-- 
--    SELECT
--        color
--    FROM 
--        u 
--    WHERE 
--        color 
--    LIKE 'b%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

fs -put data.csv;
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

colors_g = FOREACH u GENERATE color, SUBSTRING(color, 0, 1) AS color_f;
filtered_data = FILTER colors_g BY color_f == 'b';
final_data = FOREACH filtered_data GENERATE color;
STORE final_data INTO 'output';
fs -get output/ .;
fs -rm data.csv;