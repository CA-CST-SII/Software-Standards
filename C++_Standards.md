## Introduction
This document contains the C++ coding standards that the CA-CST development teams follow during the development of C++ code. 
### Purpose
Coding standards help make sure that project code has a consistent structure and style. They are intended to make the code easier to read, understand, review and maintain.  They further reduce the complexity of the code.
Additional coding guidelines in the form of code metrics (measurements) and coding rules are provided in this document for developers. The code metrics guidelines consist of “hand-calculable” measurements within each method and each class. The coding rules are based on information gathered from multiple sources to enhance the security, reliability, maintainability, testability and performance.  
This document is intended for the following uses:
* Desk-side reference for C++ developers during coding.
* Source for code review checklists.
* Reference for developers who extend and maintain the C++ code.
* As a governance tool for CA-CST.

### Scope
This document describes the following for C++:
* Naming conventions for projects, files, objects, variables, and other code constructs.
* Formatting conventions for code modules and their comments.
* Error handling conventions.
* Complexity conventions.
* Section 508 compliance.
* Security standards.
* Coding practices and recommendations.

### Code Change Scope
The C++ coding standards described in this document apply to new applications (new code) and existing code in the following ways:
* New code in the middle of an existing file should follow new coding standards with explanations regarding the change being made to be consistent with new guidelines, ensuring no disruption to the existing code structure. Exceptions can be made to this rule if following new guidelines creates significant and unnecessary and potentially dangerous re-work. 
* New files within existing applications must follow the C++ coding standards documented in this document.
* New applications must follow the C++ coding standards documented in this document.
* Modifications to existing code will follow the CST C++ coding standards. Exceptions can be made to this rule if following new guidelines creates significant and unnecessary and potentially dangerous re-work when modifying a subset of code within a larger context.
* Code that is referenced or imported from existing libraries, open source or commercial, will be left unchanged to preserve its integrity and to align with its intended API design.  If existing library code is copied and then modified to be part of the code base, then it is subject to CST coding standards 

### References
The following sources were used in creation of the original version of this standard.
* US-VISIT C++ Coding Standards, Version 1.1, November 19, 2010
* A Java coding standard on a page, http://www.xp123.com/xplor/xp0002f/index.shtml
* IDENT Java Coding Standard, February 24, 2006, IDENT-TO007-CSD-JavaCodeStndCSD-001-D
* Javadoc Information, http://java.sun.com/j2se/javadoc/writingdoccomments/

The following books provide good advice above and beyond language syntax:
* The C++ Programming Language (2nd Edition), Bjarne Stroustrup, Addison-Wesley, 1991
* Effective C++: 50 Specific Ways to Improve Your Programs and Design (2nd Edition), Scott Meyers, Addison-Wesley, 1997 
* Handbook: CMU/SEI-97-HB-001. January 1997. C4 Software Technology Reference Guide —A Prototype, Software Engineering Institute, Carnegie Mellon University, Pittsburgh, Pennsylvania 15213
* A Proposed Taxonomy for Software Development Risks for High-Performance Computing (HPC) Scientific/Engineering Applications, TECHNICAL NOTE, CMU/SEI-2006-TN-039 January 2007, Software Engineering Institute, Carnegie Mellon University, Pittsburgh, Pennsylvania 15213
* Applying and Interpreting Object Oriented Metrics, NASA Software Assurance Technology Center (SATC), http://satc.gsfc.nasa.gov/support/STC_APR98/apply_oo/apply_oo.html
* Minimizing code defects to improve software quality and lower development costs, Development Solutions White paper, October 2008, IBM/Rational 
* Managing Software Risks in Software Intensive Systems with Metrics and Measures, Robert A. Martin, MITRE, presentation to SEI/CMU Conference on the Acquisition of Software-Intensive Systems 2003, 30 January 2003. 
* NIST Special Publication 500-235, Structured Testing: A Testing Methodology Using the Cyclomatic Complexity Metric, Arthur H. Watson, Thomas J. McCabe, Prepared under NIST Contract 43NANB517266 , Dolores R. Wallace, Editor Computer Systems Laboratory, National Institute of Standards and Technology, Gaithersburg, MD 20899-0001, August 1996 
* Shyam R. Chidamber, Chris F. Kemerer. A Metrics suite for Object Oriented design. M.I.T. Sloan School of Management E53-315. 1993. http://uweb.txstate.edu/~mg43/CS5391/Papers/Metrics/OOMetrics.pdf
* Victor Basili, Lionel Briand and Walcelio Melo. A Validation of Object-Oriented Design Metrics as Quality Indicators. IEEE Transactions on Software Engineering. Vol. 22, No. 10, October 1996. http://www.cs.umd.edu/users/basili/publications/journals/J60.pdf
* Laing, Victor & Coleman, Charles: Principal Components of Orthogonal Object-Oriented Metrics. White Paper Analyzing Results of NASA Object-Oriented Data. SATC, NASA, 2001. http://satc.gsfc.nasa.gov/support/OSMASAS_SEP01/Principal_Components_of_Orthogonal_Object_Oriented_Metrics.pdf

