#SQL scripts that import Enem 2012 microdata in a MariaDB database

What the script does:

Enem 2012 microdata cconsist of 3 huge CSV files, whose structure was optimized so that the files be procecssed in a software called IBM SPSS. This script:

- imports the data into a relational database, allowing for better that querying;
- normalize and the data in order to avoid redundancy;
- preprocess item responses in binary format and spit it out in binary form.

Instructions:

1. download the data available [here](http://portal.inep.gov.br/basica-levantamentos-acessar) and unzip it;
2. In a MariaDB or MySQL database (untested) run the **import.sql** script