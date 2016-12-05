ALTER TABLE iatischema.`ctl-publishers`
  MODIFY `publisher-name` VARCHAR(128);

ALTER TABLE iatidatamart.`fct-results`
  ADD COLUMN IF NOT EXISTS `publisher-name` VARCHAR(128);
  
ALTER TABLE iatidatamart.`fct-results`
  MODIFY `publisher-name` VARCHAR(128);
  
ALTER TABLE iatidatamart.`fct-transactions`
  MODIFY `publisher-name` VARCHAR(128);