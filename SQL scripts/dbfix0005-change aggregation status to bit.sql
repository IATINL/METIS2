ALTER TABLE iatistaging.`xml-act-results`  
      MODIFY COLUMN `result-aggregation-status` BIT;
      
ALTER TABLE iatistaging.`src-act-results`  
      MODIFY COLUMN `result-aggregation-status` BIT; 

ALTER TABLE iatischema.`dwh-results`  
      MODIFY COLUMN `result-aggregation-status` BIT;
		
ALTER TABLE iatidatamart.`fct-results`  
      MODIFY COLUMN `result-aggregation-status` BIT;     