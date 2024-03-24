**free
ctl-opt main(sndmsg);

dcl-proc sndmsg;
    dcl-ds system qualified;
        name    char(10);
        version char(4);
        TR      packed(1);
    end-ds;

    dcl-s version varchar(10) inz('V7R5');

    // snd-msg *INFO 'I'm new in ' + version
    //  *INFO is the default value so it is
    //  equivalent to:
    snd-msg 'I''m new in ' + version %target(*self:2);

    system.name    = 'System001';
    system.version = 'V7R5';
    system.TR      = 3;
    snd-msg  %msg('COM0001':'COMMONMSGF':system) %target(*self:2);

    snd-msg 'Check the job log. Messages are there too.' %target(*self:2);

    return;
end-proc;