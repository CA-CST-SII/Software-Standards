#





Department of State_

## Object Definition and Naming Standard







_Seventh Edition_























Updated:  October 2010

Version:   7.0

<img src="https://github.com/CA-CST-SII/Software-Standards/blob/master/Images/DoS.jpg" width="100" height="100" />

Prepared by IRM/OPS/SIO/APD/DM

UNITED STATES DEPARTMENT OF STATE

BUREAU OF INFORMATION RESOURCE MANAGEMENT

SYSTEMS AND INTEGRATION OFFICE
APPLICATION Programming DIVISION– DATA MANAGEMENT BRANCH





**Revision History Summary**

| **Release Number** | **Date** | **Revision Description** |
| --- | --- | --- |
| First Edition | August 1997 | Document Object Definition and Naming Standard |
| Second Edition | February 1998 | Update Object Definition and Naming Standard |
| Third Edition | May 1998 | Update Object Definition and Naming Standard |
| Fourth Edition | January 2000 | Update Object Definition and Naming Standard |
| Fifth Edition | December 2002 | Comprehensive review of naming standard by Data Administration Working Group. Conformance with ISO 11179. See Change Summary for additional details. |
| Sixth Edition | February 2006 | <p>Changed named references to IRS/OPS/SIO/API/DM Branch from Data Administration to Data Management (DM)<p> Added Appendix B (Oracle and SQL Server - Database Naming Guidelines) and Appendix C (Document Revision History Detail)<p> Refer to Appendix C for detailed history of changes made to this document |
| Seventh Edition | October 2010 | <p> Changed named references from IRS/OPS/SIO/API/DM Branch to IRS/OPS/SIO/APD/DM<p> Changed DM Email address<p> Changed the requirement for general Naming rules<p> Added general naming Principal section<p> Deleted Acronyms and Abbreviations section of the document<p> Updated Naming and description section for the following: Entity, Attribute, Column, Table, View and relationship, Index and Triggers<p> Added New data Objects and naming standard for Constraints and Stored Procedure |
|   | January 25, 2011 | Reworded section 9 – Triggers (RMKajiru) |



**Obtaining Copies of This Manual or Submitting Comments**



**Submitting Comments**

If you have suggestions for this manual or know of any additions, deletions, or changes, please e-mail them to [ Data Management](mailto:Data%20Management) at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov) or send them to the following address:

Department of State

Data Management (IRM/OPS/SIO/APD/DM) SA-9, Room: NE 7046
Washington, DC 20006

The memorandum should indicate the type of request (change, addition, deletion) and must specify clearly what is being requested and the reason the request should be granted. Please include the name, e-mail address, and telephone number of a contact that can provide further information if necessary.

The request will be reviewed and the originator will be notified, via e- mail or memorandum, of the action taken. IRM/OPS/SIO/APD/DM has 30 working days after receipt of a request for change, addition, or deletion to respond. If a final response cannot be provided within that time, an interim response will be issued.

If a request for change, addition, or deletion is approved, the revision will be incorporated into the next edition of this document.

**Obtaining Copies**

You can obtain a copy of this manual from DM's web site [http://irm.m.state.sbu/sites/OPS/SIO/APD/dm/Pages/Home.aspx](http://irm.m.state.sbu/sites/OPS/SIO/APD/dm/Pages/Home.aspx) or via e-mail to [ Data Management](mailto:Data%20Management) at [ ](mailto:DA@state.gov) [DataMgmtSupport@state.gov](mailto:DA@state.gov)  or request additional copies in writing to:

Department of State

Data Management (IRM/OPS/SIO/APD/DM) SA-9, Room: NE 7046
Washington, DC 20006




# 1. Introduction



The Data Management (DM) Branch is responsible for establishing, maintaining, and administering the policies and procedures required to facilitate sharing data. To fulfill this function, DM must establish standards. _The Object Definition and Naming Standard_ is a critical cornerstone to data and information sharing.

The definitions and naming standards detailed in this document were developed to:

- Facilitate data object sharing, data object consistency and communication among the Department's organizations. 

- Increase reliability of information stored, shared and managed by the repository tool set. 
- Improves the accuracy of searches for a particular piece of data. 
- Promote accessibility and understandability of information across systems. 

- Improve the quality of data and application documentation. 

- Assist the DM effort in eliminating data redundancy and inconsistency. 

- Facilitate user access to object names and related documentation as used throughout the Department. 

