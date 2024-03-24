**free

dcl-s var1       varucs2(30);
dcl-s var2       like(var1);
dcl-s var3       like(var1);
dcl-s var4       like(var1);

var1 = 'bruce dickinson';
var2 = %upper(var1:1:1);
snd-msg '%upper(' + var1 + ':1:1) => ' + var2 %target(*self:2);

var3 = %upper(var2:%scan(%ucs2(' '):var2) + 1:1);
snd-msg '%upper(' + var2 + ':%scan(%ucs2('' ''):var2) + 1:1) => ' + var3 %target(*self:2);

var4 = %lower(var3);
snd-msg '%lower(' + var3 + ') => ' + var4 %target(*self:2);

*inlr = *on;