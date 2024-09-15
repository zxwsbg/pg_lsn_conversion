/* pg_lsn_conversion.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_lsn_conversion" to load this file. \quit


CREATE OR REPLACE FUNCTION convert_to_dec(lsn pg_lsn)
RETURNS numeric AS $$
DECLARE
    dec_lsn numeric;
BEGIN
    dec_lsn := pg_lsn_mi(lsn,'0/0');
    RETURN dec_lsn;
END;
$$ LANGUAGE plpgsql STABLE STRICT;

CREATE OR REPLACE FUNCTION convert_to_lsn(dec_lsn numeric)
RETURNS pg_lsn AS $$
DECLARE
    high_bits bigint;
    low_bits bigint;
    lsn pg_lsn;
BEGIN
    high_bits := (dec_lsn / '4294967296'::numeric)::bigint;
    low_bits := (dec_lsn % '4294967296'::numeric)::bigint;

    lsn := lpad(to_hex(high_bits), 8, '0') || '/' ||
                 lpad(to_hex(low_bits), 8, '0');
    RETURN lsn;
END;
$$ LANGUAGE plpgsql STABLE STRICT;