- Assist analysts in selecting names that are clear and represent rules of good grammar. Simplify recognition of synonyms. 

- Standardize metadata collected for Standard Data Elements (SDEs) 

The Department of State's (DOS) naming standard complies with the _ISO/IEC 11179-5 Naming__and Identification Principles for Data Elements _standard and uses terminology consistent with it.To clarify any aspect of this document, including examples, contact the Data Management Branch at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov).

The intended audience for this document includes:

- IT Project Managers who manage projects that involve the development of new systems and/or enhancements of existing IT systems. 
- Data Architects/Analysts involved in developing high-level, technology-independent logical models such as data models, process models, and data-process interaction models. 
- System Architects/Analysts, Application Developers, Database Administrators (DBAs), and others who wish to standardize physical data objects. 

- Data Stewards responsible for managing particular classes of information enterprise-wide, and making decisions for the name, definition, and relationships of business data. 

Department legacy systems will not be required to change implemented names to make those systems adhere to this standard. Data Management will support and maintain an Enterprise Metadata Repository (EMR) which will store metadata about the Department's data resources. The EMR will provide a means to relate data resources from various structural platforms across the Department. The data structures contained in legacy databases will be populated in the EMR through the use of scanning tools that are part of the repository software. The names in legacy systems will be mapped to the Standard Data Elements (SDEs) that adhere to naming conventions outlined in this document. New systems will be developed in accordance with the naming standards outlined in this document which will facilitate re-use and integration.





## 1.1 Purpose

The purpose of this document is to provide users with a benchmark for defining objects and for creating standard object names and relate it to its business purpose.

## 1.2 Scope

This document provides standards for defining and naming logical and physical data objects and standardizing physical data objects. If a physical implementation is using tools that cannot support this standard, a deviation from the standard **may** be necessary.

Objects cited in this document do not represent the full set of objects available in all modeling, repository, or Computer-Aided Software Engineering (CASE) tools, or more generally, in the IT systems development environment. In some instances, a tool does not call an object type by the same name. If further guidance on naming is needed in these cases, contact Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov).

The data objects currently covered by this standard may not comprise all data objects in the Systems Development Life Cycle. As the use of other data objects becomes necessary, this standard will be revised to address them.