### C++ Best Practices
This section describes C++ coding best practices and the resources used to support the best practices.

#### Standard Libraries
* Try to use the standard C++ libraries whenever they are adequate: for example, STL and iostreams.
* The old standard C Language library is also part of the C++ standard library.  Try to avoid the old C Language library as much as feasible when the C++ standard library can be used.  For example, use `cout` instead of `printf`.

#### Mixing C++ with C Language
One of the primary design goals of C++ was compatibility with millions of lines of existing C code already in existence.  With some precaution, you can safely call C functions from C++.  On the other hand, it may not be safe to call C++ functions from C code even when only C language data types are involved.

If there is old but reliable C code that can be reused for a project, then it is permissible to reuse the old code.  That is often better than to rewrite a lot of reliable C code strictly in C++.  C++ wrappers or layers can be created.  In a C++ module where C functions are called, just use “extern C” to make sure that parameter passing is compatible.  And obviously, when implementing C function calls from C++ code, in general, only C language data types should be involved—especially when passing a function pointer to a C++ method to some “extern C” code.  (There are some exceptions to this however.)

Use the definition of the __cplusplus macro to separate C and C++. This macro is most useful in guarding the specification of an extern "C" interface for function declarations, as shown in the following example. To prevent inconsistent specification of extern "C", never place an `#include` directive within the scope of an extern "C" linkage specification. 
```cpp
#include "header.h"
...                     // ... other include files ... 
#if defined(_ _cplusplus)
extern "C" {
#endif
  int g1();
  int g2();
  int g3()
#if defined(_ _cplusplus)
}
#endif
```
#### Header File
To prevent complications involving multiple inclusions of header files, directly and/or indirectly, every element of a header file should have the following enclosure:
```cpp
<File header documentation.>
#ifndef __<FILENAME>_H
#define __<FILENAME>_H
.
.
.
<Everything else: include statements, declarations, and definitions>D
.
.
.
#endif 

<FILENAME>_H must be a unique definition among all the source files compiled. 
```
#### Global Variables
For each global variable, document how the global variable is initialized, used, and cleaned up.
#### Logging
* Use the Log class (from the CA-CST C++ Util library) for API for application logging. Proper error logging quickly helps to find application errors and business logic issues in test or production environment.  Logging should have several levels of detail and each level should be configurable at run-time.
* The following illustrates a log message that indicates an error condition:
```cpp
xLog.print(LOG_NORMAL, "Sql Error: " + xErr.context());
```
#### Comments
* Use Javadoc tool or Javdoc commenting style for documenting comments within C++ programs.  This allows for a standard comment format across the Java and C++ languages and allows for generation of documentation via tools like Doxygen.  In addition to file, class, method and member level comments, note the following:
* Comment any complex and hard-to-understand code constructions, workarounds or assumptions made by the code.
* Remove dead code rather than comment it out.
* Use @todo directive to comment code which require additional work so they can be easily identified and can be extracted by automated tools.  All @todo directives should be handled and removed prior to integration test. 

An example of proper comment is shown in Section 7.0, Code Example, of this document.

* For more information on Javadoc, refer to: http://java.sun.com/j2se/javadoc/writingdoccomments/
* For more information on the Doxygen Tool, refer to: http://www.stack.nl/~dimitri/doxygen/ 

#### Exception Handling
* Use the Err class for application level exceptions.   Subclassing Err is recommended to allow the receiver of the exception to distinguish between error types.  
* All exception handling should be logged to the application log and such that all logs contain identifiable exceptions for operational debugging purposes.  Errors should never be silently ignored.  At a minimum, the condition should be logged.  

##### Error Handling
The framework will allow a configurable number of exceptions to be thrown prior to killing the daemon. The  transaction  will  instead  be  thrown  into  data_error  when  the  maximum limit  has  been reached. 

The programmer is expected to detect any errors which are likely to be caused by bad input data or existing data (e.g. in the database) and use the 'data_error' state. 

### Naming Conventions
This section contains naming conventions that apply.  Do not change existing applications since there will be large impact to the existing software. This means new code in the middle of an existing file must follow new guidelines as much as possible without disrupting the existing code.  However, new files within existing application must follow these new naming conventions.

