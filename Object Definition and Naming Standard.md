





Department of State

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

  The greater than and less than symbols "< >" enclose each name component. 
  The square bracket symbols "[]" enclose optional name components.
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

For the development of new systems and databases, all _prime terms, object class terms, property terms, modifiers, qualifier terms_ and _representation terms_ MUST be derived from theDepartment's repository of standard business terms wherever possible. If a desired term is not present, it MUST be registered in the Enterprise Metadata Repository (EMR) and made available for re-use. Legacy systems that are in use in the Department will go through a procedure of registration of data elements. The legacy systems metadata will be scanned into the EMR and mapped to existing Standard Data Element (SDE) names, as applicable. Candidate standard data element names will be proposed where SDEs have not already been identified. The candidate elements will be created in accordance with DM's standard naming convention, and be prepared to be approved by the Enterprise Data Administrative Group (E-DAWG) to become SDEs.

Candidate standard business terms may be submitted via e-mail to Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov) by sending a request citing the business term, a definition, and proposed abbreviation.

### 1.3.5       Business Name vs. Abbreviated Name vs. Synonym Name

The _Business Name_ is the name of an object in a business context. Business name contains information pertinent to the organization. By combining _Standard Business Terms_ according to the formats described in this document _Business Name_ can be formed. _Abbreviated Name_ is formed by replacing terms from the Business Name with standard abbreviations and using underscore in place of space. _Synonym Name_ can be created by using the acronym formed by the first letter or letters of the business terms in a _Business Name_ and omitting any underscores. _Synonym Names_ SHOULD be incorporated into _Abbreviated Names_ to represent _object class terms_ or _prime terms_ in physical data objects that require them (for example, _Columns, Indexes, Foreign Keys_). When _Synonym Names_ are used, they MUSTbe registered with Data Management.

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
| &nbsp;&nbsp;Object ClassTerm/Prime Term | MUST NOT be used | MAY be used | SHOULD be used |
| &nbsp;&nbsp; Qualifier Term/Modifier/Property Term | MAY be used | SHOULD be used | MUST NOT be used |
| &nbsp;&nbsp;RepresentationTerm/Class Word | MUST NOT be used | MUST be used | MUST NOT be used |
| &nbsp;&nbsp;Foreign Key |   |   |   |
| &nbsp;&nbsp;Table Name | MAY be used | MAY be used | SHOULD be used |
| &nbsp;&nbsp;Purpose/Role Name | MAY be used | May be used | MUST NOT be used |
| Index |   |   |   |
|   &nbsp;&nbspTable Name | MAY be used | MAY be used | **S** SHOULD be used |
| Purpose/Role Name | MAY be used | May be used | MUST NOT be used |
| Trigger |   |   |   |
| Table Name | MAY be used | MAY be used | SHOULD be used |
| Purpose | MAY be used | May be used | MUST NOT be used |
| View | SHOULD be used | MAY be used | MAY be used |

### 1.3.6 General principles and Naming Rules

General Principles:

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

The Enterprise Conceptual Data Model (ECDM) provides a specification of the key data entities that support Department of State's (DOS) business process. The purpose of the Enterprise Conceptual Data Model (ECDM) is to provide a conceptual view the key data entities and their relationships that support DOS's mission. DOS requires such a model in order to provide an organizing framework for further enterprise data architecture efforts. The ECDM acts as a high-level taxonomy organizing all of DOS's data assets into groups and rules. This high-level presentation will allow DOS management and stakeholders to effectively understand the current state of the data architecture and to plan for a future state data architecture that will enhance DOS.  It is composed of entities, relationships, general definitions and attributes. The ECDM defines the major data domains of information maintained to conduct Department business and consists of business objects (Entities) in the Department. These entities represent the highest-level view, the most essential data categories that define the boundaries and the nature of the Department's business and distinguish it fromany other government enterprise. ECDM is currently a work in progress model detail is being added by analysis and discussion that identify additional data requirements. Entities are added, and as facts are identified for each Entity, they become attributes of that Entity. These attributes can become _Candidate Standard Data Elements_ and ultimately be approved as _Standard Data Elements_.  For more information on SDEs and the Enterprise conceptual data Model contact Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov).

# 2. Entities

An _Entity_ is a set of real or abstract things (a person, place, thing, resource, concept, or event) that have common _Attributes_ or characteristics about which a business retains information. In data modeling, it is a logical object whose physical counterpart is usually a _Table_.

## 2.1    Entity Types

There are five types of entities.

&nbsp;&nbsp;&nbsp;&nbsp;**Fundamental** – An entity that is independent of any other Entity for its existence. Alsoknown as an Identifier-Independent Entity. This may also be known as a Parent entity if it exists in a relationship with an Attributive Entity



&nbsp;&nbsp;&nbsp;&nbsp;**Associative** – An Entity that represents a Relationship between two or more Entities. An _Associative Entity_ does not exist independently from the related _Entities_. An _Associative Entity_ resolves many-to-many relationships.

&nbsp;&nbsp;&nbsp;&nbsp;**Attributive** – An entity that describes another entity. It is dependent on the existence ofthe other entity. Also known as an Identifier-Dependent Entity. Attributes repeated within an entity are candidates for attributive entities.



&nbsp;&nbsp;&nbsp;&nbsp;**Supertype** – An Entity that represents a general class of business objects that may be broken down into a hierarchy of more specific classes. A _Supertype Entity_'s attributes apply to all of its _Subtype Entities_, and the _Subtypes_ inherit its identifier. It is also known as a Generic entity.

&nbsp;&nbsp;&nbsp;&nbsp;**Subtype** – An Entity that identifies or represents an occurrence of another Entity with the same Primary Key but has a narrower definition, a subset of different Attributes, and/or different relationships. It inherits all the attributes of the _Supertype Entity_. It is also known as a _Category Entity._

&nbsp;&nbsp;&nbsp;&nbsp;**Subtype** – An Entity that identifies or represents an occurrence of another Entity with the same Primary Key but has a narrower definition, a subset of different Attributes, and/or different relationships. It inherits all the attributes of the _Supertype Entity_. It is also known as a _Category Entity._

## 2.2 Describing Entities