Further examples of the rules in this standard may be found in the _Standard Data Element_ (SDE) publications of the Data Management Branch at the link [http://irm.m.state.sbu/sites/ops/SIO/APD/dm/Standards/Forms/AllItems.aspx](http://irm.m.state.sbu/sites/ops/SIO/APD/dm/Standards/Forms/AllItems.aspx)

Because the object definition is as important as the name, this document also provides the user with a set of rules for defining object types. Data object types other than those specifically covered in this document may be standardized using the rules in this standard. This will be especially appropriate for system developers and others wishing to standardize their physical data objects.

This standard provides the basis for defining and naming the following data objects, listed in the order in which they are discussed in the body of the standard:

| **DATA OBJECT** | **DEFINITION** |
| --- | --- |
| Entities | A thing or object of importance about which data must be captured. Each entity on a data model represents a person, place, thing, or concept about which the business stores formation |
| Attributes |  An item of data, a fact, or a single piece of   information about an entity that quantifies,  Identifies, or describes an entity. |
| Relationships | A connection or association between entities that represent relevant information of value to the organization; represents a business rule |
| Tables | The physical representation of an entity, and containing rows and columns wherein data may be stored and retrieved |
| Columns | The physical representation of an attribute.  It has a specified size and format.  The smallest unit of data that has a meaning in describing information; the smallest unit of named data. |
| Views | A customized, usually limited, presentation of columns contained in one or more tables. Is a virtual table whose contents are defined by a query |





| **DATA OBJECT** | **DEFINITION** |
| --- | --- |
| Indexes | A set of ordered pointers to specific rows in a table. |
| Triggers | Stored code object that executes for specific events on tables |
| Constraints | Restrictions on the contents of the database or on database operations |
| Stored Procedure | A named program or routine stored in a database |
|
## 1.3 Naming Conventions

Several conventions for defining and naming objects are followed in this manual. This section describes those conventions.

### 1.3.1       Naming Format Statements

Each data object type has a naming standard defined in a format statement. The format statements concisely show how an object's _Business Name_ is formed. In addition to the format statement, names must follow several general rules outlined in each section. The format statements are composed of the following:

The greater than and less than symbols "< >" enclose each name component. The square bracket symbols "[]" enclose optional name components.

The term "(space)" represents a space character to be used between components.

### 1.3.2       Naming Format Glossary

The following name components are used in the naming format statements:

| **Term**|**Definition** |
| --- | --- |
| Class Word | Describe the type of data; they indicate the domain of potential values from which the data item's valid values are drawn.e.g.: name, number, amount, percent |
| Data Element | A unit of data for which the definition, identification, representation, and permissible values are specified by means of a set of attributes. It is also known as an Attribute, Column or Field. |
| Modifier | A word or words that help define and differentiate a name within the database; are used to add important business information to a business name. Usually a noun or noun phrase used to make the term it modifies more precise or accurate. (Qualifier Term).e.g.: "CUSTOMER\_PHONE\_NUMBER", the word "PHONE" is a modifier ( it is being used to adequately describe the data object) |
| Object Class Term | Highest level of qualification and the most important word in a business name. e.g. "employee".. |
| Prime Term | Describe the major topic or subject area to which the data refers. It identifies the application area, major data category, table, or view, depending on the data object being named. e.g. ORGANIZATION, ACCOUNT |
| Property Term | A component of the name of a data element that expresses a property of an object class or the category to which the data element belongs.Property represents the distinguishing characteristic of the business entity. e.g. in the data element "EmployeeAddressText", the component _Address_ is the property term. |
| Qualifier Term | A word or words that help define and differentiate a name within the database; usually a noun or noun phrase used to make the term it qualifies more precise or accurate.  Qualifier terms may be attached to object class terms and property terms.  e.g... In the data element "EmployeeMailingAddressText", the component mailing is a qualifier term. (Modifier) |
| Representation Term | A word that describes the form of the set of valid values for a data element. e.g... "amount, name"  (Class Word) |
| Purpose Term | A word or words that describe the function of a data object. |
| Role Name | A noun or noun phrase that describes the function of a foreign key |
| Sequence | A numeric component of a name that differentiates an object from another that would be identically named without it. |

### 1.3.3       Requirement Level Key Words

The standards in this document use key words to reflect varying levels of adherence that are required. When encountered in the standard, they will be capitalized and bolded. The table below defines the requirement level key words and their meaning.

| **Label** | **Alternate Labels** | **Definition** |
| --- | --- | --- |
| MUST BE | REQUIRED or SHALL | The definition is an absolute requirement of the specification |
| MUST NOT | SHALL NOT | The definition is an absolute prohibition of the specification |
| SHOULD | RECOMMENDED | There may be valid reasons when a particular item or behavior is acceptable or even useful, but the full implications should be understood and the case carefully weighed before implementing it. |
| SHOULD NOT | NOT RECOMMENDED | There may be valid reasons to ignore a particular item or behavior, but the full implications must be understood and carefully weighed before choosing a different course. |
| MAY | OPTIONAL | An item is truly optional. |

### 1.3.4       Standard Business Terms and Abbreviations

For the development of new systems and databases, all _prime terms, object class terms, property__terms, modifiers, qualifier terms _and_ representation terms _MUSTbe derived from theDepartment's repository of standard business terms wherever possible. If a desired term is not present, it MUST be registered in the Enterprise Metadata Repository (EMR) and made available for re-use. Legacy systems that are in use in the Department will go through a procedure of registration of data elements. The legacy systems metadata will be scanned into the EMR and mapped to existing Standard Data Element (SDE) names, as applicable. Candidate standard data element names will be proposed where SDEs have not already been identified. The candidate elements will be created in accordance with DM's standard naming convention, and be prepared to be approved by the Enterprise Data Administrative Group (E-DAWG) to become SDEs.

Candidate standard business terms may be submitted via e-mail to Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov) by sending a request citing the business term, a definition, and proposed abbreviation.

### 1.3.5       Business Name vs. Abbreviated Name vs. Synonym Name

The _Business Name_ is the name of an object in a business context. Business name contains information pertinent to the organization. By combining _Standard Business __Terms _according to the formats described in this document_ Business Name _can be formed. _Abbreviated Name _is formed by replacing terms from the Business Name with standard abbreviations and using underscore in place of space. _Synonym Name _can be created by using the acronym formed by the first letter or letters of the business terms in a _Business Name_ and omitting any underscores. _Synonym Names SHOULD_ be incorporated into _Abbreviated Names_ to represent _object class terms_ or _prime terms_ in physical data objects that require them (for example, _Columns, Indexes, Foreign Keys_). When _Synonym__ Names _are used, theyMUSTbe registered with Data Management.

