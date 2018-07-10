   CREATE or REPLACE PROCEDURE dna_proc     
   AS
   
     sql_stmt VARCHAR2(70);
     sql_stmt1 VARCHAR2(300);
     sql_stmt2 VARCHAR2(300); 
     sql_stmt3 VARCHAR2(300);
     sql_stmt4 VARCHAR2(300);
     num_rows_stmt VARCHAR2(300); 
     sql_col_size VARCHAR2(300);
     p_size NUMBER;
     num_rows NUMBER;
     nums NUMBER;
     chars NUMBER;
     occ NUMBER;
     s NUMBER;
     k NUMBER;
     x NUMBER;
     num NUMBER;
     col_size NUMBER;
     last NUMBER;
     next_rec NUMBER;
     a VARCHAR2(200);
     b VARCHAR2(200);
     new_substr VARCHAR2(200);

   BEGIN
     
     p_size:=20;
     occ:=0;
   
     sql_stmt1:= 'CREATE TABLE dna_ext_seqs (seq VARCHAR2(4000))ORGANIZATION EXTERNAL 
                  (TYPE ORACLE_LOADER DEFAULT DIRECTORY my_data ACCESS PARAMETERS(RECORDS DELIMITED BY ''$'' READSIZE 2777834)
                  LOCATION (my_data:''dna.txt''))REJECT LIMIT UNLIMITED';
     EXECUTE IMMEDIATE sql_stmt1;
     num:=p_size-1;
     FOR i IN 1..num LOOP
     
     sql_stmt2:= 'ALTER TABLE dna_ext_seqs LOCATION (my_data:''cdna'||i||'.txt'')';
     EXECUTE IMMEDIATE sql_stmt2;
     
     END LOOP;
     
     

     sql_stmt4:='CREATE TABLE dna_reps AS SELECT seq, count(seq) 
                AS occurences FROM dna_ext_seqs GROUP BY seq HAVING count(*)>1';
     EXECUTE IMMEDIATE sql_stmt4;

   END;
   /



 



