define ROOT C:\Program Files\nxlog
#define ROOT C:\Program Files (x86)\nxlog

Moduledir %ROOT%\modules
CacheDir %ROOT%\data
Pidfile %ROOT%\data\nxlog.pid
SpoolDir %ROOT%\data
LogFile %ROOT%\data\nxlog.log
LogLevel INFO

<Extension json>
    Module      xm_json
</Extension>
  
<Input mylogs>
    Module      im_file
    Files       {{ LOGFILE }}
    SavePos     TRUE
    InputType   LineBased
    Exec        to_json();
</Input>

<Output logstash>
     Module  om_ssl
     Host    logs-in.us-east4.dev.gcp.int
     Port    5080
     CAFile  %ROOT%\cert\ca.pem
</Output>

<Route logs-to-logstash>
    Path    mylogs  => logstash
</Route>