Candidate _Synonym Names_ may be submitted via e-mail to Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov) by sending a request citing the prime term/object class term and the proposed synonym.



Example of Business Name vs. Abbreviated Name vs. Synonym name :

An entity that represented a bank account held by a customer for the purpose of borrowing money may be named a "loan account" a have the following names:

Business Name:  LOAN ACCOUNT

Abbreviated Name: LOAN\_ACCT – The standard abbreviation for LOAN is LOAN and for ACCOUNT it is ACCT.

Synonym Name: LNACCT – To further shorten the name LOAN is reduced to LN and combined with ACCT.

In data models and databases, the _Business Names, Abbreviated Names,_ and _Synonym Names_ are used as follows:

| **Data Object** | **Business Name** | **Abbreviated Name** | **Synonym Name** |
| --- | --- | --- | --- |
| Entity | MUST be used | MUST NOT be used | MUST NOT be used |
| Attribute | MUST be used | MUST NOT be used | MUST NOT be used |
| Relationship | MUST be used | MUST NOT be used | MUST NOT be used |
| Table | SHOULD be used | MAY be used | MUST NOT be used |
| Column |   |   |   |
| Object ClassTerm/Prime Term | MUST NOT be used | MAY be used | SHOULD be used |
| Qualifier Term/Modifier/Property Term | MAY be used | SHOULD be used | MUST NOT be used |
| RepresentationTerm/Class Word | MUST NOT be used | MUST be used | MUST NOT be used |
| Foreign Key |   |   |   |
| Table Name | MAY be used | MAY be used | SHOULD be used |
| Purpose/Role Name | MAY be used | May be used | MUST NOT be used |
| Index |   |   |   |
| Table Name | MAY be used | MAY be used | **S** SHOULD be used |
| Purpose/Role Name | MAY be used | May be used | MUST NOT be used |
| Trigger |   |   |   |
| Table Name | MAY be used | MAY be used | SHOULD be used |
| Purpose | MAY be used | May be used | MUST NOT be used |
| View | SHOULD be used | MAY be used | MAY be used |

### 1.3.6 General principles and Naming Rules

General Principles:

-
  - Each database object must be uniquely identified. 
  - Data Object names should be meaningful 
  - Data Object names should describe what the object represents 
  - Names should be independent of the application and independent of hardware and software used 
  - Reserved words should not be used. _Reserved words are keywords that the DBMS employs for their exclusive use_ 
  - Data Object names should not include meaning that can change over the life of the object 

- Acronyms MUST be Capitalized 

Naming Guidelines for Logical Structure:

- The characters used in names MUST be upper case A-Z, 0-9 and space character 
- Punctuation marks and special characters, including the slash (/) and the hyphen or dash (-) MUST NOT be used. 
- Underscore MUST NOT be used in names 
- The first character in a name MUST be an alphabetic. 
- Entity names MUST be singular nouns 
- Relationships MUST be verbs or verb phrases 
- Possessive nouns MUST not be used in names 
- Standard abbreviations ( from glossary of approved standard term) MUST be used where they exist 

Naming Guidelines Physical Data Model:

-
  - Characters used in names MUST be upper case A-Z, 0-9 
  - CamelCase MAY BE used in names 
  - Standard abbreviations ( from glossary of approved standard term) MUST be used where they exist 
  - Underscore MUST be used in place of space in naming 
  - Acronyms from glossary of approved standard terms MUST be used in naming when they exist 
  - The terms used in names SHOULD be plural nouns and MUST NOT be verbs (except in _Relationships_). 
  - Possessive MUST not be used in names 

### 1.3.7       Language Specific Exceptions

This standard has been developed to accommodate most popular Relational Database Management Systems (RDBMS) in use at the Department. It is understood, however, that physical database limitations may require shorter names than what would typically be derived using this standard.

### 1.3.8       Invalid Name Components

Synonyms are not to be used in place of a business term already in use to describe an object. Any word selected for use in an object name must be used consistently throughout the set of all objects. For example, if _APPROVAL_ is used as a modifier for _DATE_, then _APPROVAL_ must always be used whenever that concept must be captured. Synonyms like CONSENT, PERMISSION, and ENDORSEMENT must not then be used in place of _APPROVAL_ to describe another term conveying the same concept as the first.

 Appendix A. provides a list of invalid and reserved name components, which are not to be used in formulating names.

