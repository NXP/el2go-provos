set blhost=blhost.exe
set comport=COM12,115200
set timeout=-t 100000

%blhost% -p %comport% -- get-property 0x1
pause

%blhost% -p %comport% -- fill-memory 0x20001000 0x4 0xC0000004
%blhost% -p %comport% -- configure-memory 0x9 0x20001000

%blhost% -p %comport% -- flash-erase-region 0x08000000 0x20000

%blhost% -p %comport% -- write-memory 0x20001000 "{{ 000000b000040008 }}"
%blhost% -p %comport% -- configure-memory 0x9 0x20001000
%blhost% -p %comport% -- write-memory 0x08001000 el2go_nxp_provos.sb3