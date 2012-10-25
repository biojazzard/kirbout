# kirbout 
## This is a Mashup by [@biojazzard](https://twitter.com/biojazzard)

# kirbout [Demo](http://biojazzard.github.com/kirbout/)
#### kinoutJS & kirby living together
[not a marriage, but who knows...]
* * *

## [kinoutJS](https://github.com/soyjavi/Kinout)
#### HTML5-based Keynote System
*KinoutJS* is awesome, period.
But I tought it was nice to have a content manager.
### +
## [kirby](https://github.com/bastianallgeier/kirbycms)
CMS based on Markdown. Text files in folders. Uses PHP. Extremely easy.
*Kirby* is also awesome, but I tought it was nice to have a better display.
### =
## [kirbout](https://github.com/biojazzard/kirbout)
That´s what you get: a very nice HTML5 Keynote System based on Markdown files served with PHP.
*kirbout has to be awesome!!!*
I believe in this kind of sinergy...

#Howto

## 1.-Download [kirbout](https://github.com/biojazzard/kirbout) and put it some where in your server.
* * *
You need a web server (of your choice) with PHP > 5.3.
OSX Tip: Drop it somewhere in. ~/Sites & Activate *Web Sharing* in *Preferences > Sharing*
* * *

## 2.-Check what's going on in the */content* folder.
You can find all *TEH* Sildes content there.
In the first level, you´ll find the Main slides: Use the *Left* & *Right* arrows to navigate.
Main slides may have children: Use the *Up* & *Down* arrows to navigate.

## 3.-Add Slides

### Folder names
For Main slides:
<pre>|content
|-01-whatever
|-02-whenever
</pre>
For Secondary (children) slides: Add a letter suffix.
<pre>|content
|-01-whatever
|--01-whatever-a
|--01-whatever-b
|--01-whatever-c
|-02-whenever
</pre>
* * *
Adding a Silde equals adding New Folder with a .txt file inside.
Same for Secondary Slides, at it's parent level.
* * *

## 4.-Add Slides (Edit the *.txt* files)
So, let´s see what we find here:

### Minimal Config (Only Content)

<pre>Text:
** Some **
## nice ## [Markdown](http://daringfireball.net/projects/markdown/)
----</pre>

* * *
Basically, Markdown Tags between the *Text:* and the closing *&#45;&#45;&#45;&#45;*.
* * *

## 5.-Content Edit (inside *.txt* files)
Let´s go for more:

### Extra Layout (Header and/or Footer)
You can easily add headers and footers per slide, adding the *Header:* and *Footer:*
<pre>Header:
** Cool Fixed Header
----
Footer:
** Cool Fixed Footer
----</pre>

* * *
Don´t forget to close them: *&#45;&#45;&#45;&#45;* !!!
* * *

## 6.-Edit the *.txt* files
And finally, the Title. tag.

### Slide Title () 
Adding a title to the slide is not necesary, as the slide will take it´s file name.
But maybe we want a "Real Title" instead of a "real-title"... So we add:
<pre>Title: &#42;&#42;Real Title
----</pre>
* * *
Yes, you can use Markdown here also, as every where in the *.txt*
And of course don´t forget to close it: *&#45;&#45;&#45;&#45;* !!!
* * *

##### Glued by [@biojazzard](https://github.com/biojazzard)

*All credits should go to:*

+[kinoutJS](https://github.com/soyjavi/Kinout) by [Javier Jiménez Villar](https://github.com/soyjavi)
+[kirby](https://github.com/bastianallgeier/kirbycms) by [Bastian Allgeier](https://github.com/bastianallgeier)