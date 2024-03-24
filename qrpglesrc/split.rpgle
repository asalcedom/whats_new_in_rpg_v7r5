**free

dcl-s string varchar(100);
dcl-s array  varchar(20) dim(*auto:10);
dcl-s i      uns(3);

string = 'Hello..I am testing SPLIT';

array = %split(string:'. ');
snd-msg 'There are ' + %char(%elem(array)) + ' elements in the array' %target(*self:2);
for i = 1 to %elem(array);
    snd-msg 'array(' + %char(i) + ') = ' + array(i) %target(*self:2);
endfor;

array = %split(string:'. ':*allsep);
snd-msg 'There are ' + %char(%elem(array)) + ' elements in the array' %target(*self:2);
for i = 1 to %elem(array);
    snd-msg 'array(' + %char(i) + ') = ' + array(i) %target(*self:2);
endfor;

*inlr = *on;