Meaningful names are important for maintaining understandable, high-quality code. Developers should take the time to choose names that are descriptive and unambiguous. 

Except for user-defined constants, all identifier names should be written as a mix of upper and lower case letters. This coding standard uses the following rules for formatting identifier names:

<table>
<caption><em>Table 4 1. Formatting Identifier Names</em></caption>
<thead>
<tr class="header">
<th align="left"><p>Identifier Type</p></th>
<th align="left"><p>Naming Rules</p></th>
<th align="left"><p>Example</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Variables</p></td>
<td align="left"><ul>
<li>Variables are in mixed case with a lowercase first letter. Internal words start with capital letters.</li>
</ul>

<ul>
	<li>Variable types should have the following prefix:</li>
 	<ul>
 		<li>integer - ‘i’</li>
		<li>long - ‘l’ (lower case L)</li>
		<li>float - ‘f’</li>
		<li>double - ‘d’</li>
		<li>bool - ‘b’</li>
		<li>char - ‘c’</li>
		<li>string - ‘str’</li>
		<li>vector - ‘v’</li>
		<li>others - ‘x’ (this includes user defined classes)</li>
	</ul>
<li>Additionally, variable modifiers should have the following prefix:</li>
	<ul>
		<li>pointer – ‘p’</li>
		<li>reference – ‘r’</li>
		<li>member variables – ‘m_’</li>
	</ul>
<li>Variable names should be short yet meaningful. The choice of a variable name should be mnemonic- that is, designed to indicate to the casual observer the intent of its use. One-character variable names should be avoided except for temporary “throwaway” variables. Common names for temporary variables are i, j, k, m, and n for integers; c, d, and e for characters.</li>
<li>No instance variables should be declared as public; getters and setters should be preferred.</li>
<li>Note that const references should not use the leading ‘r’ in variable names.</li>
</ul></td>
<td align="left"><p>class Base</p>
<pre><code>{
public:
    string getName(string&amp; rstrKey);
    bool doWork(const string&amp; strID);
private:
    long   m_lCount;
    string m_strName;
    char   m_rcReferencedChar;_
};</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>Classes</p></td>
<td align="left"><p>Class names should be nouns, in mixed case with the first letter of each internal word capitalized. Try to keep your class names simple and descriptive. Use whole words; avoid acronyms and abbreviations (unless the abbreviation is much more widely used than the long form, such as URL or HTML). Acronym should be capitalized.</p></td>
<td align="left"><pre><code>class ReqReqDAO {};
class ResReqHome {};</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p>Constants (user defined)</p></td>
<td align="left"><p>Capitalize all letters in each word. Use underscores in lieu of spaces. Constant variables constructed with multiple words should use an underscore to distinguish each word; as compared to the standard variable which uses mixed case character to distinguished multiple words from a variable name.</p></td>
<td align="left"><pre><code>static const int MIN_WIDTH = 4;</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>Methods</p></td>
<td align="left"><p>Methods should be verbs, in mixed case with the first letter lowercase, with the first letter of each internal word capitalized. Variables should be public only at last resort; getters and setters should be preferred.</p></td>
<td align="left"><pre><code>getCustomerData();
setCustomerData();</code></pre></td>
</tr>
</tbody>
</table>

#### Packages and Files
This section describes the naming conventions for development files created in the C++ project.  The following file extensions will be used for all CA-CST files.

<table>
<caption><em>Table 4 2. CA-CST file extensions</em></caption>
<thead>
<tr class="header">
<th align="left"><p>File type</p></th>
<th align="left"><p>Extension</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>C++ source file</p></td>
<td align="left"><p><code>.cpp</code></p></td>
</tr>
<tr class="even">
<td align="left"><p>C++ header file</p></td>
<td align="left"><p><code>.h</code></p></td>
</tr>
<tr class="odd">
<td align="left"><p>C++ Shared Library</p></td>
<td align="left"><p><code>.sl</code></p></td>
</tr>
<tr class="even">
<td align="left"><p>C++ Archive library</p></td>
<td align="left"><p><code>.a</code></p></td>
</tr>
</tbody>
</table>

