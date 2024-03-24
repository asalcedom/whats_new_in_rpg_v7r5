**free
// Variables for FOR-EACH / %SUBARR
dcl-ds prices;
    base     packed(8:2) inz(95);
    medium   like(base)  inz(984);
    advanced like(base)  inz(5698);
    premium  like(base)  inz(12345);
    arrprice like(base) dim(4) samepos(base);
end-ds;

dcl-s price like(base);
dcl-s elem  packed(1);

// Variables for FOR-EACH with ENUM
 dcl-enum permission qualified;
    dcl-c read 'r';
    dcl-c write 'w';
    execute 'x';
 end-enum;

dcl-s perm           char(1);
dcl-s permissionList varchar(100);

// Variables for FOR-EACH with %LIST
dcl-s phone varchar(20);

// Variables for FOR-EACH with %SPLIT
dcl-s sentences varchar(10000);
dcl-s sentence  varchar(1000);
dcl-s word      varchar(20);
dcl-s numWords  packed(4);

//FOR-EACH / %SUBARR
snd-msg 'FOR-EACH' %target(*self:2);
for-each price in arrprice;
    select price;
        when-in %range(0:100);
            snd-msg %char(price) + ' is a base price.' %target(*self:2);
         when-in %range(101:1000);
            snd-msg %char(price) + ' is a medium price.' %target(*self:2);
         when-in
         %range (1001:10000);
            snd-msg %char(price) + ' is an advanced price.' %target(*self:2);
         other;
            snd-msg %char(price) + ' is a premium price.' %target(*self:2);
    endsl;
endfor;

snd-msg 'FOR-EACH with %SUBARR' %target(*self:2);
elem = 2;
for-each price in %subarr(arrprice:2:2);
    snd-msg 'The value of element ' + %char(elem) + ' is ' + %char(price) %target(*self:2);
    elem += 1;
endfor;

// FOR-EACH with ENUM
snd-msg 'FOR-EACH with ENUM' %target(*self:2);

permissionList = 'The list of permissions is';
for-each perm in permission;
    permissionList += (' ' + perm);
endfor;
snd-msg permissionList %target(*self:2);

// FOR-EACH with %LIST
snd-msg 'FOR-EACH with %LIST' %target(*self:2);

for-each phone in %list('iPhone 15':'iPhone 14':'iPhone 13');
   snd-msg 'Update available for ' + phone %target(*self:2);
endfor;

// FOR-EACH with %SPLIT
snd-msg 'FOR-EACH with %SPLIT' %target(*self:2);

sentences = 'This is the first sentence. The second one ends with a semicolon; Final sentence.';

for-each sentence in %split(sentences:'.;');
    for-each word in %split(sentence);
        numwords += 1;
    endfor;
endfor;

snd-msg '''' + sentences + '''' %target(*self:2);
snd-msg ' sentences have ' + %char(numwords) + ' words.'  %target(*self:2);

*inlr = *on;