ALTER TABLE iatistaging.`xml-act-results` ADD COLUMN 
      IF NOT EXISTS `result-description` MEDIUMTEXT;
      
ALTER TABLE iatistaging.`src-act-results` ADD COLUMN 
      IF NOT EXISTS `result-description` MEDIUMTEXT; 

ALTER TABLE iatischema.`dwh-results` ADD COLUMN 
      IF NOT EXISTS `result-description` MEDIUMTEXT;
		
ALTER TABLE iatidatamart.`fct-results` ADD COLUMN 
      IF NOT EXISTS `result-description` MEDIUMTEXT;     