#### Constants
* Always use “const” to indicate input only reference parameters, for example:
```cpp
bool getTxStatus(const string& strID, string& strStatus);
```
* Use the “static const” keyword to declare member constants.
* Use constants to avoid hard-coded values in the code.
* Use uppercase letters and replace spaces with underscores to format the name of the constant for user-defined constants.
* Use common sense and provide meaningful constant name (not e, var, io, etc).
* If there are several related integer values, an enumeration type can be used to group the constants. 
* No arbitrary numbers should be allowed within the code – these values should be placed in constants files and clearly described.
* Constants used over multiple files (classes) should be placed in a separate constants file with a meaningful name.
* Constants which may need to be modified over the lifetime of the project should be placed in header files or configuration files where they can be modified without recompiling the code.
* Run time configuration variables that are modifiable by the O&M staff should be retrieved from the database globals file.

The following are examples of specifying a constant:
```cpp
const int Base_BiographicEnroll:UNASSIGNED_ID = -2;

(Modify the example!)

```
The following is an example of using enumeration to specify a group of related integer constants:
```cpp
	typedef enum {
		EAST(0),
		SOUTH(1),
		WEST(2},
		NORTH(3)
	} Direction;
```

### Formatting Conventions
* Use spaces, not tabs.
* The length of C++ source lines, including comments, should not exceed 79 characters.  This 

standard is intended to accommodate any printer and text editor.
* Use liberal amounts of white space to improve code readability.
* When a complete statement or an expression will not fit on a single line, break it according to these general principles: 
  * Break after a comma.  
  * Break before an operator.  
  * Prefer higher-level breaks to lower-level breaks.  
  * Align the new line with the beginning of the expression at the same level on the previous line.  
  * If the above rules lead to confusing code or to code that's all up against the right margin, back up the indentation a few levels as needed for readability. 
 
#### Class File Structure
The elements of a class file should appear in the following order: 
1. Class (static) variables 
2. Member variables  
3. Constructors  
4. Methods grouped by functionality

#### Comments
The formatting for comments will follow the Javadoc standard. A documentation comment is made up of two parts `--` a description followed by zero or more tags, with a blank line (containing a single asterisk `"*"`) between these two sections:  
```cpp
/**  
 *  This is the description part of a doc comment
 * 
 *  @tag    Comment for the tag
 */
```
The first line is indented to line up with the code below the comment, and starts with the begin-comment symbol `(/** )` followed by a return.  
Subsequent lines start with an asterisk `*` . They are indented an additional space so the asterisks line up. A space separates the asterisk from the descriptive text or tag that follows it.  

Insert a blank comment line between the description and the list of tags, as shown in the preceding example.

Insert additional blank lines to create "blocks" of related tags.  

The last line begins with the end-comment symbol `(*/)` indented so the asterisks line up and followed by a return. Note that the end-comment symbol contains only a single asterisk `(*)`.  

A blank line should precede and follow the comment block. 

##### Comments: Class Header
The following comments will appear before the declaration of every class. 
```cpp
/**  
 *  A description of what the class does. 
 *  
 */
```
##### Comments: Method Header
The following comments will appear before every method declaration in the header file 
(including main).  
```cpp
/** 
 *  A description of what the method does
 * 
 *  @param       name    description
 *  @param       name    description
               .
 *  @param       name    description
 * 
 *  @return              description
 * 
 *  @exception   name    description
 *  @exception   name    description
                 .
                 .
 *  @exception   name    description
 * 
 */
```
Definition of Comments

* @param

The @param tag is followed by the name (not type) of the parameter, followed by a description 

of the parameter. Additional spaces should be inserted between the name and description so 

that comments line up in a block. Dashes or other punctuation should not be inserted before 

the description. The name always starts with a lowercase letter. The description is most 

usually a phrase, starting with a lowercase letter and ending without a period, unless it 

contains a complete sentence.  

* @return
  
The @return tag is followed by a description of the return value. Whenever possible, detailed 

information (such as returns -1 when an out-of-bounds argument is supplied) should be 

provided. Spaces should be used to line the description up with the rest of the comments in 

the method.  

* @exception
  
An @exception tag should be included for at least any declared (checked) exceptions. It can 

also document any non-declared exceptions that can be thrown by the method, (normally those 

that appear directly in the implementation, rather than those that are indirectly thrown).
 
* Custom tags
Java SDK 1.4 and later versions support custom tags to the javadoc tool.  One example is 

putting @pre and @post tags to describe specific runtime conditions in method headers which 

