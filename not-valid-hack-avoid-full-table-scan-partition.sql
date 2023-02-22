----------------------------------------------------------------
/* Down time - starts here*/
----------------------------------------------------------------

BEGIN;
  ALTER TABLE logtable ALTER COLUMN id SET DEFAULT NULL;
  ALTER SEQUENCE logtable_id_seq AS bigint;
  ALTER TABLE public.logtable_part ADD CONSTRAINT logtable_part_entry_fk FOREIGN KEY (entry_id) REFERENCES public.logentry(id) NOT VALID;
  ALTER TABLE logtable_part ALTER COLUMN id SET DEFAULT nextval('logtable_id_seq');
  ALTER SEQUENCE logtable_id_seq OWNED BY logtable_part.id;
  ALTER TABLE logtable RENAME TO logtable_archive;
  ALTER TABLE logtable_part RENAME TO logtable;
COMMIT;

----------------------------------------------------------------
/*
Down time - ends here

Grants & ACL

EOF */