## 1.4   Standard Data Elements and the Enterprise Conceptual Data Model

Standard Data Elements (SDEs) are data attributes that have been standardized for usage across the Department. As such, the naming conventions for SDEs are the same as those outlined in this document.

The Enterprise Conceptual Data Model (ECDM) provides a specification of the key data entities that support Department of State's (DOS) business process. The purpose of the Enterprise Conceptual Data Model (ECDM) is to provide a conceptual view the key data entities and their relationships that support DOS's mission. DOS requires such a model in order to provide an organizing framework for further enterprise data architecture efforts. The ECDM acts as a high-level taxonomy organizing all of DOS's data assets into groups and rules. This high-level presentation will allow DOS management and stakeholders to effectively understand the current state of the data architecture and to plan for a future state data architecture that will enhance DOS.  It is composed of entities, relationships, general definitions and attributes. The ECDM defines the major data domains of information maintained to conduct Department business and consists of business objects (Entities) in the Department. These entities represent the highest-level view, the most essential data categories that define the boundaries and the nature of the Department's business and distinguish it fromany other government enterprise. ECDM is currently a work in progress model detail is being added by analysis and discussion that identify additional data requirements. Entities are added, and as facts are identified for each Entity, they become attributes of that Entity. These attributes can become _Candidate Standard Data Elements_ and ultimately be approved as _Standard Data Elements. _For more information on SDEs and the Enterprise conceptual data Model contact Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov).

# 2. Entities

An _Entity_ is a set of real or abstract things (a person, place, thing, resource, concept, or event) that have common _Attributes_ or characteristics about which a business retains information. In data modeling, it is a logical object whose physical counterpart is usually a _Table_.

## 2.1    Entity Types

There are five types of entities.

**Fundamental** – An entity that is independent of any other Entity for its existence. Alsoknown as an Identifier-Independent Entity. This may also be known as a Parent entity if it exists in a relationship with an Attributive Entity



**Associative** – An Entity that represents a Relationship between two or more Entities. An_Associative Entity _does not exist independently from the related_ Entities_. An_ Associative Entity _resolves many-to-many relationships.

**Attributive** – An entity that describes another entity. It is dependent on the existence ofthe other entity. Also known as an Identifier-Dependent Entity. Attributes repeated within an entity are candidates for attributive entities.



**Supertype** – An Entity that represents a general class of business objects that may be broken down into a hierarchy of more specific classes. A _Supertype Entity_'s attributes apply to all of its _Subtype Entities_, and the _Subtypes_ inherit its identifier. It is also known as a Generic entity.

**Subtype** – An Entity that identifies or represents an occurrence of another Entity with the same Primary Key but has a narrower definition, a subset of different Attributes, and/or different relationships. It inherits all the attributes of the _Supertype Entity_. It is also known as a _Category Entity._

**Subtype** – An Entity that identifies or represents an occurrence of another Entity with the same Primary Key but has a narrower definition, a subset of different Attributes, and/or different relationships. It inherits all the attributes of the _Supertype Entity_. It is also known as a _Category Entity._

## 2.3 Naming Entities

Legacy systems in use in the Department are not required to change existing entity names to adhere to this standard. Those entities will be mapped to standard names where possible.

- In data models the _Business Name_ MUST be used for the entity. An exception to this is made if the modeling tool cannot accommodate a long name. Standard abbreviations (from glossary of approved standard term) MUST be used where they exist as part of _Business Name_. 

The following general standards apply in creating an _Entity Business Name_:

- The characters used in names MUST be upper case A-Z, 0-9 and space character 
- Punctuation marks and special characters, including the slash (/) and the hyphen or dash (-) MUST NOT be used. 
- Underscore MUST NOT be used in names 
- The first character in a name MUST be an alphabetic. 
- The name MUST be composed of singular Nouns or noun phrases SHOULD be singular 
- Possessive nouns and proper nouns MUST NOT be used in the name 
- The name MUST be fully spelled out. 
- The name MUST be 120 characters or less in length 
- Verbs SHOULD NOT be used 
- The name of a child _Entity_ MAY include the name of its parent _Entity_. 



A _Synonym Name_ MUST be defined for use as the _prime term/object class term_ in _Column__Names_. Using an acronym or shorter abbreviation for the terms in the_ Table Business Name _forms _Synonym Names_. They do not have to be formed from standard abbreviations. They should, however, be recorded in the set of full metadata for an Entity. _Synonym Names_ MUST be registered with the Data Management Branch and made available for reuse.