The following rules apply when describing an _Entity_ of any type (_Fundamental, Associative, Attributive, Supertype _or_ Subtype_).

  - An _Entity_ description MUST be a noun phrase 
  - The description MUST be broad enough that no instances of the Entity are omitted 
  - The description MUST be clear, concise, and unambiguous 
  - The description MUST be relevant to its business purpose and independent of technology and implementation 
  - The description MUST be stable over time. The following words or phrases are examples of time dependency or process orientation, and MUST NOT be used to describe an _Entity_: 

     - At this (point in) time   
     - Occasionally 
     - Perhaps                   
     - But not always 
     - Unless this happens       
     - In certain circumstances 
     - In this situation         
     - However, under these circumstances 
     - When this happens         
     - Frequently 
     - If this happens           
     - Depending on
     - However                   
     - Sometimes 



  - The description MUST NOT simply repeat the name of the _Entity_ as a description. 
  - The description MUST be of an _Entity_, not of the data the Department records about the _Entity_, nor the functions, applications, or organizations that use or create the data. The description MUST NOT pertain to: 

    - When, how, or where the data about the Entity are used 
    - Who uses the data 
    - How to edit or process the data 
    - The format the data stored in or other physical considerations 
    - What hardware or software systems use the data 



- _Abbreviations_ and _Acronyms_ MUST NOT be used in descriptions 
- Two _Entities_ MUST NOT be circular in description. (For example, a description of one  _Entity _should not point to descriptions of another) 
- The description MUST be: 

  - Grammatically correct 
  - Spelled correctly 
  - Complete and accurate, fully reflecting the meaning of the Entity. 
  - Written in active voice, where possible. 
  
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



A _Synonym Name_ MUST be defined for use as the _prime term/object class term_ in _Column__Names_. Using an acronym or shorter abbreviation for the terms in the _Table Business Name_ forms _Synonym Names_. They do not have to be formed from standard abbreviations. They should, however, be recorded in the set of full metadata for an Entity. _Synonym Names_ MUST be registered with the Data Management Branch and made available for reuse.

Candidate _Synonym Names_ may be submitted via e-mail to Data Management at [DataMgmtSupport@state.gov](mailto:DataMgmtSupport@state.gov)  by sending a request citing the prime term/object class term and the proposed synonym.

### 2.3.1        Entity Name Formats

All Entities MUST be named according to one of the formats described below:

| **Entity Type** | **Format** |
| --- | --- |
| All entities MAY be named using the format | &lt;Prime Term> (space)] &lt; modifier(s)> [&lt;qualifier term> (space)] &lt;object class term>   e.g: HUMAN RESOURCES PERSONAL DATA |
| Associative entities SHOULD use the format | &lt;parent entity name> (space) &lt;Modifier > e.g. HUMAN RESOURCES PERSONAL  ACCOUNT DATA |
| Attributive entities MAY use the format | &lt;parent entity name> (space) &lt;modifier(s)> e.g. HUMAN RESOURCES PERSONAL TRANSACTION DATA |
| Subtype entities MAY use the formats | &lt;parent entity name> (space) &lt;modifier(s)>&lt;modifier(s)> (space) &lt;parent entity name> e.g. HUMAN RESOURCES PERSONAL  ACCOUNT TYPE DATA |


### 2.3.2       Prime Terms/Object Class Terms

An _Entity's Business Name_ is also known as _a prime term_ or _object class term_, which may be composed of more than one word. The designation of a prime term/object class term is critical

to the successful implementation of establishing standard data elements. _Prime terms_ reflect the subject area information used by various business areas in the Department. They are also a key component of _Attribute_ names. For _Attribute Abbreviated Names_, the prime term/object class term may be expressed as the _Synonym Name_ instead of the _Entity Abbreviated Name_ to satisfy the 30 characters or less length requirement.

## 2.4 Entity Metadata Properties

The metadata properties listed in the following table are to be used to fully document an _Entity_.

| **Metadata Property** | **Documentation Requirement** |
| --- | --- |
| Abbreviated Name | The short form of the Business Name. (Follow the abbreviation guidelines found in Section 12 of this document.) |
| Business Name | The unabbreviated form of the entity name. |
| Comment | Any remarks of significance to the understanding of the entity's history |
| Description | The textual description of the entity. |
| Primary Key | The primary identifier that is used to uniquely identify a record instance, or other data grouping in the entity. It is composed of one or more attributes. |
| Business Rule(s) | The manner in which one or more business processes uses the entity. There may be many business rules that pertain directly to the entity or to its relationship to other entities |
| Non-Key Attributes | Identifies all attributes in the entity that are not part of the primary key. |
| _Synonym_ Name | Typically an acronym formed by the first letter or letters of the business terms in a Business Name. The Synonym Name is typically 8 characters or less and is used specifically in the Abbreviated Names of Attributes and Columns |


# 3. Attributes

An _Attribute_ is an item of data, a fact or piece of information about an _Entity_. An _Attribute_ represents a characteristic or descriptive property of an _Entity_. In data modeling, it is a logical object whose physical counterpart is a _Column._


## 3.1 Describing Attributes

The following rules apply when describing an _Attribute_:

- The description MUST be a noun phrase, complete and detailed
- The description MUST pertain to a  single occurrence of the Attribute in the present tense
- The description MUST be precise and unambiguous.  It MUST identify the Attribute and distinguish it from any other Attribute
- The description MUST be relevant to its business purpose and independent of technology and implementation
- The description MUST be stable over time
- The description MUST NOT simply repeat the name of the _Attribute_ as the description
- Abbreviations and acronyms MUST NOT be used in descriptions
- The _Attribute_'s description MUST NOT contain the description of the _Attribute's_ prime term/object class term or class word/representation term, since they have been defined separately. 
- The description MUST be stable over time. The following words or phrases are examples of time dependency or process orientation, and MUST NOT be used to describe an _Attribute_: 

     - At this (point in) time   
     - Occasionally 
     - Perhaps                   
     - But not always 
     - Unless this happens       
     - In certain circumstances 
     - In this situation         
     - However, under these circumstances 
     - When this happens         
     - Frequently 
     - If this happens           
     - Depending on
     - However                   
     - Sometimes 

- The description MUST BE of an _Attribute_, not of the data the Department records about the _Attribute_, nor the functions, applications or organizations that use or create the data. The description MUST not pertain to: 


  - When, how, or where the data about the Entity are used 
  - Who uses the data 
  - How to edit or process the data 
  - The format the data stored in or other physical considerations 
  - What hardware or software systems use the data

