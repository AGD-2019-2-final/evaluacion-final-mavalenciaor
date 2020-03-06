-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 

fs -put data.tsv;
lines = LOAD 'data.tsv' AS (let:CHARARRAY, dat:CHARARRAY, numb:INT);
order_by_data = ORDER lines BY let ASC, numb ASC;
STORE order_by_data INTO 'output';
fs -get output/ .;
fs -rm data.tsv;
