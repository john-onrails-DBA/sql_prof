-- *** DECODE eh igual a um (ou mais) IF(s) comparando igualdade com uma clausula ELSE
SELECT  DECODE(CITY,'Sao Paulo','SAO PAULO',CITY) AS CITY
FROM    HR.LOCATIONS;