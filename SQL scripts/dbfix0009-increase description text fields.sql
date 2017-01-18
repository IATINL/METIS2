ALTER TABLE iatistaging.`xml-act-descriptions`
  MODIFY COLUMN `description` VARCHAR(16384);
  
ALTER TABLE iatistaging.`src-act-descriptions`
  MODIFY COLUMN `description` VARCHAR(16384);

ALTER TABLE iatischema.`dwh-descriptions`
  MODIFY COLUMN `description` VARCHAR(16384);

ALTER TABLE iatidatamart.`fct-descriptions`
  MODIFY COLUMN `description` VARCHAR(16384);
