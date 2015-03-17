1. Introduction
Business Process Execution Language for Web Services (BPEL or BPEL4WS) is a language used for the definition and execution of business processes using Web services.  BPEL enables the top-down realization of Service Oriented Architecture (SOA) through composition, orchestration, and coordination of Web services.  BPEL provides a relatively easy and straightforward way to compose several Web services into new composite services called business processes, which is a collection of coordinated service invocations and related activities that produce a result.
BPEL builds on the foundation of XML and Web services; it uses an XML-based language that supports the Web services technology stack, including SOAP, WSDL, UDDI, WS-Reliable Messaging, WS-Addressing, WS-Coordination, and WS-Transaction.
BPEL is used to standardize enterprise application integration as well as to extend the integration to the Consular Affairs (CA) legacy applications and services where an Oracle Enterprise Service Bus is a middleware solution as an intermediary between service requesters and service providers.
2. Purpose
The purpose is to document industry best practices and recommendations for BPEL coding to improve the overall quality, performance, security, maintainability, and robustness of Oracle BPEL solutions implementation. Conformance to the practices will promote measurable improvements in the performance of codes and a reduction in sustainment costs.  

Consular Systems and Technology’s (CST) implements CAST as a quality gate to minimize software risk.  CAST is a software analysis and measurement automation tool that provides on the current and ongoing delivery code quality to reduce production risks and costs for fixes and rework.  Currently, CAST framework has a limited analytical capability in supporting BPEL.  So until BPEL analysis is fully implement by CAST, the best practices will provide guidance in performing manual analysis of systems written in BPEL.

This document is intended for the CST Systems Engineering and Integration (SEI) team and development teams.  Upon review of this document, the best practices will be converted to CAST rules.
3. Industry Best Coding Practice
 3.1 Create scopes for each step of the flow in the process

Create scopes for each step of the flow in the process so as to make it modular.  This will help in creating local variables within that scope.  Scopes provide a context for the execution and/or documentation of enclosed activities, and they can have variables that are visible and usable at and within the scope level. Scopes can have both default and defined Fault and Event handling logic, and they can be undone, if necessary. Undoing the work of a Scope involves the concept of compensation.  When designing BPEL processes, they should be organized into logical units of work that can be undone.  Scopes can be used as a context to create variables, fault/compensation/event handlers and for organizational purposes. They are the basic building blocks used to assemble a BPEL process.
 3.2	Use Global variables when required

This will help in maintainability.  However, declaring many global variables needs to be avoided in a BPEL process, instead use scope or local variables. The variables defined at the Process root are global variables, which have a global visibility throughout the entire process.  The variables defined within a particular Scope are visible only inside that Scope and all nested Scopes.  These variables are called local variables.  A variable defined for an inner Scope element can hide an upper defined variable of the same name.
 3.3	Consider creating sequences instead of scopes for performance

Do not add too many scopes since it may affect the performance. Instead, consider creating sequences. A Sequence is a structured activity which can contain other activities, all of which will be executed in a specifically defined order.  The purpose of a Sequence, therefore, is to define the execution order for a group of activities.  BPEL Sequences can contain other Sequences and can be nested as deeply as you want.  Sequences have all the standard attributes and elements and they must contain at least one or more activities.
 3.4	Adopt naming standards for maintainability and scalability

Naming convention is company/project specific that the Department has to come up with its own standards.  This should be part of the governance strategy.  BPEL activities need naming conventions and should not be changed.  Also, activities with default names like 'Assign_1', 'Assign_2' are meaningless and also doesn’t help much during auditing and debugging.
 3.5	Handle all the exceptions

The ability to specify exceptional conditions and their consequences, including recovery sequences, is at least as important for business processes as the ability to define the behavior in the "all goes well" case.  Use a catch branch for a different scope to catch binding, remote, custom faults, and business faults.
  3.5.1	Using a Fault Handler

The BPEL language provides the capability to catch and manage exceptions using fault handlers. For example, exceptions occur when web services return different data than was expected. If faults are not handled, the entire BPEL process can be thrown into a faulted state. Therefore, to prevent the entire process from fault, add fault handlers to catch and manage exceptions within particular Scopes.

