**free
ctl-opt charcounttypes(*utf8) option(*srcstmt);

dcl-f v7r5tr3d workstn indds(indicators);

dcl-ds indicators;
  exit         ind pos(3);
  leftGreater  ind pos(40);
  rightGreater ind pos(41);
  substFrom    ind pos(42);
  substChars   ind pos(43);
  lowerGreater ind pos(44);
  lowerZero    ind pos(45);
  lowerChars   ind pos(46);
  upperGreater ind pos(47);
  upperZero    ind pos(48);
  upperChars   ind pos(49);
end-ds;

dcl-s sentencer varchar(30) ccsid(*utf8);

pgm_name = 'V7R5PT3R';
write header;
write fkeys;
exfmt prompt;

dow not exit;
  sentencer = %trim(sentence);
  select;
    when left > %charcount(sentencer);
      leftGreater = *on;
    when right > %charcount(sentencer);
      rightGreater = *on;
    when subsf > %charcount(sentencer);
      substFrom = *on;
    when (subsf + subsc) - 1 > %charcount(sentencer);
      substChars = *on;
    when lowers > %charcount(sentencer);
      lowerGreater = *on;
    when lowers = *zero;
      lowerZero = *on;
    when (lowers + lowerc) - 1 > %charcount(sentencer);
      lowerChars = *on;
    when uppers > %charcount(sentencer);
      upperGreater = *on;
    when uppers = *zero;
      upperZero = *on;
    when (uppers + upperc) - 1 > %charcount(sentencer);
      upperChars = *on;
  endsl;
  if (leftGreater or rightGreater or lowerGreater or lowerZero or lowerChars or
      upperGreater or upperZero or upperChars);
    exfmt prompt;
    iter;
  endif;
  /charcount natural
  lennat   = %len(sentencer);
  charnat  = %charcount(sentencer);
  leftnat  = %left(sentencer:left);
  rightnat = %right(sentencer:right);
  substnat = %subst(sentencer:subsf:subsc);
  lowernat = %lower(sentencer:lowers:lowerc);
  uppernat = %upper(sentencer:uppers:upperc);

  /charcount stdcharsize
  lenstd   = %len(sentencer);
  charstd  = %charcount(sentencer);
  monitor;
    leftstd  = %left(sentencer:left);
  on-excp 'RNX0453';
    leftstd = 'ERROR RNX0453';
  endmon;
  monitor;
    rightstd = %right(sentencer:right);
  on-excp 'RNX0453';
    rightstd = 'ERROR RNX0453';
  endmon;
  monitor;
    subststd = %subst(sentencer:subsf:subsc);
  on-excp 'RNX0453';
    subststd = 'ERROR RNX0453';
  endmon;
  monitor;
    lowerstd = %lower(sentencer:lowers:lowerc);
  on-excp 'RNX0125';
    lowerstd = 'ERROR RNX0125';
  endmon;
  monitor;
    upperstd = %upper(sentencer:uppers:upperc);
  on-excp 'RNX0125';
    upperstd = 'ERROR RNX0125';
  endmon;
  write result;
  exfmt prompt;
enddo;

*inlr = *on; 