- _Abbreviations_ and _Acronyms_ MUST NOT be used in descriptions 
- Two _Attributes_ MUST NOT be circular in description (for example, two _Attributes_ descriptions cannot exist where one description points to a second description; and the second _Attribute_ description points back to the first description). 

  - Grammatically correct 
  - Spelled correctly 
  - Complete and accurate, fully reflecting the meaning of the Entity. 
  - Written in active voice, where possible.

- The description MUST NOT include an example. Examples of an _Attribute's_ domain values MAY be written as a separate business rule. 

## 3.2        Naming Attributes

Legacy systems in use in the Department are _not_ required to change existing attribute names to adhere to this standard. Those attributes will be mapped to standard data element names where possible.

The following general standards apply in creating an _Attribute Business Name_:

- The name MUST be UPPERCASE 
- The name MUST be composed of the characters A-Z, 0-9
- The name MUST be fully spelled out
- The name MUST be 120 characters or less in length
- Nouns SHOULD be singular except where the plural form is commonly used
- Verbs MUST NOT be used
- Possessive nouns and proper nouns MUST NOT be used in the name
- Underscore MUST NOT be used in names

### 3.2.1 Attribute Name Format

_Attribute Names_ MUST use the format:

   &lt;prime  term>  (space)  [&lt;modifier(s)>  (space)]   &lt;class  word>      
   e.g..: Building  Identification Number 


_In ISO/IEC 11179 terminology:_

   &lt;object class term> (space) [ &lt;qualifier term> (space)]  &lt;property term> (space)  &lt;representation term> 

### 3.2.2       Class Words/Representation Terms

A _class word_, or _representation term_, is a reserved word to be used as part of an _Attribute Name_ so that the type of data it represents may group the _Attribute_. In most cases, the words reserved as class words MUST NOT be used as modifiers in the _Attribute Name_.

The approved list of standard class words appears below. Each approved CLASS WORD is shown together with its standard _Abbreviation._

| **Class Word** | **Abbr.** | **Data Type** | **Data Element Categories**|  **Definition** |
| --- | --- | --- | --- | --- |
| AMOUNT | AMT | Numeric | Amount, Average, Balance, Cost, Price | A monetary value. |
| CODE | CD | Alphanumeric | Code, Category, Status, Type, Condition | A combination of one or more numbers, letters, or special characters substituted for a specific meaning. Represents finite, predetermined values. |
| DATE | DT | Numeric | Date, Day, Month, Year | The designation of a specific 24-hour period of time. A date, specified by month, day, and year (for example, July 4, 1976), but in YYYYMMDD format (for example, 19760704). |
| DATETIME | DTTM | Numeric | Date and Time | The designation of a specificchronological point in time inconjunction with a specific 24-hour period of time. |
| DESCRIPTION | DESC | Alphanumeric | Description | A character string used to tell thefacts, details or particulars ofsomething. |
| FILE | FIL | Alphanumeric | Binary Data that can't be described as Sound, Video, or  Picture but has a fileextension type associated | An attribute that holds data in a known file format that does not conform to another, more specific class word (i.e., SOUND, VIDEO, or PICTURE).  For example: an XML or PDF file stored in a Binary Large Object (BLOB). |
| IDENTIFIER | ID | Alphanumeric | Identifier, Designator, Index, Key | A combination of one or morenumbers, letters, or special characters that designate a specific entity that have no readily definable meaning. |
| INDICATOR | IND | Alphanumeric | Binary Data that can't be described as sound, Video, or Picture but has a file extension type Associated | An attribute that holds data in a known file format that does not conform to another, more specific class word (i.e., SOUND, VIDEO, or PICTURE).  For example: an XML or PDF file stored in a Binary Large Object (BLOB). |
| NAME | NM | Alphanumeric | Name, Title | A designation of an entity expressed in a word or phrase. |
| NUMBER | NUM | Numeric | Number, Count, Index | A non-monetary numeric value that is not a calculated unit or aggregated unit. |
| PICTURE | PIC | Binary | Picture | A picture, including graphics that can be stored in a binary large object (BLOB) and viewed on the screen. |
| QUANTITY | QTY | Numeric | Quantity, Average, Balance, Deviation, Mean, Median, Mode, Altitude, Depth, Diameter, Dimension, Elevation, Height, Length, Radius, Width, Magnitude, Percent | A non-monetary numeric value that does not have to be a whole number. It is a calculated or aggregated value. |
| SOUND | SND | Binary | Sound | Audio that can be stored in a binary large object (BLOB) and heard on system speakers. |
| TEXT | TXT | Alphanumeric | Text, Comments, Memo, Description, Definition | An unformatted character string (free-form narrative), frequently in the form of words with no length limitation. |
| TIME | TM | Numeric | Time, Quarter | A designation of a specifiedchronological point designated as an occurrence (in the past, present, or future) within a period. |
| VIDEO | VID | Binary | Video | Dynamic pictures that can be stored in a binary large object (BLOB) and viewed at a workstation. |

For each class word, an _Attribute_'s description SHOULD begin as follows:

| **Class Word** | **Description** |
| --- | --- |
| AMOUNT | The &lt;modifier> amount of… |
| CODE | The code that represents… |
| DATE | The date on which… |
| DATETIME | The date and time at which… |
| DESCRIPTION | The description of… |
| FILE | The file that… |
| IDENTIFIER | The identifier of… |
| INDICATOR | Indicates whether |
| NAME | The name of… |
| NUMBER | The &lt;modifier> number that… |
| PICTURE | The picture that… |
| QUANTITY | The quantity of… |
| SOUND | The sound that… |
| TEXT | The text that describes… |
| TIME | The time at which… |
| VIDEO | The video that… |

### 3.2.3 Migrated Foreign Key Attributes

Attributes that exist because of a relationship to another Entity, relationship between the same Entity, multiple relationships with the same entity, or from a Categorization/Supertype Entity have additional rules that must also be followed. These rules impact which object class term/prime term is used in naming the Attribute:

  - _Attributes_ migrated through non-recursive relationshipsMUSTmaintain the name of theobject class term/prime term (the _Entity Name_) from which it migrated. 

  - _Attributes_ migrated through recursive relationshipsMUSTprefix the object classterm/prime term with a _Role Name_ for all but the primary _Attributes'_ prime term/object class term. The primary attribute MAY also prefix the object class term/prime term with a Role Name. 

