# SQL scripts to import Enem 2012 microdata into a MariaDB/MySQL database

Enem 2012 microdata consists of 3 huge CSV files, whose structure was optimized so that the files can be imported into a software called IBM SPSS. I don't have this program, so I created a bunch of scripts to normalize and import the data into a MariaDB/MySQL database, as well as generate dichotomous responses for all 4 tests.

Of particular importance is the fact that, although there are 4 tests (natural sciences, humanities sciences, literature, mathematics) the students take in the span of 2 days, there are actually 25 different test kits. The differences between each kit is only in the order of itens. I have manually tracked down where each item appears in each of the test kits and reordered the students' answers accordingly, so that all answers to a specific item are contained in the same column.

## The scripts

- `import.sql`: imports the data into a relational database, allowing for better data querying, and normalizes the data in multiple tables, avoiding redundancy;
- `binary_responses.sql`: reads the tables created by `import.sql` and dichotomizes item responses, creating one CSV file for each of the 4 tests that were applied in Enem 2012. The files are generated from a random sample of 50000 students. The samples for each of the 4 tests is different.
- `import_treated.sql`: in case the tables created by `import.sql` are ever exported to CSV files, this script imports them into a new database, taking considerably less time.

## Instructions

1. download the 2012 Enem data, available [here](http://portal.inep.gov.br/microdados) and unzip it. If the link is broken, I suggest you google it, as its location has changed quite a few times along the years.
2. In a MariaDB or MySQL database (untested) run the `import.sql` script.
3. _(Optional)_ execute `binary_responses.sql` to generate the CSV files with dichotomous responses.