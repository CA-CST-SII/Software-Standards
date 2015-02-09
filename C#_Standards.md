# Development Standards and Guidelines (C#)

## About the Guide
This guide covers structuring and naming of the Apptis/Project libraries in such a manner that other developers/teams can easily determine whether or not an object that provides desired functionality already exists, easily locate objects slated for modification, and decide where to include new development.  The guide also covers software coding standards; and although the primary focus will be on programs written in C #, many of the rules and principles are useful and apply to programs written in other languages.  Finally, the guide will briefly cover embedded XML documentation and includes a more extensive elaboration on usage in Appendix A - taken from a white paper article written by Anson Horton from the .NET Framework community website. 

## Purpose
Project specific C# coding standards are maintained by the lead developer for each project.

It is expected that all new C# code will adhere to these standards; existing code can be retrofitted to meet the standards to whatever degree possible, as modifications to that code are required. 

## Library Organization
### Library Taxonomy
The taxonomy presented in this section is a partial library layout with some explanation.  

Structure and usage will be discussed in the subsequent sections.  
* Apptis
  * Common – Houses the company’s core objects that are not “Account” specific (e.g., the Data Access Layer) and may be shared across multiple projects/accounts.
    * DataAccess
      * DBConnection.cs
      * DBConnectionFactory.cs
      * …
    * Hardware
      * Factory
        * …
    * Helper
      * NumericString.cs
      * XMLHelper.cs
      * ParameterizedString.cs
      * TokenValue.cs
      * …
    * MoneyManagement
      * MoneyManager.cs
    * SecurityManagement
      * SecurityManager.cs
    * UI
      * Web
        * … 
      * Windows
        * DesignSuite
    * Utils
      * Settings
  * Passport – Houses account specific common objects	
    * FEPClient
  * PATS
    * …
  * PIERS
    * …
  * PRISM
    * …
  * TDIS
    * Common – Houses project specific common objects
      * DataAdapter
      * DataFormatter
      * Passport
      * Project specific business entity objects.
      * PassportManagement
      * Project specific business entity management objects.
    * Support
      * SecurityManagement
      * SettingsManagement
    * Workflow
      * Adjudication
      * SignatureService
      * QualityControl

###Library Structure###
The library directory should be structured and named in a manner that makes it intuitive for a developer to easily check for existing functionality.  In general namespaces should match with the corresponding code directory structure (e.g., Apptis.TDIS.Common.Passport would align with the Apptis/TDIS/Common/Passport path).  This makes it easier to map namespaces to the directory layout, and makes it a relatively trivial matter for a developer to look for the appropriate “using” directive in a code file and locate the underlying functionality.  

However, this is not to say that every folder MUST map to a namespace.  If you’re creating a sub-folder within a project for organizational purposes, it is recommended that the objects within these folders share the same root namespace as the project (e.g., items within the Apptis/TDIS/Common/Passport/Applicant folder would lie within the Apptis.TDIS.Common.Passport namespace).  Again, this greatly simplifies library inclusion with the “using” directive and may vastly reduce the impact of a library consolidation and re-organization.

###Library Usage###
The first place a Team/Developer should look for developing a NEW system or Project is in the Apptis.Common section of the library.  If there is no existing functionality for the GENERAL type of development they are performing and it is conceivable that other systems may need the functionality at some future point, it should be implemented within the Apptis.Common section for other Projects to use.  Likewise, this may also be a good time to investigate whether other Developers/Teams have implemented functionality similar to what is needed, and if so, considering abstracting it out into the Apptis.Common section of the library.  

When adding/extending functionality to an existing Project, a developer should be able to look in the module folder (i.e., look in Apptis.TDIS.ModuleName if modifying an existing module) to see how current functionality has been implemented, and look to the Project and Apptis Common folders for existing business or non-domain specific objects.  If the folder structure is laid out in a sensible fashion and the underlying objects carry with them meaningful names, it should be relatively easy to determine whether or not there are existing pieces to the puzzle they are working on.  Again this is also a good time to look for existing functionality that is not in the Common area and re-factor and move it out if possible.  

##Programming Standards##
###About Code Uniformity###
Whereas most developers are familiar with writing code that a compiler can interpret, this section may be read as a guide that focuses on helping developers adopt code Naming Conventions, Structure, and Documentation/Comments that will help other developers understand the purpose of existing code.  Typically it is much simpler for a developer to familiarize their self with new code that has naming conventions and formatting similar to their own.  

###Naming Conventions###
####Naming Overview####
In general, put every class in a separate file and name the file like the class name.  An exception to this would be private inner classes.  Class names typically describe the business entity that the class represents or the function or set of functionality the class provides.  This convention makes things much easier to follow and significantly lends to self-documenting code.  Class and file names should NOT include the company and/or project name (e.g. GDSSecurity, TDISPassport, etc.).  Although this may have made some small amount of sense for COM objects, the combination of appropriate module name selection and the namespace paradigm used throughout the .NET framework make this unnecessary.   An obvious exception to this would be Bridge or Adapter classes where the name denotes the systems being bridged (e.g., TDISFEPAdapter).

For classes/files/methods keep your source code short, divide your code up into methods that are named such that their purpose is clear.  Unusually long classes/methods are sometimes cumbersome to name (not to mention read through) as they often perform multiple semi-atomic tasks.  This usually a good sign that some method and/or class refactoring is in order.

####Hungarian Notation####
Generally, the use of Hungarian notation in the naming objects/variables is considered poor practices in terms of modern programming standards.  

Hungarian notation is a defined set of prefixes and suffixes, which are applied to names to reflect the type of the variable.  This style of naming was widely used in early Windows programming, but now is obsolete or at least should be considered deprecated.  Using Hungarian notation is not allowed if you follow this guide.

Instead modern standards call for names that denote usage rather than type.  In other words a good variable name describes the semantic. 

One exception to this rule is UI code. All fields and variable names that contain UI elements such as a button should be suffixed with their type name without abbreviations. For example:

```C#
System.Windows.Forms.Button cancelButton;
System.Windows.Forms.TextBox firstNameTextBox;
```

#### Capitalization Styles
##### *Pascal Casing*
This convention capitalizes the first character of each word (e.g., 

<code>StandardsAndGuidelines</code>).

##### *Camel Casing*
This convention capitalizes the first character of each word except the first one (e.g. 

<code>standardsAndGuidelines</code>).

##### *Upper case*
Only use all upper case for identifiers if it consists of an abbreviation or acronym that is only a few characters long.  Longer identifiers should use Pascal Casing instead.

For Example:
```C#
public class Math
{
    public const PI # ...
    public const E # ...
    public const FeigenBaumNumber # ...
}
```

####Naming Guidelines####
##### *Class Naming Guidelines
* Class names must be nouns or noun phrases.
* Use Pascal Casing.
* Do not use any class prefix.

##### *Interface Naming Guidelines* * Name interfaces with nouns or noun phrases or adjectives describing behavior. (Example 

IComponent or IEnumberable)
* Use Pascal Casing.
* Use I as prefix for the name, it is followed by a capital letter (first char of the 

interface name)

##### *Enum Naming Guidelines* 
* Use Pascal Casing for enum value names and enum type names.
* Don’t prefix (or suffix) an enum type or enum values.
* Use singular names for enums.

##### *Static and Const Field Names* 
* Name static fields with nouns, noun phrases or abbreviations for nouns
* Use Pascal Casing.

##### *Non- const Field /Member Variable Names* 
* Use descriptive names that, if done properly should be enough to indicate the variable 

meaning/usage and provide insight into the underlying type.
* Use an underscore “_” as a prefix for private and protected class member variables (declared 

at the top of the class above any constructors) so they can be easily identified and located.
*Use Camel Casing after the underscore.

#####Method Names#####
*Name methods with verbs or verb phrases.
*Use Pascal Casing.

#####Method Parameters and Local Variables#####
*Use descriptive names that, if done properly should be enough to indicate the variable 

meaning/usage and provide insight into the underlying type.
*Use Camel Casing.

#####Property Names#####
*Name properties using nouns or noun phrases.
*Use Pascal Casing.
*Consider naming a property with the same name as the underlying class variable (without the 

underscore prefix).

#####Event Names#####
*Name event handlers with the EventHandler suffix.
*Use two parameters named sender and e.
*Use Pascal Casing.
*Name event argument classes with the EventArgs suffix.
*Name event names that have a concept of pre and post using the present and past tense.
*Consider naming events using a verb.  Consider using the “On” prefix, e.g., OnStart.

#####Capitalization summary#####
{| class#"wikitable" style#"text-align:left; color:green; background-color:#ffffcc;" 

cellpadding#"20" style#"text-align:left;" style#"text-align:left;" style#"text-align:left;" 
|+ style#"caption-side:bottom;"|''Table 4.2.4.10 Capitalization summary''
|-
! Type
! Case
! Notes
|-
| Class/Struct	
| Pascal Casing
|
|-	
| Interface	
| Pascal Casing	
| Start with I
|-
| Enum values	
| Pascal Casing	
|
|-
| Enum type	
| Pascal Casing
|
|-	
| Events	
| Pascal Casing	
|
|-
| Exception class	
| Pascal Casing	
| End with Exception
|-
| Public Fields	
| Pascal Casing
|
|-	
| Methods	
| Pascal Casing	
|
|-
| Namespace	
| Pascal Casing	
|
|-
| Property	
| Pascal Casing	
|
|-
| Protected/Private Fields	
| Camel Casing	
| Start with “_” for class level
|-
| Parameters/Local Variables 	
| Camel Casing	
|
|}