Migrated foreign key attribute names are illustrated in  Figure 2. Migrated Foreign Key Attribute  Names below. Note that the migrated attributes in the CUSTOMER ACCOUNT associative entity maintain the object class term/prime term of their originating entities: CUSTOMER and ACCOUNT rather than take on the prime term of their actual entity CUSTOMER ACCOUNT.

 

![pic-2](https://github.com/CA-CST-SII/Software-Standards/blob/master/Images/Object_FIG_2.png)

Role Names by which migrated foreign keys are illustrated in Figure 3 (Role Names on Migrated Foreign Keys), where RELATED is the role given to the migrated foreign key PERSON IDENTIFIER. In the second example PARENT is the role given to attribute migrated through the recursive relationship of ORGANIZATION with itself

![pic-2](https://github.com/CA-CST-SII/Software-Standards/blob/master/Images/Object_FIG_3.png)

## 3.3 Attribute Metadata Properties

The metadata properties listed in the following _Table_ are necessary to fully document an _Attribute_. The name of the property is the name that appears in the current repository schema.

| **Metadata Property** | **Documentation Requirement** |
| --- | --- |
| Allowed Values | Entries permitted for an instance of an attribute |
| Business Name | The attribute name in its unabbreviated form |
| Business Rule(s) | The manner in which one or more business processes uses the attribute.  There may be many business rules that pertain directly to the attribute or to its relationship to other attributes |
| Case Sensitivity | Indicates whether or not the data is to be upper case, lower case or mixed |
| Comment | Any remarks of significance to the understanding of the attribute's history. |
| Data Length | The maximum allowable length for the attribute. |
| Data Type | The allowed data format for the attribute (for example, alphabetic, binary, and so on). |
| Default Value | The domain value that is automatically assigned when no other value is specifically identified. |
| Derivation Rule | The algorithm used to determine how the attribute is derived. |
| Description | The textual definition of the attribute. |
| Domain Definition | The general description of the applicable domain for the attribute. |
| Domain Detail | Additional detail pertaining to the Allowed Values. |
| Mandatory Requirement | Identifies whether or not the attribute is required for an instance of the entity to have meaning. |
| Originating Entity | The entity in which the attribute is initially defined. |
| Originating Organization | The organization(s) that is the source of the attribute's definition and maintenance. |
| Other Security | Handling restriction, such as Sensitive, under Freedom of Information Act (FOIA). |
| Precision | The number of places after the decimal point. |
| Range Maximum | The upper bound of the range of acceptable data values. |
| Range Minimum | The lower bound of the range of acceptable data values. |
| Reference Documentation | Information pertaining to the source material for the attribute's definition or a statement regarding the current source organization for the domain definition.  If the source is from Data Management, a complete a set of domain values will be identified.  If the source is other than Data Management, a sample of the domain will be defined in the Allowed Values property. |
| Security Classification | Level of national security protection required for the attribute. |







# 4. Relationships



A _Relationship_ is an association between two or more _Entities_ (a non-recursive relationship) or between occurrences of the same _Entity_ (a recursive relationship) that represents a business rule. _Relationships_ are used in Entity Relationship Diagrams (ERDs) to convey information as to how _Entities_ correspond to one another. In data modeling, it is a logical object whose physicalcounterpart is a _Foreign Key Constraint_.

## 4.1 Naming Relationships

The following rules apply when determining a _Relationship Business Name_:

  - The _Entity Names_ MUST be UPPERCASE
  - The _verb phrase_ MUST be lower case. 
  - The _Relationship Name_ MUST be an active voice _verb phrase_
  - The _Relationship_ names MUST be clear and precise. Ideally, the names SHOULD fully describe the _Relationship_ so that no further description is needed. Avoid weak verbs and imprecise clauses. For example, avoid the following: 

     - Has 
     - Does 
     - Can
     - Could
     - Is related to  
     - Might 
     - Relates to  
     - Has a relationship to 
     - Is a kind of

  - Characters used for a _verb phrase_MUST be lowercase a-z and the space character. Punctuation marks or special characters, including the slash (/) and the hyphen (-) and numbers MUST NOT be used. Avoid using special characters like "/?!@#$ %^&\*() +-='," or numbers.
  - Verbs occurring in a _Relationship_ name MUST be singular unless the sense requires the plural. 
  - _Abbreviations_ and _Acronyms_ MUST NOT be used in _Relationship_ names.

### 4.1.1       Relationship Name Format

_Relationships_ MUST use the following format:

&lt;(parent)  entity  name>  (space)  &lt;active  voice  verb  phrase>  (space) &lt;(child)  entity  name>

## 4.2 Describing Relationships

All of the information the analyst needs to precisely describe a _Relationship_ is often provided when the following items are determined:


&nbsp;&nbsp; **The nature of the relationship between the entities,**  For example, the _Entities__EMPLOYEE _and_ WORKSITE _may have the following_ Relationship_:

            - _EMPLOYEE_ works at WORKSITE 

            - _WORKSITE_ is work location of EMPLOYEE 

The two _Entities_, together with the nature of the _Relationship_ between two _Entities_, are known collectively as the _Relationship Name_. The _Relationship_ is established by the business rules of the enterprise. Each business rule MAY be stated in either an active or passive voice, resulting in two _Relationship Names_ for the resulting _Relationship_. For purposes of clarity in the data model, only the _Relationship Names_ with the active voice MUST be described. The name with the passive voice is optional, and is only used where it adds significant value without detracting from the clarity of the model.



&nbsp;&nbsp; **The optionality between the entities**  ,   Relationship _ &lt;u>**optionality**&lt;u> indicates whether a_Relationship_ is optional or required. Frequently, a _Relationship_ can be optional whenviewed from one _Entity_ and required when viewed from the other. The following illustrates the concept of optionality.

            - A _CUSTOMER_ may place ORDER_ (optional)  
            - An _ORDER_ must be placed by a _CUSTOMER_ (required) 

&nbsp;&nbsp; **The cardinality between the entities**  ,_Relationship_cardinality indicates how many of one_Entity _is related to how many of another_ Entity_.  _Relationships_ between two _Entities_ maybe one-to-one (1:1), one-to-many (1: M), or many-to-many (M: M). the modeler should be wary of including 1:1 _Relationships_ in a finished data model. A 1:1 _Relationship_ normally indicates that two _Entities_ can be combined into one _Entity_. An M: M _Relationship _MUSTbe represented by two 1: M _Relationships_ and an _Associative Entity_.  When recording the _Relationship Name_, optionality and cardinality, enough information is usually conveyed so that _Relationship_ descriptions are not required.

## 4.3 Foreign Key Constraint on Relationship

In some Relational Database Management Systems (RDBMS), _Foreign Key Constraints_ may be used to physically enforce a business rule defined by a _Relationship_. The _Foreign Key_ constraint name in the physical data model does not affect the verb phrase on the _Relationship_ in the logical data model.

### 4.3.1       Foreign Key Constraints Name Format:

_Foreign Key Constraint Names_ MUST use the following format:

FK\_&lt;sequence number>_\_&lt;table name>_\_&lt;referential table name>[\_&lt;purpose or role name>] 


The _Table Names_ used in _Foreign Key Constraint Names_ SHOULD be the _Table Abbreviated Names_ but MAY also be the _Table Business Names_ or _Table Synonym Names_.

The _purpose, role name or sequence_ is typically only used when more than one constraint exists between two tables. The _purpose_ should describe the functional role of the constraint and MUST be composed of _Standard Business Terms_. The _role_ may represent the role name of the column that is being constrained. The _sequence_ simply differentiates between the two constraints but does not provide any additional information and is therefore the least desirable.





# 5. Tables



A _Table_ is the physical manifestation of an _Entity_, containing rows and columns wherein data may be stored and retrieved and represents a person, place, thing, resource, concept, or event about which a business retains information. These rules also apply for the representation of a _Table_ in a physical data model. _Tables _follow the naming rules of their corresponding _Entities_, but with spaces replaced by underscores. See Section 2 of this document for a complete list of rules for describing and naming Tables, as well as their appropriate metadata properties.

## 5.1 Naming Tables

The same naming rules for naming an entity apply to naming tables:

        Exceptions:
              - Acronyms and abbreviation from glossary of standard term MUST BE used if exist
              - CamelCaseMAY be used 
              - Table names (nouns) must be pluralized 
              - The names of tables that implement a star schema  MUST have prefixes that specify the table's role in the star
                - schema model:
                "DIM" for dimension and "FACT" for fact.
              - Underscore MUST be used in place of space 

### 5.1.1 Name Format:

[&lt;Prime Term> (space)] &lt;modifier(s)>[&lt;qualifier term> (space)] &lt;Object class term>   e.g.: HR\_PERSONAL\_DATA

## 5.2 Describing Tables

Tables MUST be described in the same fashion as Entities.

## 5.3 Table Metadata Properties

The metadata properties used to fully document a _Table_ are the same as those for an _Entity_.











# 6. Columns

A _Column_ is a vertical segment in a _Table_ and the physical manifestation of an _Attribute_. These rules also apply for the representation of a _Column_ in a physical data model. See Section 2 of this document for a complete list of rules for describing and naming Columns, as well as their appropriate metadata properties.

## 6.1 Naming Columns

_Columns_ MUST be named in the same way as their corresponding _Attributes_. Whereas theattribute name uses all business names for its components, the column name should be constructed as follows:


    - CamelCase MAY be used 
    - Underscore MUST be used in place of space 
    - Columns MUST be  named with a class word, or it's abbreviation
    - Acronyms and abbreviation from glossary of standard term MUST BE used if exist

### 6.1.1Name Format:

[&lt;modifier(s)> (\_)] &lt;noun>[&lt;qualifier term> (\_)] &lt;object class term>  e.g..: long\_term\_plan\_dsc

## 6.2 Describing Columns

_Columns_ MUST be described in the same fashion as_ Attributes_.

## 6.3 Column Metadata Properties

The metadata properties used to fully document a _Column_ are the same as those for an _Attribute_.



# 7. Views

A _View_ is a specific physical data object that provides access to all or a portion of one or more _Tables_. In the case of multiple _Tables in a _View_, the _Tables_ must be capable of being joined. Aprinciple reason for creating a _View_ is to give a user somewhat limited access to the columns in the _View's_ tables. See Section 2 of this document for a complete list of rules for describing and naming _Views_, as well as their appropriate metadata properties.

## 7.2 Naming Views


The same general rules for naming an entity also apply to naming Views.

_Exception:_

     - View name MUST have a prefix "VW_"

### 7.2.1       View Name Format


_View Names_ SHOULD use the format:

[&lt;Prime Term> (space)] &lt;modifier(s)>[&lt;qualifier term> (space)] &lt;object class term>   e.g.: VW\__HR\_ PERSONAL DATA_


## 7.1 Describing Views

_Views_ MUST be described in the same fashion as _Entities_.

## 7.3 View Metadata Properties

The metadata properties listed in the following table are to be used to fully document a view.

| **Metadata Property** | **Documentation Requirement** |
| --- | --- |
| View Name | The identifier of the view, including the abbreviated Functional Name. |
| Functional Name | The name of the business function supported by the view. |
| Description | The textual description of the _View._ |
| Tables | The tables included in the _View._ |
| Columns | The columns included in the _View._ |





#8. Indexes

An _Index_ is a set of ordered pointers to data contained in a _Table_, and it can be created with one or more columns contained in the _Table_. Three _Indexes_ will be defined in this section: _Primary Key Index, Foreign Key Index, and Alternate Key Index_.

## 8.1 Index Types

**Primary Key Index** – An index placed on the column or columns that make up the Primary Key ofa Table. Primary Key Indexes MUST be defined as "UNIQUE" if RDBMS supports this feature
**Alternate Key Index** – An index placed on a column or columns that could be used to uniquelyidentify a row in the table, but are not the Primary Key. Alternate Key Indexes MUST be defined as "UNIQUE" if your RDBMS supports this feature
**Foreign Key Index** – An index placed on the column or columns that represent a foreign keyconstraint to another table
**Non-key Index** – An index placed on a column that does not represent a key of any of the typesdescribed above

## 8.2 Naming Indexes

- Index MUST be named according to their function and Table Name
- The Index MUST not exceed 30 characters in length

### 8.2.1       Index Name Formats

Indexes MUST be named according to one of the following formats:

| Index Type | Format |
| --- | --- |
| Primary Key Index: | PK\_&lt;table name> |
| Alternate Key Index:   | AK\_&lt;table name>\_&lt;purpose, role name or sequence> |
| Foreign Key Index | XFK\_&lt;table name>\_&lt;referential table name>\_&lt;purpose, role name or sequence> |
| _Non\_Key\_Index_ | &lt;Table name>\_&lt;purpose, role name or sequence> |

## 8.3 Index Metadata Properties

The metadata properties listed in the following _Table_ are necessary to fully document an _Index_.

| **Metadata Property** | **Documentation Requirement** |
| --- | --- |
| Index Name | The name of the index |
| Index Type | Whether the index defines a Primary Key, Foreign Key, Alternate Key, or Non-Key |
| Index Expanded Name | In the same format as the Index Name, but with all business terms spelled out |
| Table Name | The name of the table in which the index is defined. |
| Column(s) | The name(s) of the column(s) contained in the index |



# 9. Triggers

Some RDBMS support _Triggers_ that are stored code objects that execute for specific events on _Tables_. These events are defined as before or after an insert, update or delete of a row orstatement on a specific table.

## 9.1 Naming Triggers

_Trigger Names_ are based on when they fire, whether they fire for every row in a table or once forthe event statement, and the event that must occur for them to fire as described below:



- Trigger names MUST be prefixed with the letters "Trgr\_" 
- The second portion of the trigger name is composed of three letters and followed by an underscore character. 
  - The first letter MUST be either "b" or "a" indicating whether the trigger fires before or after the action, respectively.
  - The second letter MUST be one of the following letters: "i", "u", or "d" indicating whether the trigger fires upon an insert, update, or delete, respectively.
  - The third letter MUST be either an "r" or an "s" indicating whether the trigger fires for each row or statement, respectively.

- On the very seldom occasion that more than one trigger of the same name combination is required (for example, when more than one trigger is needed to update different sets of columns on a table), a number can be appended after the table name.
- The last portion of the trigger name MUST be the table name on which it fires an activity on 



### 9.1.1       Formatting Triggers

_Triggers_ MUST use the following format:

_Trgr_\_&lt;B or A> &lt;I or U or D> &lt;R or S>\_Table Name _

The above formatted name can optionally be followed by _&lt;\_1>_if more than one trigger with the exact same name is created.

          B or A – Before or After
          R or S – Row or Statement
          I, U, D – Insert, Update, Delete

## 9.2 Trigger Metadata

_Metadata Properties:_

<table style="width:100%">
   <tr>
    <td>Description</td>
     <td>The textual description of the triggers and Purpose</td> 
   </tr>
  <tr>
    <td>Comment</td>
     <td>Any remarks of significance to the understanding of the triggers history.</td> 
   </tr>
<table>


# 10. Constraints

Database constraints are restrictions on the contents of the database or on database operations. Database constraints provide a way to guarantee that:

- rows in a table have valid primary or unique key values
- rows in a dependent table have valid foreign key values that reference rows in a parent table
- individual column values are valid 

## 10.1 Type of Constraints

1) Primary Key (PK) - Serves as the unique identifier for rows in the table
2) A unique constraint (UNQ) - is similar to a primary key constraint but doesn't have to be defined with Not Null.
3) Foreign key constraint (FK) - The relationship between rows in two tables is expressed by a foreign key in the dependent table. A foreign key is one or more columns that contain a value identical to a primary key (or unique key) value in some row in the parent table (i.e., the referenced table).
4) Check Constraints (CHK) - Used to enforce the validity of column values