Each fault handler contains an activity that runs in case of an error. For example, a partner service is notified if an error has occurred. Fault handlers can be added to the entire process or to individual Scope elements.
  3.5.2	Using an Event Handler

The entire BPEL process as well as each individual Scope can be associated with a set of Event Handlers that are invoked concurrently if the corresponding event occurs. The actions taken within an Event Handler can be any type of activity, such as Sequence or Flow.
  3.5.3	Using a Compensation Handler

A business process often contains several nested transactions. The overall business transaction can fail or be cancelled after many enclosed transactions have already been processed. Then it is necessary to reverse the effect obtained during process execution. For example, a travel planning process can include several nested transactions to book a ticket, to reserve a hotel and a car. If the trip is cancelled, the reservation transactions must be compensated for by cancellation transactions in the appropriate order. 
3.5.4	Using a Termination Handler

The termination handler is used to control the termination of a running scope. The termination of a running scope happens if a scope or process enclosing it has faulted.  When a fault is thrown inside a scope or process, a fault handler associated with the scope or process should be run, but before that all the running activities inside the faulted scope or process should be terminated. 
3.6	Use assign activity instead of transform activity

Use assign activity instead of transform activity where ever possible since it take less memory.
Assign activity provides a method for data manipulation, such as copying the contents of one variable to another. This activity can contain any number of elementary assignments.  Transform activity enables to create a transformation that maps source elements to target elements (for example, incoming purchase order data into outgoing purchase order acknowledgment data).
3.7	Use XSL to construct messages and do multiple assign statement

Don’t use multiple assign statement to construct a message; use XSL to construct messages.
3.8	Use XPath Expression constraints to check the data constraints

Don’t loop through the data for checking data constraints; use XPath Expression constraints to check the data constraints. Use Fully Qualified XPath expression.
3.9	Initialize a BPEL variable before copying values to internal elements

Variables offer the possibility to store messages that hold the state of the process.  Initialize a variable before copying values to internal elements to avoid SelectionFailure faults or "variable counter isn't properly initialized" on execution.
3.10	Use <nonBlockingInvoke> in BPEL flow for Performance improvement

Normally when executing a synchronous (two-way) invoke activity, Oracle BPEL
Server waits for the response from the endpoint before executing the subsequent
activity. This behavior can present problems when synchronous invoke activities are
placed inside a flow activity, because Oracle BPEL Server executes the flow using
pseudo-parallelism.

 

The second invoke activity is not executed until the response from the first invoke activity is received. If the number of branches in the flow is large, the delay before the final invoke activity is executed is the sum of all the preceding synchronous invoke activities.

Solution 

With a nonblocking invoke depicted in Pic 1 and Pic 2, the execution of the synchronous invoke activity is scheduled to be performed by a separate thread in the background. With this change, the initial execution time of the invoke activities is reduced.

 
 

The sequence of events in Pic 1 and Pic 2 for a nonblocking invoke call is as follows:

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

 Conclusion

A performance test showed a 30 % improvement in comparison with not using NonBlocking invoke.
3.11	Keep the number of activities in BPEL as minimal as possible

Keep the number of activities in BPEL as minimal as possible; increasing the number of activities will decrease the performance of BPEL Engine.
3.12	Avoid empty activity
3.13	Avoid unused partner links
3.14	Avoid repetitive names for different Activities,
3.15	Don’t use BPEL for intensive time scheduled activities

Extensive use of activities such as alarm and wait can lower system performance.
3.16	Do not include any special characters in the project name

Special characters (such as periods) in the project name cause errors during compilation.
3.17	Don’t use Pick based Initiate pattern for interdependent operations 

The pick activity waits for the occurrence of exactly one event from a set of events, then executes the activity associated with that event. After an event has been selected, the other events are no longer accepted by that pick. So, don’t use Pick based Initiate pattern for implementing interdependent operations. If a race condition occurs between multiple events, the choice of the event is implementation dependent. 
3.18	Don’t let SOA Composite instance grow exponentially

