# Table of Contents

- [1 Introduction](#1-introduction)	
- [2 List Of References](#2-list-of-references)	
- [3 Purpose](#3-purpose)
- [4 Naming Conventions](#4-naming-conventions)
  - [4.1 General Naming Standards](#41-general-naming-standards)
  - [4.2 General Namespace Naming Standards](#42-general-namespace-naming-standards)
  - [4.3 BPEL Activities](#43-bpel-activities)
    - [4.3.1 BPEL Process Name and Namespace](#431-bpel-process-name-and-namespace)
    - [4.3.2 Assign](#432-assign)
    - [4.3.3 Compensate](#433-tag-signature)
    - [4.3.4 Flow](#434-flow)
    - [4.3.5 FlowN](#432-flown)
    - [4.3.6 Invoke](#433-invoke)
    - [4.3.7 Java Embedding](#431-java-embedding)
    - [4.3.8 Pick](#432-pick)
    - [4.3.9 Receive](#433-receive)
    - [4.3.10 Scope](#431-scope)
    - [4.3.11 Sequence](#432-assign)
    - [4.3.12 Switch](#433-switch)
    - [4.3.13 Case](#433-case)
    - [4.3.14 Terminate](#431-terminate)
    - [4.3.15 Throw](#432-throw)
    - [4.3.16 Transform](#433-transform)
    - [4.3.17 Wait](#431-wait)
    - [4.3.18 While](#432-while)
  - [4.4 OTHER BPEL ARTIFACTS](#4-other-bpel-artifacts)
    - [4.4.1 Variables](#41-variables)
    - [4.4.2 Properties](#42-properties)
    - [4.4.3 Correlation Sets](#43-correlation-sets)	
    - [4.4.4 Correlation Sets](#44-correlation-sets)	
- [5 Fault Handling](#5-fault-handling)
  - [5.1 BPEL STANDARD FAULTS](#41-general-naming-standards)
    - [5.1.1 BPEL 2.0 Standard Faults](#431-bpel-process-name-and-namespace)
    - [5.1.2 Fault handling order of precedence in BPEL 2.0](#432-assign)
  - [5.2 Categories of BPEL Faults](#42-general-namespace-naming-standards)
    - [5.2.1 Business Faults](#432-assign)
    - [5.2.2 Runtime Faults](#432-assign)
  - [5.3 Typical Fault Handling Flow](#43-bpel-activities)
  - [5.4 BPEL Activities to propagate a fault](#43-bpel-activities)
    - [5.4.1 Throw](#432-assign)
    - [5.4.2 Rethrow](#432-assign)
    - [5.4.3 Reply with a fault](#432-assign)
  - [5.5 USE A FAULT HANDLER WITHIN A SCOPE](#43-bpel-activities)
  - [5.6 USE COMPENSATION AFTER UNDOING A SERIES OF OPERATIONS](#43-bpel-activities)
  - [5.7 USE THE TERMINATE ACTIVITY TO STOP A BUSINESS PROCESS INSTANCE](#43-bpel-activities)
- [6 CODE LEVEL METRICS](#43-bpel-activities)	
- [7 SIMPLE CODING GUIDELINES](#43-bpel-activities)	
  - [7.1 AVOID INTERRUPTIBLE PROCESSES](#43-bpel-activities)
  - [7.2 AVOID MISSING OTHERSWISE IN SWITCH STATEMENTS](#43-bpel-activities)
  - [7.3 AVOID USING INVOKE WITHOUT CATCH](#43-bpel-activities)
  - [7.4 CREATE SCOPES FOR EACH STEP OF THE FLOW IN THE PROCESS](#43-bpel-activities)
  - [7.5 USE SHORT-RUNNING FLOWS WHERE POSSIBLE](#43-bpel-activities)
  - [7.6 USE GLOBAL VARIABLES WHEN REQUIRED](#43-bpel-activities)
  - [7.7 CONSIDER CREATING SEQUENCES INSTEAD OF SCOPES FOR PERFORMANCE](#43-bpel-activities)
  - [7.8 USE ASSIGN ACTIVITIES INSTEAD OF TRANSFORM ACTIVITIES](#43-bpel-activities)
  - [7.9 USE XSL TO CONSTRUCT MESSAGES INSTEAD OF MULTIPLE ASSIGN STATEMENTS](#43-bpel-activities)
  - [7.10 USE XPATH EXPRESSION CONSTRAINTS TO CHECK THE DATA CONSTRAINTS](#43-bpel-activities)
  - [7.11 INITIALIZE A BPEL VARIABLE BEFORE COPYING VALUES TO INTERNAL ELEMENTS](#43-bpel-activities)
  - [7.12 USE NONBLOCKINGINVOKE IN BPEL FLOW FOR PERFORMANCE IMPROVEMENTS](#43-bpel-activities)
  - [7.13 KEEP THE NUMBER OF ACTIVITIES IN BPEL AS MINIMAL AS POSSIBLE](#43-bpel-activities)
  - [7.14 AVOID UNUSED PARTNER LINKS.](#43-bpel-activities)
  - [7.15 AVOID REPETITIVE NAMES FOR DIFFERENT ACTIVITIES.](#43-bpel-activities)
  - [7.16 DON’T USE BPEL FOR INTENSIVE TIME SCHEDULED ACTIVITIES](#43-bpel-activities)
  - [7.17 FOLLOW PROJECT NAME CONVENTIONS.](#43-bpel-activities)
  - [7.18 FOLLOW VARIABLE NAME CONVENTIONS.](#43-bpel-activities)
  - [7.19 DON’T USE THE PICK BASED INITIATE PATTERN FOR INTERDEPENDENT OPERATIONS](#43-bpel-activities)
  - [7.20 DON’T LET A SOA COMPOSITE INSTANCE GROW EXPONENTIALLY.](#43-bpel-activities)
  - [7.21 AVOID EMPTY SEQUENCE.](#43-bpel-activities)
  - [7.22 CODE CLEANING IN PROCESS LEVEL VARIABLES CREATED BY DEFAULT.](#43-bpel-activities)
  - [7.23 DEFINE A COMMON ERROR PROCESS TO HANDLE ERRORS ACROSS MULTIPLE BUSINESS PROCESS.](#43-bpel-activities)
  - [7.24 ADAPTERS SHOULD BE DEFINED AS AN ESB SERVICE FOR REUSABILITY STANDARDS.](#43-bpel-activities)
  - [7.25 EXTERNALIZE SECURITY FROM SERVICE PROVIDERS AND CONSUMERS THROUGH AGENTS AND GATEWAYS FOR IT SECURITY.](#43-bpel-activities)
  - [7.26 DO NOT USE A FILE ADAPTOR FOR LOGGING FOR DEBUGGING PURPOSES.](#43-bpel-activities)
- [8 CODE EXAMPLES](#43-bpel-activities)	
- [9 LEADING PRACTICES FOR SUCCESS OF BPEL IMPLEMENTATION](#43-bpel-activities)
  - [9.1 ASSESSMENTS AND MATURITY MODELS](#43-bpel-activities)
  - [9.2 A STRATEGIC ROADMAP AND TACTICAL PLAN](#43-bpel-activities)
  - [9.3 AVOID INTERRUPTIBLE PROCESSES](#43-bpel-activities)
  - [9.4 AGILE METHODS AND PROCESSES](#43-bpel-activities)
  - [9.5 GOVERNANCE](#43-bpel-activities)





# 1 Introduction

Business Process Execution Language for Web Services (BPEL or BPEL4WS) is a language used for the definition and execution of business processes using Web services.  BPEL enables the top-down realization of Service Oriented Architecture (SOA) through composition, orchestration, and coordination of Web services.  BPEL provides a relatively easy and straightforward way to compose several Web services into new composite services called business processes, which is a collection of coordinated service invocations and related activities that produce a result.

BPEL builds on the foundation of XML and Web services; it uses an XML-based language that supports the Web services technology stack, including SOAP, WSDL, UDDI, WS-Reliable Messaging, WS-Addressing, WS-Coordination, and WS-Transaction.  BPEL is used to standardize enterprise application integration as well as to extend the integration to the Consular Affairs (CA) legacy applications and services where an Oracle Enterprise Service Bus is a middleware solution as an intermediary between service requesters and service providers.
Using BPEL a series of discreet services can be integrated into an end-to-end process flow that reduces process cost and complexity.  The BPEL enables to define how to:

   •	Send XML messages to, and asynchronously receive XML messages from, remote services.

   •	Manipulate XML data structures.

   •	Manage events and exceptions.

   •	Design parallel flows of process execution.

   •	Undo portions of processes when exceptions occur.



 
# 2 List Of References


The following sources were used in creation of the original version of this standard.
o	Oracle Infrastructure Components and Utilities User's Guide for Oracle Application Integration Architecture Foundation Pack, https://docs.oracle.com/cd/E28280_01/doc.1111/e17366/toc.htm

o	Fusion Middleware Developer's Guide for Oracle Application Integration Architecture Foundation Pack, 11g Release 1 (11.1.1.7), https://docs.oracle.com/cd/E28280_01/doc.1111/e17364/toc.htm

o	Fusion Middleware Developer's Guide for Oracle SOA Suite, https://docs.oracle.com/cd/E28280_01/dev.1111/e10224/bp_appx_ref.htm#SOASE2070

o	OASIS WS-BPEL v2.0 specification, http://docs.oasis-open.org/wsbpel/2.0/OS/wsbpel-v2.0-OS.pdf.  

o	Oracle SOA Suite 11g Handbook by Lucas Jellema
 
# 3 Purpose
Each business unit is at a different point in the journey of adopting BPEL applications.  Although the answer can vary depending on the current state of maturity, there are important concepts, design decisions, coding practices, and considerations that need to be taken into account to benefit most from BPEL projects.

The purpose of this document is to collect industry best practices and recommendations to move toward higher levels of maturity. Conformance to the practices and guidelines will promote measurable improvements in the performance of BPEL projects and a reduction in sustainment costs.    

This document is intended for the CST Systems Engineering and Integration (SEI) team and development teams.  
 
# 4 Naming Conventions
## 4.1 General Naming Standards

Follow these general naming standards:

 •	Lower-Camel-case must be used for naming attributes.
Example: ```<xsd:attribute name="unitCode"/>```


•	Upper-Camel-case must be used for naming elements and types.
Example: ```<xsd:element name="UnitOfMeasure"/> <xsd:complexType name="InvoiceEBOType"/>```


 •	Names must be singular unless the concept itself is plural.
For example repeating elements must have a singular name.


 •	Names must not contain special characters such as: ```space, '-', '_', '.', '$', '%', '#', ....```


 •	Avoid having numeric characters in the name.
There are cases were using a numeric character is required to convey some significance.


 •	Complex type names should end with the 'Type' suffix to help recognize types from elements.
Example: ```<xsd:complexType name="InvoiceEBOType"/>```


 •	The name of a simple type definition should be the name of the root element with the 'ContentType' suffix.
Example: ```<xsd:simpleType name="PhoneNumberContentType">```
## 4.2 General Namespace Naming Standards

Follow these general namespace naming standards:


•	All namespaces must start with http://xmlns.oracle.com/.


•	Namespaces used by Enterprise Business Objects(EBOs) and Enterprise Business Messages (EBMs) start with http://xmlns.oracle.com/EnterpriseObjects/.
Example: http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Invoice/V1


•	Namespaces used for externally facing services must start with http://xmlns.oracle.com/EnterpriseServices/.
Examples: http://xmlns.oracle.com/EnterpriseServices/Core/Invoice/V1 


•	Namespaces for versioned artifacts must have the major version number as a suffix with 'V' as an abbreviation for 'version'.
Example: http://xmlns.oracle.com/ EnterpriseObjects/Core/EBO/Invoice/V1


•	The namespace structure should closely map to the taxonomy of the types it encapsulates.
Example: Horizontal: http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Invoice/V1.

•	Namespaces for artifacts generated within ABCSs must start with: http://xmlns.oracle.com/ABCS/


•	When importing or including schema in a schema file, the schema location must always use relative path.
Example: ```<xsd:importnamespace="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Invoice/V1" schemaLocation="../../../../Core/EBO/Invoice/InvoiceEBO .xsd"/>```


•	Namespace prefixes must be a minimum of six (6) lowercase characters abbreviation of the namespace.  The abbreviation must be descriptive and unambiguous within the context where it is being used.

•	Namespace prefixes for EBOs and EBMs must adhere to the following standard wherever used regardless of the applications or technology used.  Auto-generated prefixes such as ns1, ns2 must not be used. Auto-generated prefixes for standard namespaces such as xsd, xsi are acceptable.
## 4.3 BPEL Activities
### 4.3.1	BPEL Process Name and Namespace

The BPEL process JDeveloper project name should match the BPEL process name (use default project setting).

Name standards

•	The name should follow the general standard naming standards depending on whether it is being used for EBS, Application Business Connector Services (ABCS), or Adapter Service.

•	The name should clearly describe the process and action/verb being performed.

Namespace standards:

•	The namespace should follow the general namespace standards depending on whether it is being used for EBS, ABCS or Adapter Service.

•	The namespace must reflect the taxonomy of the process.

•	The namespace must include the major version number where appropriate.

•	BPEL composite's reference component name should follow the general naming standards based on the type of AIA artifacts it is calling.
### 4.3.2	Assign
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with the Assign prefix.

•	Followed by a name describing what is being assigned. If what is assigned is a message, then use the message name.

•	In case there are multiple assignments, provide a name that describes the group of assignments if possible.
Pattern: ```Assign<Name of what is being assigned>```
Example: ```AssignPaymentEBM```, ```AssignOrderInitialValues```

### 4.3.3	Compensate

Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Start with the Compensate prefix.

•	Followed by the scope encapsulating the tasks to be compensated.
Pattern: ```Compensate<scope name>```
Example: ```CompensateProcessCreditCheckMilestone```, ```Compensate TranseferFundsScope```

### 4.3.4	Flow
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts by a name describing the tasks being run concurrently.

•	Ends with the Flow suffix.
Pattern: ```<Name describing concurrent tasks>Flow```
Example: ```CallManufacturersFlow```, ```GetQuotesFlow```

### 4.3.5	FlowN
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts by a name describing the dynamic tasks being run concurrently.

•	Ends with the FlowN suffix.

•	The index variable name should be the flow name with Index as suffix.
```Pattern: name = <Name describing concurrent tasks>FlowN```, ```index variable = <Name describing concurrent tasks>FlowNIndex```
Example: ```ActivateUsersFlowN (ActivateUsersFlowNIndex)```, ```CheckSuppliersFlowN (CheckSuppliersFlowNIndex)```

### 4.3.6	Invoke
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with the Invoke prefix.

•	Followed by the partner link to be invoked.

•	Followed by Call if synchronous invocation or Start if asynchronous invocation.

•	Followed by the operation name within the partner link.
Pattern: ```Invoke<Partner Link Name>{Call/Start}<Operation>```
Example: ```InvokeCustomerServiceCallGetCustomer```, ```InvokeNotificationServiceStartNotifyByEmail```

### 4.3.7	Java Embedding
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	The name should be similar to a Java method Name with lower-camel-case.
Pattern: ```<A name describing the functionality>```
Example: ```getDiscountPrice```

### 4.3.8	Pick
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with the Pick prefix.

•	Followed by a name describing as accurate as possible all branches (onMessage and onAlarm) within the pick activity.
Pattern: ```Pick<Name describing the branches to pick from>```
Example: ```PickOrderAckOrTimeout```, ```PickFirstQuote```

### 4.3.9	Receive
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with the Receive prefix.

•	Contains the name of the message it is receiving.
Pattern: ```Receive<Message Name>```
Example: ```ReceiveUpdateInvoiceEBM```

### 4.3.10 Scope
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Including brief information about transaction type may be appropriate.

•	Use Milestone as the suffix if the scope is a candidate for end-user monitor.

•	If it is not intended for the end-user monitor, use Scope as the suffix.
Pattern: ```<Name describing the Scoped Tasks>{ Scope |Milestone}```
Examples: ```GetCreditRatingScope```, ```GetLoanOfferScope```, ```ProcessCreditCheckMilestone```

### 4.3.11 Sequence
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	The sequence name should describe the steps performed in the sequence.

•	The sequence name should end with Sequence suffix.
Pattern: <Name describing the Sequenced Tasks>Sequence
Example: GetCustomerInfoSequence

### 4.3.12 Switch
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Start with the Switch prefix.

•	Followed by what is being evaluated
Pattern: ```Switch<Name of what is being evaluated>```
Example: ```SwitchCreditRating```

### 4.3.13 Case
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Start with the Case prefix.

•	Followed by the evaluated value.
Pattern: ```Case<Name evaluated value>```
Example: ```CaseBadCredit```, ```CaseApprovalRequired```

### 4.3.14 Terminate
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with the Terminate prefix.

•	Followed by a name describing the termination reason.
Pattern: ```Terminate<reason of termination>```
Example: ```TerminateTimeout```, ```TerminateEndOfProcess```

### 4.3.15 Throw
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with the Throw prefix.

•	Followed by the fault name.

•	The fault variable name is typically named the same as the fault name.
Pattern: ```Throw<fault name>```
Example: ThrowExceededMaxAmount, which uses ExceededMaxAmount variable.
Note:
When defining a Catch in the Scope activity, the displayed catch name is the fault name.

### 4.3.16 Transform
Follow these guidelines:

The name should follow the general standard naming standards.

•	Starts with the Xform prefix.

•	Followed by the source name.

•	Followed by To.

•	Followed by the destination name.

Pattern: ```Xform<source>To<destination>```
Example: ```XformBillToPortal80Bill```

### 4.3.17 Wait
Follow these guidelines:

The name should follow the general standard naming standards.

•	Starts with the Wait prefix.

•	Followed by a name describing the reason for waiting.
Pattern: ```Wait<Name describing the waiting reason>```
Example: ```WaitOrderAcknowledgeTimeout```, ```WaitWarmUpTime```

### 4.3.18 While
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with the While prefix.

•	Followed by a name describing the loop condition.
Pattern: ```While<Name describing the loop condition>```
Example: ```WhileAllMsgsSent```

## 4.4 Other BPEL Artifacts

### 4.4.1	Variables
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Use lower-camel-case for variable names.

•	The data type must not be part of the variable name.
Example: ```accountBalance```, ```invoiceAmount```.

### 4.4.2	Properties
Property names follow the general BPEL variables naming standards.

### 4.4.3	Correlation Sets
Follow these guidelines:

•	The name should follow the general standard naming standards.

•	Starts with a name describing the correlation set.

•	Ends with CorSet suffix.
Pattern: <Name describing the correlation>CorSet
Example: PurchaseOrderCorSet

### 4.4.4	Correlation Set Properties
The correlation set property names follows the general BPEL variables naming standards.

# 5	Fault Handling
The term fault refers to any exceptional condition that can alter the normal processing of a business process. Within the context of a business process, a fault need not result in a process ending condition; instead, a fault should lead to an actionable event. If a fault is not handled, it will lead to unexpected conditions, outcomes or even unpredictable failures of the business process. A well-designed business process should handle faults so that failures lead to predictable outcomes. Within BPEL, fault handlers can catch faults and attach business relevant execution logic to deal with the exceptional situation.

Explicit fault handlers, if used, attached to a scope provide a way to define a set of custom fault-handling activities, defined by <catch> and <catchAll> constructs.  Each <catch> construct is defined to intercept a specific kind of fault, defined by a fault QName.  An optional variable can be provided to hold the data associated with the fault.  If the fault name is missing, then the catch will intercept all faults with the same type of fault data.  The fault variable is specified using the fault Variable attribute in a <catch> fault handler.  The variable is deemed to be implicitly declared by virtue of being used as the value of this attribute and is local to the fault handler. It is not visible or usable outside the fault handler in which it is declared. A <catchAll> clause can be added to catch any fault not caught by a more specific fault handler.
## 5.1 BPEL Standard Faults
### 5.1.1 BPEL 2.0 Standard Faults

The following list specifies the standard faults defined within the WS-BPEL specification. All standard fault names are qualified with the standard WS-BPEL namespace.


Fault name	Description
ambiguousReceive	Thrown when a business process instance simultaneously enables two or more IMAs for the same partnerLink, portType, operation but different correlationSets, and the correlations of multiple of these activities match an incoming request message.
completionConditionFailure	Thrown if upon completion of a directly enclosed <scope> activity within <forEach> activity it can be determined that the completion condition can never be true.
conflictingReceive	Thrown when more than one inbound message activity is enabled simultaneously for the same partner link, port type, operation and correlation set(s).
conflictingRequest	Thrown when more than one inbound message activity is open for the same partner link, operation and message exchange.
correlationViolation	Thrown when the contents of the messages that are processed in an <invoke>, <receive>, <reply>, <onMessage>, or <onEvent> do not match specified correlation information.
invalidBranchCondition	Thrown if the integer value used in the <branches> completion condition of <forEach> is larger than the number of directly enclosed <scope> activities.
invalidExpressionValue	Thrown when an expression used within a WS-BPEL construct (except <assign>) returns an invalid value with respect to the expected XML Schema type.
invalidVariables	Thrown when an XML Schema validation (implicit or explicit) of a variable value fails.
joinFailure	Thrown when the join condition of an activity evaluates to false and the value of the suppressJoinFailure attribute is yes.
mismatchedAssignmentFailure	Thrown when incompatible types or incompatible XML infoset structure are encountered in an <assign> activity.
missingReply	Thrown when an inbound message activity has been executed, and the process instance or scope instance reaches the end of its execution without a corresponding <reply> activity having been executed.
missingRequest	Thrown when a <reply> activity cannot be associated with an open inbound message activity by matching the partner link, operation and message exchange tuple.
scopeInitializationFailure	Thrown if there is any problem creating any of the objects defined as part of scope initialization. This fault is always caught by the parent scope of the faulted scope.
selectionFailure	Thrown when a selection operation performed either in a function such as bpel:getVariableProperty, or in an assignment, encounters an error.
subLanguageExecutionFault	Thrown when the execution of an expression results in an unhandled fault in an expression language or query language.
uninitializedPartnerRole	Thrown when an <invoke> or <assign> activity references a partner link whose partnerRole endpoint reference is not initialized.
uninitializedVariable	Thrown when there is an attempt to access the value of an uninitialized variable or in the case of a message type variable one of its uninitialized parts.
unsupportedReference	Thrown when a WS-BPEL implementation fails to interpret the combination of the reference-scheme attribute and the content element OR just the content element alone.
xsltInvalidSource	Thrown when the transformation source provided in a bpel:doXslTransform function call was not legal (i.e., not an EII).
xsltStylesheetNotFound	Thrown when the named style sheet in a bpel:doXslTransform function call was not found.
 
### 5.1.2	Fault handling order of precedence in BPEL 2.0

In BPEL 2.0, the order of precedence for catching faults thrown without associated data is as follows:

•	If there is a catch activity with a matching faultName value that does not specify a faultVariable attribute, the fault is sent to the identified catch activity.

•	Otherwise, if there is a catchAll activity, the fault is sent to the catchAll fault handler.

•	Otherwise, the fault is processed by the default fault handler.

In BPEL 2.0, the order of precedence for catching faults thrown with associated data is as follows:

•	If there is a catch activity with a matching faultName value that does not specify a faultVariable attribute, the fault is sent to the identified catch activity.

•	If the fault data is a WSDL message type in which the following exists:

o	The message contains a single part defined by an element.

o	There exists a catch activity with a matching faultName value that has a faultVariable whose associated faultElement QName matches the QName of the runtime element data of the single WSDL message part.

Then, the fault is sent to the identified catch activity with the faultVariable initialized to the value in the single part's element.

•	Otherwise, if there is a catch activity with a matching faultName value that does not specify a faultVariable attribute, the fault is sent to the identified catch activity. In this case, the fault value is not available from within the fault handler, but is available to the rethrow activity.

•	Otherwise, if there is a catch construct without a faultName attribute that has a faultVariable whose type matches the type of the runtime fault data, then the fault is sent to the identified catch activity.

•	Otherwise, if the fault data is a WSDL message type in which the message contains a single part defined by an element and there exists a catch activity without a faultName attribute that has a faultVariable whose associated faultElement's QName matches the QName of the runtime element data of the single WSDL message part, the fault is sent to the identified catch activity with the faultVariable initialized to the value in the single part's element.

•	Otherwise, if there is a catchAll activity, the fault is sent to the catchAll fault handler.

•	Otherwise, the fault is handled by the default fault handler.

## 5.2	Categories of BPEL Faults

A BPEL fault has a fault name called a Qname (name qualified with a namespace) and a possible messageType. There are two categories of BPEL faults:

•	Business faults

•	Runtime faults
### 5.2.1	Business Faults

Business faults are application-specific faults that are generated when there is a problem with the information being processed (for example, when a social security number is not found in the database). A business fault occurs when an application executes a throw activity or when an invoke activity receives a fault as a response. The fault name of a business fault is specified by the BPEL process service component. The messageType, if applicable, is defined in the WSDL. A business fault can be caught with a faultHandler using the faultName and a faultVariable.
<catch faultName="ns1:faultName" faultVariable="varName">
### 5.2.2	Runtime Faults

Runtime faults are the result of problems within the running of the BPEL process service component or web service (for example, data cannot be copied properly because the variable name is incorrect). These faults are not user-defined, and are thrown by the system. They are generated if the process tries to use a value incorrectly, a logic error occurs (such as an endless loop), a Simple Object Access Protocol (SOAP) fault occurs in a SOAP call, an exception is thrown by the server, and so on.

•	```bindingFault```: a bindingFault is thrown inside an activity if the preparation of the invocation fails.  For example, the WSDL of the process fails to load. A bindingFault is not retryable.  This type of fault usually must be fixed by human intervention.

•	```remoteFault```: a remoteFault is also thrown inside an activity. It is thrown because the invocation fails.  For example, a SOAP fault is returned by the remote service.  

•	```replayFault```: a replayFault replays the activity inside a scope. At any point inside a scope, this fault is migrated up to the scope. The server then re-executes the scope from the beginning.

## 5.3 Typical fault handling flow

When a fault occurs in a process, the current operational flow moves to the fault handler within the immediate scope.  If the current fault handler does not have the appropriate Catch element defined to trap and handle this fault, the business process container checks from inner scope to outer scope until it finds an appropriate fault handler that can trap this fault. 

The Catch mechanism handles a specific application or standard fault.  In cases when the type of a fault is unknown, the Catch All element can be used.   It is a best practice to use a Catch All element in the global process’s fault handler.

When designing fault handlers, consider the following options:

•	Catch a fault and try to correct the problem, allowing the business process to continue to normal completion.

•	Catch a fault and find that it is not resolvable at this scope. Additional options can be used: 

o	Throw a new fault.

o	Re-throw the original fault to allow another scope to handle it.

o	Reply with a fault to the process initiator. 

o	Invoke a human task to correct the issue. 

o	If the fault handler cannot resolve the issue, you might need to rollback and compensate.
## 5.4 BPEL activities to propagate a fault
BPEL allows fault propagation using throw, rethrow and reply within a fault handler.
### 5.4.1	Throw
A throw activity indicates a problem that a business process flow cannot handle. It is used to throw an exception corresponding to an internal error condition. Use a throw activity within the flow of a business process or within a fault handler, to allow an outer fault handler to handle the fault. A throw activity can throw one of the standard BPEL faults or a custom fault. 

### 5.4.2	Rethrow
When the current fault handler cannot handle the fault and wants to propagate it to an outer-scoped fault handler, use a rethrow activity.  In the absence of a rethrow activity, a fault propagated to a higher level using a throw activity would be a new fault. When a rethrow activity is invoked, the fault is the same instance. The rethrow activity is available only within a fault handler because only an existing fault can be rethrown.
### 5.4.3	Reply with a fault

This construct allows the propagation of the fault to the client that initiated the process. A reply with fault activity can only return a fault defined on the interface the process is implementing. This is useful when the business process cannot properly respond to the caught fault, and the process initiator may be better equipped to respond; for example if the client passes an account number that is not found by the business process, the process should reply to the service call with an AccountNotFound Fault.
## 5.5 Use a fault handler within a scope

If a fault is not handled, it creates a faulted state that migrates up through the application and can throw the entire process into a faulted state.  To prevent this, contain the parts of the process that have the potential to receive faults within a scope. The catch activity works within a scope to catch faults and exceptions before they can throw the entire process into a faulted state.

You can use specific fault names in the catch activity to respond in a specific way to an
individual fault. To catch any faults that are not already handled by name-specific
catch activities, use the catchAll activity.
## 5.6 Use compensation after undoing a series of operations

Compensation occurs when the BPEL process cannot complete a series of operations after some of them have already completed, and the BPEL process must backtrack and undo the previously completed transactions. For example, if a BPEL process is designed to book a rental car, a hotel, and a flight, it may book the car and the hotel and then be unable to book a flight for the right day. In this case, the BPEL flow performs compensation by going back and unbooking the car and the hotel.

You can invoke a compensation handler by using the compensate activity, which names the scope for which the compensation is to be performed (that is, the scope whose compensation handler is to be invoked). A compensation handler for a scope is available for invocation only when the scope completes normally. Invoking a compensation handler that has not been installed is equivalent to using the empty activity.  This ensures that fault handlers do not have to rely on state to determine which nested scopes have completed successfully. The semantics of a process in which an installed compensation handler is invoked more than once are undefined.

If an invoke activity has a compensation handler defined inline, then the name of the activity is the name of the scope to be used in the compensate activity. The syntax is as follows:

<compensate scope="ncname"? standard-attributes>
standard-elements
</compensate>
## 5.7 Use the terminate activity to stop a business process instance

The terminate activity immediately terminates the behavior of a business process instance within which the terminate activity is performed.  All currently running activities must be terminated as soon as possible without any fault handling or compensation behavior.  The terminate activity does not send any notifications of the status of a BPEL process.

The syntax for the terminate activity is as follows:
<terminate standard-attributes>
 standard-elements
</terminate>
# 6	Code Level Metrics
 Name	Description and How to Calculate	Recommended Threshold
Minimize the Number of BPEL Variables	Use as few variables as possible, and minimize the size and the number of business objects used. 	Less than x
Avoid BPEL Processes with High Depth of Code	Depth of Code is measured as the maximum number of nested control statements in an artifact. For example, an artifact that contains an IF statement which contains a While loop which itself contains another IF statement will have a Depth of Code of 3 (at least).	Less than 9
Avoid Large Java Snippets	BPEL is an orchestration language. The services that are being orchestrated should be implemented outside of BPEL. Java should be used only for small interactions only. Long Java Snippets make BPEL more complex.  Java Snippets should not have more than X lines of code.	Less than x
Avoid BPEL artifacts with low comments/code ratio	Maintainability of the code is facilitated if there is documentation in the code. This rule will ensure there are comments within the Artifact.	More than 5%

# 7	Simple Coding Guidelines
SOA and BPEL bring a range of new challenges as composite applications introduce greater complexity and more dependencies. 

## 7.1 Avoid interruptible processes

Use interruptible processes, also known as macroflows or long-running processes, only when required.  Whenever possible, use synchronous interactions for non-interruptible processes.  A non-interruptible process is much more efficient than an interruptible process.  If interruptible processes are required for some capabilities, separate the processes such that the most frequent scenarios can be executed in non-interruptible processes and exceptional cases are handled in interruptible processes.
## 7.2 Avoid missing OTHERSWISE in SWITCH statements

 The OTHERWISE CASE is executed when none of the conditions being tested for in the CASE statement are met or executed.  Having no OTHERWISE means that there is a strong assumption about the value of data. The cases that are "impossible" today are the ones most likely to be the causes of untraceable bugs in the future, when the impossible changes to the standard.  Add the proper exception handling code in the OTHERWISE clause.
## 7.3 Avoid using invoke without catch

The BPEL process has to perform the task efficiently and reliably enough that network interruptions or the unavailability of a web service or other resource doesn't break it down.
## 7.4 Create scopes for each step of the flow in the process

Create scopes for each step of the flow in the process so as to make it modular.  This will help in creating local variables within that scope.  Scopes provide a context for the execution and/or documentation of enclosed activities, and they can have variables that are visible and usable at and within the scope level. Scopes can have both default and defined fault and event handling logic, and they can be undone, if necessary. Undoing the work of a scope involves the concept of compensation.  When designing BPEL processes, they should be organized into logical units of work that can be undone.  Scopes can be used as a context to create variables, fault/compensation/event handlers and for organizational purposes. They are the basic building blocks used to assemble a BPEL process.

## 7.5 Use short-running flows where possible

A business transaction that is represented through a long-running flow has a lifetime that can span minutes, hours, days or even months, and is typically divided into several technical transactions.  The state of such a process instance is persisted in a database between two transactions so that operating system resources are occupied only during an in-flight transaction. 

The short-running flow is used when the corresponding business transaction is fully automated, completes within a short timeframe, and has no asynchronous request/response operations.  The entire set of flow activities runs within one single technical transaction, navigation is all done in memory, and the intermediate state is not saved to a database.  Such short-running flows can run between five and fifty times faster than comparable long-running flows and are recommended, where possible.
## 7.6 Use global variables when required

This will help in maintainability.  However, declaring many global variables needs to be avoided in a BPEL process, instead use scope or local variables. The variables defined at the process root are global variables, which have a global visibility throughout the entire process.  The variables defined within a particular scope are visible only inside that scope and all nested scopes.  These variables are called local variables.  A variable defined for an inner scope element can hide an upper defined variable of the same name.
## 7.7 Consider creating sequences instead of scopes for performance

Do not add too many scopes since it may affect the performance. Instead, consider creating sequences. A sequence is a structured activity which can contain other activities, all of which will be executed in a specifically defined order.  The purpose of a sequence, therefore, is to define the execution order for a group of activities.  BPEL sequences can contain other sequences and can be nested as deeply as you want.  Sequences have all the standard attributes and elements and they must contain at least one or more activities.
## 7.8 Use assign activities instead of transform activities

Use assign activities instead of transform activities wherever possible since it take less memory.
Assign activity provides a method for data manipulation, such as copying the contents of one variable to another. This activity can contain any number of elementary assignments.  Transform activity enables to create a transformation that maps source elements to target elements (for example, incoming purchase order data into outgoing purchase order acknowledgment data).
## 7.9 Use XSL to construct messages instead of multiple assign statements

Don’t use multiple assign statement to construct a message; use XSL to construct messages.
## 7.10	Use XPath Expression constraints to check the data constraints

Don’t loop through the data to check data constraints; use XPath Expression constraints to check the data constraints. Use Fully Qualified XPath expressions.
## 7.11	Initialize a BPEL variable before copying values to internal elements

Variables offer the possibility to store messages that hold the state of the process.  Initialize a variable before copying values to internal elements to avoid “SelectionFailurefaults or "variable counter isn't properly initialized" on execution.
## 7.12	Use <nonBlockingInvoke> in BPEL flow for performance improvements

Normally when executing a synchronous (two-way) invoke activity, Oracle BPEL
server waits for the response from the endpoint before executing the subsequent
activity. This behavior can present problems when synchronous invoke activities are
placed inside a flow activity, because Oracle BPEL Server executes the flow using
pseudo-parallelism.

 

The second invoke activity is not executed until the response from the first invoke activity is received. If the number of branches in the flow is large, the delay before the final invoke activity is executed is the sum of all the preceding synchronous invoke activities.

Solution 

With a non-blocking invoke depicted in Pic 1 and Pic 2, the execution of the synchronous invoke activity is scheduled to be performed by a separate thread in the background. With this change, the initial execution time of the invoke activities is reduced.

 
 

The sequence of events in Pic 1 and Pic 2 for a non-blocking invoke call is as follows:

1.	The first synchronous invoke activity sends a message to a JMS queue. This activity now waits for the asynchronous response and relinquishes control to the next activity.
2.	The second synchronous invoke activity sends a message to a JMS queue.
3.	Since there are no additional activities to execute, the instance now dehydrates.
4.	The invoke activities cannot complete until they receive their callbacks.
5.	Two InvokerBean instances pick up the messages in the JMS queue and execute
the synchronous invoke against the partner endpoint.
6.	The response from the endpoint is cached and a callback message is scheduled
with the dispatcher module.
7.	The first invoke activity receives its callback. The instance is rehydrated during this step.
8.	The second invoke activity receives its callback. The instance is rehydrated during this step.

A performance test showed a 30 % improvement in comparison with not using nonBlockingInvoke.
## 7.13	Keep the number of activities in BPEL as minimal as possible
Keep the number of activities in BPEL as minimal as possible; increasing the number of activities will decrease the performance of BPEL engine.
## 7.14	Avoid unused partner links.
## 7.15	Avoid repetitive names for different activities.
## 7.16	Don’t use BPEL for intensive time scheduled activities

Extensive use of activities such as alarm and wait can lower system performance.
## 7.17	Follow project name conventions.

A project name SHOULD:
•	Be a noun, in mixed case with the first letter of each internal word capitalized.
•	Be simple and meaningful.
•	Be abstract.
•	Be abbreviated, where possible.
o	Common government acronyms are acceptable.
A project name SHOULD NOT:
•	Identify a particular department, bureau, agency, or other entity. 
•	Identify a particular product or technology, e.g. SOA, OSB, ESB, etc.
•	Identify the type of service, e.g. synchronous/sync or asynchronous/asynchronous.
•	Include the following word(s):
•	Project,
•	Proxy, and/or
•	Service.
## 7.18	Follow variable name conventions.

A variable name SHOULD:
•	Be meaningful.
•	Begin with a lower-case letter.
•	Be in camelCase where the first letter of a composite word is capitalized, e.g. thisIsAVariable.
•	Use complete words
A variable name SHOULD NOT:
•	Be abbreviated.
•	Contain _’s (underscore), unless declaring a constant.
•	Use a keyword or reserved word.
## 7.19	Don’t use the pick based initiate pattern for interdependent operations 

The pick activity waits for the occurrence of exactly one event from a set of events, then executes the activity associated with that event. After an event has been selected, the other events are no longer accepted by that pick. If a race condition occurs between multiple events, the choice of the event is implementation dependent. 
## 7.20	Don’t let a SOA composite instance grow exponentially.

Define rules to keep the house clean, purge the instances at regular interval to obtain better performance from the BPEL engine and Enterprise Manager.
## 7.21	Avoid empty sequence.
## 7.22	Code cleaning in process level variables created by default.

A database adapter is configured and deleted it later, the configuration files (schemas, mappings, etc.) for the adaptor still remains in BPEL project folder and not deleted automatically.
## 7.23	Define a common error process to handle errors across multiple business process.
## 7.24	Adapters should be defined as an ESB service for reusability standards.  

Oracle SOA Suite contain two components that implement many characteristics of what the industry has dubbed he enterprise service bus (ESB).  An ESB provides decoupling between the senders of service requests and the service providers.  This helps in Endpoint Virtualization. 
Also, BPEL process gains homogeneity, focusing on business problems rather than protocol transformation.
## 7.25	Externalize security from service providers and consumers through agents and gateways for IT security.

Security related information is not normally not advertised in a Web Service’s WSDL document. A SOA environment consists of heterogeneous infrastructure components.  Each has its own security design and implementation.  The can cause poor interoperability and result I more security customizations and a higher risk of security breaches.  A best practice is to use a separate and specialized component aimed at IT security through agents and gateways.  In this pattern, agents contain a service specific security configuration (also called policies) while gateways contains more generic security configuration that should be enforced for more or all services.
## 7.26	Do not use a file adaptor for logging for debugging purposes.

Using a file adaptor for logging for debugging purposes is too intrusive on the application.

# 8	Code Examples
Below are code examples for BPEL concepts, fault handling, and invoking an asynchronous and synchronous services.
 
 
 
 
 
 
 
# 9	Leading practices for success of BPEL implementation
To increase project success rates and decrease risks of BPEL projects, it is recommended to follow the following initiative that consists of a combination of process, rules, integration using services, and underlying data.

## 9.1 Assessments and maturity models

A first important step is to agree on the features that characterize your current processes, and then decide which set of capabilities you need to have in a future or to-be state. This assessment needs to be predicated on some kind of a maturity model. 

Course corrections are then made possible by assessing deviations from the roadmap that you have created. The roadmap consists of a set of initiatives, projects that are implemented to get you to your wanted future state in each of the dimensions defined by the maturity model that you use.
For example:

•	Rules and decisions

•	Analytics and key performance indicators (KPIs)

•	Services and integrations

•	API management

•	Data or Information Architecture

•	Infrastructure

## 9.2 A strategic roadmap and tactical plan
You can create a strategic roadmap (often as a program consisting of multiple projects and initiatives), and a tactical plan. This plan is based on an evaluation of the as-is state, and a determination of the wanted to-be state that you have worked out in your maturity assessment.

A tactical project plan is created for the shorter term, and a longer-term plan is crafted with schedules, initiatives, and objectives to be attained. Resources are trained and allocated to meet these objectives and timelines.

## 9.3 Agile methods and processes

Paramount to large-scale software development across an organization is consistency and prescriptiveness. This involves large groups of distributed staff working from the same templates so that activities converge and outputs are relevant across the organization. Prescriptiveness is important to help guide technical and business resources to engage in the correct activities to produce the wanted artifacts and deliverables.

It is suggested to define a few project types as the baseline. Map other projects in terms of size, complexity, and domain.  The outcome is a work breakdown structure that can serve as a guide for future projects.
Remember that agile methods are appropriate for smaller projects. As project size and complexity increase, a tailoring of the agile method needs to be conducted. For example, it is tempting to assume that, after a quick win pilot or an initial working prototype, we can continue onward into the full-fledged project using the same approach.

After the initial pilot or prototype, it is advised to look holistically at the macro level of the project:

•	The integration

•	The architecture as a whole

•	Database considerations

•	Infrastructure issues

•	Configurations for the various development, staging, testing, and production

Environments

## 9.4 Reference architecture

Reference architectures, such as service-oriented architecture (SOA), can provide a blueprint for the logical and physical manifestations of the components and architectural building blocks that are agreed-upon standards within an organization. 

The key point is that you ensure that it is not an ad hoc architecture that gets built every time a new project comes along. A basis is established as a standard in effect, which is adhered to by using governance and management.

Start with an industry-standard reference architecture, and then customize key aspects for your organization or line of business.  This practice helps establish uniformity and consistency that can aid in the governance of enterprise initiatives.  The SOA Reference Architecture from the Open Group (http://opengroup.org) provides the basis for architectural building blocks that enable refinements needed to support business processes.

## 9.5 Governance

All of the standards and leading practices and methods that are agreed upon by one group of people at a given point in time fade from organizational memory unless they are institutionalized. Usually, a construct such as a center of competency (CoC) is established as a steward and focal point for best practices and standards. It also facilitates the enforcement of the standards, or the appeal for exceptions should the need arise.

Governance defines the policies, and the management function enforces those policies in practice.