Candidate _Synonym Names_ may be submitted via e-mail to Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov)  by sending a request citing the prime term/object class term and the proposed synonym.

### 2.3.1        Entity Name Formats

All Entities MUST be named according to one of the formats described below:

| **Entity Type** | **Format** |
| --- | --- |
| All entities MAY be named using the format | [<Prime Term> (space)] < modifier(s)> [<qualifier term> (space)] <object class term>  e.g: HUMAN RESOURCES PERSONAL DATA |
| Associative entities SHOULD use the format | <parent entity name> (space) <Modifier >e.g. HUMAN RESOURCES PERSONAL  ACCOUNT DATA |
| Attributive entities MAY use the format | <parent entity name> (space) <modifier(s)>e.g. HUMAN RESOURCES PERSONAL TRANSACTION DATA |
| Subtype entities MAY use the formats | <parent entity name> (space) <modifier(s)><modifier(s)> (space) <parent entity name>e.g. HUMAN RESOURCES PERSONAL  ACCOUNT TYPE DATA |

## 2.2 Describing Entities

The following rules apply when describing an _Entity_ of any type (_Fundamental, Associative,__Attributive, Supertype _or_ Subtype_).

- An _Entity_ description MUST be a noun phrase 
- The description MUST be broad enough that no instances of the Entity are omitted 

- The description MUST be clear, concise, and unambiguous 

- The description MUST be relevant to its business purpose and independent of technology and implementation 

- The description MUST be stable over time. The following words or phrases are examples of time dependency or process orientation, and MUST NOT be used to describe an _Entity_: 

| At this (point in) time |   | Occasionally |
| --- | --- | --- |
|   | Perhaps |   | But not always |
|   | Unless this happens |   | In certain circumstances |
|   | In this situation |   | However, under these circumstances |
|   | When this happens |   | Frequently |
|   | If this happens |   | Depending on |
|   | However |   | Sometimes |



- The description MUST NOT simply repeat the name of the _Entity_ as a description. 

- The description MUST be of an _Entity_, not of the data the Department records about the _Entity_, nor the functions, applications, or organizations that use or create the data. Thedescription MUST NOT pertain to: 

- --When, how, or where the data about the Entity are used 
- --Who uses the data 
- --How to edit or process the data 
- --The format the data stored in or other physical considerations 
- --What hardware or software systems use the data 



- _Abbreviations _and_ Acronyms _MUST NOTbe used in descriptions 

- Two _Entities_ MUST NOT be circular in description. (For example, a description of one  _Entity _should not point to descriptions of another) 

- The description MUST be: 

- --Grammatically correct 

- --Spelled correctly 
- --Complete and accurate, fully reflecting the meaning of the Entity. 

- --Written in active voice, where possible. 

### 2.3.2       Prime Terms/Object Class Terms

An _Entity's Business Name_ is also known as _a prime term_ or _object class term_, which may be composed of more than one word. The designation of a prime term/object class term is critical

to the successful implementation of establishing standard data elements. _Prime terms_ reflect the subject area information used by various business areas in the Department. They are also a key component of _Attribute_ names. For _Attribute Abbreviated Names_, the prime term/object class term may be expressed as the _Synonym Name_ instead of the _Entity Abbreviated Name_ to satisfy the 30 characters or less length requirement.

## 2.4 Entity Metadata Properties

The metadata properties listed in the following table are to be used to fully document an _Entity_.

| **Metadata Property** | **                                            Documentation Requirement** |
| --- | --- |
| Abbreviated Name | The short form of the Business Name. (Follow the abbreviation guidelines found in Section 12 of this document.) |
| Business Name | The unabbreviated form of the entity name. |
| Comment | Any remarks of significance to the understanding of the entity's history |
| Description | The textual description of the entity. |
| Primary Key | The primary identifier that is used to uniquely identify a record instance, or other data grouping in the entity. It is composed of one or more attributes. |
| Business Rule(s) | The manner in which one or more business processes uses the entity. There may be many business rules that pertain directly to the entity or to its relationship to other entities |
| Non-Key Attributes | Identifies all attributes in the entity that are not part of the primary key. |
| _Synonym _Name | Typically an acronym formed by the first letter or letters of the business terms in a Business Name. The Synonym Name is typically 8 characters or less and is used specifically in the Abbreviated Names of Attributes and Columns |
