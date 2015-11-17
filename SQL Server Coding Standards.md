Overview
--------

This document sets forth guidelines for production SQL code deployed by
Apptis, Inc.

Purpose
-------

SQL coding standards are maintained by database administrators in the
development database group. The target audience is DBA’s, SQL
Developers, and anyone who writes SQL code that will be deployed to a
production environment.

Deployable SQL code can be stored procedures, DTS packages, SQL jobs,
replication filters, or SQL embedded in client objects. Standards are
grouped into four categories: object naming, DML (data manipulation
language) syntax, error handling, and general stored procedure
guidelines. Strictly speaking, object naming standards could be
documented separately, since they apply to database objects as well as
SQL code. They are contained in this SQL Coding Standards document for
purposes of convenience at this time. Note that formatting of SQL
embedded in client objects may be governed by SQL Standards for the
client object.

It is expected that all new SQL code will adhere to these standards;
existing code can be retrofitted to meet the standards to whatever
degree possible, as modifications to that code are required. Note that
implementation of error handling in only a subset of stored procedures
will reduce the utility of a standardized approach.

Standards Categories
--------------------

Object Naming Standards define how tables, columns, stored procedures,
etc are named. A list of approved abbreviations or short names (for
example, Appl for Application; Num for Number rather than Nbr) is
included here. This list is maintained by the database development group
as part of the object naming standard.

DML syntax standard defines guidelines for writing selects, inserts,
updates, and deletes.

General Stored Procedure Standards are a guideline for formatting,
parameter/variable names, and in-line documentation.

Error Handling Standard defines how the various types of errors that may
occur during execution of SQL code are trapped and handled.
Recommendations for implementing transactions are also contained in this
section. Note that client handling of errors returned from the database
is not addressed in this standards document, but is an important factor
in the overall efficacy of a standard error handling approach.

### Object Naming Standards

Object names will be English words and abbreviations, which convey
meaning about what the object represents in the system. Mixed-case will
be used for readability, without underscores or other special
characters. Where a prefix is appropriate for an object, the prefix will
follow mixed-case formatting. Abbreviations for common words should be
used across the board; a list of standard abbreviations is provided
later in this document.

General naming guidelines:

-   Avoid using numbers; if a number is absolutely required, spell it
    out as a word.
-   Avoid using proprietary acronyms (GDSINC, SQL)
-   Avoid using product-specific names, or names whose meaning is
    subject to change
