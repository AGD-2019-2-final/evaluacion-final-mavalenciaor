-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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
dates = FOREACH u GENERATE birthday, ToDate(birthday, 'yyyy-MM-dd') AS birthday_d;
b_years = FOREACH dates GENERATE GetYear(birthday_d) AS years;
grouped_data = GROUP b_years BY years;
result = FOREACH grouped_data GENERATE group, COUNT(b_years);
STORE result INTO 'output' USING PigStorage(',');
fs -get output/ .;
fs -rm data.csv;