## 10.2 Naming Constraints

- MUST including Keyword stating the database object
- MUST include suffix with abbreviation for the type of Constraints
- Separate each word with an underscore
- If more than one constraint is required exist within a type of constraint, MUST add a numeric suffix of 1 through 9.

### 10.2.1      Constraints Name Formats

Constraints MUST be named according to one of the following formats:

&lt;Noun (keyword)>, &lt;\_>, &lt;abbreviation for type of constraints

<table style="width:100%">
  <tr>
    <th>Type of Constraints</th>
    <th>Naming Rule</th>
    <th colspan="3">Example</th>
  </tr>
  <tr>
    <td>Primary Key</td>
    <td width="50%"> Primary key type constraints MUST be named after the table name plus a suffix of "_pk".</td>
    <td>proj_et_pk </td>
    <td>prcl_cnty_pk</td>
    <td>srfc_wtr_pmp_pk</td>
  </tr>
  <tr>
    <td>A unique constraint</td>
    <td>The unique constraint MUST be named after the table plus a suffix of "_unq". If more than one unique constraint is required, add a numeric suffix of 1 through 9.</td>
    <td>proj_et_unq </td>
    <td>prcl_cnty_unq1</td>
    <td>prcl_cnty_unq2</td>
  </tr>
  <tr>
    <td>Foreign key constraint</td>
    <td>A foreign key constraint MUST be named after the table plus a suffix of "_fk". If more than on foreign key constraint is required, add a numeric suffix of 1 through 9.".</td>
    <td>proj_et_fk </td>
    <td>bdgk_acct_fk1</td>
    <td>bdgk_acct_fk2</td>
  </tr>