appear in the javadoc output just like @param and @return.
Comment Example
For example, source code that contains the following statements: 
<pre>
 /* *  
   *  Determine a birth year given an age 
   *  
   *  @param age how old a person is in standard Earth years. 
   *  @return String the year the person was born 
   * / 
 public string findYear(int age) {}
</pre>
Produces this output: 
<pre>
findYear
public string findYear(int age)
Determine a birth year given an age
</pre>
Parameters: 
<pre>
age - how old a person is in standard Earth years 
</pre>
Returns: 
<pre>
String the year the person was born 
</pre>
A complete reference is available at: 
http://java.sun.com/j2se/1.4/docs/tooldocs/windows/javadoc.html#tag/ 
### ## Non-Javadoc Comments### ## 
Use // for non-Javadoc comments, including multi-line comments.
#### Indentation#### 
Four spaces should be used as the unit of indentation—tab characters will NOT be used in C++ 

source files.  However, it entirely reasonable to configure editors such as “vim” and “emacs” 

to translate tabs to spaces to make indention easier to implement.
#### White Space#### 
### ## Blank Lines### ## 
Blank lines improve readability by setting off sections of code that are logically related. 
Two blank lines should always be used in the following circumstances: 
* Between sections of a source file 
* Between class and method definitions 
One blank line should always be used in the following circumstances: 
* Between methods 
* Between the local variables in a method and its first statement 
* Before a block or single-line comment 
* Between logical sections inside a method to improve readability 
### ## Blank Spaces### ## 
Blank spaces should be used in the following circumstances: 
* A keyword followed by a parenthesis should be separated by a space. Example: 
<pre>
       while (true) {
       ...
   }
</pre>
* Note that a blank space should not be used between a method name and its opening 

parenthesis. This helps to distinguish keywords from method calls.
* A blank space should appear after commas in argument lists. 
* 	All binary operators should be separated from their operands by spaces. Blank spaces 

should never separate unary operators such as unary minus, increment ("++"), and decrement 

("--") from their operands. Example: 
<pre>  
 a += c + d;
    a = (a + b) / (c *  d);
    
    while (d++ ##  s++) {
        n++;
    }
    printSize("size is " + foo + "\n");
</pre>
* The expressions in a for statement should be separated by blank spaces. Example: 
<pre>
for (expr1; expr2; expr3)
</pre
* Casts should be followed by a blank space. Examples: 
<pre>   
myMethod((float) aNum, (Log) log);
    myMethod((int) (cp + 5), ((int) (i + 3)) + 1);
</pre>
### Statements### 
#### Simple Statements#### 
Each line should contain at most one statement. Example: 
<pre>
argv++;       	// Correct
argc--;       	// Correct  
argv++; argc--;   // INCORRECT!
</pre>
#### Compound Statements#### 
Compound statements are statements that contain lists of statements enclosed in braces "{ 

statements }".  See the following example. 
<pre>
while (!done) {
	    doSomething();
	    doMoreThing();
	}
</pre>
* The enclosed statements should be indented one more level than the compound statement. 
* The opening brace should be at the end of the same line or on the next line just below the 

text that begins the compound statement; the closing brace should begin a line and be 

indented to the beginning of the compound statement. 
* Braces are used around all statements, even single statements, when they are part of a 

control structure, such as an if-else or for statement. This makes it easier to add 

statements without accidentally introducing bugs due to forgetting to add braces. 
#### Return Statement#### 
A return statement with a value should not use parentheses unless it is an expression that 

requires parentheses or the parentheses provide clarity. Example: 
<pre>
return;
return myDisk.size();
return (size ? size : defaultSize);
</pre>
#### if, if-else, if else-if else and ternary operator Statements#### 
The “if-else” class of statements should have the following form: 
<pre>
if (condition) {
    statements;
}

if (condition) {
    statements;

} else {
    statements;
}

if (condition) {
    statements;

} else if (condition) {
    statements;

} else {
    statements;
}
</pre>
If statements containing only two clauses may be shortened by using the ternary operator “?:”
<pre>
 if (a > b) {
    largest = a;
} else if (b > a) {
    largest = b;
} else /*  a ##  b * / {
    std::cout << "Uh oh, they're the same!\n";
}
</pre>
Could be shortened using the ternary operator “?:” to the following.
<pre>
largest = ((a > b) ? a : b);
</pre>
Nesting ternary operators is not recommended, because even one level of nesting
makes the code very hard to understand:
<pre>
some_val = x >= 0 ? x : ( y >= 0 ) ? y : z;
</pre>
Note: “if” statements always use braces {}. Avoid the following error-prone form: 
<pre>
if (condition) 	//INCORRECT !!
    statement;
</pre>
#### for Statements#### 
A “for” statement should have the following form: 
<pre>
for (initialization; condition; update) {
    statements;
}
</pre>
An empty “for” statement (one in which all the work is done in the initialization, condition, 

and update clauses) should have the following form: 
<pre>
for (initialization; condition; update);
</pre>
When using the comma operator in the initialization or update clause of a “for” statement, 

avoid the complexity of using more than three variables. If needed, use separate statements 

before the “for” loop (for the initialization clause) or at the end of the loop (for the 

update clause). 
#### while Statements#### 
A “while” statement should have the following form: 
<pre>
while (condition) {
    statements;
}
</pre>
An empty “while” statement should have the following form: 
<pre>
while (condition);
</pre>
#### do-while Statements#### 
A “do-while” statement should have the following form: 
<pre>
do {
    statements;
} while (condition);
</pre>
#### switch Statements#### 
A “switch” statement should have the following form: 
<pre>
switch (condition) {
case ABC:

    statements;
    /*  falls through * /

case DEF:

    statements;
    break;

case XYZ:

    statements;
    break;

default:

    statements;
    break;
}
</pre>
Every time a case falls through (i.e. does not include a break statement), add a comment 

where the break statement would normally be. This is shown in the preceding code example with 

the /*  falls through * / comment. 
Every switch statement should include a default case. The break in the default case is 

redundant, but it prevents a fall-through error if later another case is added. 
#### try-catch Statements#### 
A “try-catch” statement should have the following format: 
<pre>
try {
    statements;
} catch (ExceptionClass e) {
    statements;
}
</pre>
#### Exception Statements#### 
### ## Throwing an Exception### ## 
Exceptions should contain sufficient context information to indicate where the throw 

occurred. 
A completed, precise description of the exception should be included while throwing an 

exception. The text should be as simple and direct as possible, and end with a period. 

Uppercase is mandatory in the first word of the sentence, and should be used inside the 

sentence only when required.
For example: 
<pre>
      if (m_bDoneTranslation ##  true)
      {
          throw Err("Config::load() error. The config object was 
already loaded.");
      }
<\pre>
Examples of correct exception text are:
* “Capability for checking document not implemented yet.”
* “Incorrect document is provided.”
* “File not found in given path.”
Examples of incorrect exception text:
* “We’re sorry, but we have not implemented the capability to delete entries at the moment.”
* “Incorrect password.”
* “Certificate file not there.”
The first example politely beats around the bush instead of concisely stating the problem 

such that technical support staff can efficiently correct a problem.  The second example 

treats an ordinary user situation as a program exception.  The last exception lacks 

sufficient detail.
### ## Catching an Exception### ## 
When catching an exception, the statement should have the following sample format:
<pre>
void Config::load(string strFullpath) {
    try {
       ...
    }
    catch (Err xErr) {
        xLog.print(LOG_NORMAL, "Config::load, “ + xErr.context());
    }
}
</pre>
The catch statement should always print the message contained in the exception object or re-

throw the exception to the higher level method.
### Declarations### 
#### Number Per Line#### 
Maximum one declaration per line is mandatory. The comment describing each variable should be 

placed above the declaration.
<pre>
// Indentation level      
int level = 0; 

// Size of table
int size = 0;  
</pre>
The following is not allowed:
<pre>
int level, size;
</pre>
#### Initialization#### 
Local variables should be initialized where they are declared. The only reason not to 

initialize a variable where it is declared is if the initial value depends on some 

computation occurring first. 
#### Placement#### 
Declarations should be placed only at the beginning of local blocks. Do not wait to declare 

variables until their first use; it can confuse the unwary programmer and hamper code 

portability within the scope.  
<pre>
// beginning of method block
void myMethod() {
    int int1 = 0;         
   // beginning of "if" block
    if (condition) {
        int int2 = 0;     
        ...
 	   }
}
</pre>
Note.  One exception to the placement rule is for “first use” declarations that cannot be 

initialized until all data required for them is collected.
Another exception to the rule is indexes of for loops, which in C++ can be declared in the 

for statement: 
<pre>
for (int i = 0; i < iMaxLoops; i++) { 
    ... 
}
</pre>
Avoid local declarations that hide declarations at higher levels. For example, do not declare 

the same variable name in an inner block:
<pre>
int iCount;
...
myMethod() {
    if (condition) {
        int iCount = 0;     // INCORRECT!
        ...
    }
    ...
}
</pre>
#### Class Declarations####  
When coding C++ classes the following formatting rules should be followed: 
* No space between a method name and the parenthesis "(" starting its parameter list, followed 

by the parenthesis “)”
* Open brace "{" appears at the end of the same line as the declaration statement or on the 

next line directly under the first character of the class name.
#### Class Implementations####  
When coding C++ classes the following formatting rules should be followed: 
* Each method implementation shall be preceded by a single line comment that distinguishes the 

encoded method from surrounding source statements.
* No space between a method name and the parenthesis "(" starting its parameter list, followed 

by the parenthesis “)”.
* Open brace "{" appears on the next line by itself directly under the first character of the 

method name.
* As noted in the Statements Section, logic statements with the method will include opening 

braces at the end of the same line or on the next line directly under beginning text of the 

logical statement. 
About 60-70% of developers append curly braces at the end of the same line, whereas the rest 

of the people place the opening brace on the end of a line.  A strong argument for not 

placing braces at the end of lines is two-fold. First, if the line scrolls off the screen, 

the brace cannot be viewed anymore. Two, when scanning code to find blocks (defined by 

braces) it is easier and faster to just move eyes vertically, rather that both vertically and 

horizontally to find them. By placing braces at the beginning of their own lines it is much 

easier to decipher code blocks. Comments can even be added immediately after the opening 

brace (on the same line) to hint to what that block is trying to accomplish. 
* Closing brace "}" starts a line by itself indented to match its corresponding opening 

statement, except when it is a null statement the "}" should appear immediately after the 

"{". 
<pre>
class Sample : public BaseSample {
    int ivar1 = 0;
    int ivar2 = 0;

    Sample(int i, int j) : ivar1(i), ivar2(j) {
    }

    int emptyMethod() {
	 }
    ...
}
</pre>
* Methods are separated by a blank line.
#### Access Level#### 
C++ instance variables and methods have three access levels: public, protected, private.  As 

access level can have a big impact on maintainability of the software system, it is important 

to consider the following guidelines:
* Variables should be declared as locally as possible
* Avoid global variables as much as possible
* Variables and methods should have the least possible access level
* Public instance variables should be avoided at all costs
* Protected instance variable should be avoided unless the instance variable is declared as 

const
* The only public methods that a class exposes will be the methods of the interface it 

implements.
### Code Level Metrics### 
Code level metrics serve to keep the characteristics of the code within certain limits in 

order to enhance the readability/understandability, maintainability, testability, and in 

certain cases, security and performance of the code. The most commonly known metric is the 

Cyclomatic complexity or very roughly, the number of decision-making and/or branches in the 

code. High levels of complexity lead to difficulty understanding and testing code and 

therefore reduce the maintainability and testability of the code.  The less complexity in the 

code, the less room for error, the easier it is to test and to understand and therefore 

maintain the code.  Ensure your C++ code meets the following metrics:

{| class="wikitable"style="color:#303030;" cellpadding="20"
|+ style="caption-side:bottom; color:#0000CC;"|''Table 8 1. Code level metrics''
|-
! scope="col"| Class Level	
! scope="col"| Description and How to Calculate
! scope="col"| Recommended Threshold	
|-
! scope="row" style="color: black; background-color: #C8C8C8; text-align:left;" colspan="3"| 

Class Level
|-
| Classes with High # of Methods: Such classes are difficult to understand, maintain and 

test. 		
| Count the number of methods per class and keep them below the recommended threshold. 	
| Less than or equal to 20 
|-
| Classes Dependent on their Children: This is a violation of OO programming guidelines as no 

parent class shall be dependent on its children. 	
| Do not create class structures that have circular dependencies or parents that make calls 

to child methods.	
| ZERO
|-
| Highly Coupled Classes:  CBO: Such classes violate encapsulation and modularity guidelines 

and reduce potential re-use and component development capabilities since they are coupled 

with multiple other structures. 	
| Count of number of references to classes outside the current class hierarchy and stay 

within the recommended threshold. 	
| Less than or equal to 2 
|-
| Public/Protected Data (PUB_DATA)
Ratio of Public/Private Data (Threshold =<20%)
Large percentages of Public Data violate encapsulation and modularity guidelines and reduce 

potential re-use and component development capabilities since they provide “global” data to 

other classes and methods, making all such units of code dependent on one another; i.e. 

coupled with multiple other structures.	
| The ratio of public data (attributes) in a class to the private data in same class.	
| Less than or equal to 20 %
|-
! scope="row" style="color: black; background-color: #C8C8C8; text-align:left;" colspan="3"| 

Method Level
|-	 	 
| Cyclomatic Complexity: can make a piece of code; i.e. a method harder to understand, 

maintain and test. In addition high levels of Cyclomatic complexity can introduce security 

risks as hard-to-understand code may perform undesirable actions. 
| The number of linearly-independent paths through a program module – roughly the Number of 

all decisions and loops in a method or number of branches – stay within the recommended 

threshold. 
| Less than or equal to 12 
|-
| DESIGN Complexity:  this complexity measure evaluates the dependence of a method on other 

methods and as such is a measure of how encapsulation and modularity (independence) 

guidelines have been followed.  
| The number of all decisions and loops that contain calls to subordinate modules.
| Less than or equal to 7
|-
| High Depth of Code: creates complexity that may be hard to understand, follow and maintain.
| The level of nesting of loops and decisions making statements.
| Limit to 5
|-
| Global Data Complexity :  This measurement shows the dependence of a module of code on the 

global data present in a system and as such can violate encapsulation and modularity 

guidelines and reduce potential re-use and component development capabilities since they 

provide “global” data to other classes and methods, making all such units of code dependent 

on one another; i.e. coupled with multiple other structures.
| The count of  number of paths through global data.
| Less than or equal to 5
|-
| Avoid high fan-out: high values of this metric indicate excessive interaction between 

modules and a coupling between disparate structures. This violates encapsulation and 

modularity guidelines and reduces potential re-use and component development capabilities 

since they are coupled with multiple other structures.
| The count of the subordinate modules called from a single super-ordinate module.
| Less than or equal to 7
|-
| Number of Logical Branches in a method: very similar to Cyclomatic complexity. Useful for 

understanding high paths are in need of testing in any piece of code. A module with a 

Cyclomatic Complexity of 12 for example, has 22 branches which means the minimum number of 

paths to cover during testing.
| Logical branches: Correlates to threshold for Cyclomatic Complexity of 10 - which would 

equal 19 branches, for a Cyclomatic Complexity of 12 it is approximately 22.
| Less than or equal to 22
|}  
### Security Standards### 
The following Security Standards are derived from ---TBD---. For more details, please visit   

http://---TBD---.

### Section 508 Compliance### 
In order to comply with section 508 guidelines, please visit the following websites and 

ensure adherence to the guidelines presented therein. 
http://www.section508.gov/

Understanding accessibility: 
http://www-03.ibm.com/able/guidelines/software/accesssoftware.html

General checklist from IBM: 
http://www-03.ibm.com/able/access_ibm/disability.html

### Simple Coding Guidelines### 
The following coding guidelines assist with understandability, reliability, maintainability 

and testability of the code. General research has shown (please see the references section) 

that units of code following these guidelines are much easier to understand, maintain and 

test. 
#Avoid artifacts with too many parameters
#Avoid base Classes without virtual Destructors
#Avoid Classes using "new" to allocate Instances but not defining a copy Constructor
#Avoid Classes with a High Depth of Inheritance Tree
#Avoid Classes with a High Number Of Children
#Avoid Classes with a High Public Data Ratio
#Avoid Classes with a very low comment/code ratio
#Avoid Classes with at least one virtual Method and without a virtual Destructor
#Avoid Classes with High Coupling Between Objects
#Avoid Classes with High Weighted Methods per Class
#Avoid Classes with multiple inheritance
#Avoid Data Members that are not Private
#Avoid direct usage of database tables
#Avoid Dynamic SQL Objects With Queries on more than 4 Tables
#Avoid Functions/Methods with a complex SELECT clause
#Avoid Functions/Methods with High RAW SQL Complexity
#Avoid Functions/Methods with queries on too many Tables
#Avoid Functions/Methods with SQL statement including Subqueries
#Avoid Functions/Methods with SQL statement using Group By clause
#Avoid header files circular references
#Avoid High Response for a Class
#Avoid included files including other files
#Avoid including files other than header files
#Avoid inline Constructors and Destructors
#Avoid invocation of virtual Methods of the declared Class in a Constructor or Destructor
#Avoid large Classes - too many Constructors
#Avoid large Classes - too many Data Members
#Avoid large Classes - too many Methods
#Avoid large Interfaces - too many Methods
#Avoid large Methods/Functions - too many Lines of Code
#Avoid undocumented Classes
#Avoid undocumented Functions, Methods, Constructors, and Destructors
#Avoid unreferenced Classes
#Avoid unreferenced Data Members
#Avoid unreferenced Methods
#Avoid using global objects in constructors and destructors
#Avoid using Global Variables
#Avoid using VARIANT Structures
#Class naming convention - case control
#Constant naming convention - case control
#Data Members naming convention - case control
#File naming convention - embedded Class
#Macros naming convention - case control
#Method naming convention - case control
#Never throw an exception from a destructor
### Code Example (Style)### 
Below is a one-page C++ coding styling standard quick reference using a sample class.
<p align="center">
[[https://cloud.githubusercontent.com/assets/6976295/2877797/468d0204-d453-11e3-87a0-

553df7c53257.png]]
</p><p align="center">
Figure 12-1. C++ Coding Style Example
</p> 
