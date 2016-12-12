ALTER TABLE iatidatamart.`fct-results` 
	ADD IF NOT EXISTS `baseline-is-number` BIT;
	
ALTER TABLE iatidatamart.`fct-results` 
	ADD IF NOT EXISTS `baseline-total` DOUBLE;
	
ALTER TABLE iatidatamart.`fct-results` 
	ADD IF NOT EXISTS `actual-is-number` BIT;
	
ALTER TABLE iatidatamart.`fct-results` 
	ADD IF NOT EXISTS `actual-total` DOUBLE;
	
ALTER TABLE iatidatamart.`fct-results` 
	ADD IF NOT EXISTS `target-is-number` BIT;
	
ALTER TABLE iatidatamart.`fct-results` 
	ADD IF NOT EXISTS `target-total` DOUBLE;  