</table>



## 10.3 Constraint Metadata Properties

The metadata properties listed in the following table are necessary to fully document Constraints

| **Metadata Property** | **Documentation Requirement** |
| --- | --- |
| Constraint Name | The Name of the Constraints |
| Constraint Type | Type of Constraint such as Primary key, Foreign Key, Unique constrain or Check Constrain |
| Table Name | The name of the table in which the constrain is defined |
| Column(s) | The name(s) of the column(s) contained in the constrain |

# 11. Stored Procedure

An action oriented named program or routine stored in a database. Stored procedures are precompiled database queries that improve the security, efficiency and usability of database client/server applications. Developers specify a stored procedure in terms of input and output variables

## 11.2 Naming Stored Procedure

- Stored procedures performs a function, they are action oriented. Name MUST describe the function;
- MUST use a verb as prefix to describe the work
- MUST use keyword of the object
- SHOULD use underscore to separate words

### 11.2.1      Stored Procedure Name Formats

Stored Procedure MUST be named according to one of the following formats:

Prefix (verb) &lt;\_>, &lt;Prime term>, &lt;qualifier > e.g..: Get\_Customer\_Details Insert\_Customer\_Info

## 11.3 Stored Procedure Metadata Properties

The metadata properties listed in the following table are necessary to fully document Constraints

