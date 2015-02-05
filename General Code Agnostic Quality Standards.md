##Abstract##
This "wiki" is an adaptation of “How to Deliver Resilient, Secure, Efficient, and Easily Changed IT Systems in Line with CISQ Recommendations” produced by Consortium for IT Software Quality (CISQ) which proposes a minimal set of language agnostic code development guidelines.  With a framework of language agnostic guidelines, the Division shall endorse a set of detailed and actionable set of coding standards for languages approved for use within the enterprise.  These standards are understood to be dynamic documents subject to continuous improvement to capture changes to architecture and Bureau constraints.  Input from development staff and software engineering staff, leveraging both private and public sector personnel were included.

##Introduction##
In pursuit of division code quality standards, several professional objectives and interests from the CST Strategic Plan 2014-2016 are supported and benefit from these activities:
* (1.2) Continue building CA stakeholder participation into IT development projects and encourage consultations and visits with CST Staff
* (2.5) Review and develop means to accelerate technology adoption processes
* (3.1) Lead the implementation of or serve as an early adopter for Federal CIO initiatives.
* (4.4) Build continuous collaboration mechanisms with IRM & DS management.
* (6.2) Create rotational assignments for CST staff
* (6.3) Create a performance matrix and standards for CST staff
* (6.6) Hire more technical talent in key roles throughout CST

By elevating system quality to a more consistent and professional standard worthy of publication, solutions shared within CST and with other collaborative organizations will be presented in a manner easier to understand, to review for compatibility, validation and for use with automated integration tools.  As new technology is introduced to the Bureau or offered to other federal adopters for integration, winning over stakeholders by clearly articulating how a system works is critical to its success.  System behavior becomes easier to anticipate when internal structure and interfaces are standardized.  Murky and obscure system level requirements which business stakeholders are unaware of during early elaborations will be explicitly defined so common issues described in this document are avoided, which may distract them during system review.

Standardization provides training and guidance material for CST staff making it easier to manage.  Although this guidance does not necessarily facilitate CST personnel developing code themselves, It does give them insight to recognizing signs of best practices being exercised or the absence thereof. 

Modern developers are under pressure of a fast-paced environment where software quality standards are often set aside for another day due to schedule, personnel, or budget constraints.  Most developers try to produce good code, but if they are not given guidance to follow coding standards, they will generally fail by increasing the probability of defects with the next developer and simply charge more technical debt to the system.

Based on twenty years of research in software engineering & business IT, CISQ non-functional requirements lay at the core of the CISQ standards & recommendations.  This "wiki" raises the importance for good coding practices at the code unit level and assuring value for the business at the system level if balances of these factors are not thoughtfully addressed.  Based on CISQ projections, the relative cost of nonconformance is estimated to aid in prioritization.  

##Key Coding Standard Factors##
The Consortium for IT Software Quality is co-sponsored by the Object Management Group and the Software Engineering Institute at Carnegie Mellon University with contributing members from 24 companies, many of whom are Fortune Global 200 Companies.  The consortium publishes automated quality measures for technical characteristics as well as underlying rules for good architectural and coding practice.  CISQ classifies Software engineering best practices into two main categories: **rules of good coding practice within a program at the Unit Level** without the full Technology or System Level context in which the program operates, and **rules of good architectural and design practice at the Technology or System level** that take into consideration the broader architectural context within which a unit of code is integrated.   Figure 1 displays examples of these rules at the Unit and Technology/System Level under four CISQ quality characteristic sub classifications defined by ISO/IEC 25010, a series of Software product Quality Requirements and Evaluation standards.


|CHARACTERISTIC |GOOD CODING PRACTICES (Unit Level)|GOOD ARCHITECHTURAL PRACTICES (Technology/ Systems Level)|
| --------------- | --------------- | --------------- |
|**RELIABILITY – RESILIANCE & DEPENDABILITY**|Protecting state in multi-threaded environments Safe use of inheritance and polymorphism Resource bounds management, Complex code. Managing allocated resources, Timeouts, Built-in remote addresses| Multi-layer design compliance Software manages data integrity and consistency Exception handling through transactions Class architecture compliance |
|**PERFORMANCE EFFICIENCY**| Compliance with Object-Oriented best practices Compliance with SQL best practices Expensive computations in loops Static connections versus connection pools Compliance with garbage collection best practices| Appropriate interactions with expensive or remote resources Data access  performance and data management Memory, network and disk space management Centralized handling of client requests Use of middle tier components versus procedures and database functions |
|**SECURITY & VULNERABILITY**| Use of hard-coded credentials Buffer overflows Broken or risky cryptographic algorithms Missing initialization Improper validation of array index Improper locking References to released resources Uncontrolled format string| Input validation SQL injection Cross-site scripting Failure to use vetted libraries or frameworks Secure architecture design compliance |
|**MAINTAINABILITY, ADAPTIBILITY & CHANGEABILITY**| Unstructured and Duplicated code High cyclomatic complexity Controlled level of dynamic coding Over-parameterization of methods Hard coding of literals Excessive component size Compliance with OO best practices| Compliance with initial architecture design Strict hierarchy of calling between architectural layers Excessive horizontal layers |
 > Fig 1  Elements of the CISQ Quality Characteristic Measures 

These coding quality factors are language agnostic, and can be applied to any development, the factors themselves are not tied to a particular languages, but rather follow object oriented design principles.  The prime goal is that **consistency and transparency across all application development is the most important guideline in producing quality application code.** These factors will be addressed in detail for each programming language in separate style guides which will detail The following areas of interest for each programming language for example C#, C++, and JAVA. The subset of quality characteristics described below represent the priorities for the Division with high level approaches to mitigate them and factors to grade systems against.

##Reliability - Resiliency & Dependability##
{| class="wikitable" style="text-align:left; color:green; background-color:#ffffcc;" cellpadding="20" style="text-align:left;" style="text-align:left;"
|+ style="caption-side:bottom;"|''Fig 2  Reliability Element of the CISQ Quality Characteristic Measures''
|-
! Coding Errors Impacting the RELIABILITY
! Context Required
! Business Impact (est.)
|-
| 
*Error & Exception handling (Unit Level)
*Complexity of algorithms
*Error-prone programming
| Unit Level
| 10%
|-
| 
*Object-Oriented and Structured Programming best practices (when applicable)
*Resource bounds management
| Technology Level
| 25%
|-
| 
*Multi-layer design compliance
*Data integrity and consistency
*Error & Exception handling (across layers)
*Transaction complexity
*Time and state / multi-threading programming
*Null pointers dereference detection
*Resource bounds management
| System Level
| 65%
|}
