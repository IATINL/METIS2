ALTER TABLE iatistaging.`xml-act-results` ADD COLUMN 
      IF NOT EXISTS `result-aggregation-status` BIT;
      
ALTER TABLE iatistaging.`src-act-results` ADD COLUMN 
      IF NOT EXISTS `result-aggregation-status` BIT; 

ALTER TABLE iatischema.`dwh-results` ADD COLUMN 
      IF NOT EXISTS `result-aggregation-status` BIT;
		
ALTER TABLE iatidatamart.`fct-results` ADD COLUMN 
      IF NOT EXISTS `result-aggregation-status` BIT;     