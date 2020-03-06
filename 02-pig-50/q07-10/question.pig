-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put data.tsv;
records = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:BAG{t:tuple(p:CHARARRAY)}, c3:MAP[]);
conteo = FOREACH records GENERATE c1, COUNT(c2) AS c2_tam, SIZE(c3) AS c3_tam;
ordered_data = ORDER conteo BY c1 ASC, c2_tam ASC, c3_tam ASC;
STORE ordered_data INTO 'output' USING PigStorage(',');
fs -get output/ .;
fs -rm data.tsv;