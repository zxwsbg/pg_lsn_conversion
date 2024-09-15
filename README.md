pg_lsn_conversion
========

pg_lsn_conversion is an extension used for converting between PG LSN and decimal. This will facilitate developers in debugging and usage.

INSTALL
-------
1. Clone code

```
git clone https://github.com/zxwsbg/pg_lsn_conversion
```
2. Export ENV
```
export PATH=/your_pg_bin_path/:$PATH
```

3. Compile and install

```
make && make install
```

USAGE
-------

1. Create extension
```
CREATE EXTENSION pg_lsn_conversion;
```
2. Convert from pg_lsn to decimal

```
SELECT convert_to_dec('3D7/40ABA220');
 convert_to_dec 
----------------
  4223037841952
(1 row)
```

3. Convert from decimal to pg_lsn

```
SELECT convert_to_lsn(4223037841952);
 convert_to_lsn 
----------------
 3D7/40ABA220
(1 row)
```
