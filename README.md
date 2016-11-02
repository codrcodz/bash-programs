# Number Namer
[![Build Status](https://travis-ci.org/codrcodz/phone-extension-namer.svg?branch=master)](https://travis-ci.org/codrcodz/number-namer)
[![GitHub version](https://badge.fury.io/gh/codrcodz%2Fnumber-namer.svg)](https://badge.fury.io/gh/codrcodz%2Fnumber-namer)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://badge.mit-license.org)

Ever wonder if the last four digits of your phone number spells a funny word or acronym?  Well I have, because one of my coworkers noticed that his last-four spelled "BASH".  From that point forward, anytime someone asked him what his extension was, he would tell them it was "BASH".  This got me thinking... I wonder if mine spells anything interesting?  So, I wrote a program in pure Bash, (of course), that accomplishes this very thing.

Here is example usage:

```bash
$ ./namer.sh 2345 | head
adgj
adgk
adgl
adhj
adhk
adhl
adij
adik
adil
aegj
```
You can also pipe to a file or the column utility to get nicer output. Have fun!