Define rules to keep the house clean, purge the instances at regular interval to obtain better performance from BPEL engine and Enterprise Manager.
3.19	Static Analysis Checks
Systems integration requires more than the ability to conduct simple interactions by using standard protocols. Interoperability between applications can be achieved by using Web standards. To ensure conformant implementations of BPEL, the basic static analysis of a business process must be performed to detect any undefined semantics or invalid semantics within a process definition and reject process definitions that fail any of those static analysis checks. 
The basic static analysis is based on the OASIS WS-BPEL v2.0 specification 0(http://docs.oasis-open.org/wsbpel/2.0/OS/wsbpel-v2.0-OS.pdf).  Below summarize the static analysis requirements listed in Appendix B of the specification.  Please refer to the specification for further details of static analysis fault codes and descriptions.
Note: A WS-BPEL implementation MAY perform extra static analysis checking beyond the basic static analysis required by this specification to signal warnings or even reject process definitions. It is recommended that these non-specified static analysis checks should be configurable to disable.


Static Analysis Fault Code 	Static analysis Description 	Section Reference 
SA00001 	A WS-BPEL processor MUST reject a WS-BPEL that refers to solicit-response or notification operations portTypes. 	Section 3 
SA00002 	A WS-BPEL processor MUST reject any WSDL portType definition that includes overloaded operation names. 	Section 3 
SA00003 	If the value of exitOnStandardFault of a <scope> or <process> is set to “yes”, then a fault handler that explicitly targets the WS-BPEL standard faults MUST NOT be used in that scope. 	Section 5.2 
SA00004 	If any referenced queryLanguage or expressionLanguage is unsupported by the WS-BPEL processor then the processor MUST reject the submitted WS-BPEL process definition. 	Section 5.2 
SA00005 	If the portType attribute is included for readability, in a <receive>, <reply>, <invoke>, <onEvent> or <onMessage> element, the value of the portType attribute MUST match the portType value implied by the combination of the specified partnerLink and the role implicitly specified by the activity. 	Section 5.2 
SA00006 	The <rethrow> activity MUST only be used within a faultHandler (i.e. <catch> and <catchAll> elements). 	Section 5.2 
SA00007 	The <compensateScope> activity MUST only be used from within a faultHandler, another compensationHandler, or a terminationHandler. 	Section 5.2 
SA00008 	The <compensate> activity MUST only be used from within a faultHandler, another compensationHandler, or a terminationHandler. 	Section 5.2 
SA00009 	In the case of mandatory extensions declared in the <extensions> element not supported by a WS-BPEL implementation, the process definition MUST be rejected. 	Section 5.3
SA00010 	A WS-BPEL process definition MUST import all XML Schema and WSDL definitions it uses. This includes all XML Schema type and element definitions, all WSDL port types and message types as well as property and property alias definitions used by the process. 	Section 5.4 
SA00011 	If a namespace attribute is specified on an <import> then the imported definitions MUST be in that namespace. 	Section 5.4 
SA00012 	If no namespace is specified then the imported definitions MUST NOT contain a targetNamespace specification. 	Section 5.4 
SA00013 	The value of the importType attribute of element <import> MUST be set to http://www.w3.org/2001/XMLSchema when importing XML Schema 1.0 documents, and to http://schemas.xmlsoap.org/wsdl/ when importing WSDL 1.1 documents. 	Section 5.4 
SA00014 	A WS-BPEL process definition MUST be rejected if the imported documents contain conflicting definitions of a component used by the importing process definition (as could be caused, for example, when the XSD redefinition mechanism is used). 	Section 5.4 
SA00015 	To be instantiated, an executable business process MUST contain at least one <receive> or <pick> activity annotated with a createInstance="yes" attribute. 	Section 5.5 
SA00016 	A partnerLink MUST specify the myRole or the partnerRole, or both. 	Section 6.2 
SA00017 	The initializePartnerRole attribute MUST NOT be used on a partnerLink that does not have a partner role. 	Section 6.2 
SA00018 	The name of a partnerLink MUST be unique among the names of all partnerLinks defined within the same immediately enclosing scope. 	Section 6.2 
SA00019 	Either the type or element attributes MUST be present in a <vprop:property> element but not both. 	Section 7.2 
SA00020 	A <vprop:propertyAlias> element MUST use one of the three following combinations of attributes: 
	messageType and part, 
	type or 
	element 	Section 7.3


SA00021 	Static analysis MUST detect property usages where propertyAliases for the associated variable's type are not found in any WSDL definitions directly imported by the WS-BPEL process. 	Section 7.3 
SA00022 	A WS-BPEL process definition MUST NOT be accepted for processing if it defines two or more propertyAliases for the same property name and WS-BPEL variable type. 	Section 7.3 
SA00023 	The name of a variable MUST be unique among the names of all variables defined within the same immediately enclosing scope. 	Section 8.1 
SA00024 	Variable names are BPELVariableNames, that is, NCNames (as defined in XML Schema specification) but in addition they MUST NOT contain the “.” character. 	Section 8.1 
SA00025 	The messageType, type or element attributes are used to specify the type of a variable. Exactly one of these attributes MUST be used. 	Section 8.1 
SA00026 	Variable initialization logic contained in scopes that contain or whose children contain a start activity MUST only use idempotent functions in the from-spec. 	Section 8.1 
SA00027 	When XPath 1.0 is used as an expression language in WS-BPEL there is no context node available. Therefore the legal values of the XPath Expr (http://www.w3.org/TR/xpath#NT-Expr) production must be restricted in order to prevent access to the context node. 
Specifically, the "LocationPath" (http://www.w3.org/TR/xpath#NT-LocationPath) production rule of "PathExpr" (http://www.w3.org/TR/xpath#NT-PathExpr) production rule MUST NOT be used when XPath is used as an expression language. 	Section 8.2.4 
SA00028 	WS-BPEL functions MUST NOT be used in joinConditions. 	Section 8.2.5 
SA00029 	WS-BPEL variables and WS-BPEL functions MUST NOT be used in query expressions of propertyAlias definitions. 	Section 8.2.6 
SA00030 	The arguments to bpel:getVariableProperty MUST be given as quoted strings. It is therefore illegal to pass into a WS-BPEL XPath function any XPath variables, the output of XPath functions, a XPath location path or any other value that is not a quoted string. 	Section 8.3
SA00031 	The second argument of the XPath 1.0 extension function bpel:getVariableProperty(string, string) MUST be a string literal conforming to the definition of QName in [XML Namespaces] section 3. 	Section 8.3 
SA00032 	For <assign>, the <from> and <to> element MUST be one of the specified variants. 
The <assign> activity copies a type-compatible value from the source ("from-spec") to the destination ("to-spec"), using the <copy> element. Except in Abstract Processes, the from-spec MUST be one of the following variants: 
<from variable="BPELVariableName" part="NCName"?> 
<query queryLanguage="anyURI"?>? 
queryContent 
</query> 
</from> 
<from partnerLink="NCName" 
endpointReference="myRole|partnerRole" /> 
<from variable="BPELVariableName" 
property="QName" /> 
<from expressionLanguage="anyURI"?> 
expression 
</from> 
<from> 
<literal>literal value</literal> 
</from> 
<from/> 
In Abstract Processes, the from-spec MUST be either one of the above or the opaque variant described in section 13.1.3. Hiding Syntactic Elements 
The to-spec MUST be one of the following variants: 
<to variable="BPELVariableName" part="NCName"?> 
<query queryLanguage="anyURI"?>? 
queryContent 
</query> 
</to> 
<to partnerLink="NCName" /> 
<to variable="BPELVariableName" 
property="QName" /> 
<to expressionLanguage="anyURI"?> 
expression 
</to> 
<to/> 	Section 8.4
SA00033 	The XPath expression in <to> MUST begin with an XPath VariableReference. 	Section 8.4 
SA00034 	When the variable used in <from> or <to> is defined using XML Schema types (simple or complex) or element, the part attribute MUST NOT be used. 	Section 8.4 
SA00035 	In the from-spec of the partnerLink variant of <assign> the value "myRole" for attribute endpointReference is only permitted when the partnerLink specifies the attribute myRole. 	Section 8.4 
SA00036 	In the from-spec of the partnerLink variant of <assign> the value "partnerRole" for attribute endpointReference is only permitted when the partnerLink specifies the attribute partnerRole. 	Section 8.4 
SA00037 	In the to-spec of the partnerLink variant of assign only partnerLinks are permitted which specify the attribute partnerRole. 	Section 8.4 
SA00038 	The literal from-spec variant returns values as if it were a from-spec that selects the children of the <literal> element in the WS-BPEL source code. The return value MUST be a single EII or Text Information Item (TII) only. 	Section 8.4 
SA00039 	The first parameter of the XPath 1.0 extension function bpel:doXslTransform(string, node-set, (string, object)*) is an XPath string providing a URI naming the style sheet to be used by the WS-BPEL processor. This MUST take the form of a string literal. 	Section 8.4 
SA00040 	In the XPath 1.0 extension function bpel:doXslTransform(string, node-set, (string, object)*) the optional parameters after the second parameter MUST appear in pairs. An odd number of parameters is not valid. 	Section 8.4 
SA00041 	For the third and subsequent parameters of the XPath 1.0 extension function bpel:doXslTransform(string, node-set, (string, object)*) the global parameter names MUST be string literals conforming to the definition of QName in section 3 of [Namespaces in XML]. 	Section 8.4 
SA00042 	For <copy> the optional keepSrcElementName attribute is provided to further refine the behavior. It is only applicable when the results of both from-spec and to-spec are EIIs, and MUST NOT be explicitly set in other cases. 	Section 
SA00043 	For a copy operation to be valid, the data referred to by the from-spec and the to-spec MUST be of compatible types. 
The following situations are considered type incompatible: 
	the selection results of both the from-spec and the to-spec are variables of a WSDL message type, and the two variables are not of the same WSDL message type (two WSDL message types are the same if their QNames are equal). 
	the selection result of the from-spec is a variable of a WSDL message type and that of the to-spec is not, or vice versa (parts of variables, selections of variable parts, or endpoint references cannot be assigned to/from variables of WSDL message types directly). 
	Section 8.4.3 
SA00044 	The name of a <correlationSet> MUST be unique among the names of all <correlationSet> defined within the same immediately enclosing scope. 	Section 9.1 
SA00045 	Properties used in a <correlationSet> MUST be defined using XML Schema simple types. 	Section 9.2 
SA00046 	The pattern attribute used in <correlation> within <invoke> is required for request-response operations, and disallowed when a one-way operation is invoked. 	Section 9.2 
SA00047 	One-way invocation requires only the inputVariable (or its equivalent <toPart> elements) since a response is not expected as part of the operation (see section 10.4. Providing Web Service Operations – Receive and Reply ). Request-response invocation requires both an inputVariable (or its equivalent <toPart> elements) and an outputVariable (or its equivalent <fromPart> elements). If a WSDL message definition does not contain any parts, then the associated attributes variable, inputVariable or outputVariable, MAY be omitted,and the <fromParts> or <toParts> construct MUST be omitted. 	Section 10.3 
Section 10.4 
Section 10.4 
Section 11.5 
Section 12.7
SA00048 	When the optional inputVariable and outputVariable attributes are being used in an <invoke> activity, the variables referenced by inputVariable and outputVariable MUST be messageType variables whose QName matches the QName of the input and output message type used in the operation, respectively, except as follows: if the WSDL operation used in an <invoke> activity uses a message containing exactly one part which itself is defined using an element, then a variable of the same element type as used to define the part MAY be referenced by the inputVariable and outputVariable attributes respectively. 	Section 10.3 
SA00050 	When <toParts> is, it is required to have a <toPart> for every part in the WSDL message definition; the order in which parts are specified is irrelevant. Parts not explicitly represented by <toPart> elements would result in uninitialized parts in the target anonymous WSDL variable used by the <invoke> or <reply> activity. Such processes with missing <toPart> elements MUST be rejected during static analysis. 	Section 10.3.1 
SA00051 	The inputVariable attribute MUST NOT be used on an Invoke activity that contains <toPart> elements. 	Section 10.3.1 
SA00052 	The outputVariable attribute MUST NOT be used on an <invoke> activity that contains a <fromPart> element. 	Section 10.3.1 
SA00053 	For all <fromPart> elements the part attribute MUST reference a valid message part in the WSDL message for the operation. 	Section 5.4 
SA00054 	For all <toPart> elements the part attribute MUST reference a valid message part in the WSDL message for the operation. 	Section 5.4 
SA00055 	For <receive>, if <fromPart> elements are used on a <receive> activity then the variable attribute MUST NOT be used on the same activity. 	Section 10.4 
SA00056 	A "start activity" is a <receive> or <pick> activity that is annotated with a createInstance="yes" attribute. Activities other than the following: start activities, <scope>, <flow> and <sequence> MUST NOT be performed prior to or simultaneously with start activities. 	Section 10.4 
SA00057 	If a process has multiple start activities with correlation sets then all such activities MUST share at least one common correlationSet and all common correlationSets defined on all the activities MUST have the value of the initiate attribute be set to "join". 	Section 10.4
SA00058 	In a <receive> or <reply> activity, the variable referenced by the variable attribute MUST be a messageType variable whose QName matches the QName of the input (for <receive>) or output (for <reply>) message type used in the operation, except as follows: if the WSDL operation uses a message containing exactly one part which itself is defined using an element, then a WS-BPEL variable of the same element type as used to define the part MAY be referenced by the variable attribute of the <receive> or <reply>activity. 	Section 10.4 
SA00059 	For <reply>, if <toPart> elements are used on a <reply> activity then the variable attribute MUST NOT be used on the same activity. 	Section 10.4 
SA00060 	The explicit use of messageExchange is needed only where the execution can result in multiple IMA-<reply> pairs (e.g. <receive>-<reply> pair) on the same partnerLink and operation being executed simultaneously. In these cases, the process definition MUST explicitly mark the pairing-up relationship. 	Section 10.4.1 
SA00061 	The name used in the optional messageExchange attribute MUST resolve to a messageExchange declared in a scope (where the process is considered the root scope) which encloses the <reply> activity and its corresponding IMA. 	Section 10.4.1 
SA00062 	If <pick> has a createInstance attribute with a value of yes, the events in the <pick> MUST all be <onMessage> events. 	Section 11.5 
SA00063 	The semantics of the <onMessage> event are identical to a <receive> activity regarding the optional nature of the variable attribute or <fromPart> elements, if <fromPart> elements on an activity then the variable attribute MUST NOT be used on the same activity (see SA00055). 	Section 11.5 
SA00064 	For <flow>, a declared link’s name MUST be unique among all <link> names defined within the same immediately enclosing <flow>. 	Section 11.6 
SA00065 	The value of the linkName attribute of <source> or <target> MUST be the name of a <link> declared in an enclosing <flow> activity. 	Section 11.6.1 
SA00066 	Every link declared within a <flow> activity MUST have exactly one activity within the <flow> as its source and exactly one activity within the <flow> as its target. 	Section 11.6.1
SA00067 	Two different links MUST NOT share the same source and target activities; that is, at most one link may be used to connect two activities. 	Section 11.6.1 
SA00068 	An activity MAY declare itself to be the source of one or more links by including one or more <source> elements. Each <source> element MUST use a distinct link name. 	Section 11.6.1 
SA00069 	An activity MAY declare itself to be the target of one or more links by including one or more <target> elements. Each <target> element associated with a given activity MUST use a link name distinct from all other <target> elements at that activity. 	Section 11.6.1 
SA00070 	A link MUST NOT cross the boundary of a repeatable construct or the <compensationHandler> element. This means, a link used within a repeatable construct (<while>, <repeatUntil>, <forEach>, <eventHandlers>) or a <compensationHandler> MUST be declared in a <flow> that is itself nested inside the repeatable construct or <compensationHandler>. 	Section 11.6.1 
SA00071 	A link that crosses a <catch>, <catchAll> or <terminationHandler> element boundary MUST be outbound only, that is, it MUST have its source activity within the <faultHandlers> or <terminationHandler>, and its target activity outside of the scope associated with the handler. 	Section 11.6.1 
SA00072 	A <link> declared in a <flow> MUST NOT create a control cycle, that is, the source activity must not have the target activity as a logically preceding activity. 	Section 11.6.1 
SA00073 	The expression for a join condition MUST be constructed using only Boolean operators and the activity's incoming links' status values. 	Section 11.6.2 
SA00074 	The expressions in <startCounterValue> and <finalCounterValue> MUST return a TII (meaning they contain at least one character) that can be validated as a xsd:unsignedInt. Static analysis MAY be used to detect this erroneous situation at design time when possible (for example, when the expression is a constant). 	Section 11.7 
SA00075 	For the <forEach> activity, <branches> is an integer value expression. Static analysis MAY be used to detect if the integer value is larger than the number of directly enclosed activities of <forEach> at design time when possible (for example, when the branches expression is a constant). 	Section 11.7
SA00076 	For <forEach> the enclosed scope MUST NOT declare a variable with the same name as specified in the counterName attribute of <forEach>. 	Section 11.7 
SA00077 	The value of the target attribute on a <compensateScope> activity MUST refer to the name of an immediately enclosed scope of the scope containing the FCT-handler with the <compensateScope> activity. This includes immediately enclosed scopes of an event handler (<onEvent> or <onAlarm>) associated with the same scope. 	Section 12.4.3.1 
SA00078 	The target attribute of a <compensateScope> activity MUST refer to a scope or an invoke activity with a fault handler or compensation handler. 	Section 12.4.3.1 
SA00079 	The root scope inside a FCT-handler MUST not have a compensation handler. 	Section 12.4.4.3 
SA00080 	There MUST be at least one <catch> or <catchAll> element within a <faultHandlers> element. 	Section 12.5 
SA00081 	For the <catch> construct; to have a defined type associated with the fault variable, the faultVariable attribute MUST only be used if either the faultMessageType or faultElement attributes, but not both, accompany it. The faultMessageType and faultElement attributes MUST NOT be used unless accompanied by faultVariable attribute. 	Section 12.5 
SA00082 	The peer-scope dependency relation MUST NOT include cycles. In other words, WS-BPEL forbids a process in which there are peer scopes S1 and S2 such that S1 has a peer-scope dependency on S2 and S2 has a peer-scope dependency on S1. 	Section 12.5.2 
SA00083 	An event handler MUST contain at least one <onEvent> or <onAlarm> element. 	Section 12.7 
SA00084 	The partnerLink reference of <onEvent> MUST resolve to a partner link declared in the process in the following order: the associated scope first and then the ancestor scopes. 	Section 12.7.1 
SA00085 	The syntax and semantics of the <fromPart> elements as used on the <onEvent> element are the same as specified for the receive activity. This includes the restriction that if <fromPart> elements are used on an onEvent element then the variable, element and messageType attributes MUST NOT be used on the same element. 	Section 12.7.1
SA00086 	For <onEvent>, variables referenced by the variable attribute of <fromPart> elements or the variable attribute of an <onEvent> element are implicitly declared in the associated scope of the event handler. Variables of the same names MUST NOT be explicitly declared in the associated scope.. 	Section 12.7.1 
SA00087 	For <onEvent>, the type of the variable (as specified by the messageType attribute) MUST be the same as the type of the input message defined by operation referenced by the operation attribute. Optionally the messageType attribute may be omitted and instead the element attribute substituted if the message to be received has a single part and that part is defined with an element type. That element type MUST be an exact match of the element type referenced by the element attribute. 	Section 12.7.1 
SA00088 	For <onEvent>, the resolution order of the correlation set(s) referenced by <correlation> MUST be first the associated scope and then the ancestor scopes. 	Section 12.7.1 
SA00089 	For <onEvent>, when the messageExchange attribute is explicitly specified, the resolution order of the message exchange referenced by messageExchange attribute MUST be first the associated scope and then the ancestor scopes. 	Section 12.7.1 
SA00090 	If the variable attribute is used in the <onEvent> element, either the messageType or the element attribute MUST be provided in the <onEvent> element. 	Section 12.7.1 
SA00091 	A scope with the isolated attribute set to "yes" is called an isolated scope. Isolated scopes MUST NOT contain other isolated scopes. 	Section 12.8 
SA00092 	Within a scope, the name of all named immediately enclosed scopes MUST be unique. 	Section 12.4.3 
SA00093 	Identical <catch> constructs MUST NOT exist within a <faultHandlers> element. 	Section 12.5 
SA00094 	For <copy>, when the keepSrcElementName attribute is set to “yes” and the destination element is the Document EII of an element-based variable or an element-based part of a WSDL message-type-based variable, the name of the source element MUST belong to the substitutionGroup of the destination element. This checking MAY be enforced through static analysis of the expression/query language. 	Section 8.4.2
SA00095 	For <onEvent>, the variable references are resolved to the associated scope only and MUST NOT be resolved to the ancestor scopes. 	Section 12.7.1
