# SQL scripts to import Enem 2012 microdata into a MariaDB/MySQL database

What the script does:

Enem 2012 microdata consists of 3 huge CSV files, whose structure was optimized so that the files be procecssed in a software called IBM SPSS. This script:

- imports the data into a relational database, allowing for better data querying;
- normalizes the data in multiple tables, avoiding redundancy;
- dichotomizes item responses.

Instructions:

1. download the data, available [here](http://portal.inep.gov.br/basica-levantamentos-acessar) and unzip it;
2. In a MariaDB or MySQL database (untested) run the **import.sql** script.
