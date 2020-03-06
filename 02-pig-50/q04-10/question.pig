--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 

fs -put truck_event_text_partition.csv;

records = LOAD 'truck_event_text_partition.csv' USING PigStorage (',')
                                                    AS (driverId:INT, truckId:INT, eventTime:CHARARRAY, eventType:CHARARRAY,
                                                    longitude:DOUBLE, latitude:DOUBLE, eventKey:CHARARRAY,
                                                    correlationId:CHARARRAY, driverName:CHARARRAY, routeId:BIGINTEGER ,
                                                    routeName:CHARARRAY, eventDate:CHARARRAY);
firsts_columns = FOREACH records GENERATE driverId, truckId, eventTime;
fc_table = FOREACH firsts_columns GENERATE driverId, truckId, eventTime;
rank_e = RANK fc_table;
ranked_filt = FILTER rank_e BY rank_fc_table <= 10;
ranked_filt_f = FOREACH ranked_filt GENERATE driverId, truckId, eventTime;
sorted_records = ORDER ranked_filt_f BY driverId ASC, truckId ASC, eventTime ASC;
STORE sorted_records INTO 'output' USING PigStorage(',');
fs -get output/ .;
fs -rm truck_event_text_partition.csv;