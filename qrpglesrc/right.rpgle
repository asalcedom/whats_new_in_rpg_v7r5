**free

dcl-s name   varchar(30) ccsid(*utf8);
dcl-s last   like(name);
dcl-s length packed(2);

name = 'Rubén Martínez';

// I want the last 8 characters
length = 8;

last = %subst(name:%charcount(name)-(length-1):length:*natural);
snd-msg 'name: ' + last %target(*self:2);

last = %right(name:length:*natural);
snd-msg 'name: ' + last %target(*self:2);

*inlr = *on;