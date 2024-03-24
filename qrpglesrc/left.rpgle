**free

dcl-s var1       varchar(30) ccsid(*utf8);
dcl-s var2       like(var1);
dcl-s len_var1   packed(2);
dcl-s count_var1 packed(2);

var1 = 'Rubén Martínez';
len_var1 = %len(var1);
count_var1 = %charcount(var1);
var2 = %left(var1:5);

snd-msg '%left without *NATURAL...' %target(*self:2);
snd-msg 'Length of var1: ' + %char(len_var1) %target(*self:2);
snd-msg 'Char count of var1: ' + %char(count_var1) %target(*self:2);
snd-msg ('First 5 positions of var1: ''' + var2 + '''') %target(*self:2);


len_var1 = %len(var1);
count_var1 = %charcount(var1);
var2 = %left(var1:5:*natural);

snd-msg '%left with *NATURAL...' %target(*self:2);
snd-msg 'Length of var1: ' + %char(len_var1) %target(*self:2);
snd-msg 'Char count of var1: ' + %char(count_var1) %target(*self:2);
snd-msg ('First 5 positions of var1: ''' + var2 + '''') %target(*self:2);

*inlr = *on;