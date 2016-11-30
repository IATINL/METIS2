ALTER TABLE iatischema.`dwh-documents`
  MODIFY COLUMN `document-format` VARCHAR(50);
  
ALTER TABLE iatidatamart.`fct-documents`
  MODIFY COLUMN `document-format` VARCHAR(50);
