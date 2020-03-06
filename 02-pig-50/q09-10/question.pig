-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

fs -put data.csv;

records = LOAD 'data.csv' USING PigStorage (',') AS (idn:INT, name:CHARARRAY, lastname:CHARARRAY, 
                                                     birthdate:CHARARRAY, color:CHARARRAY, numb:INT);
result = FOREACH records GENERATE CONCAT(name, '@', lastname);
DUMP result;
STORE result INTO 'output';
fs -get output/ .;
fs -rm data.csv;
