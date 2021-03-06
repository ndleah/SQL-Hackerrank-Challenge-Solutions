SELECT WANDS.ID, 
       WANDS_PROPERTY.AGE, 
       WANDS.COINS_NEEDED, 
       WANDS.POWER
FROM   WANDS 
       JOIN WANDS_PROPERTY 
         ON WANDS.CODE = WANDS_PROPERTY.CODE 
WHERE  WANDS_PROPERTY.IS_EVIL = 0 
AND WANDS.COINS_NEEDED = (
    SELECT MIN(WANDS_2.COINS_NEEDED) 
    FROM   WANDS AS WANDS_2
    JOIN WANDS_PROPERTY AS WANDS_PROPERTY_2 
        ON WANDS_2.CODE = WANDS_PROPERTY_2.CODE 
    WHERE  WANDS_PROPERTY.AGE = WANDS_PROPERTY_2.AGE 
    AND WANDS.POWER = WANDS_2.POWER
    ) 
ORDER  BY WANDS.POWER DESC, 
          WANDS_PROPERTY.AGE DESC; 