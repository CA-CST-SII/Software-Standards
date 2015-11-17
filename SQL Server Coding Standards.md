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
    subject to change (Schema, DCN159)
-   Use the singular form (i.e. the Loan table and not the Loans table).
-   ‘Camel capitalization’ (i.e. mixed-case) should be used on all
    identifiers (for example, FirstName, LogDetail, AcctSysId,
    LkupCountryCode, @ErrNum, etc).
-   Never name an object with a SQL Server reserved word. See Books
    Online, ‘Reserved Keywords’ section.

3.1.1 Approved Object Name Abbreviations

Some objects should be named in an abbreviated form, when they are part
of database object names. Please see DBA staff to suggest other
abbreviated forms for inclusion. . Business Name Abbreviation Account
Acct Address Addr Administration Admin Amount Amt Application Appl
Attribute Attr Business Bus Date DT Description Desc Document Doc
Identifier ID Number Num Parameter Parm Passport PPT Percent Pct
Sequence Seq System Sys

3.1.2 Table Names

Data tables are defined as tables containing data specific to the
business of the application. Their names may include a prefix, to group
tables of similar business purpose. The set of approved data table name
prefixes is defined below (TBD):

Prefix Definition Lkup Lookup data Imp “Import” or staging data

Non-data tables are used for more generic purpose: error handling,
maintenance, work holding space, etc. Their names may also include a
prefix and a suffix as well. The suffix is used to indicate a more
general grouping by purpose. General definitions of non-data tables,
whose naming convention may include a prefix, suffix, or both, are given
below:

\[All prefixes should be in camel case. All suffixes should be upper
case, with no underscore\]

Table Group Definitions Prefix Suffix Application Static Tables (code
lookup tables) State code and other code lookup tables. os = Operational
Standards os Note: going forward, we will use the Lkup prefix. (no
suffix) System Utility Tables Tables to support Administrative utilities
admin (no suffix) Persistent Work Tables Tables to support interim work
steps Application Group Name where Appropriate WORK Staging Tables (For
import/export) Tables used to hold imported and exported data
Application Group Name where Appropriate (no suffix; use Inp prefix)
Backup Tables Tables used to back up other tables Application Group Name
where Appropriate BKUP

3.1.3 Column Names

Columns name should provide a clear, concise description of the
attribute in mixed case, without prefixes or underscores.

Any system-generated identifiers will always have the suffix ‘ID’. The
full column name will be the table name plus the suffix. All fields that
reference a lookup table should include a suffix of ‘Code’ when
referencing an actual code values versus ‘ID’ when referencing a
surrogate integer field.

Columns that are foreign keys to another table, should preserve the
column name across the relationship. An exception to this rule must be
made when there are two foreign key columns representing the same
primary key.

Do not use ‘timestamp’ or ‘TS’ as part of the column name of a datetime
column,since timestamp is a non-temporal datatype; the name is misleading.

UID \[Unique Identifier\] is a binary record identifier that is unique
across all agencies.

3.1.4 Index Names

Index names should provide a clear and concise description of the index.
An upper-case prefix is always used in the index name to indicate the
type of index, and should include an underscore separator. The body of
the index name includes the table name and may include the name(s) of
the columns indexed. By type, the definitions are as follows:

Index Type Naming convention Example Primary Key PK\_ + Name of Table
PK\_pTDISAppl Foreign Key FK\_ + Name of Table + ‘\_’ + Name of Column
(first column name required, rest optional) FK\_Trace\_BatchID
Alternative Key AK\_ + name of Table + ‘\_’ + Name of Column This type
of index is associated with a unique constraint on a table (i.e., an
alternate primary key). AK\_Acct\_SSN

Other An index that is not related to a primary, foreign, or
‘alternative’ key on the table. IX\_Acct\_LastName

(open issue, should be clearly identify clustered keys)

3.1.5 Naming Views, Check Constraints, Defaults, and Rules

Check constraints are preferred over rules; do not create new rules,
which are supported as a back-ward compatibility feature of SQL Server
2000. The naming conventions for views, check constraints, and defaults
consist of a prefix, underscore, and descriptive name.

The descriptive name of these objects should include the purpose of the
code behind the object; the table or column name may be included. A view
name should include the purpose and a reference to the main type of data
in the view, for example, vwRejectedPassport. Check constraint names
must be unique, so a reference to the object table name is appropriate;
however, the table name can be embedded in the descriptive name (for
example, CHK\_ApplicationNameIsValid).

Database Object Format Example Default df\_ + table name + column name
df\_ApplicationSSN View vw + name vwAcctPersonProfile Check Constraint
CHK\_ + name CHK\_ApplicationFeeMax

3.1.6 Stored Procedure Names

Procedures may be grouped by purpose or by the name of the entity
processed. For example, there may be a group of procedures that
manipulate Application data. Those procedures might be named
ApplicationInsert, ApplicationUpdate, ApplicationDelete, etc. In
general, naming procedures with a ‘noun + verb’ format, works well for
grouping by purpose.

If entity names are not appropriate as a grouping prefix, the
table-grouping prefixes in section 3.1.2 of this document can be used.

Do not use sp\_ as the prefix of a stored procedure name; the query
engine looks for these first in the master database, so a performance
dip can result.

Input parameters to a stored procedure shall be named with the prefix
@p, so they can be distinguished in code from local variables. Output
parameters to a stored procedure shall be named with the prefix @o.

3.1.7 DTS Package and SQL Job Names