| **Metadata Property** | **Documentation Requirement** |
| --- | --- |
| Stored Procedure Name | The Name of the Stored Procedure |
| Description | Describe the function of the stored procedure. Schedule of when the procedure is applied. |
| Table Name | The name of the table in which the stored procedure is defined |
| Column(s) | The name(s) of the column(s) contained in the procedure |


# 12. Acronyms and Abbreviations

_Acronyms_ and _Abbreviations_ are necessary due to some physical tool constraints. They eliminate objectname redundancy and inconsistency and improve the quality of model descriptions and application documentation by using clear and commonly used words. Acronym and _Abbreviation_ standards enable analysts to select _Acronyms_ and abbreviations that are as clear and commonly used as possible. The standards also require a consistent use of the _Acronyms_ and _Abbreviations_, regardless of the length of the name. The _Abbreviated Name_ MUST have each word in the name abbreviated in accordance with this section. A Business Name MUST use Standard abbreviations (from glossary of approved standard term) MUST be used where they exist.

For the purposes of this document, the definition of _acronym_ is "a word formed from the first (or first few) letters of a series of words." An _Abbreviation_ is defined as "a shortened _Form_ of a word or phrase by contraction, or by omission of letters." A _candidate_ is defined as an acronym or _Abbreviation_ which an organization wants to use that does not yet exist in the repository."

## 12.1 Creating Abbreviations

Create a candidate _Abbreviation_ by using the following rules:

1. Check the following sources for a common _Abbreviation_ for the term in question: 

     - A commonly accepted American dictionary 
     - Any commonly accepted _Abbreviation_ (de facto standard) 

   An _Abbreviation_ for the term in question **may** be found through these sources, or follow _Abbreviation_ rules 2 through 20. If a readily acceptable _Abbreviation_ is found, use it, identify itssource, and go to rule 2; then skip rules 3 through 20. If the _Abbreviation_ is not readily acceptable due to possible conflicts or duplications, or it does not adequately represent the word it replaces, continue with the _Abbreviation_ rules. Apply common sense.

2. Ensure that each _Abbreviation_ is unique, not only with regard to other _Abbreviations_, but also with respect to _Acronyms_. 
3. Ensure that each term has only one _Abbreviation_. 

4. _Abbreviations_ MAY consist of alphabetic characters only.

5. Only the singular _Form_ of the business term should be used. 

6. An _Abbreviation_ should be recognizable; that is, looking at the _Abbreviation_, one should be able to visualize the word. 

7. Generally, do not abbreviate words that are five or fewer characters, except for class words. Exceptions MAY be made for size considerations. 

8. Preserve the first letter of the term, whether it is a vowel or consonant. 

9. Always treat "y" as a consonant. 

10. Delete unnecessary vowels; however, not all vowels need to be eliminated to have a valid _Abbreviation_. Keep those that are necessary to make the _abbreviation_ understandable. 

11. Generally, delete one consonant of a double consonant.  Exceptions MAY be made for clarity. 

12. If the removal of a vowel causes a double consonant then keep the vowel. 

13. If the term has a leading double vowel  (e.g., "au" or "ou"),  keep  both  vowels.  For  example, 

    _AUTHORIZATION_ would be abbreviated _AUTHZN_.

14. If the abbreviation already exists for another word, for example, _FCLTY_ for _FACILITY_, then it is necessary to either keep one of the vowels for the new _Abbreviation_, or use a commonly accepted _Abbreviation_ that is sufficiently different. For example, using FAC for _FACULTY_ might be usedin lieu of _FCLTY_, which would otherwise be one result of following the rules. 

    A root word and its derivatives SHOULD have the same 'root' _Abbreviation_. For example, the _Abbreviation_ for_EXEMPT_ is _EXMPT_, and for _EXEMPTION_ is _EXMPTN_. The 'root _Abbreviation_' in both cases is _EXMPT_.

    Always eliminate the vowels in a suffix. Use _G_ as the _Abbreviation_ for the _ING_ suffix, and _MT_ for the _MENT_ suffix. Using this rule, the _Abbreviation_ for _PRINTING_ is _PRINTG_, and an acceptable _Abbreviation_ for _EMPLOYMENT_ is _EMPMT_.

15. If a root word is five or fewer characters and is not abbreviated, its derivatives may have the root portion spelled out or abbreviated, but, if abbreviated, all derivatives must have the same _Abbreviation_ of the root portion of the word. For example, _PRINT_ is not abbreviated since it is five characters. _PRINTING_ can be abbreviated _PRINTG_, and all other derivatives would also contain the root _PRINT_. On the other hand, _CLEAR_ is not abbreviated, but _CLEARANCE_ MAY be abbreviated _CLRNC_. In this case _CLR_ MUST be used as the root for all derivatives of _CLEAR_.
16. _Abbreviations_ must not spell an expletive.

## 12.2 Creating Acronyms

The rule for creating a candidate acronym is a simple. An acronym is formed from the first or first few, letters of a series of words. Examples include "FICA" in place of "F ederal I nsurance Contributions Act," and "radar" in place of "RAdio Detecting and Ranging."_Acronyms_ are not to be used in Business Name s; nor are they to be used in descriptions unless they are first spelled out. However, some _Acronyms_, such as radar and sonar, become so common that they are accepted as words, and are notcapitalized in normal use. _Acronyms_ must not spell an expletive.

## 12.3 Candidate Term Submittals

All candidate _Acronyms, Abbreviations_, and _Synonym Names_ submitted to Data Management will go through a review and approval cycle. Once DM accepts candidates, they will be reviewed in a timely manner. Candidate _Acronyms_ and _Abbreviations_ that an organization desires to use, but do not exist in the _Standard Acronyms_ and _Abbreviations List_ for Common Business Terms, will be measured against the rules in this section.

Candidate terms may be submitted via e-mail to Data Management at [ DataMgmtSupport@state.gov,](mailto:DA@state.gov) citing the candidate term, the definition, and the proposed synonym.


