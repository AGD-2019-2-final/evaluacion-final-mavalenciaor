-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;
lines = LOAD 'data.tsv' AS (let:CHARARRAY, dat:CHARARRAY, numb:INT);
numbers = FOREACH lines GENERATE numb;
sorted_numbs = ORDER numbers BY numb ASC;
limited_data = LIMIT sorted_numbs 5;
STORE limited_data INTO 'output';
fs -get output/ .;
fs -rm data.tsv;