###Code Structure###
####Code Separation####
#####Separation Overview#####
Imagine trying to read a book or a magazine article with no spaces between the words or any 

indentation and/or blank lines to set-off or separate paragraphs.  It becomes readily 

apparent just how powerful these simple formatting tools are in contributing to the flow and 

readability of the text.  Similarly, the proper usage of indentation, blank lines, and white 

spaces will vastly improve the flow and readability of source code. 

#####Indentation#####
An indentation standard using spaces never was achieved.  Some people like 2 spaces; some 

prefer 4 and others 8, or even more spaces.  For this reason it is better use tabs and we 

define the Tab as the standard indentation character.  Tab characters have some advantages:

*Everyone can set their own preferred indentation level
*It is only 1 keystroke and not 2, 4, or 8…and will therefore reduce typing (even with “smart 

indenting” you have to set the indentation manually sometimes, or take it back or whatever).
*If you want to increase the indentation (or decrease), mark one block and increase the 

indent level with Tab with Shift-Tab you decrease the indentation. This is true for almost 

any text editor.

Indentation should be used in the following manner:

*Subordinate scopes/clauses should be indented one level in from the next higher scope (see 

Code Examples).
**The class, interface, struct, enum, and delegate declarations should be one level in from 

the namespace declaration.
**Constructors, Fields, Properties, Methods, etc. should be one level in from the class 

declaration.
**Source code within Constructors, Properties, Methods, etc. should be indented one level.
**Subordinate statements within conditional and flow statements should be indented one level 

(see Formatting Conditional/Flow Statements).
*If a declaration or statement continues onto subsequent lines the “wrapped” portion should 

be indented (see Wrapping Lines).

#####Blank Lines#####
Blank lines used within and between Methods, Properties, etc. improve readability.  They set 

off blocks of code that are logically related.

Two blank lines should always be used between:

*Logical sections of a source file (e.g., between code regions).
*Class and interface definitions (use one class/interface per file to prevent this case).

One blank line should always be used between:

*Methods
*Properties
*Local variables in a method and its first statement
*Logical sections inside a method to improve readability

#####Spacing#####
The following spacing rules should be followed:
*No space between a method name and the opening parenthesis "(".
*No space between the parentheses for methods with no params in the signature.
*All items in a Class declaration should be separated by spaces (see Class, Interface, and 

Method Declarations).
*All parameters/expressions within parentheses should be separated by spaces located after 

the opening parenthesis, after the commas or semicolons, and before the closing parenthesis.
*Nested parentheses should be separated by spaces from the outer parentheses as well as the 

contained expression.
*No spaces should be used within parentheses that denote an explicit object cast.
*Surround operators with single spaces (except unary operators like increment or logical 

not).

Method example:

Use:
```java
TestMethod();
```
Or
```java
TestMethod( paramName1, paramName2, paramName3 );
```

Don't use: 
```java
TestMethod(paramName1,paramName2,paramName3);
```
Or
```java
TestMethod(paramName1, paramName2, paramName3);
```

Flow example:

Use:
```java
for( int loopIndex # 0; loopIndex < 10; loopIndex++ )
```

Don't use:
```java
for(int loopIndex#0; loopIndex<10; loopIndex++)
```
Or
```java
for(int loopIndex#0;loopIndex<10;loopIndex++)
```

Nested parentheses example:

Use:
```java
if( ( ( printStatus & PrintError ) !# PrintError ) ||
    ( ( printStatus & PrintBypass ) ## PrintBypass ) )
{
	…
}
```

Don’t use:
```java
if( ( (printStatus & PrintError) !# PrintError ) ||
    ( (printStatus & PrintBypass) ## PrintBypass ) )
{
	…
}
```
	Or
```java
if( ((printStatus & PrintError) !# PrintError) ||
    ((printStatus & PrintBypass) ## PrintBypass) )
{
	…
}
```

Explicit cast example:
```java
double someDouble # 1234.7;
int someInt;
```
Use:
```java
someInt # (int) someDouble;
```
Or
```java
someInt # (int)someDouble;
```

Don't use:
```java
someInt # ( int )someDouble;
```

Operator example:

Use:
```java
prevVariable # curVariable;
```

Don't use:
```java
prevVariable#curVariable;
```

####Wrapping Lines####
When an expression will not fit on a single line, break it up according to these general 

principles:

*Break after a comma.
*Break after an operator.
*Prefer higher-level breaks to lower-level breaks.

Example of breaking up method calls:
```java
MethodCall( variableName1, variableName2, variableName3,
	variableName4, variableName5 );
```
Or
```java
MethodCall( variableName1, variableName2, variableName3,
            variableName4, variableName5 );
```

Examples of breaking an arithmetic expression:

Use:
```java
someResult # a * b / ( c - g + f ) + 
4 * z;
```
Or
```java
someResult # a * b / ( c - g + f ) + 
      4 * z;
```

Don’t use:
```java
someResult # a * b / ( c - g +
f ) + 4 * z;
```
The first is preferred since the break occurs outside the parenthesized expression (i.e., 

flows and reads better with the order of operations in mind).  


NOTE: If you prefer to use indentation that lines variables and/or the right hand portion of 

expressions up with those on the previous line, then you MUST use tabs only to where the 

previous line began and spaces for the rest of the indentation.  Otherwise, formatting will 

be disrupted for developers using tab lengths that differ from your own.  

Examples of using tab/char combinations to preserve alignment:
```java
>MethodCall( variableName1, variableName2, variableName3,
>............variableName4, variableName5, variableName6 );

>var # a * b / ( c - g + f ) +
>......4 * z;
```
Where '>' are tab chars and '.' are spaces (the spaces after the tab char must begin under 

the first char of the previous line).  For this reason it may be easier to simply indent with 

an additional tab rather than align continuations of variable lists and expressions.

####Declarations####
#####Number of Declarations per Line#####
One declaration per line is recommended since it allows for commenting should the variable 

name not suffice.  In other words,
```java
int floorNumber; 	
int totalFloors; // The total number of floors in the building
```

Do not put more than one variable on a line unless their usage is closely related.  Do not 

put variables of different types on the same line when declaring them.  Example:
```java
int a, b; // What is 'a'? What does 'b' stand for?
```
The above example also demonstrates the drawbacks of non-obvious variable names.  

#####Initialization#####
Wherever possible try to initialize local variables as soon as they are declared. 

For example:
```java
string mLastName # string.Empty;
```
Or
```java
string lastName # curEmployee.LastName;
```
Or
```java
double hoursWorked # timePeriod.Hours;
```

Note: If you initialize a dialog try to use the using statement:
```java
using( OpenFileDialog openFileDialog # new OpenFileDialog() )
{
...
}
```

#####Class, Interface, and Method Declarations#####
*The opening brace "{" appears in the next line after the declaration statement.
*The closing brace "}" starts a line by itself indented to match its corresponding opening 

brace.

For example:
```java
class BoundedCounter : CounterBase, ICounter
 {
  int _upperBound;
  int _lowerBound;
  int _countStart;
		
 public MySample( int countStart, int upperBound, 
  int lowerBound )
 {
  _countStart # countStart;
  _upperBound # upperBound;
  _lowerBound # lowerBound;
 }

 void Increment()
 {
	if( _countStart < upperBound )
	{
          CounterBase.Increment();
	}
 }

 void Decrement()
 {
	if( _countStart > lowerBound )
	{
          // Call the base class decrement
			}
        }

 void EmptyMethod()
 {
	// How’d I end up here?
 }
}
```
For a brace placement example see the Brace Example.

####Formatting Conditional/Flow Statements####
#####Formatting if, if-else, if else-if else Statements#####
The if, if-else and else-if else statements should be formatted as follows:
```java
if( condition )
{
 DoSomething();
 ...
}

if( condition )
{
 DoSomething();
 ...
}
else
{
 DoSomethingOther();
 ...
}

if( condition )
{
 DoSomething();
 ...
}
else if( condition )
{
 DoSomethingOther();
 ...
}
else
{
 DoSomethingOtherAgain();
 ...
}
```
Note: Generally use brackets even if there is only one statement in condition.

#####Formatting for / foreach Statements#####
A for statement should have following format:
```java
for( int loopIndex # 0; loopIndex < 5; ++ loopIndex )
{
 ...
}
```
Or single lined (consider using a while statement instead):
```java
for( [initialization expression]; [loop condition]; 
[update expression] );
```
A foreach should look like:
```java
foreach( int i in IntList )
{
 ...
}
```
Note: Generally use brackets even if there is only one statement in the loop.

#####Formatting  while/do-while Statements#####
A while statement should be written as follows:
```java
while( condition )
{
 ...
}
```
Note: Generally use brackets even if there is only one statement in the loop.

An empty while should have the following form:
```java
while( condition );
```
A do-while statement should have the following form:
```java
do
{
 ...
} 
while( condition );
```

#####Formatting switch Statements#####
A switch statement should be of following form:
```java
switch( condition )
{
 case A:
  ...
  break;
 case B:
  ...
  break;
 default:
  ...
  break;
}
```

#####try-catch Statements#####
A try-catch statement should follow this form:
```java
try
{
 ...
}
catch( Exception ) 
{
  // We don't care if it fails because we're shutting down anyway.
}
```
NOTE:  If you plan on catching and ignoring the error, a good practice is to place a comment 

in the catch block explaining why.