# Appendix A:  Invalid Entity and Attribute Name Components

Neither _Entity_ nor _Attribute Names_ MUST contain conjunctions, prepositions, certain adverbs, or phrases listed below unless it is necessary to meaningfully name the object.

Invalid _Entity_ and _Attribute Names_ name components:




<table style="width:80%">
   <tr>
    <td>A</td>
     <td>Non</td> 
   </tr>
  <tr>
    <td>An</td>
     <td>Nor</td> 
   </tr>
    <td>After</td>
     <td>Occasionally</td> 
   </tr>
  <tr>
    <td>Always</td>
     <td>Off</td> 
   </tr>
    <td>And</td>
     <td>Often</td> 
   </tr>
  <tr>
    <td>Because</td>
     <td>on</td> 
   </tr>
    <td>But</td>
     <td>or</td> 
   </tr>
  <tr>
    <td>Do</td>
     <td>Sometimes</td> 
   </tr>
   <tr>
    <td>Else</td>
     <td>The</td> 
   </tr>
  <tr>
    <td>For</td>
     <td>Then</td> 
   </tr>
    <td>Frequently</td>
     <td>Through</td> 
   </tr>
  <tr>
    <td>How</td>
     <td>Thru</td> 
   </tr>
    <td>However</td>
     <td>To</td> 
   </tr>
  <tr>
    <td>If</td>
     <td>Too</td> 
   </tr>
    <td>In</td>
     <td>When</td> 
   </tr>
  </tr>
    <td>While</td>
     <td></td> 
   </tr>
</table> 

The word **KEY** is reserved for use in naming key fields.



# Appendix C:  Document Revision

# History Detail


**A. Changes from the Fourth (4th) Edition** 

1. The standard was brought into conformance to ISO/IEC 11179-5 
  - Information Technology
  - Specification and Standardization of Data Elements
  - Naming and Identification Principles for Data Elements from earlier conformance to Federal Information Processing Standards (FIPS) 156 Information Resources Dictionary System (IRDS). 
2. Acceptable Business Name, Abbreviated Name and Synonym Name usage has been changed as follows: 
3. Business Names must now be used in data models for all logical objects including Entities, Attributes and Relationships. 
4. For Tables, the Business Name is now preferred. 
5. Synonym Names are now preferred for the Prime Term/Object Class Term/Table Name component of Column, Foreign Key Index, and Trigger names. 
6. Business Terms are preferred in View names. 
7. Added DESCRIPTION, FILE, and INDICTOR to class word/representation terms. 
8. Foreign Key Constraint name prefixes were changed from R\_ to FK\_. 
9. Foreign Key Index prefixes were changed from FK\_ to XFK\_. 
10. Trigger prefixes were modified to include more accurate indicators as to when the trigger fires. 
11. The sequence number name component was dropped from View names to encourage more accurate functional names. 
12. The standard for Form objects was dropped. 

**B. Changes from the Fifth (5th) Edition** 

1. Changed IRM/OPS/SIO/API/DM organization name from Data Administration to Data Management (DM), including references to DM e-mail address. 
2. Updated term repository to specify Metadata Repository (MDR). 
3. Updated intended audience section. 
4. Added website reference for FIPS 184:   [ ](http://www.itl.nist.gov/fipspubs/idef1x.doc) [http://www.itl.nist.gov/fipspubs/idef1x.do](http://www.itl.nist.gov/fipspubs/idef1x.doc)c. 
5. Deleted references to page numbers used to cross-reference applicable sections within the document. Table of contents will be sufficient for cross referencing and will lessen effort to synchronize re-pagination in future document updates. 
6. Added items to Acronyms and Abbreviations List of document (DAWG, DM, EDM, and IDE1X). 
7. Re-worded sentences for better clarity and completeness, without changing the context of the information being conveyed. 
8. Added additional rule to Section 1.4.6, General Naming Rules, as follows: "For logical objects, the underscore character MAY be used in place of spaces." 
9. Added Data Modeling Syntax Legend in Section 2.0, Entity Types, to show graphical notations used in data models related to entities, super types/subtypes, and relationships. 
10. Revised Section 4.3.1, Foreign Key Constraints Name Format to show: 

    FK\_&lt;sequence number>\_&lt;table name>\_&lt;referential table name>_[&lt;purpose or role name>]

11. Added Appendix B to this document to provide additional guidelines (template format) in naming database components related to ORACLE and MS SQL Server DBMS. 
12. Added Appendix C to provide detailed account of the revisions made to this document. Transferred Section 1.3, "Changes from the Fourth Edition," to Appendix C of this document (6th Edition). 
 

**C. Changes from the Seventh (7th) Edition** 

1. Changed all the named references from IRS/OPS/SIO/API/DM Branch toIRS/OPS/SIO/APD/DM
2. Changed DM Email address
3. Deleted all the reference to Old DM site
4. Changed the requirement for general Naming rules
5. Added General naming Principal section (section 1.3.6)
6. Add two new data objects Constraints and Stored Procedure at section (1.2)
7. Updated section 1.4 _Standard Data Elements and the Enterprise Conceptual Data Model_ by replaced the Scope Model with ECDM
8. Deleted _Acronyms and Abbreviations_ section of the (list under section 1.4). This section is not necessary since Acronyms and abbreviations are defined when mention at first.
9. Updated Section _2.2 Describing Entity Section_ Re-worded sentences for better clarity and completeness, without changing the context of the information being conveyed. Deleted redundant rules
10. Updated section 2.1 _Entity Types_ removed entity type picture illustration. It is tools specific illustration. Didn't add much value to the document
11. Added Naming Guidelines for Logical and physical Structure
12. Added additional rule to Section 2.2 _Naming Entities,_ deleted redundant rules
13. Deleted website reference for FIPS 184:   [ http://www.itl.nist.gov/fipspubs/idef1x.do](http://www.itl.nist.gov/fipspubs/idef1x.doc)c (Out-of -date document)
14. Modified sections for naming, description and metadata properties for the following with new rules for the following object: Entity, Tables, Column, Triggers, views, relationship and index.  
15. Added section 10. _Constraints_ withType of Constraints, Constraints Name Formats, Constraints metadata properties.
16. Added section 11. _Stored Procedure_ with Type of Stored Procedure, Stored Procedure Name Formats, and Stored Procedure metadata properties.
