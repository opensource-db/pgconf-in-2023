/*

Table "public.p_transaction"
       Column        |           Type           | Collation | Nullable |                   Default                    
---------------------+--------------------------+-----------+----------+----------------------------------------------
 id                  | int                      |           | not null | nextval('p_transaction_id_seq'::regclass)
 site_id             | integer                  |           | not null | 
 user_id             | integer                  |           | not null | 
 transaction_type    | character varying(2)     |           | not null | 
 created_at          | timestamp with time zone |           | not null | 
 updated_at          | timestamp with time zone |           | not null |
 is_cancelled        | boolena                  |           |          | 
*/

CREATE TABLE public.p_transaction_part (
        id bigint NOT NULL,
        site_id int4 NOT NULL,
        user_id int4 NOT NULL,
        transaction_type varchar(2) NOT NULL,
        created_at timestamptz NOT NULL,
        updated_at timestamptz NOT NULL,
        is_cancelled boolean
) PARTITION BY RANGE (created_at);

CREATE TABLE p_transaction_part_202203 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-MAR-01') TO ('2022-APR-01');
CREATE TABLE p_transaction_part_202204 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-APR-01') TO ('2022-MAY-01');
CREATE TABLE p_transaction_part_202205 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-MAY-01') TO ('2022-JUN-01');
CREATE TABLE p_transaction_part_202206 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-JUN-01') TO ('2022-JUL-01');
CREATE TABLE p_transaction_part_202207 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-JUL-01') TO ('2022-AUG-01');
CREATE TABLE p_transaction_part_202208 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-AUG-01') TO ('2022-SEP-01');
CREATE TABLE p_transaction_part_202209 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-SEP-01') TO ('2022-OCT-01');
CREATE TABLE p_transaction_part_202210 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-OCT-01') TO ('2022-NOV-01');
CREATE TABLE p_transaction_part_202211 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-NOV-01') TO ('2022-DEC-01');
CREATE TABLE p_transaction_part_202212 PARTITION OF p_transaction_part FOR VALUES FROM ('2022-DEC-01') TO ('2023-JAN-01');
CREATE TABLE p_transaction_part_202301 PARTITION OF p_transaction_part FOR VALUES FROM ('2023-JAN-01') TO ('2023-FEB-01');
CREATE TABLE p_transaction_part_202301 PARTITION OF p_transaction_part FOR VALUES FROM ('2023-FEB-01') TO ('2023-MAR-01');
CREATE TABLE p_transaction_part_202301 PARTITION OF p_transaction_part FOR VALUES FROM ('2023-MAR-01') TO ('2023-APR-01');

ALTER TABLE p_transaction_part_202203
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202204
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202205
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202206
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202207
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202208
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202209
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202210
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202211
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202212
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202301
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202302
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part_202303
SET (autovacuum_vacuum_insert_scale_factor=0.001, autovacuum_vacuum_insert_threshold=10000, autovacuum_vacuum_scale_factor=0.0, autovacuum_analyze_scale_factor=0.0,
  autovacuum_vacuum_threshold=1000000, autovacuum_analyze_threshold=400000);

ALTER TABLE p_transaction_part ADD CONSTRAINT p_transaction_partition_pkey PRIMARY KEY (id, created_at);

/*
Upsert trigger
*/

CREATE OR REPLACE FUNCTION trg_upsert_func_p_transaction() RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'UPDATE') THEN
    UPDATE p_transaction_part SET
                updated_at=NEW.updated_at,
                is_cancelled=NEW.is_cancelled
    WHERE id = OLD.id;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO p_transaction_part 
                (id,
                site_id, 
                user_id, 
                transaction_type, 
                created_at, 
                updated_at, 
                is_cancelled)
        VALUES(
                NEW.id,
                NEW.site_id, 
                NEW.user_id, 
                NEW.transaction_type, 
                NEW.created_at, 
                NEW.updated_at, 
                NEW.is_cancelled);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--CREATE TRIGGER

