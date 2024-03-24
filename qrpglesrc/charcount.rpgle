**free
ctl-opt charcounttypes(*utf8) charcount(*natural);

dcl-s var1       varchar(10) ccsid(*utf8);
dcl-s var2       like(var1);
dcl-s len_var1   packed(2);
dcl-s count_var1 packed(2);

var1 = 'Árbol'; //Tree
len_var1 = %len(var1);
count_var1 = %charcount(var1);
var2 = %subst(var1:1:3);

snd-msg 'CHARCOUNT(*NATURAL) set...' %target(*self:2);
snd-msg 'Length of var1: ' + %char(len_var1) %target(*self:2);
snd-msg 'Char count of var1: ' + %char(count_var1) %target(*self:2);
snd-msg ('First 3 positions of var1: ''' + var2 + '''') %target(*self:2);

// Directive '/charcount (natural | stdcharsize)' can also be used to
//   change the default mode or to overwrite control specification

/charcount stdcharsize

len_var1 = %len(var1);
count_var1 = %charcount(var1);
var2 = %subst(var1:1:3);

snd-msg 'Change to *STDCHARSIZE...' %target(*self:2);
snd-msg 'Length of var1: ' + %char(len_var1) %target(*self:2);
snd-msg 'Char count of var1: ' + %char(count_var1) %target(*self:2);
snd-msg ('First 3 positions of var1: ''' + var2 + '''') %target(*self:2);

*inlr = *on;