DTS Package and SQL Job names should be prefixed with the primary
project it supports (for example: TDISArchiveETL,
MISPassportSpecialistETL, TDISAgencyPurge, etc).

3.2 DML Syntax Standard

Include the table owner when referencing a table in DML (i.e., select
columnA from dbo.tableB). Otherwise, SQL server looks to see if the user
running the query owns the table, rather than dbo. Performance is
improved by always including the table owner in the reference.

Do not use ‘select \* ’ since columns can be added, changed, or removed
from a table. Instead, reference each column that is returned from the
select, by name.

In general, do not use ‘select into’ to create a new table variable or
temporary table, within a stored procedure. It is better practice to
define the table variable or temporary table, at the top of the
procedure.

Use ANSI-92 standard SQL syntax. This includes DELETE FROM and INNER /
OUTER / LEFT join syntax. A good concise source for checking ANSI SQL
syntax is <http://www.ocelot.ca/commands.htm>.

3.3 General Stored Procedure Standard

Following is a template to use when creating a stored procedure. Some
general standard guidelines that are demonstrated within the template
are:

1.Input parameter names are prefixed with @p to distinguish them from
local variables within the code of the procedure. Output parameter names
are prefixed with @o.

2.It is recommended that variable names be declared immediately after
the comments section. Variable names should be descriptive.

3.Define the parameters immediately after the declaration. Within the
parameter definition, it is recommended to default parameters to NULL,
then check for required parameters so that missing values can be handled
gracefully.

4.The header info for the SP goes after the ‘create procedure’
statement, so that the comments are included in the SP when it is
installed in the database.

5.Define all parameters to a stored procedure as NULL (or otherwise
default them to a value). Then, as one of the first steps in the SP,
check whether REQUIRED inputs were input as null. If they were, raise an
error. This is a graceful way of handling SP calls that did not supply
required values.

6.Execute sub-procedure calls in a standard fashion: check both the
return code and @@error after the call; qualify the procedure name with
the owner name.

7.Execute sub-procedure calls by explicitly setting the input values
equal to the parameter names, rather than depending upon the position.

8.GOTO’s are only permitted in the error handling portion of the code.

9.All SPs should be indented (recommended 2 spaces per indent) per the
following example.

CREATE PROCEDURE dbo.<spName> (

`@pParmOne varchar(255) = NULL,      -- define the parm, such as ’Last name of the applicant’`\
`@pParmID int = NULL,                -- define the parm, such as ‘Identifier to the application being processed’`\
`@oOutputParm int = NULL OUTPUT      -- define the parm, such as ‘Identifier to the login created by this SP’`

) as

/\* \[DESCRIPTION\]

`* (detailed description, such as:`\
`*`\
`*  This SP is used to create new ApplicationDetail information on a passport applicant.`\
`*  It is called from the DOSPassport application, and passes back an identifier to`\
`*  the applicant’s new login.`\
`*`\
`* [CHANGE INFORMATION]`\
`* Author            Date            Description of Change`\
`* ------            ----            ---------------------`\
`* `<Author>`          3/25/2005       Created`\
`*`\
`* [RETURNS]`\
`* (Single record, Recordset, integer, ...)`\
`*/`

declare @ErrNum int,

`       @ReturnCode int,`\
`       @SysName varchar(35),`\
`       @ErrMsg varchar(255),`\
`       @RowCount int `

-- init some variables

set @ErrNum = 0 set @SPName = object\_name(@@procid)

-- check the required parameters

If isnull(@pParmID, 0) &lt; 1

` Or isnull(@pParmOne, ‘’) = ‘’`

begin

` set @ErrMsg = ‘A required input parameter (ParmID or ParmOne) is missing.’`\
` goto ERR_HANDLER`

end

-- when calling other stored procedures, check both ReturnCode and
@@error. Always have a stored procedure return -- ZERO if there were no
errors during execution. Do NOT use the return code to return parameter
values - use -- OUTPUT variables for that.

exec @ReturnCode = dbo.spSomeOtherProcedure @pInputParmName = @pParmOne

set @ErrNum = @@error if @ReturnCode &lt;&gt; 0 or @ErrNum &lt;&gt; 0
begin

` if @ErrNum = 0 `\
`   set @ErrNum = @ReturnCode  -- this preserves all errors`\
`   set @ErrMsg = ‘Make this a descriptive msg: Error returned from spSomeOtherProcedure; error: ‘`\
`              + convert(varchar(11), @ErrNum) + ‘.’`\
`   Goto ERR_HANDLER`

end

-- Here we show how to perform an insert and do some checking.

Begin transaction

Insert dbo.SomeTable (ColA, ColB, ColC) Select b.Colxx, b.Colyy, b.Colzz
From dbo.Table1 a inner join dbo.Table2 b

` On a.PKcol = b.FKCol`

Where b.ParmID = @pParmID

Select @RowCount = @@rowcount, @ErrNum = @@error

If @ErrNum &lt;&gt; 0 or @RowCount &lt;&gt; 1 Begin

` Rollback transaction`

` set @ErrMsg = ‘Error inserting SomeTable using ParmID ‘ + convert(varchar(10), @pParmID)`\
`       + ‘; error, rowcount ‘ + convert(varchar(11), @ErrNum) + ‘, ’`\
`       + convert(varchar(11), @RowCount) + ‘.’`\
` Goto ERR_HANDLER`

end

-- if we are here we can commit the transaction

Commit transaction

END\_PROC:

` return @ErrNum`

-- this error handler captures the error in errLog, then raises an error
and returns a non-zero error number.
