# What is Markdown?
Markdown is a way to style text on the web. You control the display of the document; formatting words as bold or italic, adding images, and creating lists are just a few of the things we can do with Markdown. Mostly, Markdown is just regular text with a few non-alphabetic characters thrown in, like # or *.

The overriding design goal for Markdown’s formatting syntax is to make it as readable as possible. The idea is that a Markdown-formatted document should be publishable as-is, as plain text, without looking like it’s been marked up with tags or formatting instructions. While Markdown’s syntax has been influenced by several existing text-to-HTML filters, the single biggest source of inspiration for Markdown’s syntax is the format of plain text email.

You can use Markdown most places around GitHub:

* Gists
* Comments in Issues and Pull Requests
* Files with the .md or .markdown extension

## Syntax guide
Here’s an overview of Markdown syntax that you can use anywhere on GitHub.com or in your own text files.

### Headers
```md
# This is an <h1> tag
## This is an <h2> tag
###### This is an <h6> tag
```
# This is an `<h1>` tag
## This is an `<h2>` tag
###### This is an `<h6>` tag

### Emphasis
```md
*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_
```
*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_

### Lists

#### Unordered
```md
* Item 1
* Item 2
  * Item 2a
  * Item 2b
```
* Item 1
* Item 2
  * Item 2a
  * Item 2b

#### Ordered
```md
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b
```
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b
   
### Images
```md
![GitHub Logo](/images/logo.png)
HTML format: ![Alt Text](url) or <img src="URL/github-octocat.png" width="200" height="100" />
```
![GitHub Logo](https://assets-cdn.github.com/images/modules/open_graph/github-octocat.png)
HTML Format: 
<img src="https://assets-cdn.github.com/images/modules/open_graph/github-octocat.png" alt="Drawing" width="200" height="100"/>

### Links
```md
http://github.com - automatic!
[GitHub](http://github.com)
```
http://github.com - automatic!
[GitHub](http://github.com)


### Blockquotes
```md
As Jane Cobb said:

> "Lets go be badguys!"
```
As Jane Cobb said:

> "Lets go be badguys!"

### Inline code
```md
I think you should use an
`<form>` element here instead.
```
I think you should use an
`<form>` element here instead.

## GitHub Flavored Markdown
GitHub.com uses its own version of the Markdown syntax that provides an additional set of useful features, many of which make it easier to work with content on GitHub.com.

Note that some features of GitHub Flavored Markdown are only available in the descriptions and comments of Issues and Pull Requests. These include `@mentions` as well as references to SHA-1 hashes, Issues, and Pull Requests. Task Lists are also available in Gist comments and in Gist Markdown files.

Syntax highlighting

Here’s an example of how you can use syntax highlighting with GitHub Flavored Markdown:
```md
```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
    ```


You can also simply indent your code by four spaces:
```
    function fancyAlert(arg) {
      if(arg) {
        $.facebox({div:'#foo'})
      }
    }
```

### Task Lists
```md
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item
```
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item

If you include a task list in the first comment of an Issue, you will get a handy progress indicator in your issue list. It also works in Pull Requests!

### Tables

You can create tables by assembling a list of words and dividing them with hyphens - (for the first row), and then separating each column with a pipe `|`:
```md
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column
```
Would become:

First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

and of course you can always use HTML:
```html
<table>
  <tr>
    <th>First Header</th>
    <th>Second Header</th>
  </tr>
  <tr>
    <td>Content from cell 1</td>
    <td>Content from cell 2</td>
  </tr>
  <tr>
    <td>Content in the first column</td>
    <td>Content in the second column</td>
  </tr>
 </table>
```
<table>
  <tr>
    <th>First Header</th>
    <th>Second Header</th>
  </tr>
  <tr>
    <td>Content from cell 1</td>
    <td>Content from cell 2</td>
  </tr>
  <tr>
    <td>Content in the first column</td>
    <td>Content in the second column</td>
  </tr>
 </table>
 
### SHA references

Any reference to a commit’s SHA-1 hash will be automatically converted into a link to that commit on GitHub.
```md
16c999e8c71134401a78d4d46435517b2271d6ac
mojombo@16c999e8c71134401a78d4d46435517b2271d6ac
mojombo/github-flavored-markdown@16c999e8c71134401a78d4d46435517b2271d6ac
```
### Issue references within a repository

Any number that refers to an Issue or Pull Request will be automatically converted into a link.
```
#1
mojombo#1
mojombo/github-flavored-markdown#1
```
### Username `@mentions`

Typing an `@` symbol, followed by a username, will notify that person to come and view the comment. This is called an `“@mention”`, because you’re mentioning the individual. You can also `@mention` teams within an organization.

### Automatic linking for URLs

Any URL (like `http://www.github.com/`) will be automatically converted into a clickable link http://www.github.com/.

### Strikethrough

Any word wrapped with two tildes (like `~~this~~`) will appear ~~crossed out~~.

### Emoji

GitHub supports emoji! ```:sparkles: :camel: :boom:```
:sparkles: :camel: :boom:

To see a list of every image we support, check out the [Emoji Cheat Sheet](http://www.emoji-cheat-sheet.com/).
### Refrences:

* http://daringfireball.net/projects/markdown/
* https://guides.github.com/features/mastering-markdown/ Last updated Jan 15, 2014
* http://assemble.io/docs/Cheatsheet-Markdown.html
* https://gist.github.com/jonschlinkert/5854601