Or
```java
try
{
 ...
}
catch( Exception e )
{
 ...
}
```
Or
```java
try
{
 ...
}
catch( Exception e )
{
 ...
}
finally
{
...
}
```
####Implementing Structure Standards####
#####Within Visual Studio#####
For the most part In Visual Studio 2003 these code formatting practices must be adopted and 

adhered to via the developer’s own diligence.

In Visual Studio 2005 the structure rules described above, along with additional layout and 

formatting rules, must be configured by using the C# Code Options depicted in the screen 

shots below.


TODO:  Screen Shots to be added.


##Best Practices##
###Visibility###
Do not make any instance or class variable public make them private or protected.   Instead, 

use properties if you need to expose a class variable.  You may use public static fields (or 

const) as an exception to this rule, but it should not be the rule.

###No embedded, user-facing strings.###
No UI elements (Labels, Drop Downs, Text Boxes, Error Messages, etc.) should use text that is 

embedded in the application.  In .Net much of this can be overcome by enabling localization, 

and the remainder should rely on some construct that can display the appropriate text from a 

persistent store such as the Notification layer.

###No 'magic' Numbers###
Don’t use magic numbers, i.e. place constant numerical values directly into the source code. 

Replacing these later on in case of changes (say, your application can now handle 32767 users 

instead of the 255 hard-coded into your code in 50 lines scattered throughout your 25000 LOC) 

is error-prone, not productive, and an all around bad programming practice.  Instead declare 

a const variable which contains the number:
```java
public class MyMath
{
  public const double PI # 3.14159...
}
```
##Code Examples##
###Brace Placement Example###
```java
namespace ShowMeTheBracket
{
  public enum Test
  {
    TestMe,
    TestYou
  }

  public class TestMeClass
  {
    Test _test;

    public Test Test
    {
     get
     {
       return _test;
     }

      set
     {
       _test # value;
     }
    }

  void DoSomething()
  {
    if( _test ## Test.TestMe )
    {
      //...stuff gets done
    }
    else
    {
      //...other stuff gets done
    }
   }
 }
}
```
Brackets should begin on a new line after:
*Namespace declarations
*Class/Interface/Struct declarations
*Method declarations
*Looping statements with multiple subordinate statements.
*Conditional statements with multiple subordinate statements.

###Variable Naming Example###

Instead of:
```java
for( int i # 1; i < num; i++ )
{
  meetsCriteria[i] # true;
}
			
for( int i # 2; i < num / 2; i++ )
{
  int j # i + i;
  while( j <# num )
  {
    meetsCriteria[j] # false;
    j +# i;
  }
}
	
for( int i # 0; i < num; i++ )
{
  if( meetsCriteria[i] )
  {
    Console.WriteLine( i + " meets criteria" );
  }
}
```

Try intelligent naming:
```java
for( int primeCandidate # 1; primeCandidate < candidateLimit; 
    primeCandidate++ )
{
    _isPrime[primeCandidate] # true;
}

for( int factor # 2; factor < candidateLimit / 2; factor++ )
{
    int factorableNumber # factor + factor;

    while( factorableNumber <# candidateLimit )
    {
      _isPrime[factorableNumber] # false;
      factorableNumber +# factor;
    }
}

for( int primeCandidate # 0; primeCandidate < candidateLimit; 
    primeCandidate++ )
{
    if( _isPrime[primeCandidate] )
    {
      Console.WriteLine( primeCandidate + " is prime." );
    }
}
```
Note: Indexer variables are generally named i,j,k, etc.  But in cases like this, it may make 

sense to reconsider this rule.  In general, when the same counters or indexers are reused or 

can provide insight into the functionality, give them meaningful names.

##Embedded Comments and Documentation##
###Block Comments###
Block comments should not be used above Constructors, Methods, and Properties.  Instead use 

the /// XML comments discussed in a later section to give C # standard descriptions.  For the 

most part, appropriately named classes, methods, properties, and variables should make the 

code self-explanatory and limit in-line comments to the occasional, single-line // comments.  

However, complex algorithms/business rules occasionally do require more verbose in-line 

commenting.  In these cases if you wish to use block comments you should use the following 

style:
```java
/* Line 1
 * Line 2
 * Line 3 
 */
```
Lining up the asterisks and closing the comment block on a separate line will visually set 

the comment block off from code for the (human) reader.   Comment blocks are also useful for 

“commenting out” sections of code during development / debugging; however, functionality 

being deprecated should not be “commented out” and left in the source files.  Instead, rely 

on the source repository to retain historical functionality.

###Single-Line Comments###
Single-line // comments should be used where subtle clarification is needed.  A rule of thumb 

is that the length of a comment should not exceed the length of the code being explained; 

and, with the exception of complex algorithms/business rules, the need for long comments is 

generally an indication of poorly named or structured source code.  Single-line comments may 

also be used to “comment out” code during development / debugging but, again, “commented out” 

code should not be left in the source files.

When single-line comments are used as in-line, code documentation they must be indented to 

the same level as the code they are clarifying.  When using single-line comments to "comment 

out" code, place the // comment marks at the beginning of the line to enhance the visibility 

of commented out code.  

###XML Documentation Overview###
In the .NET framework, Microsoft has introduced a documentation generation system based on 

XML comments. These comments are formally single line C# comments containing XML tags. They 

follow this pattern for single line comments:
```java
/// <summary>
/// This class...
/// </summary>
```
Multi-line XML comments follow this pattern:
```java
/// <exception cref#”BogusException”>
/// This exception gets thrown as soon as a
/// Bogus flag gets set.
/// </exception>
```
All lines must be preceded by three slashes to be accepted as XML comment lines.
Tags fall into two categories:

*Documentation items
*Formatting/Referencing

The first category contains tags like <code><summary>, <param> or <exception></code>.  These 

represent items that are the elements of a program's API, which must be documented for the 

program to be useful to other programmers.  These tags usually have attributes such as name 

or cref as demonstrated in the multi-line example above.  The compiler checks these 

attributes, so they should be valid.

The latter category governs the layout of the documentation, using tags such as <code><code>, 

<list> or <para></code>.

For a more complete explanation of XML comments see the Microsoft .NET framework SDK 

documentation.

####XML Documentation Tag Usage####
For all classes, types, enums, and class members, a <code><summary></code> tag must be used, 

regardless of whether they are public, protected, or private.  This can be simply done by 

positioning the cursor on an empty line above the statement you wish to comment and typing 

‘///’.  The VS .NET editor will automatically turn this into a correctly structured 

<code><summary></code> block, and will add <code><param></code> tags also if the statement is 

a method and has parameters.

The <code><remarks></code> tag should be used in addition to the <code><summary></code> tag 

for any code that does not allow for brief description.  This can be combined with the 

<code><example></code> tag to demonstrate usage if helpful.

Any method that includes parameters in its signature must have a <code><param></code> tag for 

each parameter that describes their purpose.  

Any method that throws an exception must have an <code><exception></code> tag to describe the 

exception that can be thrown and why it would be thrown.  The cref attribute of this tag WILL 

be evaluated by the compiler, so should refer to the actual Exception class that will be 

thrown.

Any method with a return value must have a <code><remarks></code> tag describing the return 

value.

Once XML documentation has been created, it is only truly useful if transforms are applied to 

make it readable.  A popular open source application called NDOC does a very good job of 

this.  NDOC can generate HTML or Windows based .chm help files.  As of the writing of this 

guide NDOC is available in at the DevSystemSoftware/ndoc share.

More information on XML Documentation Tags can be found in Appendix A.

####Implementing XML Documentation####
#####Within Visual Studio#####
In Visual Studio 2003 consider using the latest 2003 compatible GhostDoc Add-In (1.3.0 as of 

this writing).

In Visual Studio 2005 consider using the latest 2005 compatible GhostDoc Add-In (1.9.2 as of 

this writing).