CREATE TRIGGER trg_upsert_p_transaction_event AFTER INSERT OR UPDATE ON p_transaction 
FOR EACH ROW EXECUTE FUNCTION trg_upsert_func_p_transaction();
------------------------
--PHASE 1 STOPS HERE--
------------------------

-- TODO indexes
-- Consider DESC indexes on Dates

--invalid index
CREATE INDEX p_transaction_part_user_id_idx ON ONLY public.p_transaction_part USING btree (user_id, created_at, transaction_type);

--To check the Indexes are listed as INVALID 
--make sure p_transaction_part_user_id_idx Index is listed
--relkind `I` denotes a partitioned index

SELECT pg_class.relname, pg_class.relkind
FROM pg_class, pg_index 
WHERE pg_index.indexrelid = pg_class.oid 
AND pg_index.indisvalid = false; 

--Creating leaf indexes at partition level


CREATE INDEX CONCURRENTLY p_transaction_part_202203_user_id_idx ON p_transaction_part_202203 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202204_user_id_idx ON p_transaction_part_202204 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202205_user_id_idx ON p_transaction_part_202205 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202206_user_id_idx ON p_transaction_part_202206 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202207_user_id_idx ON p_transaction_part_202207 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202208_user_id_idx ON p_transaction_part_202208 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202209_user_id_idx ON p_transaction_part_202209 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202210_user_id_idx ON p_transaction_part_202210 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202211_user_id_idx ON p_transaction_part_202211 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202212_user_id_idx ON p_transaction_part_202212 (user_id, updated_at DESC, transaction_type);
CREATE INDEX CONCURRENTLY p_transaction_part_202301_user_id_idx ON p_transaction_part_202301 (user_id, updated_at DESC, transaction_type);

ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202203_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202204_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202205_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202206_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202207_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202208_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202209_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202210_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202211_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202212_user_id_idx;
ALTER INDEX p_transaction_part_user_id_idx ATTACH PARTITION p_transaction_part_202301_user_id_idx;

--Validation step to check the Index is NOT INVALID anymore
--make sure p_transaction_part_user_id_idx is not listed

SELECT pg_class.relname, pg_class.relkind
FROM pg_class, pg_index 
WHERE pg_index.indexrelid = pg_class.oid 
AND pg_index.indisvalid = false; 


VACUUM ANALYZE p_transaction_part_202203;
VACUUM ANALYZE p_transaction_part_202204;
VACUUM ANALYZE p_transaction_part_202205;
VACUUM ANALYZE p_transaction_part_202206;
VACUUM ANALYZE p_transaction_part_202207;
VACUUM ANALYZE p_transaction_part_202208;
VACUUM ANALYZE p_transaction_part_202209;
VACUUM ANALYZE p_transaction_part_202210;
VACUUM ANALYZE p_transaction_part_202211;
VACUUM ANALYZE p_transaction_part_202212;
VACUUM ANALYZE p_transaction_part_202301;
VACUUM ANALYZE p_transaction_part_202302;
VACUUM ANALYZE p_transaction_part_202303;


----------------------------------------------------------------
/* Down time - starts here*/
----------------------------------------------------------------

BEGIN;
  ALTER TABLE p_transaction ALTER COLUMN id SET DEFAULT NULL;
  ALTER SEQUENCE p_transaction_id_seq AS bigint;
  ALTER TABLE p_transaction_part ALTER COLUMN id SET DEFAULT nextval('p_transaction_id_seq');
  ALTER SEQUENCE p_transaction_id_seq OWNED BY p_transaction_part.id;
  DROP FUNCTION trg_upsert_func_p_transaction() cascade;  
  ALTER TABLE p_transaction RENAME TO p_transaction_archive;
  ALTER TABLE p_transaction_part RENAME TO p_transaction;
COMMIT;

----------------------------------------------------------------
/*
Down time - ends here

Grants & ACL

EOF */
