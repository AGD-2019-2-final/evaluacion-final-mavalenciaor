-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;

lines = LOAD 'data.tsv' AS (let:CHARARRAY, dat:CHARARRAY, numb:INT);
group_let = GROUP lines BY let;
appcount = FOREACH group_let GENERATE group, COUNT(lines.numb);
DUMP appcount;
STORE appcount INTO 'output';
fs -get output/ .;

fs -rm data.tsv;