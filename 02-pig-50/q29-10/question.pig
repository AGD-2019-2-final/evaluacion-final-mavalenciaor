-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
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
selected_data = FOREACH u GENERATE birthday,
                                   REGEX_EXTRACT(birthday, '(....)-(..)-(..)', 2) AS b_year;
months_data = FOREACH selected_data GENERATE birthday, (CASE b_year 
                                                        WHEN '01' THEN 'ene'
                                                        WHEN '02' THEN 'feb'
                                                        WHEN '03' THEN 'mar'
                                                        WHEN '04' THEN 'abr'
                                                        WHEN '05' THEN 'may'
                                                        WHEN '06' THEN 'jun'
                                                        WHEN '07' THEN 'jul'
                                                        WHEN '08' THEN 'ago'
                                                        WHEN '09' THEN 'sep'
                                                        WHEN '10' THEN 'oct'
                                                        WHEN '11' THEN 'nov'
                                                        ELSE 'dic' END), b_year,
                                                        (CASE b_year 
                                                        WHEN '01' THEN '1'
                                                        WHEN '02' THEN '2'
                                                        WHEN '03' THEN '3'
                                                        WHEN '04' THEN '4'
                                                        WHEN '05' THEN '5'
                                                        WHEN '06' THEN '6'
                                                        WHEN '07' THEN '7'
                                                        WHEN '08' THEN '8'
                                                        WHEN '09' THEN '9'
                                                        WHEN '10' THEN '10'
                                                        WHEN '11' THEN '11'
                                                        ELSE '12' END);
STORE months_data INTO 'output' USING PigStorage(',');
fs -get output/ .;
fs -rm data.csv;