There also exists Add-Ins for previewing your comments, such as QuickDocViewer. 
#Children Pages#
[[Appendix A |https://github.com/CA-CST-SII/Software-Standards/wiki/Appendix-A]]
hat the objects 

within these folders share the same root namespace as the project (e.g., items within the 

Apptis/TDIS/Common/Passport/Applicant folder would lie within the Apptis.TDIS.Common.Passport 

namespace).  Again, this greatly simplifies library inclusion with the “using” directive and 

may vastly reduce the impact of a library consolidation and re-organization.

###Library Usage###
The first place a Team/Developer should look for developing a NEW system or Project is in the 

Apptis.Common section of the library.  If there is no existing functionality for the GENERAL 

type of development they are performing and it is conceivable that other systems may need the 

functionality at some future point, it should be implemented within the Apptis.Common section 

for other Projects to use.  Likewise, this may also be a good time to investigate whether 

other Developers/Teams have implemented functionality similar to what is needed, and if so, 

considering abstracting it out into the Apptis.Common section of the library.  

When adding/extending functionality to an existing Project, a developer should be able to 

look in the module folder (i.e., look in Apptis.TDIS.ModuleName if modifying an existing 

module) to see how current functionality has been implemented, and look to the Project and 

Apptis Common folders for existing business or non-domain specific objects.  If the folder 

structure is laid out in a sensible fashion and the underlying objects carry with them 

meaningful names, it should be relatively easy to determine whether or not there are existing 

pieces to the puzzle they are working on.  Again this is also a good time to look for 

existing functionality that is not in the Common area and re-factor and move it out if 

possible.  

##Programming Standards##
###About Code Uniformity###
Whereas most developers are familiar with writing code that a compiler can interpret, this 

section may be read as a guide that focuses on helping developers adopt code Naming 

Conventions, Structure, and Documentation/Comments that will help other developers understand 

the purpose of existing code.  Typically it is much simpler for a developer to familiarize 

their self with new code that has naming conventions and formatting similar to their own.  

###Naming Conventions###
####Naming Overview####
In general, put every class in a separate file and name the file like the class name.  An 

exception to this would be private inner classes.  Class names typically describe the 

business entity that the class represents or the function or set of functionality the class 

provides.  This convention makes things much easier to follow and significantly lends to 

self-documenting code.  Class and file names should NOT include the company and/or project 

name (e.g. GDSSecurity, TDISPassport, etc.).  Although this may have made some small amount 

of sense for COM objects, the combination of appropriate module name selection and the 

namespace paradigm used throughout the .NET framework make this unnecessary.   An obvious 

exception to this would be Bridge or Adapter classes where the name denotes the systems being 

bridged (e.g., TDISFEPAdapter).

For classes/files/methods keep your source code short, divide your code up into methods that 

are named such that their purpose is clear.  Unusually long classes/methods are sometimes 

cumbersome to name (not to mention read through) as they often perform multiple semi-atomic 

tasks.  This usually a good sign that some method and/or class refactoring is in order.

####Hungarian Notation####
Generally, the use of Hungarian notation in the naming objects/variables is considered poor 

practices in terms of modern programming standards.  

Hungarian notation is a defined set of prefixes and suffixes, which are applied to names to 

reflect the type of the variable.  This style of naming was widely used in early Windows 

programming, but now is obsolete or at least should be considered deprecated.  Using 

Hungarian notation is not allowed if you follow this guide.

Instead modern standards call for names that denote usage rather than type.  In other words a 

good variable name describes the semantic.

One exception to this rule is UI code. All fields and variable names that contain UI elements 

such as a button should be suffixed with their type name without abbreviations. For example:

```javaSystem.Windows.Forms.Button cancelButton;
System.Windows.Forms.TextBox firstNameTextBox;```

####Capitalization Styles####
#####Pascal Casing#####
This convention capitalizes the first character of each word (e.g., 

<code>StandardsAndGuidelines</code>).

#####Camel Casing#####
This convention capitalizes the first character of each word except the first one (e.g. 

<code>standardsAndGuidelines</code>).

#####Upper case#####
Only use all upper case for identifiers if it consists of an abbreviation or acronym that is 

only a few characters long.  Longer identifiers should use Pascal Casing instead.

For Example:
```java
public class Math
{
    public const PI # ...
    public const E # ...
    public const FeigenBaumNumber # ...
}
```

####Naming Guidelines####
#####Class Naming Guidelines#####
*Class names must be nouns or noun phrases.
*Use Pascal Casing.
*Do not use any class prefix.

#####Interface Naming Guidelines#####
*Name interfaces with nouns or noun phrases or adjectives describing behavior. (Example 

IComponent or IEnumberable)
*Use Pascal Casing.
*Use I as prefix for the name, it is followed by a capital letter (first char of the 

interface name)

#####Enum Naming Guidelines#####
*Use Pascal Casing for enum value names and enum type names.
*Don’t prefix (or suffix) an enum type or enum values.
*Use singular names for enums.

#####Static and Const Field Names#####
*Name static fields with nouns, noun phrases or abbreviations for nouns
*Use Pascal Casing.

#####Non- const Field /Member Variable Names#####
*Use descriptive names that, if done properly should be enough to indicate the variable 

meaning/usage and provide insight into the underlying type.
*Use an underscore “_” as a prefix for private and protected class member variables (declared 

at the top of the class above any constructors) so they can be easily identified and located.
*Use Camel Casing after the underscore.

#####Method Names#####
*Name methods with verbs or verb phrases.
*Use Pascal Casing.

#####Method Parameters and Local Variables#####
*Use descriptive names that, if done properly should be enough to indicate the variable 

meaning/usage and provide insight into the underlying type.
*Use Camel Casing.

#####Property Names#####
*Name properties using nouns or noun phrases.
*Use Pascal Casing.
*Consider naming a property with the same name as the underlying class variable (without the 

underscore prefix).

#####Event Names#####
*Name event handlers with the EventHandler suffix.
*Use two parameters named sender and e.
*Use Pascal Casing.
*Name event argument classes with the EventArgs suffix.
*Name event names that have a concept of pre and post using the present and past tense.
*Consider naming events using a verb.  Consider using the “On” prefix, e.g., OnStart.

#####Capitalization summary#####
{| class#"wikitable" style#"text-align:left; color:green; background-color:#ffffcc;" 

cellpadding#"20" style#"text-align:left;" style#"text-align:left;" style#"text-align:left;" 
|+ style#"caption-side:bottom;"|''Table 4.2.4.10 Capitalization summary''
|-
! Type
! Case
! Notes
|-
| Class/Struct	
| Pascal Casing
|
|-	
| Interface	
| Pascal Casing	
| Start with I
|-
| Enum values	
| Pascal Casing	
|
|-
| Enum type	
| Pascal Casing
|
|-	
| Events	
| Pascal Casing	
|
|-
| Exception class	
| Pascal Casing	
| End with Exception
|-
| Public Fields	
| Pascal Casing
|
|-	
| Methods	
| Pascal Casing	
|
|-
| Namespace	
| Pascal Casing	
|
|-
| Property	
| Pascal Casing	
|
|-
| Protected/Private Fields	
| Camel Casing	
| Start with “_” for class level
|-
| Parameters/Local Variables 	
| Camel Casing	
|
|}

###Code Structure###
####Code Separation####
#####Separation Overview#####
Imagine trying to read a book or a magazine article with no spaces between the words or any 

indentation and/or blank lines to set-off or separate paragraphs.  It becomes readily 

apparent just how powerful these simple formatting tools are in contributing to the flow and 

readability of the text.  Similarly, the proper usage of indentation, blank lines, and white 

spaces will vastly improve the flow and readability of source code. 

#####Indentation#####
An indentation standard using spaces never was achieved.  Some people like 2 spaces; some 

prefer 4 and others 8, or even more spaces.  For this reason it is better use tabs and we 

define the Tab as the standard indentation character.  Tab characters have some advantages:

*Everyone can set their own preferred indentation level
*It is only 1 keystroke and not 2, 4, or 8…and will therefore reduce typing (even with “smart 

indenting” you have to set the indentation manually sometimes, or take it back or whatever).
*If you want to increase the indentation (or decrease), mark one block and increase the 

indent level with Tab with Shift-Tab you decrease the indentation. This is true for almost 

any text editor.

Indentation should be used in the following manner:

*Subordinate scopes/clauses should be indented one level in from the next higher scope (see 

Code Examples).
**The class, interface, struct, enum, and delegate declarations should be one level in from 

the namespace declaration.
**Constructors, Fields, Properties, Methods, etc. should be one level in from the class 

declaration.
**Source code within Constructors, Properties, Methods, etc. should be indented one level.
**Subordinate statements within conditional and flow statements should be indented one level 

(see Formatting Conditional/Flow Statements).
*If a declaration or statement continues onto subsequent lines the “wrapped” portion should 

be indented (see Wrapping Lines).

#####Blank Lines#####
Blank lines used within and between Methods, Properties, etc. improve readability.  They set 

off blocks of code that are logically related.

Two blank lines should always be used between:

*Logical sections of a source file (e.g., between code regions).
*Class and interface definitions (use one class/interface per file to prevent this case).

One blank line should always be used between:

*Methods
*Properties
*Local variables in a method and its first statement
*Logical sections inside a method to improve readability

#####Spacing#####
The following spacing rules should be followed:
*No space between a method name and the opening parenthesis "(".
*No space between the parentheses for methods with no params in the signature.
*All items in a Class declaration should be separated by spaces (see Class, Interface, and 

Method Declarations).
*All parameters/expressions within parentheses should be separated by spaces located after 

the opening parenthesis, after the commas or semicolons, and before the closing parenthesis.
*Nested parentheses should be separated by spaces from the outer parentheses as well as the 

contained expression.
*No spaces should be used within parentheses that denote an explicit object cast.
*Surround operators with single spaces (except unary operators like increment or logical 

not).

Method example:

Use:
```java
TestMethod();
```
Or
```java
TestMethod( paramName1, paramName2, paramName3 );
```

Don't use: 
```java
TestMethod(paramName1,paramName2,paramName3);
```
Or
```java
TestMethod(paramName1, paramName2, paramName3);
```

Flow example:

Use:
```java
for( int loopIndex # 0; loopIndex < 10; loopIndex++ )
```

Don't use:
```java
for(int loopIndex#0; loopIndex<10; loopIndex++)
```
Or
```java
for(int loopIndex#0;loopIndex<10;loopIndex++)
```

Nested parentheses example:

Use:
```java
if( ( ( printStatus & PrintError ) !# PrintError ) ||
    ( ( printStatus & PrintBypass ) ## PrintBypass ) )
{
	…
}
```

Don’t use:
```java
if( ( (printStatus & PrintError) !# PrintError ) ||
    ( (printStatus & PrintBypass) ## PrintBypass ) )
{
	…
}
```
	Or
```java
if( ((printStatus & PrintError) !# PrintError) ||
    ((printStatus & PrintBypass) ## PrintBypass) )
{
	…
}
```

Explicit cast example:
```java
double someDouble # 1234.7;
int someInt;
```
Use:
```java
someInt # (int) someDouble;
```
Or
```java
someInt # (int)someDouble;
```

Don't use:
```java
someInt # ( int )someDouble;
```

Operator example:

Use:
```java
prevVariable # curVariable;
```

Don't use:
```java
prevVariable#curVariable;
```

####Wrapping Lines####
When an expression will not fit on a single line, break it up according to these general 

principles:

*Break after a comma.
*Break after an operator.
*Prefer higher-level breaks to lower-level breaks.

Example of breaking up method calls:
```java
MethodCall( variableName1, variableName2, variableName3,
	variableName4, variableName5 );
```
Or
```java
MethodCall( variableName1, variableName2, variableName3,
            variableName4, variableName5 );
```

Examples of breaking an arithmetic expression:

Use:
```java
someResult # a * b / ( c - g + f ) + 
4 * z;
```
Or
```java
someResult # a * b / ( c - g + f ) + 
      4 * z;
```

Don’t use:
```java
someResult # a * b / ( c - g +
f ) + 4 * z;
```
The first is preferred since the break occurs outside the parenthesized expression (i.e., 

flows and reads better with the order of operations in mind).  


NOTE: If you prefer to use indentation that lines variables and/or the right hand portion of 

expressions up with those on the previous line, then you MUST use tabs only to where the 

previous line began and spaces for the rest of the indentation.  Otherwise, formatting will 

be disrupted for developers using tab lengths that differ from your own.  

Examples of using tab/char combinations to preserve alignment:
```java
>MethodCall( variableName1, variableName2, variableName3,
>............variableName4, variableName5, variableName6 );

>var # a * b / ( c - g + f ) +
>......4 * z;
```
Where '>' are tab chars and '.' are spaces (the spaces after the tab char must begin under 

the first char of the previous line).  For this reason it may be easier to simply indent with 

an additional tab rather than align continuations of variable lists and expressions.

####Declarations####
#####Number of Declarations per Line#####
One declaration per line is recommended since it allows for commenting should the variable 

name not suffice.  In other words,
```java
int floorNumber; 	
int totalFloors; // The total number of floors in the building
```

Do not put more than one variable on a line unless their usage is closely related.  Do not 

put variables of different types on the same line when declaring them.  Example:
```java
int a, b; // What is 'a'? What does 'b' stand for?
```
The above example also demonstrates the drawbacks of non-obvious variable names.  

#####Initialization#####
Wherever possible try to initialize local variables as soon as they are declared. 

For example:
```java
string mLastName # string.Empty;
```
Or
```java
string lastName # curEmployee.LastName;
```
Or
```java
double hoursWorked # timePeriod.Hours;
```

Note: If you initialize a dialog try to use the using statement:
```java
using( OpenFileDialog openFileDialog # new OpenFileDialog() )
{
...
}
```

#####Class, Interface, and Method Declarations#####
*The opening brace "{" appears in the next line after the declaration statement.
*The closing brace "}" starts a line by itself indented to match its corresponding opening 

brace.

For example:
```java
class BoundedCounter : CounterBase, ICounter
 {
  int _upperBound;
  int _lowerBound;
  int _countStart;
		
 public MySample( int countStart, int upperBound, 
  int lowerBound )
 {
  _countStart # countStart;
  _upperBound # upperBound;
  _lowerBound # lowerBound;
 }

 void Increment()
 {
	if( _countStart < upperBound )
	{
          CounterBase.Increment();
	}
 }

 void Decrement()
 {
	if( _countStart > lowerBound )
	{
          // Call the base class decrement
			}
        }

 void EmptyMethod()
 {
	// How’d I end up here?
 }
}
```
For a brace placement example see the Brace Example.

####Formatting Conditional/Flow Statements####
#####Formatting if, if-else, if else-if else Statements#####
The if, if-else and else-if else statements should be formatted as follows:
```java
if( condition )
{
 DoSomething();
 ...
}

if( condition )
{
 DoSomething();
 ...
}
else
{
 DoSomethingOther();
 ...
}

if( condition )
{
 DoSomething();
 ...
}
else if( condition )
{
 DoSomethingOther();
 ...
}
else
{
 DoSomethingOtherAgain();
 ...
}
```
Note: Generally use brackets even if there is only one statement in condition.

#####Formatting for / foreach Statements#####
A for statement should have following format:
```java
for( int loopIndex # 0; loopIndex < 5; ++ loopIndex )
{
 ...
}
```
Or single lined (consider using a while statement instead):
```java
for( [initialization expression]; [loop condition]; 
[update expression] );
```
A foreach should look like:
```java
foreach( int i in IntList )
{
 ...
}
```
Note: Generally use brackets even if there is only one statement in the loop.

#####Formatting  while/do-while Statements#####
A while statement should be written as follows:
```java
while( condition )
{
 ...
}
```
Note: Generally use brackets even if there is only one statement in the loop.

An empty while should have the following form:
```java
while( condition );
```
A do-while statement should have the following form:
```java
do
{
 ...
} 
while( condition );
```

#####Formatting switch Statements#####
A switch statement should be of following form:
```java
switch( condition )
{
 case A:
  ...
  break;
 case B:
  ...
  break;
 default:
  ...
  break;
}
```

#####try-catch Statements#####
A try-catch statement should follow this form:
```java
try
{
 ...
}
catch( Exception ) 
{
  // We don't care if it fails because we're shutting down anyway.
}
```
NOTE:  If you plan on catching and ignoring the error, a good practice is to place a comment 

in the catch block explaining why.

Or
```java
try
{
 ...
}
catch( Exception e )
{
 ...
}
```
Or
```java
try
{
 ...
}
catch( Exception e )
{
 ...
}
finally
{
...
}
```
####Implementing Structure Standards####
#####Within Visual Studio#####
For the most part In Visual Studio 2003 these code formatting practices must be adopted and 

adhered to via the developer’s own diligence.

In Visual Studio 2005 the structure rules described above, along with additional layout and 

formatting rules, must be configured by using the C# Code Options depicted in the screen 

shots below.


TODO:  Screen Shots to be added.


##Best Practices##
###Visibility###
Do not make any instance or class variable public make them private or protected.   Instead, 

use properties if you need to expose a class variable.  You may use public static fields (or 

const) as an exception to this rule, but it should not be the rule.

###No embedded, user-facing strings.###
No UI elements (Labels, Drop Downs, Text Boxes, Error Messages, etc.) should use text that is 

embedded in the application.  In .Net much of this can be overcome by enabling localization, 

and the remainder should rely on some construct that can display the appropriate text from a 

persistent store such as the Notification layer.

###No 'magic' Numbers###
Don’t use magic numbers, i.e. place constant numerical values directly into the source code. 

Replacing these later on in case of changes (say, your application can now handle 32767 users 

instead of the 255 hard-coded into your code in 50 lines scattered throughout your 25000 LOC) 

is error-prone, not productive, and an all around bad programming practice.  Instead declare 

a const variable which contains the number:
```java
public class MyMath
{
  public const double PI # 3.14159...
}
```
##Code Examples##
###Brace Placement Example###
```java
namespace ShowMeTheBracket
{
  public enum Test
  {
    TestMe,
    TestYou
  }

  public class TestMeClass
  {
    Test _test;

    public Test Test
    {
     get
     {
       return _test;
     }

      set
     {
       _test # value;
     }
    }

  void DoSomething()
  {
    if( _test ## Test.TestMe )
    {
      //...stuff gets done
    }
    else
    {
      //...other stuff gets done
    }
   }
 }
}
```
Brackets should begin on a new line after:
*Namespace declarations
*Class/Interface/Struct declarations
*Method declarations
*Looping statements with multiple subordinate statements.
*Conditional statements with multiple subordinate statements.

###Variable Naming Example###

Instead of:
```java
for( int i # 1; i < num; i++ )
{
  meetsCriteria[i] # true;
}
			
for( int i # 2; i < num / 2; i++ )
{
  int j # i + i;
  while( j <# num )
  {
    meetsCriteria[j] # false;
    j +# i;
  }
}
	
for( int i # 0; i < num; i++ )
{
  if( meetsCriteria[i] )
  {
    Console.WriteLine( i + " meets criteria" );
  }
}
```

Try intelligent naming:
```java
for( int primeCandidate # 1; primeCandidate < candidateLimit; 
    primeCandidate++ )
{
    _isPrime[primeCandidate] # true;
}

for( int factor # 2; factor < candidateLimit / 2; factor++ )
{
    int factorableNumber # factor + factor;

    while( factorableNumber <# candidateLimit )
    {
      _isPrime[factorableNumber] # false;
      factorableNumber +# factor;
    }
}

for( int primeCandidate # 0; primeCandidate < candidateLimit; 
    primeCandidate++ )
{
    if( _isPrime[primeCandidate] )
    {
      Console.WriteLine( primeCandidate + " is prime." );
    }
}
```
Note: Indexer variables are generally named i,j,k, etc.  But in cases like this, it may make 

sense to reconsider this rule.  In general, when the same counters or indexers are reused or 

can provide insight into the functionality, give them meaningful names.

##Embedded Comments and Documentation##
###Block Comments###
Block comments should not be used above Constructors, Methods, and Properties.  Instead use 

the /// XML comments discussed in a later section to give C # standard descriptions.  For the 

most part, appropriately named classes, methods, properties, and variables should make the 

code self-explanatory and limit in-line comments to the occasional, single-line // comments.  

However, complex algorithms/business rules occasionally do require more verbose in-line 

commenting.  In these cases if you wish to use block comments you should use the following 

style:
```java
/* Line 1
 * Line 2
 * Line 3 
 */
```
Lining up the asterisks and closing the comment block on a separate line will visually set 

the comment block off from code for the (human) reader.   Comment blocks are also useful for 

“commenting out” sections of code during development / debugging; however, functionality 

being deprecated should not be “commented out” and left in the source files.  Instead, rely 

on the source repository to retain historical functionality.

###Single-Line Comments###
Single-line // comments should be used where subtle clarification is needed.  A rule of thumb 

is that the length of a comment should not exceed the length of the code being explained; 

and, with the exception of complex algorithms/business rules, the need for long comments is 

generally an indication of poorly named or structured source code.  Single-line comments may 

also be used to “comment out” code during development / debugging but, again, “commented out” 

code should not be left in the source files.

When single-line comments are used as in-line, code documentation they must be indented to 

the same level as the code they are clarifying.  When using single-line comments to "comment 

out" code, place the // comment marks at the beginning of the line to enhance the visibility 

of commented out code.  

###XML Documentation Overview###
In the .NET framework, Microsoft has introduced a documentation generation system based on 

XML comments. These comments are formally single line C# comments containing XML tags. They 

follow this pattern for single line comments:
```java
/// <summary>
/// This class...
/// </summary>
```
Multi-line XML comments follow this pattern:
```java
/// <exception cref#”BogusException”>
/// This exception gets thrown as soon as a
/// Bogus flag gets set.
/// </exception>
```
All lines must be preceded by three slashes to be accepted as XML comment lines.
Tags fall into two categories:

*Documentation items
*Formatting/Referencing

The first category contains tags like <code><summary>, <param> or <exception></code>.  These 

represent items that are the elements of a program's API, which must be documented for the 

program to be useful to other programmers.  These tags usually have attributes such as name 

or cref as demonstrated in the multi-line example above.  The compiler checks these 

attributes, so they should be valid.

The latter category governs the layout of the documentation, using tags such as <code><code>, 

<list> or <para></code>.

For a more complete explanation of XML comments see the Microsoft .NET framework SDK 

documentation.

####XML Documentation Tag Usage####
For all classes, types, enums, and class members, a <code><summary></code> tag must be used, 

regardless of whether they are public, protected, or private.  This can be simply done by 

positioning the cursor on an empty line above the statement you wish to comment and typing 

‘///’.  The VS .NET editor will automatically turn this into a correctly structured 

<code><summary></code> block, and will add <code><param></code> tags also if the statement is 

a method and has parameters.

The <code><remarks></code> tag should be used in addition to the <code><summary></code> tag 

for any code that does not allow for brief description.  This can be combined with the 

<code><example></code> tag to demonstrate usage if helpful.

Any method that includes parameters in its signature must have a <code><param></code> tag for 

each parameter that describes their purpose.  

Any method that throws an exception must have an <code><exception></code> tag to describe the 

exception that can be thrown and why it would be thrown.  The cref attribute of this tag WILL 

be evaluated by the compiler, so should refer to the actual Exception class that will be 

thrown.

Any method with a return value must have a <code><remarks></code> tag describing the return 

value.

Once XML documentation has been created, it is only truly useful if transforms are applied to 

make it readable.  A popular open source application called NDOC does a very good job of 

this.  NDOC can generate HTML or Windows based .chm help files.  As of the writing of this 

guide NDOC is available in at the DevSystemSoftware/ndoc share.

More information on XML Documentation Tags can be found in Appendix A.

####Implementing XML Documentation####
#####Within Visual Studio#####
In Visual Studio 2003 consider using the latest 2003 compatible GhostDoc Add-In (1.3.0 as of 

this writing).

In Visual Studio 2005 consider using the latest 2005 compatible GhostDoc Add-In (1.9.2 as of 

this writing).

There also exists Add-Ins for previewing your comments, such as QuickDocViewer. 
#Children Pages#
[[Appendix A |https://github.com/CA-CST-SII/Software-Standards/wiki/Appendix-A]]
tructure (e.g., Apptis.TDIS.Common.Passport would 

align with the Apptis/TDIS/Common/Passport path).  This makes it easier to map namespaces to 

the directory layout, and makes it a relatively trivial matter for a developer to look for 

the appropriate “using” directive in a code file and locate the underlying functionality.  

However, this is not to say that every folder MUST map to a namespace.  If you’re creating a 

sub-folder within a project for organizational purposes, it is recommended that the objects 

within these folders share the same root namespace as the project (e.g., items within the 

Apptis/TDIS/Common/Passport/Applicant folder would lie within the Apptis.TDIS.Common.Passport 

namespace).  Again, this greatly simplifies library inclusion with the “using” directive and 

may vastly reduce the impact of a library consolidation and re-organization.

###Library Usage###
The first place a Team/Developer should look for developing a NEW system or Project is in the 

Apptis.Common section of the library.  If there is no existing functionality for the GENERAL 

type of development they are performing and it is conceivable that other systems may need the 

functionality at some future point, it should be implemented within the Apptis.Common section 

for other Projects to use.  Likewise, this may also be a good time to investigate whether 

other Developers/Teams have implemented functionality similar to what is needed, and if so, 

considering abstracting it out into the Apptis.Common section of the library.  

When adding/extending functionality to an existing Project, a developer should be able to 

look in the module folder (i.e., look in Apptis.TDIS.ModuleName if modifying an existing 

module) to see how current functionality has been implemented, and look to the Project and 

Apptis Common folders for existing business or non-domain specific objects.  If the folder 

structure is laid out in a sensible fashion and the underlying objects carry with them 

meaningful names, it should be relatively easy to determine whether or not there are existing 

pieces to the puzzle they are working on.  Again this is also a good time to look for 

existing functionality that is not in the Common area and re-factor and move it out if 

possible.  

##Programming Standards##
###About Code Uniformity###
Whereas most developers are familiar with writing code that a compiler can interpret, this 

section may be read as a guide that focuses on helping developers adopt code Naming 

Conventions, Structure, and Documentation/Comments that will help other developers understand 

the purpose of existing code.  Typically it is much simpler for a developer to familiarize 

their self with new code that has naming conventions and formatting similar to their own.  

###Naming Conventions###
####Naming Overview####
In general, put every class in a separate file and name the file like the class name.  An 

exception to this would be private inner classes.  Class names typically describe the 

business entity that the class represents or the function or set of functionality the class 

provides.  This convention makes things much easier to follow and significantly lends to 

self-documenting code.  Class and file names should NOT include the company and/or project 

name (e.g. GDSSecurity, TDISPassport, etc.).  Although this may have made some small amount 

of sense for COM objects, the combination of appropriate module name selection and the 

namespace paradigm used throughout the .NET framework make this unnecessary.   An obvious 

exception to this would be Bridge or Adapter classes where the name denotes the systems being 

bridged (e.g., TDISFEPAdapter).

For classes/files/methods keep your source code short, divide your code up into methods that 

are named such that their purpose is clear.  Unusually long classes/methods are sometimes 

cumbersome to name (not to mention read through) as they often perform multiple semi-atomic 

tasks.  This usually a good sign that some method and/or class refactoring is in order.

####Hungarian Notation####
Generally, the use of Hungarian notation in the naming objects/variables is considered poor 

practices in terms of modern programming standards.  

Hungarian notation is a defined set of prefixes and suffixes, which are applied to names to 

reflect the type of the variable.  This style of naming was widely used in early Windows 

programming, but now is obsolete or at least should be considered deprecated.  Using 

Hungarian notation is not allowed if you follow this guide.

Instead modern standards call for names that denote usage rather than type.  In other words a 

good variable name describes the semantic.

One exception to this rule is UI code. All fields and variable names that contain UI elements 

such as a button should be suffixed with their type name without abbreviations. For example:

```javaSystem.Windows.Forms.Button cancelButton;
System.Windows.Forms.TextBox firstNameTextBox;```

####Capitalization Styles####
#####Pascal Casing#####
This convention capitalizes the first character of each word (e.g., 

<code>StandardsAndGuidelines</code>).

#####Camel Casing#####
This convention capitalizes the first character of each word except the first one (e.g. 

<code>standardsAndGuidelines</code>).

#####Upper case#####
Only use all upper case for identifiers if it consists of an abbreviation or acronym that is 

only a few characters long.  Longer identifiers should use Pascal Casing instead.

For Example:
```java
public class Math
{
    public const PI # ...
    public const E # ...
    public const FeigenBaumNumber # ...
}
```

####Naming Guidelines####
#####Class Naming Guidelines#####
*Class names must be nouns or noun phrases.
*Use Pascal Casing.
*Do not use any class prefix.

#####Interface Naming Guidelines#####
*Name interfaces with nouns or noun phrases or adjectives describing behavior. (Example 

IComponent or IEnumberable)
*Use Pascal Casing.
*Use I as prefix for the name, it is followed by a capital letter (first char of the 

interface name)

#####Enum Naming Guidelines#####
*Use Pascal Casing for enum value names and enum type names.
*Don’t prefix (or suffix) an enum type or enum values.
*Use singular names for enums.

#####Static and Const Field Names#####
*Name static fields with nouns, noun phrases or abbreviations for nouns
*Use Pascal Casing.

#####Non- const Field /Member Variable Names#####
*Use descriptive names that, if done properly should be enough to indicate the variable 

meaning/usage and provide insight into the underlying type.
*Use an underscore “_” as a prefix for private and protected class member variables (declared 

at the top of the class above any constructors) so they can be easily identified and located.
*Use Camel Casing after the underscore.

#####Method Names#####
*Name methods with verbs or verb phrases.
*Use Pascal Casing.

#####Method Parameters and Local Variables#####
*Use descriptive names that, if done properly should be enough to indicate the variable 

meaning/usage and provide insight into the underlying type.
*Use Camel Casing.

#####Property Names#####
*Name properties using nouns or noun phrases.
*Use Pascal Casing.
*Consider naming a property with the same name as the underlying class variable (without the 

underscore prefix).

#####Event Names#####
*Name event handlers with the EventHandler suffix.
*Use two parameters named sender and e.
*Use Pascal Casing.
*Name event argument classes with the EventArgs suffix.
*Name event names that have a concept of pre and post using the present and past tense.
*Consider naming events using a verb.  Consider using the “On” prefix, e.g., OnStart.

#####Capitalization summary#####
{| class#"wikitable" style#"text-align:left; color:green; background-color:#ffffcc;" 

cellpadding#"20" style#"text-align:left;" style#"text-align:left;" style#"text-align:left;" 
|+ style#"caption-side:bottom;"|''Table 4.2.4.10 Capitalization summary''
|-
! Type
! Case
! Notes
|-
| Class/Struct	
| Pascal Casing
|
|-	
| Interface	
| Pascal Casing	
| Start with I
|-
| Enum values	
| Pascal Casing	
|
|-
| Enum type	
| Pascal Casing
|
|-	
| Events	
| Pascal Casing	
|
|-
| Exception class	
| Pascal Casing	
| End with Exception
|-
| Public Fields	
| Pascal Casing
|
|-	
| Methods	
| Pascal Casing	
|
|-
| Namespace	
| Pascal Casing	
|
|-
| Property	
| Pascal Casing	
|
|-
| Protected/Private Fields	
| Camel Casing	
| Start with “_” for class level
|-
| Parameters/Local Variables 	
| Camel Casing	
|
|}

###Code Structure###
####Code Separation####
#####Separation Overview#####
Imagine trying to read a book or a magazine article with no spaces between the words or any 

indentation and/or blank lines to set-off or separate paragraphs.  It becomes readily 

apparent just how powerful these simple formatting tools are in contributing to the flow and 

readability of the text.  Similarly, the proper usage of indentation, blank lines, and white 

spaces will vastly improve the flow and readability of source code. 

#####Indentation#####
An indentation standard using spaces never was achieved.  Some people like 2 spaces; some 

prefer 4 and others 8, or even more spaces.  For this reason it is better use tabs and we 

define the Tab as the standard indentation character.  Tab characters have some advantages:

*Everyone can set their own preferred indentation level
*It is only 1 keystroke and not 2, 4, or 8…and will therefore reduce typing (even with “smart 

indenting” you have to set the indentation manually sometimes, or take it back or whatever).
*If you want to increase the indentation (or decrease), mark one block and increase the 

indent level with Tab with Shift-Tab you decrease the indentation. This is true for almost 

any text editor.

Indentation should be used in the following manner:

*Subordinate scopes/clauses should be indented one level in from the next higher scope (see 

Code Examples).
**The class, interface, struct, enum, and delegate declarations should be one level in from 

the namespace declaration.
**Constructors, Fields, Properties, Methods, etc. should be one level in from the class 

declaration.
**Source code within Constructors, Properties, Methods, etc. should be indented one level.
**Subordinate statements within conditional and flow statements should be indented one level 

(see Formatting Conditional/Flow Statements).
*If a declaration or statement continues onto subsequent lines the “wrapped” portion should 

be indented (see Wrapping Lines).

#####Blank Lines#####
Blank lines used within and between Methods, Properties, etc. improve readability.  They set 

off blocks of code that are logically related.

Two blank lines should always be used between:

*Logical sections of a source file (e.g., between code regions).
*Class and interface definitions (use one class/interface per file to prevent this case).

One blank line should always be used between:

*Methods
*Properties
*Local variables in a method and its first statement
*Logical sections inside a method to improve readability

#####Spacing#####
The following spacing rules should be followed:
*No space between a method name and the opening parenthesis "(".
*No space between the parentheses for methods with no params in the signature.
*All items in a Class declaration should be separated by spaces (see Class, Interface, and 

Method Declarations).
*All parameters/expressions within parentheses should be separated by spaces located after 

the opening parenthesis, after the commas or semicolons, and before the closing parenthesis.
*Nested parentheses should be separated by spaces from the outer parentheses as well as the 

contained expression.
*No spaces should be used within parentheses that denote an explicit object cast.
*Surround operators with single spaces (except unary operators like increment or logical 

not).

Method example:

Use:
```java
TestMethod();
```
Or
```java
TestMethod( paramName1, paramName2, paramName3 );
```

Don't use: 
```java
TestMethod(paramName1,paramName2,paramName3);
```
Or
```java
TestMethod(paramName1, paramName2, paramName3);
```

Flow example:

Use:
```java
for( int loopIndex # 0; loopIndex < 10; loopIndex++ )
```

Don't use:
```java
for(int loopIndex#0; loopIndex<10; loopIndex++)
```
Or
```java
for(int loopIndex#0;loopIndex<10;loopIndex++)
```

Nested parentheses example:

Use:
```java
if( ( ( printStatus & PrintError ) !# PrintError ) ||
    ( ( printStatus & PrintBypass ) ## PrintBypass ) )
{
	…
}
```

Don’t use:
```java
if( ( (printStatus & PrintError) !# PrintError ) ||
    ( (printStatus & PrintBypass) ## PrintBypass ) )
{
	…
}
```
	Or
```java
if( ((printStatus & PrintError) !# PrintError) ||
    ((printStatus & PrintBypass) ## PrintBypass) )
{
	…
}
```

Explicit cast example:
```java
double someDouble # 1234.7;
int someInt;
```
Use:
```java
someInt # (int) someDouble;
```
Or
```java
someInt # (int)someDouble;
```

Don't use:
```java
someInt # ( int )someDouble;
```

Operator example:

Use:
```java
prevVariable # curVariable;
```

Don't use:
```java
prevVariable#curVariable;
```

####Wrapping Lines####
When an expression will not fit on a single line, break it up according to these general 

principles:

*Break after a comma.
*Break after an operator.
*Prefer higher-level breaks to lower-level breaks.

Example of breaking up method calls:
```java
MethodCall( variableName1, variableName2, variableName3,
	variableName4, variableName5 );
```
Or
```java
MethodCall( variableName1, variableName2, variableName3,
            variableName4, variableName5 );
```

Examples of breaking an arithmetic expression:

Use:
```java
someResult # a * b / ( c - g + f ) + 
4 * z;
```
Or
```java
someResult # a * b / ( c - g + f ) + 
      4 * z;
```

Don’t use:
```java
someResult # a * b / ( c - g +
f ) + 4 * z;
```
The first is preferred since the break occurs outside the parenthesized expression (i.e., 

flows and reads better with the order of operations in mind).  


NOTE: If you prefer to use indentation that lines variables and/or the right hand portion of 

expressions up with those on the previous line, then you MUST use tabs only to where the 

previous line began and spaces for the rest of the indentation.  Otherwise, formatting will 

be disrupted for developers using tab lengths that differ from your own.  

Examples of using tab/char combinations to preserve alignment:
```java
>MethodCall( variableName1, variableName2, variableName3,
>............variableName4, variableName5, variableName6 );

>var # a * b / ( c - g + f ) +
>......4 * z;
```
Where '>' are tab chars and '.' are spaces (the spaces after the tab char must begin under 

the first char of the previous line).  For this reason it may be easier to simply indent with 

an additional tab rather than align continuations of variable lists and expressions.

####Declarations####
#####Number of Declarations per Line#####
One declaration per line is recommended since it allows for commenting should the variable 

name not suffice.  In other words,
```java
int floorNumber; 	
int totalFloors; // The total number of floors in the building
```

Do not put more than one variable on a line unless their usage is closely related.  Do not 

put variables of different types on the same line when declaring them.  Example:
```java
int a, b; // What is 'a'? What does 'b' stand for?
```
The above example also demonstrates the drawbacks of non-obvious variable names.  

#####Initialization#####
Wherever possible try to initialize local variables as soon as they are declared. 

For example:
```java
string mLastName # string.Empty;
```
Or
```java
string lastName # curEmployee.LastName;
```
Or
```java
double hoursWorked # timePeriod.Hours;
```

Note: If you initialize a dialog try to use the using statement:
```java
using( OpenFileDialog openFileDialog # new OpenFileDialog() )
{
...
}
```

#####Class, Interface, and Method Declarations#####
*The opening brace "{" appears in the next line after the declaration statement.
*The closing brace "}" starts a line by itself indented to match its corresponding opening 

brace.

For example:
```java
class BoundedCounter : CounterBase, ICounter
 {
  int _upperBound;
  int _lowerBound;
  int _countStart;
		
 public MySample( int countStart, int upperBound, 
  int lowerBound )
 {
  _countStart # countStart;
  _upperBound # upperBound;
  _lowerBound # lowerBound;
 }

 void Increment()
 {
	if( _countStart < upperBound )
	{
          CounterBase.Increment();
	}
 }

 void Decrement()
 {
	if( _countStart > lowerBound )
	{
          // Call the base class decrement
			}
        }

 void EmptyMethod()
 {
	// How’d I end up here?
 }
}
```
For a brace placement example see the Brace Example.

####Formatting Conditional/Flow Statements####
#####Formatting if, if-else, if else-if else Statements#####
The if, if-else and else-if else statements should be formatted as follows:
```java
if( condition )
{
 DoSomething();
 ...
}

if( condition )
{
 DoSomething();
 ...
}
else
{
 DoSomethingOther();
 ...
}

if( condition )
{
 DoSomething();
 ...
}
else if( condition )
{
 DoSomethingOther();
 ...
}
else
{
 DoSomethingOtherAgain();
 ...
}
```
Note: Generally use brackets even if there is only one statement in condition.

#####Formatting for / foreach Statements#####
A for statement should have following format:
```java
for( int loopIndex # 0; loopIndex < 5; ++ loopIndex )
{
 ...
}
```
Or single lined (consider using a while statement instead):
```java
for( [initialization expression]; [loop condition]; 
[update expression] );
```
A foreach should look like:
```java
foreach( int i in IntList )
{
 ...
}
```
Note: Generally use brackets even if there is only one statement in the loop.

#####Formatting  while/do-while Statements#####
A while statement should be written as follows:
```java
while( condition )
{
 ...
}
```
Note: Generally use brackets even if there is only one statement in the loop.

An empty while should have the following form:
```java
while( condition );
```
A do-while statement should have the following form:
```java
do
{
 ...
} 
while( condition );
```

#####Formatting switch Statements#####
A switch statement should be of following form:
```java
switch( condition )
{
 case A:
  ...
  break;
 case B:
  ...
  break;
 default:
  ...
  break;
}
```

#####try-catch Statements#####
A try-catch statement should follow this form:
```java
try
{
 ...
}
catch( Exception ) 
{
  // We don't care if it fails because we're shutting down anyway.
}
```
NOTE:  If you plan on catching and ignoring the error, a good practice is to place a comment 

in the catch block explaining why.

Or
```java
try
{
 ...
}
catch( Exception e )
{
 ...
}
```
Or
```java
try
{
 ...
}
catch( Exception e )
{
 ...
}
finally
{
...
}
```
####Implementing Structure Standards####
#####Within Visual Studio#####
For the most part In Visual Studio 2003 these code formatting practices must be adopted and 

adhered to via the developer’s own diligence.

In Visual Studio 2005 the structure rules described above, along with additional layout and 

formatting rules, must be configured by using the C# Code Options depicted in the screen 

shots below.


TODO:  Screen Shots to be added.


##Best Practices##
###Visibility###
Do not make any instance or class variable public make them private or protected.   Instead, 

use properties if you need to expose a class variable.  You may use public static fields (or 

const) as an exception to this rule, but it should not be the rule.

###No embedded, user-facing strings.###
No UI elements (Labels, Drop Downs, Text Boxes, Error Messages, etc.) should use text that is 

embedded in the application.  In .Net much of this can be overcome by enabling localization, 

and the remainder should rely on some construct that can display the appropriate text from a 

persistent store such as the Notification layer.

###No 'magic' Numbers###
Don’t use magic numbers, i.e. place constant numerical values directly into the source code. 

Replacing these later on in case of changes (say, your application can now handle 32767 users 

instead of the 255 hard-coded into your code in 50 lines scattered throughout your 25000 LOC) 

is error-prone, not productive, and an all around bad programming practice.  Instead declare 

a const variable which contains the number:
```java
public class MyMath
{
  public const double PI # 3.14159...
}
```
##Code Examples##
###Brace Placement Example###
```java
namespace ShowMeTheBracket
{
  public enum Test
  {
    TestMe,
    TestYou
  }

  public class TestMeClass
  {
    Test _test;

    public Test Test
    {
     get
     {
       return _test;
     }

      set
     {
       _test # value;
     }
    }

  void DoSomething()
  {
    if( _test ## Test.TestMe )
    {
      //...stuff gets done
    }
    else
    {
      //...other stuff gets done
    }
   }
 }
}
```
Brackets should begin on a new line after:
*Namespace declarations
*Class/Interface/Struct declarations
*Method declarations
*Looping statements with multiple subordinate statements.
*Conditional statements with multiple subordinate statements.

###Variable Naming Example###

Instead of:
```java
for( int i # 1; i < num; i++ )
{
  meetsCriteria[i] # true;
}
			
for( int i # 2; i < num / 2; i++ )
{
  int j # i + i;
  while( j <# num )
  {
    meetsCriteria[j] # false;
    j +# i;
  }
}
	
for( int i # 0; i < num; i++ )
{
  if( meetsCriteria[i] )
  {
    Console.WriteLine( i + " meets criteria" );
  }
}
```

Try intelligent naming:
```java
for( int primeCandidate # 1; primeCandidate < candidateLimit; 
    primeCandidate++ )
{
    _isPrime[primeCandidate] # true;
}

for( int factor # 2; factor < candidateLimit / 2; factor++ )
{
    int factorableNumber # factor + factor;

    while( factorableNumber <# candidateLimit )
    {
      _isPrime[factorableNumber] # false;
      factorableNumber +# factor;
    }
}

for( int primeCandidate # 0; primeCandidate < candidateLimit; 
    primeCandidate++ )
{
    if( _isPrime[primeCandidate] )
    {
      Console.WriteLine( primeCandidate + " is prime." );
    }
}
```
Note: Indexer variables are generally named i,j,k, etc.  But in cases like this, it may make 

sense to reconsider this rule.  In general, when the same counters or indexers are reused or 

can provide insight into the functionality, give them meaningful names.

##Embedded Comments and Documentation##
###Block Comments###
Block comments should not be used above Constructors, Methods, and Properties.  Instead use 

the /// XML comments discussed in a later section to give C # standard descriptions.  For the 

most part, appropriately named classes, methods, properties, and variables should make the 

code self-explanatory and limit in-line comments to the occasional, single-line // comments.  

However, complex algorithms/business rules occasionally do require more verbose in-line 

commenting.  In these cases if you wish to use block comments you should use the following 

style:
```java
/* Line 1
 * Line 2
 * Line 3 
 */
```
Lining up the asterisks and closing the comment block on a separate line will visually set 

the comment block off from code for the (human) reader.   Comment blocks are also useful for 

“commenting out” sections of code during development / debugging; however, functionality 

being deprecated should not be “commented out” and left in the source files.  Instead, rely 

on the source repository to retain historical functionality.

###Single-Line Comments###
Single-line // comments should be used where subtle clarification is needed.  A rule of thumb 

is that the length of a comment should not exceed the length of the code being explained; 

and, with the exception of complex algorithms/business rules, the need for long comments is 

generally an indication of poorly named or structured source code.  Single-line comments may 

also be used to “comment out” code during development / debugging but, again, “commented out” 

code should not be left in the source files.

When single-line comments are used as in-line, code documentation they must be indented to 

the same level as the code they are clarifying.  When using single-line comments to "comment 

out" code, place the // comment marks at the beginning of the line to enhance the visibility 

of commented out code.  

###XML Documentation Overview###
In the .NET framework, Microsoft has introduced a documentation generation system based on 

XML comments. These comments are formally single line C# comments containing XML tags. They 

follow this pattern for single line comments:
```java
/// <summary>
/// This class...
/// </summary>
```
Multi-line XML comments follow this pattern:
```java
/// <exception cref#”BogusException”>
/// This exception gets thrown as soon as a
/// Bogus flag gets set.
/// </exception>
```
All lines must be preceded by three slashes to be accepted as XML comment lines.
Tags fall into two categories:

*Documentation items
*Formatting/Referencing

The first category contains tags like <code><summary>, <param> or <exception></code>.  These 

represent items that are the elements of a program's API, which must be documented for the 

program to be useful to other programmers.  These tags usually have attributes such as name 

or cref as demonstrated in the multi-line example above.  The compiler checks these 

attributes, so they should be valid.

The latter category governs the layout of the documentation, using tags such as <code><code>, 

<list> or <para></code>.

For a more complete explanation of XML comments see the Microsoft .NET framework SDK 

documentation.

####XML Documentation Tag Usage####
For all classes, types, enums, and class members, a <code><summary></code> tag must be used, 

regardless of whether they are public, protected, or private.  This can be simply done by 

positioning the cursor on an empty line above the statement you wish to comment and typing 

‘///’.  The VS .NET editor will automatically turn this into a correctly structured 

<code><summary></code> block, and will add <code><param></code> tags also if the statement is 

a method and has parameters.

The <code><remarks></code> tag should be used in addition to the <code><summary></code> tag 

for any code that does not allow for brief description.  This can be combined with the 

<code><example></code> tag to demonstrate usage if helpful.

Any method that includes parameters in its signature must have a <code><param></code> tag for 

each parameter that describes their purpose.  

Any method that throws an exception must have an <code><exception></code> tag to describe the 

exception that can be thrown and why it would be thrown.  The cref attribute of this tag WILL 

be evaluated by the compiler, so should refer to the actual Exception class that will be 

thrown.

Any method with a return value must have a <code><remarks></code> tag describing the return 

value.

Once XML documentation has been created, it is only truly useful if transforms are applied to 

make it readable.  A popular open source application called NDOC does a very good job of 

this.  NDOC can generate HTML or Windows based .chm help files.  As of the writing of this 

guide NDOC is available in at the DevSystemSoftware/ndoc share.

More information on XML Documentation Tags can be found in Appendix A.

####Implementing XML Documentation####
#####Within Visual Studio#####
In Visual Studio 2003 consider using the latest 2003 compatible GhostDoc Add-In (1.3.0 as of 

this writing).

In Visual Studio 2005 consider using the latest 2005 compatible GhostDoc Add-In (1.9.2 as of 

this writing).

There also exists Add-Ins for previewing your comments, such as QuickDocViewer. 
#Children Pages#
[[Appendix A |https://github.com/CA-CST-SII/Software-Standards/wiki/Appendix-A]]
