-- Create Orgaization


DROP TABLE IF EXISTS org;

CREATE TABLE org(
  employee_id int PRIMARY KEY,
  employee_names varchar,
  employee_title varchar,
  direct_supervisor varchar,
  departments varchar,
  hierarchy int,
  function_ID int REFERENCES department (function_ID),
  supervisor_ID int
  );


-- import data from CSV files. CSV file is also uploaded into github
COPY org
FROM 'C:\users\public\documents\org1.csv'
DELIMITER ',' CSV;

/*Write Select Statement for self-join to Supervisors and their subordinate*/

SELECT supervisor.employee_names as Supervisors, subordinate.employee_names as Subordinate, subordinate.departments As Subordinate_Dep, subordinate.employee_title
FROM org Supervisor
     JOIN org subordinate
     ON supervisor.employee_id = subordinate.supervisor_ID
Order BY Supervisor, Subordinate