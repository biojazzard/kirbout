# kirb* out* 
## This is a Mashup by [@biojazzard](https://twitter.com/biojazzard)

# kirb* out* 
#### kinout*JS* & kirby living together
[not a marriage, but who knows...]
* * *

## [kinoutJS](https://github.com/soyjavi/Kinout)
#### HTML5-based Keynote System
Kinout*JS* is awesome, period.
But I tought it was nice to have a content manager.
### +
## [kirby](https://github.com/bastianallgeier/kirbycms)
CMS based on Markdown. Text files in folders. Uses PHP. Extremely easy.
Kirby is also awesome, but I tought it was nice to have a better display.
### =
## [kirb*out*](https://github.com/biojazzard/kirbout)
That´s what you get: a very nice HTML5 Keynote System based on Markdown files served with PHP.
#####kirb*out* has to be awesome!!!
I believe in this kind of sinergy...

#Howto

## 1.-Download [kirb*out*](https://github.com/biojazzard/KirbOut) and put it some where in your server.
You need a web server (of your choice) with PHP > 5.3.
* * *
## 2.-Check whats going on in the */content* folder.
You can find all TEH Sildes content there.
In the first level, you´ll find the Main slides: Use the *Left* & *Right* arrows to navigate.
Main slides may have children: Use the *Up* & *Down* arrows to navigate.
* * *
## 3.-Folder names
For Main slides:
Ex: *01-whatever, 02-whenever...*
For Secondary (children) slides: Add a letter suffix.
Ex: *02-whenever-a, 02-whenever-b, 02-whenever-c...*
* * *
## 4.-Edit the *.txt* files
So, let´s see what we find here:

### Minimal Config (Only Content)
<pre>Text:
** Some **
## nice ## [Markdown](http://daringfireball.net/projects/markdown/)
----</pre>
* * *
Basically, Markdown Tags between the *Text:* and the closing *&#45;&#45;&#45;&#45;*.
* * *
## 5.-Edit the *.txt* files
Let´s go for more:

### Extra Config (Header and/or Footer)
You can easily add headers and footers per slide, adding the *Header:* and *Footer:*
<pre>Header:
** Cool Header
----
Footer:
** Cool Footer
----</pre>
* * *
Don´t forget to close them: *&#45;&#45;&#45;&#45;* !!!
* * *
## 6.-Edit the *.txt* files
And finally, the Title. tag.
### Title Config
Adding a title to the slide is not necesary, as the slide will take it´s file name.
But maybe we want a "Real Title" instead of a "real-title"... So we add:
<pre>Title: &#42;&#42;Real Title
----</pre>
* * *
Yes, you can use Markdown here also, as every where in the *.txt*
And of course don´t forget to close it: *&#45;&#45;&#45;&#45;* !!!
* * *

Based on [kinoutJS](https://github.com/soyjavi/Kinout) by [Javier Jiménez Villar](https://github.com/soyjavi) and [kirby](https://github.com/bastianallgeier/kirbycms) by [Bastian Allgeier](https://github.com/bastianallgeier)