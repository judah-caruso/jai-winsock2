#scope_module;
#import "Windows";
#load "c.jai";

#scope_file; 
BYTE     :: c.unsigned_char;
WORD     :: c.unsigned_short;
WCHAR    :: u16;
WSTR     :: *WCHAR;
UINT_PTR :: SOCKET;
FORMAT_MESSAGE_MAX_WIDTH_MASK ::  0x000000FF; // @Note(Judah): Should be defined in Windows

#scope_export;
/// Type-defs
WSAEVENT          :: HANDLE;
GROUP             :: c.unsigned_int;
ADDR_ANY          :: INADDR_ANY;
WSACOMPLETIONTYPE :: c.unsigned_int;

LPWSADATA :: *WSADATA;

SOCKADDR         :: sockaddr;
SOCKADDR_IN      :: sockaddr_in;
SOCKADDR_STORAGE :: sockaddr_storage;
ADDRESS_FAMILY   :: c.unsigned_short;
ADDRINFO         :: addrinfo;
LINGER           :: linger;
FD_SET           :: fd_set;
HOSTENT          :: hostent;
SERVENT          :: servent;
PROTOENT         :: protoent;
TIMEVAL          :: timeval;

CONDITIONPROC                    :: #type (lpCallerId: *WSABUF, lpCallerData: *WSABUF, lpSQOS: *QOS, lpGQOS: *QOS, lpCalleeId: *WSABUF, lpCalleeData: *WSABUF, g: *GROUP, dwCallbackData: *DWORD) -> c.int;
WSAOVERLAPPED_COMPLETION_ROUTINE :: #type (dwError: DWORD, cbTransferred: DWORD, lpOverlapped: *WSAOVERLAPPED, dwFlags: DWORD);


/// Defines
WINSOCK_VERSION : WORD : 2 | (2 << 8);

GAI_STRERROR_BUFFER_SIZE :: 1024;

SOCKET       :: u64;
SOCKET_ERROR :: -1;
INVALID_SOCKET : SOCKET : ~0;

FD_SETSIZE :: 64;

IOCPARM_MASK :: 0x7f;
IOC_VOID     :: 0x20000000;
IOC_OUT      :: 0x40000000;
IOC_IN       :: 0x80000000;
IOC_INOUT    :: IOC_IN | IOC_OUT;

// #runs might not be needed.
FIONREAD   :: #run _IOR(#char "f", 127, c.unsigned_long);
FIONBIO    :: #run _IOW(#char "f", 126, c.unsigned_long);
FIOASYNC   :: #run _IOW(#char "f", 125, c.unsigned_long);
SIOCSHIWAT :: #run _IOW(#char "s", 0, c.unsigned_long);
SIOCGHIWAT :: #run _IOR(#char "s", 1, c.unsigned_long);
SIOCSLOWAT :: #run _IOW(#char "s", 2, c.unsigned_long);
SIOCGLOWAT :: #run _IOR(#char "s", 3, c.unsigned_long);
SIOCATMARK :: #run _IOR(#char "s", 7, c.unsigned_long);

INET_ADDRSTRLEN  :: 22;
INET6_ADDRSTRLEN :: 65;

IPPROTO_IP   :: 0;
IPPROTO_ICMP :: 1;
IPPROTO_IGMP :: 2;
IPPROTO_GGP  :: 3;
IPPROTO_TCP  :: 6;
IPPROTO_PUP  :: 12;
IPPROTO_UDP  :: 17;
IPPROTO_IDP  :: 22;
IPPROTO_ND   :: 77;
IPPROTO_RAW  :: 255;
IPPROTO_MAX  :: 256;

IPPORT_ECHO       :: 7;
IPPORT_DISCARD    :: 9;
IPPORT_SYSTAT     :: 11;
IPPORT_DAYTIME    :: 13;
IPPORT_NETSTAT    :: 15;
IPPORT_FTP        :: 21;
IPPORT_TELNET     :: 23;
IPPORT_SMTP       :: 25;
IPPORT_TIMESERVER :: 37;
IPPORT_NAMESERVER :: 42;
IPPORT_WHOIS      :: 43;
IPPORT_MTP        :: 57;

IPPORT_TFTP    :: 69;
IPPORT_RJE     :: 77;
IPPORT_FINGER  :: 79;
IPPORT_TTYLINK :: 87;
IPPORT_SUPDUP  :: 95;

IPPORT_EXECSERVER  :: 512;
IPPORT_LOGINSERVER :: 513;
IPPORT_CMDSERVER   :: 514;
IPPORT_EFSSERVER   :: 520;

IPPORT_BIFFUDP     :: 512;
IPPORT_WHOSERVER   :: 513;
IPPORT_ROUTESERVER :: 520;

IPPORT_RESERVED :: 1024;

IMPLINK_IP        :: 155;
IMPLINK_LOWEXPER  :: 156;
IMPLINK_HIGHEXPER :: 158;

IN_CLASSA_NET    :: 0xff000000;
IN_CLASSA_NSHIFT :: 24;
IN_CLASSA_HOST   :: 0x00ffffff;
IN_CLASSA_MAX    :: 128;
IN_CLASSB_NET    :: 0xffff0000;
IN_CLASSB_NSHIFT :: 16;
IN_CLASSB_HOST   :: 0x0000ffff;
IN_CLASSB_MAX    :: 65536;
IN_CLASSC_NET    :: 0xffffff00;
IN_CLASSC_NSHIFT :: 8;
IN_CLASSC_HOST   :: 0x000000ff;

IP_OPTIONS         :: 1;
IP_MULTICAST_IF    :: 2;
IP_MULTICAST_TTL   :: 3;
IP_MULTICAST_LOOP  :: 4;
IP_ADD_MEMBERSHIP  :: 5;
IP_DROP_MEMBERSHIP :: 6;
IP_TTL             :: 7;
IP_TOS             :: 8;
IP_DONTFRAGMENT    :: 9;

IP_DEFAULT_MULTICAST_TTL  :: 1;
IP_DEFAULT_MULTICAST_LOOP :: 1;
IP_MAX_MEMBERSHIPS        :: 20;

INADDR_ANY       : c.unsigned_long : 0x00000000;
INADDR_BROADCAST : c.unsigned_long : 0xffffffff;
INADDR_LOOPBACK          :: 0x7f000001;
INADDR_NONE              :: 0xffffffff;

WSADESCRIPTION_LEN :: 256;
WSASYS_STATUS_LEN  :: 128;

SOCK_STREAM    :: 1;
SOCK_DGRAM     :: 2;
SOCK_RAW       :: 3;
SOCK_RDM       :: 4;
SOCK_SEQPACKET :: 5;

SOL_SOCKET :: 0xffff;
SOMAXCONN  :: 0x7fffffff;

SO_DEBUG       :: 0x0001;
SO_ACCEPTCONN  :: 0x0002;
SO_REUSEADDR   :: 0x0004;
SO_KEEPALIVE   :: 0x0008;
SO_DONTROUTE   :: 0x0010;
SO_BROADCAST   :: 0x0020;
SO_USELOOPBACK :: 0x0040;
SO_LINGER      :: 0x0080;
SO_OOBINLINE   :: 0x0100;

SO_DONTLINGER       :: ~SO_LINGER;
SO_EXCLUSIVEADDRUSE :: ~SO_REUSEADDR;

SO_GROUP_ID       :: 0x2001;
SO_GROUP_PRIORITY :: 0x2002;
SO_MAX_MSG_SIZE   :: 0x2003;
SO_PROTOCOL_INFOA :: 0x2004;
SO_PROTOCOL_INFOW :: 0x2005;

SO_SNDBUF    :: 0x1001;
SO_RCVBUF    :: 0x1002;
SO_SNDLOWAT  :: 0x1003;
SO_RCVLOWAT  :: 0x1004;
SO_SNDTIMEO  :: 0x1005;
SO_RCVTIMEO  :: 0x1006;
SO_ERROR     :: 0x1007;
SO_TYPE      :: 0x1008;
SO_BSP_STATE :: 0x1009;

SO_CONNDATA    :: 0x7000;
SO_CONNOPT     :: 0x7001;
SO_DISCDATA    :: 0x7002;
SO_DISCOPT     :: 0x7003;
SO_CONNDATALEN :: 0x7004;
SO_CONNOPTLEN  :: 0x7005;
SO_DISCDATALEN :: 0x7006;
SO_DISCOPTLEN  :: 0x7007;

SO_OPENTYPE :: 0x7008;

SO_SYNCHRONOUS_ALERT    :: 0x10;
SO_SYNCHRONOUS_NONALERT :: 0x20;

SO_MAXDG                 :: 0x7009;
SO_MAXPATHDG             :: 0x700A;
SO_UPDATE_ACCEPT_CONTEXT :: 0x700B;
SO_CONNECT_TIME          :: 0x700C;

SD_SEND :: 0x01;

SO_CONDITIONAL_ACCEPT :: 0x3002;

SO_PAUSE_ACCEPT        :: 0x3003;
SO_COMPARTMENT_ID      :: 0x3004;
SO_RANDOMIZE_PORT      :: 0x3005;
SO_PORT_SCALABILITY    :: 0x3006;
SO_REUSE_UNICASTPORT   :: 0x3007;
SO_REUSE_MULTICASTPORT :: 0x3008;
SO_MSG_SEGMENT_SIZE    :: 0x300C;  

WSK_SO_BASE :: 0x4000;

TCP_NODELAY   :: 0x0001;
TCP_BSDURGENT :: 0x7000;

AI_PASSIVE       :: 0x00000001;
AI_CANONNAME     :: 0x00000002;
AI_NUMERICHOST   :: 0x00000004;
AI_NUMERICSERV   :: 0x00000008;
AI_DNS_ONLY      :: 0x00000010;

// Address families
AF_UNSPEC     :: 0;
AF_UNIX       :: 1;
AF_INET       :: 2;
AF_IMPLINK    :: 3;
AF_PUP        :: 4;
AF_CHAOS      :: 5;
AF_IPX        :: 6;
AF_NS         :: AF_IPX;
AF_ISO        :: 7;
AF_OSI        :: AF_ISO;
AF_ECMA       :: 8;
AF_DATAKIT    :: 9;
AF_CCITT      :: 10;
AF_SNA        :: 11;
AF_DECnet     :: 12;
AF_DLI        :: 13;
AF_LAT        :: 14;
AF_HYLINK     :: 15;
AF_APPLETALK  :: 16;
AF_NETBIOS    :: 17;
AF_VOICEVIEW  :: 18;
AF_FIREFOX    :: 19;
AF_UNKNOWN1   :: 20;
AF_BAN        :: 21;
AF_ATM        :: 22;
AF_INET6      :: 23;
AF_CLUSTER    :: 24;
AF_12844      :: 25;
AF_IRDA       :: 26;
AF_NETDES     :: 28;
AF_TCNPROCESS :: 29;
AF_TCNMESSAGE :: 30;
AF_ICLFXBM    :: 31;
AF_BTH        :: 32;
AF_LINK       :: 33;
AF_HYPERV     :: 34;
AF_MAX        :: 35;

PF_UNSPEC    :: AF_UNSPEC;
PF_UNIX      :: AF_UNIX;
PF_INET      :: AF_INET;
PF_IMPLINK   :: AF_IMPLINK;
PF_PUP       :: AF_PUP;
PF_CHAOS     :: AF_CHAOS;
PF_NS        :: AF_NS;
PF_IPX       :: AF_IPX;
PF_ISO       :: AF_ISO;
PF_OSI       :: AF_OSI;
PF_ECMA      :: AF_ECMA;
PF_DATAKIT   :: AF_DATAKIT;
PF_CCITT     :: AF_CCITT;
PF_SNA       :: AF_SNA;
PF_DECnet    :: AF_DECnet;
PF_DLI       :: AF_DLI;
PF_LAT       :: AF_LAT;
PF_HYLINK    :: AF_HYLINK;
PF_APPLETALK :: AF_APPLETALK;
PF_VOICEVIEW :: AF_VOICEVIEW;
PF_FIREFOX   :: AF_FIREFOX;
PF_UNKNOWN1  :: AF_UNKNOWN1;
PF_BAN       :: AF_BAN;
PF_MAX       :: AF_MAX;

FROM_PROTOCOL_INFO :: -1;

PVD_CONFIG :: 0x3001;

MSG_OOB            :: 0x1;
MSG_PEEK           :: 0x2;
MSG_DONTROUTE      :: 0x4;
MSG_MAXIOVLEN      :: 16;
MSG_PARTIAL        :: 0x8000;
MSG_PUSH_IMMEDIATE :: 0x20;
MSG_WAITALL        :: 0x8;
MSG_INTERRUPT      :: 0x10;

MAXGETHOSTSTRUCT :: 1024;

FD_READ_BIT      :: 0;
FD_READ          :: 1 << FD_READ_BIT;
FD_WRITE_BIT     :: 1;
FD_WRITE         :: 1 << FD_WRITE_BIT;
FD_OOB_BIT       :: 2;
FD_OOB           :: 1 << FD_OOB_BIT;
FD_ACCEPT_BIT    :: 3;
FD_ACCEPT        :: 1 << FD_ACCEPT_BIT;
FD_CONNECT_BIT   :: 4;
FD_CONNECT       :: 1 << FD_CONNECT_BIT;
FD_CLOSE_BIT     :: 5;
FD_CLOSE         :: 1 << FD_CLOSE_BIT;
FD_QOS_BIT       :: 6;
FD_QOS           :: 1 << FD_QOS_BIT;
FD_GROUP_QOS_BIT :: 7;
FD_GROUP_QOS     :: 1 << FD_GROUP_QOS_BIT;

FD_ROUTING_INTERFACE_CHANGE_BIT :: 8;
FD_ROUTING_INTERFACE_CHANGE     :: 1 << FD_ROUTING_INTERFACE_CHANGE_BIT;
FD_ADDRESS_LIST_CHANGE_BIT      :: 9;
FD_ADDRESS_LIST_CHANGE          :: 1 << FD_ADDRESS_LIST_CHANGE_BIT;
FD_MAX_EVENTS                   :: 10;
FD_ALL_EVENTS                   :: (1 << FD_MAX_EVENTS) - 1;

TF_DISCONNECT   :: 0x01;
TF_REUSE_SOCKET :: 0x02;
TF_WRITE_BEHIND :: 0x04;

// Windows Sockets error codes
WSABASEERR :: 10000;

WSAEINTR  :: WSABASEERR + 4;
WSAEBADF  :: WSABASEERR + 9;
WSAEACCES :: WSABASEERR + 13;
WSAEFAULT :: WSABASEERR + 14;
WSAEINVAL :: WSABASEERR + 22;
WSAEMFILE :: WSABASEERR + 24;

// Berkeley error codes
WSAEWOULDBLOCK     :: WSABASEERR + 35;
WSAEINPROGRESS     :: WSABASEERR + 36;
WSAEALREADY        :: WSABASEERR + 37;
WSAENOTSOCK        :: WSABASEERR + 38;
WSAEDESTADDRREQ    :: WSABASEERR + 39;
WSAEMSGSIZE        :: WSABASEERR + 40;
WSAEPROTOTYPE      :: WSABASEERR + 41;
WSAENOPROTOOPT     :: WSABASEERR + 42;
WSAEPROTONOSUPPORT :: WSABASEERR + 43;
WSAESOCKTNOSUPPORT :: WSABASEERR + 44;
WSAEOPNOTSUPP      :: WSABASEERR + 45;
WSAEPFNOSUPPORT    :: WSABASEERR + 46;
WSAEAFNOSUPPORT    :: WSABASEERR + 47;
WSAEADDRINUSE      :: WSABASEERR + 48;
WSAEADDRNOTAVAIL   :: WSABASEERR + 49;
WSAENETDOWN        :: WSABASEERR + 50;
WSAENETUNREACH     :: WSABASEERR + 51;
WSAENETRESET       :: WSABASEERR + 52;
WSAECONNABORTED    :: WSABASEERR + 53;
WSAECONNRESET      :: WSABASEERR + 54;
WSAENOBUFS         :: WSABASEERR + 55;
WSAEISCONN         :: WSABASEERR + 56;
WSAENOTCONN        :: WSABASEERR + 57;
WSAESHUTDOWN       :: WSABASEERR + 58;
WSAETOOMANYREFS    :: WSABASEERR + 59;
WSAETIMEDOUT       :: WSABASEERR + 60;
WSAECONNREFUSED    :: WSABASEERR + 61;
WSAELOOP           :: WSABASEERR + 62;
WSAENAMETOOLONG    :: WSABASEERR + 63;
WSAEHOSTDOWN       :: WSABASEERR + 64;
WSAEHOSTUNREACH    :: WSABASEERR + 65;
WSAENOTEMPTY       :: WSABASEERR + 66;
WSAEPROCLIM        :: WSABASEERR + 67;
WSAEUSERS          :: WSABASEERR + 68;
WSAEDQUOT          :: WSABASEERR + 69;
WSAESTALE          :: WSABASEERR + 70;
WSAEREMOTE         :: WSABASEERR + 71;
WSASYSNOTREADY     :: WSABASEERR + 91;
WSAVERNOTSUPPORTED :: WSABASEERR + 92;
WSANOTINITIALISED  :: WSABASEERR + 93;
WSAEDISCON         :: WSABASEERR + 101;

WSAHOST_NOT_FOUND           :: WSABASEERR + 1001;
WSATRY_AGAIN                :: WSABASEERR + 1002;
WSANO_RECOVERY              :: WSABASEERR + 1003;
WSANO_DATA                  :: WSABASEERR + 1004;
WSA_SECURE_HOST_NOT_FOUND   :: WSABASEERR + 1032;
WSA_IPSEC_NAME_POLICY_ERROR :: WSABASEERR + 1033;

// Extended error codes
WSAENOMORE             :: WSABASEERR + 102;
WSAECANCELLED          :: WSABASEERR + 103;
WSAEINVALIDPROCTABLE   :: WSABASEERR + 104;
WSAEINVALIDPROVIDER    :: WSABASEERR + 105;
WSAEPROVIDERFAILEDINIT :: WSABASEERR + 106;
WSASYSCALLFAILURE      :: WSABASEERR + 107;
WSASERVICE_NOT_FOUND   :: WSABASEERR + 108;
WSATYPE_NOT_FOUND      :: WSABASEERR + 109;
WSA_E_NO_MORE          :: WSABASEERR + 110;
WSA_E_CANCELLED        :: WSABASEERR + 111;
WSAEREFUSED            :: WSABASEERR + 112;

WSA_QOS_RECEIVERS          :: WSABASEERR + 1005;
WSA_QOS_SENDERS            :: WSABASEERR + 1006;
WSA_QOS_NO_SENDERS         :: WSABASEERR + 1007;
WSA_QOS_NO_RECEIVERS       :: WSABASEERR + 1008;
WSA_QOS_REQUEST_CONFIRMED  :: WSABASEERR + 1009;
WSA_QOS_ADMISSION_FAILURE  :: WSABASEERR + 1010;
WSA_QOS_POLICY_FAILURE     :: WSABASEERR + 1011;
WSA_QOS_BAD_STYLE          :: WSABASEERR + 1012;
WSA_QOS_BAD_OBJECT         :: WSABASEERR + 1013;
WSA_QOS_TRAFFIC_CTRL_ERROR :: WSABASEERR + 1014;
WSA_QOS_GENERIC_ERROR      :: WSABASEERR + 1015;
WSA_QOS_ESERVICETYPE       :: WSABASEERR + 1016;
WSA_QOS_EFLOWSPEC          :: WSABASEERR + 1017;
WSA_QOS_EPROVSPECBUF       :: WSABASEERR + 1018;
WSA_QOS_EFILTERSTYLE       :: WSABASEERR + 1019;
WSA_QOS_EFILTERTYPE        :: WSABASEERR + 1020;
WSA_QOS_EFILTERCOUNT       :: WSABASEERR + 1021;
WSA_QOS_EOBJLENGTH         :: WSABASEERR + 1022;
WSA_QOS_EFLOWCOUNT         :: WSABASEERR + 1023;
WSA_QOS_EUNKOWNPSOBJ       :: WSABASEERR + 1024;
WSA_QOS_EPOLICYOBJ         :: WSABASEERR + 1025;
WSA_QOS_EFLOWDESC          :: WSABASEERR + 1026;
WSA_QOS_EPSFLOWSPEC        :: WSABASEERR + 1027;
WSA_QOS_EPSFILTERSPEC      :: WSABASEERR + 1028;
WSA_QOS_ESDMODEOBJ         :: WSABASEERR + 1029;
WSA_QOS_ESHAPERATEOBJ      :: WSABASEERR + 1030;
WSA_QOS_RESERVED_PETYPE    :: WSABASEERR + 1031;

WSA_IO_PENDING          :: WSAEWOULDBLOCK;
WSA_IO_INCOMPLETE       :: WSAEWOULDBLOCK;
WSA_INVALID_HANDLE      :: WSAENOTSOCK;
WSA_INVALID_PARAMETER   :: WSAEINVAL;
WSA_NOT_ENOUGH_MEMORY   :: WSAENOBUFS;
WSA_OPERATION_ABORTED   :: WSAEINTR;
MAXIMUM_WAIT_OBJECTS    :: 64;
WSA_MAXIMUM_WAIT_EVENTS :: MAXIMUM_WAIT_OBJECTS;
WSA_WAIT_FAILED         :: -1;
WSA_INFINITE            :: -1;
WSA_WAIT_EVENT_0        : DWORD : 0;
WSA_WAIT_TIMEOUT        : DWORD : 0x102;
WSA_INVALID_EVENT       : WSAEVENT : null;

WSAPROTOCOL_LEN :: 255;

CF_ACCEPT :: 0x0000;
CF_REJECT :: 0x0001;
CF_DEFER  :: 0x0002;

SG_UNCONSTRAINED_GROUP :: 0x01;
SG_CONSTRAINED_GROUP   :: 0x02;

MAX_PROTOCOL_CHAIN :: 7;
BASE_PROTOCOL      :: 1;
LAYERED_PROTOCOL   :: 0;

PFL_MULTIPLE_PROTO_ENTRIES  :: 0x00000001;
PFL_RECOMMENDED_PROTO_ENTRY :: 0x00000002;
PFL_HIDDEN                  :: 0x00000004;
PFL_MATCHES_PROTOCOL_ZERO   :: 0x00000008;
PFL_NETWORKDIRECT_PROVIDER  :: 0x00000010;

XP1_CONNECTIONLESS           :: 0x00000001;
XP1_GUARANTEED_DELIVERY      :: 0x00000002;
XP1_GUARANTEED_ORDER         :: 0x00000004;
XP1_MESSAGE_ORIENTED         :: 0x00000008;
XP1_PSEUDO_STREAM            :: 0x00000010;
XP1_GRACEFUL_CLOSE           :: 0x00000020;
XP1_EXPEDITED_DATA           :: 0x00000040;
XP1_CONNECT_DATA             :: 0x00000080;
XP1_DISCONNECT_DATA          :: 0x00000100;
XP1_SUPPORT_BROADCAST        :: 0x00000200;
XP1_SUPPORT_MULTIPOINT       :: 0x00000400;
XP1_MULTIPOINT_CONTROL_PLANE :: 0x00000800;
XP1_MULTIPOINT_DATA_PLANE    :: 0x00001000;
XP1_QOS_SUPPORTED            :: 0x00002000;
XP1_INTERRUPT                :: 0x00004000;
XP1_UNI_SEND                 :: 0x00008000;
XP1_UNI_RECV                 :: 0x00010000;
XP1_IFS_HANDLES              :: 0x00020000;
XP1_PARTIAL_MESSAGE          :: 0x00040000;
XP1_SAN_SUPPORT_SDP          :: 0x00080000;

BIGENDIAN              :: 0x0000;
LITTLEENDIAN           :: 0x0001;
SECURITY_PROTOCOL_NONE :: 0x0000;

JL_SENDER_ONLY   :: 0x01;
JL_RECEIVER_ONLY :: 0x02;
JL_BOTH          :: 0x04;

WSA_FLAG_OVERLAPPED             :: 0x01;
WSA_FLAG_MULTIPOINT_C_ROOT      :: 0x02;
WSA_FLAG_MULTIPOINT_C_LEAF      :: 0x04;
WSA_FLAG_MULTIPOINT_D_ROOT      :: 0x08;
WSA_FLAG_MULTIPOINT_D_LEAF      :: 0x10;
WSA_FLAG_ACCESS_SYSTEM_SECURITY :: 0x40;
WSA_FLAG_NO_HANDLE_INHERIT      :: 0x80;
WSA_FLAG_REGISTERED_IO          :: 0x100;

TH_NETDEV :: 0x00000001;
TH_TAPI   :: 0x00000002;

SERVICE_MULTIPLE :: 0x00000001;

NS_ALL         :: 0;
NS_SAP         :: 1;
NS_NDS         :: 2;
NS_PEER_BROWSE :: 3;
NS_SLP         :: 5;
NS_DHCP        :: 6;
NS_TCPIP_LOCAL :: 10;
NS_TCPIP_HOSTS :: 11;
NS_DNS         :: 12;
NS_NETBT       :: 13;
NS_WINS        :: 14;
NS_NLA         :: 15;
NS_BTH         :: 16;
NS_NBP         :: 20;
NS_MS          :: 30;
NS_STDA        :: 31;
NS_NTDS        :: 32;
NS_EMAIL       :: 37;
NS_PNRPNAME    :: 38;
NS_PNRPCLOUD   :: 39;
NS_X500        :: 40;
NS_NIS         :: 41;
NS_NISPLUS     :: 42;
NS_WRQ         :: 50;
NS_NETDES      :: 60;

NI_NOFQDN      :: 0x01;
NI_NUMERICHOST :: 0x02;
NI_NAMEREQD    :: 0x04;
NI_NUMERICSERV :: 0x08;
NI_DGRAM       :: 0x10;
NI_MAXHOST     :: 1025;
NI_MAXSERV     :: 32;

RES_UNUSED_1    :: 0x00000001;
RES_FLUSH_CACHE :: 0x00000002;
RES_SERVICE     :: 0x00000004;

SERVICE_TYPE_VALUE_IPXPORT  :: "IpxSocket";
SERVICE_TYPE_VALUE_SAPID    :: "SapId";
SERVICE_TYPE_VALUE_TCPPORT  :: "TcpPort";
SERVICE_TYPE_VALUE_UDPPORT  :: "UdpPort";
SERVICE_TYPE_VALUE_OBJECTID :: "ObjectId";

LUP_DEEP                :: 0x0001;
LUP_CONTAINERS          :: 0x0002;
LUP_NOCONTAINERS        :: 0x0004;
LUP_NEAREST             :: 0x0008;
LUP_RETURN_NAME         :: 0x0010;
LUP_RETURN_TYPE         :: 0x0020;
LUP_RETURN_VERSION      :: 0x0040;
LUP_RETURN_COMMENT      :: 0x0080;
LUP_RETURN_ADDR         :: 0x0100;
LUP_RETURN_BLOB         :: 0x0200;
LUP_RETURN_ALIASES      :: 0x0400;
LUP_RETURN_QUERY_STRING :: 0x0800;
LUP_RETURN_ALL          :: 0x0FF0;
LUP_RES_SERVICE         :: 0x8000;

LUP_FLUSHCACHE          :: 0x1000;
LUP_FLUSHPREVIOUS       :: 0x2000;

LUP_NON_AUTHORITATIVE      :: 0x4000;
LUP_SECURE                 :: 0x8000;
LUP_RETURN_PREFERRED_NAMES :: 0x10000;
LUP_DNS_ONLY               :: 0x20000;

LUP_ADDRCONFIG           :: 0x00100000;
LUP_DUAL_ADDR            :: 0x00200000;
LUP_FILESERVER           :: 0x00400000;
LUP_DISABLE_IDN_ENCODING :: 0x00800000;
LUP_API_ANSI             :: 0x01000000;
LUP_RESOLUTION_HANDLE    :: 0x80000000;

RESULT_IS_ADDED   :: 0x0010;
RESULT_IS_CHANGED :: 0x0020;
RESULT_IS_DELETED :: 0x0040;

POLLRDNORM :: 0x0100;
POLLRDBAND :: 0x0200;
POLLIN     :: POLLRDNORM | POLLRDBAND;
POLLPRI    :: 0x0400;
POLLWRNORM :: 0x0010;
POLLOUT    :: POLLWRNORM;
POLLWRBAND :: 0x0020;
POLLERR    :: 0x0001;
POLLHUP    :: 0x0002;
POLLNVAL   :: 0x0004;

_SS_MAXSIZE   :: 128;
_SS_ALIGNSIZE :: (size_of(s64));
_SS_PAD1SIZE  :: (_SS_ALIGNSIZE - size_of(c.unsigned_short));
_SS_PAD2SIZE  :: (_SS_MAXSIZE - (size_of(c.unsigned_short) + _SS_PAD1SIZE + _SS_ALIGNSIZE));

// Compatibility
h_errno        :: WSAGetLastError;
HOST_NOT_FOUND :: WSAHOST_NOT_FOUND;
TRY_AGAIN      :: WSATRY_AGAIN;
NO_RECOVERY    :: WSANO_RECOVERY;
NO_DATA        :: WSANO_DATA;
WSANO_ADDRESS  :: WSANO_DATA;
NO_ADDRESS     :: WSANO_ADDRESS;

// Enums
WSAECOMPARATOR :: enum u32 {
    COMP_EQUAL :: 0;
    COMP_NOTLESS;
}

WSAESETSERVICEOP :: enum u32 {
    RNRSERVICE_REGISTER :: 0;
    RNRSERVICE_DEREGISTER;
    RNRSERVICE_DELETE;
}

// Structs
WSAOVERLAPPED :: struct {
    Internal     : DWORD;
    InternalHigh : DWORD;
    Offset       : DWORD;
    OffsetHigh   : DWORD;
    hEvent       : WSAEVENT;
}

WSANETWORKEVENTS :: struct {
    lNetworkEvents : c.long;
    iErrorCode     : [FD_MAX_EVENTS]c.int;
}

WSAPROTOCOLCHAIN :: struct {
    ChainLen     : c.int;
    ChainEntries : [MAX_PROTOCOL_CHAIN]DWORD;
}

WSAPROTOCOL_INFO :: struct {
    dwServiceFlags1    : DWORD;
    dwServiceFlags2    : DWORD;
    dwServiceFlags3    : DWORD;
    dwServiceFlags4    : DWORD;
    dwProviderFlags    : DWORD;
    ProviderId         : GUID;
    dwCatalogEntryId   : DWORD;
    ProtocolChain      : WSAPROTOCOLCHAIN;
    iVersion           : c.int;
    iAddressFamily     : c.int;
    iMaxSockAddr       : c.int;
    iMinSockAddr       : c.int;
    iSocketType        : c.int;
    iProtocol          : c.int;
    iProtocolMaxOffset : c.int;
    iNetworkByteOrder  : c.int;
    iSecurityScheme    : c.int;
    dwMessageSize      : DWORD;
    dwProviderReserved : DWORD;
    szProtocol         : [WSAPROTOCOL_LEN + 1]WCHAR;
}

AFPROTOCOLS :: struct {
    iAddressFamily : c.int;
    iProtocol      : c.int;
}

WSAVERSION :: struct {
    dwVersion : DWORD;
    ecHow     : WSAECOMPARATOR;
}

WSAQUERYSET :: struct {
    dwSize                  : DWORD;
    lpszServiceInstanceName : *WSTR;
    lpServiceClassId        : *GUID;
    lpVersion               : *WSAVERSION;
    lpszComment             : *WSTR;
    dwNameSpace             : DWORD;
    lpNSProviderId          : *GUID;
    lpszContext             : *WSTR;
    dwNumberOfProtocols     : DWORD;
    lpafpProtocols          : *AFPROTOCOLS;
    lpszQueryString         : *WSTR;
    dwNumberOfCsAddrs       : DWORD;
    dwOutputFlags           : DWORD;
    lpBlob                  : *BLOB;
}

WSANSCLASSINFO :: struct {
    lpszName    : *WSTR;
    dwNameSpace : DWORD;
    dwValueType : DWORD;
    dwValueSize : DWORD;
    lpValue     : *void;
}

WSASERVICECLASSINFO :: struct {
    lpServiceClassId     : *GUID;
    lpszServiceClassName : LPSTR;
    dwCount              : DWORD;
    lpClassInfos         : *WSANSCLASSINFO;
}

WSANAMESPACE_INFO :: struct {
    NSProviderId   : GUID;
    dwNameSpace    : DWORD;
    fActive        : bool;
    dwVersion      : DWORD;
    lpszIdentifier : *WSTR;
}

WSANAMESPACE_INFOEX :: struct {
    NSProviderId     : GUID;
    dwNameSpace      : DWORD;
    fActive          : bool;
    dwVersion        : DWORD;
    lpszIdentifier   : *WSTR;
    ProviderSpecific : BLOB;
}

WSAPOLLFD :: struct {
    fd      : SOCKET;
    events  : c.short;
    revents : c.short;
}

WSABUF :: struct {
    len: c.unsigned_long;
    buf: *c.char;
}

WSACOMPLETION :: struct {
    Type: WSACOMPLETIONTYPE;
    Parameters: union {
        WindowMessage: struct {
            hWnd : HWND;
            uMsg : c.unsigned_int;
            ctx  : WPARAM;
        };
        Event: struct {
            lpOverlapped : *WSAOVERLAPPED;
        };
        Apc: struct {
            lpOverlapped  : *WSAOVERLAPPED;
            lpfnCondition : *WSAOVERLAPPED_COMPLETION_ROUTINE;
        }
        Port: struct {
            lpOverlapped: *WSAOVERLAPPED;
            hPort: HANDLE;
            Key: *c.unsigned_long;
        }
    }
}

WSAMSG :: struct {
    name          : *SOCKADDR;
    namelen       : c.int;
    lpBuffers     : *WSABUF;
    dwBufferCount : c.unsigned_long;
    Control       : WSABUF;
    dwFlags       : c.unsigned_long;
}


BLOB :: struct {
    cbSize    : c.unsigned_long;
    pBlobData : *BYTE;
}

SOCKET_ADDRESS_LIST :: struct {
    iAddressCount : c.int;
    Address       : [1]SOCKADDR;
}

timeval :: struct {
    tv_sec  : c.long;
    tv_usec : c.long;
}

hostent :: struct {
    h_name      : *c.char;
    h_aliases   : **c.char;
    h_addrtype  : c.short;
    h_length    : c.short;
    h_addr_list : **c.char;
}

netent :: struct {
    n_name     : **c.char;
    n_aliases  : **c.char;
    n_addrtype : c.short;
    n_net      : c.unsigned_long;
}

servent :: struct {
    s_name    : *c.char;
    s_aliases : **c.char;
    s_port    : c.short;
    s_proto   : *c.char;
}

protoent :: struct {
    p_name    : *c.char;
    p_aliases : **c.char;
    p_proto   : c.short;
}

sockaddr_in :: struct {
    sin_family : c.short;
    sin_port   : c.unsigned_short;
    sin_addr   : in_addr;
    sin_zero   : [8]c.char;
}

sockaddr :: struct {
    sa_family : c.unsigned_short;
    sa_data   : [14]c.char;
}

sockaddr_storage :: struct {
    ss_family: ADDRESS_FAMILY;
    __ss_pad1: [_SS_PAD1SIZE]c.char;
    __ss_align: s64;
    __ss_pad2: [_SS_PAD2SIZE]c.char;
}

ip_mreq :: struct {
    imr_multiaddr: in_addr;
    imr_interface: in_addr;
}

in_addr :: struct {
    union {
        s_un_b: struct {
            s_b1: c.unsigned_char;
            s_b2: c.unsigned_char;
            s_b3: c.unsigned_char;
            s_b4: c.unsigned_char;
        };
        s_un_w: struct  {
            s_w1: c.unsigned_short;
            s_w2: c.unsigned_short;
        };
        s_addr: c.unsigned_long;
    };
}

addrinfo :: struct {
    ai_flags     : c.int;
    ai_family    : c.int;
    ai_socktype  : c.int;
    ai_protocol  : c.int;
    ai_addrlen   : c.size_t;
    ai_canonname : *c.char;
    ai_addr      : *sockaddr;
    ai_next      : *addrinfo;
}

sockproto :: struct {
    sp_family   : c.unsigned_short;
    sp_protocol : c.unsigned_short;
}

fd_set :: struct {
    fd_count: c.unsigned_int;
    fd_array: [FD_SETSIZE]SOCKET;
}

linger :: struct {
    l_onoff  : c.unsigned_short;
    l_linger : c.unsigned_short;
}

WSADATA :: struct {
    wVersion       : WORD;
    wHighVersion   : WORD;
    szDescription  : [WSADESCRIPTION_LEN + 1]c.char;
    szSystemStatus : [WSADESCRIPTION_LEN + 1]c.char;
    iMaxSockets    : c.unsigned_short;
    iMaxUdpDg      : c.unsigned_short;
    lpVendorInfo   : *c.char;
}

TRANSMIT_FILE_BUFFERS :: struct {
    Head       : *void;
    HeadLength : DWORD;
    Tail       : *void;
    TailLength : DWORD;
}


/// Macro/procedure-conversions
_WS2_32_WINSOCK_SWAP_LONG :: (l: c.unsigned_long) -> c.unsigned_long #expand {
    return (((l >> 24) & 0x000000FF) |
            ((l >>  8) & 0x0000FF00) |
            ((l <<  8) & 0x00FF0000) |
            ((l << 24) & 0xFF000000) );
}

_WS2_32_WINSOCK_SWAP_LONGLONG :: (l: c.unsigned_long_long) -> c.unsigned_long_long #expand {
    return (((l >> 56) & 0x00000000000000FF) |
            ((l >> 40) & 0x000000000000FF00) |
            ((l >> 24) & 0x0000000000FF0000) |
            ((l >>  8) & 0x00000000FF000000) |
            ((l <<  8) & 0x000000FF00000000) |
            ((l << 24) & 0x0000FF0000000000) |
            ((l << 40) & 0x00FF000000000000) |
            ((l << 56) & 0xFF00000000000000) );
}

_IO  :: inline (x: $T, y: T) -> T { return (IOC_VOID | (x << 8) | y); }
_IOR :: inline (x: $T, y: T, $t: Type) -> T { return (IOC_OUT | ((cast(c.long)size_of(t) & IOCPARM_MASK) << 16 | (x << 8) | y)); }
_IOW :: inline (x: $T, y: T, $t: Type) -> T { return (IOC_IN  | ((cast(c.long)size_of(t) & IOCPARM_MASK) << 16 | (x << 8) | y)); }

htonll :: inline (Value: c.unsigned_long_long) -> c.unsigned_long_long {
    return _WS2_32_WINSOCK_SWAP_LONGLONG(Value);
}

ntohll :: inline (Value: c.unsigned_long_long) -> c.unsigned_long_long {
    return _WS2_32_WINSOCK_SWAP_LONGLONG(Value);
}

IN_CLASSA :: (i: int) -> bool #expand { return (cast(c.long)(i) & 0x80000000) == 0;          }
IN_CLASSB :: (i: int) -> bool #expand { return (cast(c.long)(i) & 0xc0000000) == 0x80000000; }
IN_CLASSC :: (i: int) -> bool #expand { return (cast(c.long)(i) & 0xe0000000) == 0xc0000000; }

htonf :: inline (Value: c.float) -> c.float {
    temp := <<(cast(*u32)*Value);
    return xx _WS2_32_WINSOCK_SWAP_LONG(xx temp);
}

htond :: inline (Value: c.double) -> c.unsigned_long_long {
    temp := <<(cast(*u64)*Value);
    return _WS2_32_WINSOCK_SWAP_LONGLONG(xx temp);
}

ntohd :: inline (Value: c.unsigned_long_long) -> c.double {
    temp := _WS2_32_WINSOCK_SWAP_LONGLONG(Value);
    ret_value: c.double;
    <<(cast(*u64)*ret_value) = temp;
    return ret_value;
}

gai_strerror :: inline (ecode: c.int) -> []u8 {
    buffer: [GAI_STRERROR_BUFFER_SIZE + 1]u8;

    // @Note(Judah): Should probably use FormatMessageW since this version is deprecated.
    FormatMessageA(
        FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS | FORMAT_MESSAGE_MAX_WIDTH_MASK,
        null,
        xx ecode,
        MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
        *buffer.data,
        GAI_STRERROR_BUFFER_SIZE,
        null
    );

    return buffer;
}


/// Procedures
WSAStartup                   :: (wVersionRequired: WORD, lpWSAData: *WSADATA) -> c.int                                                                                                                                                                                       #foreign winsock;
WSACleanup                   :: () -> c.int                                                                                                                                                                                                                                  #foreign winsock;
WSASetLastError              :: (iError: c.int) -> c.int                                                                                                                                                                                                                     #foreign winsock;
WSAGetLastError              :: () -> c.int                                                                                                                                                                                                                                  #foreign winsock;
WSAIsBlocking                :: () -> bool                                                                                                                                                                                                                                   #foreign winsock;
WSAUnhookBlockingHook        :: () -> c.int                                                                                                                                                                                                                                  #foreign winsock;
WSACancelBlockingCall        :: () -> c.int                                                                                                                                                                                                                                  #foreign winsock;
WSAAsyncGetServByName        :: (hWnd: HWND, wMsg: c.unsigned_int, name: *c.char, proto: *c.char, buf: *c.char, buflen: c.int) -> HANDLE                                                                                                                                     #foreign winsock;
WSAAsyncGetServByPort        :: (hWnd: HWND, wMsg: c.unsigned_int, port: c.int, proto: *c.char, buf: *c.char, buglen: c.int) -> HANDLE                                                                                                                                       #foreign winsock;
WSAAsyncGetProtoByName       :: (hWnd: HWND, wMsg: c.unsigned_int, name: *c.char, buf: *c.char, buflen: c.int) -> HANDLE                                                                                                                                                     #foreign winsock;
WSAAsyncGetProtoByNumber     :: (hWnd: HWND, wMsg: c.unsigned_int, number: c.int, buf: *c.char, buflen: c.int) -> HANDLE                                                                                                                                                     #foreign winsock;
WSAAsyncGetHostByName        :: (hWnd: HWND, wMsg: c.unsigned_int, name: *c.char, buf: *c.char, buflen: c.int) -> HANDLE                                                                                                                                                     #foreign winsock;
WSAAsyncGetHostByAddr        :: (hWnd: HWND, wMsg: c.unsigned_int, addr: *c.char, len: c.int, type: c.int, buf: *c.char, buflen: c.int) -> HANDLE                                                                                                                            #foreign winsock;
WSACancelAsyncRequest        :: (hAsyncTaskHandle: HANDLE)                           -> c.int                                                                                                                                                                                #foreign winsock;
WSAAsyncSelect               :: (s: SOCKET, hWnd: HWND, wMsg: c.unsigned_int, lEvent: c.long) -> c.int                                                                                                                                                                       #foreign winsock;
GetHostNameW                 :: (name: LPCWSTR, namelen: c.int) -> c.int                                                                                                                                                                                                     #foreign winsock;
WSAAccept                    :: (s: SOCKET, addr: *sockaddr, addrlen: *c.int, lpfnCondition: CONDITIONPROC, dwCallbackData: *DWORD) -> SOCKET                                                                                                                                #foreign winsock;
WSACloseEvent                :: (hEvent: WSAEVENT) -> bool                                                                                                                                                                                                                   #foreign winsock;
WSAConnect                   :: (s: SOCKET, name: *sockaddr, namelen: c.int, lpCallerData: *WSABUF, lpCalleeData: *WSABUF, lpSQOS: *QOS, lpGQOS: *QOS) -> c.int                                                                                                              #foreign winsock;
WSAConnectByNameW            :: (s: SOCKET, nodename: *WSTR, servicename: *WSTR, LocalAddressLength: *DWORD, LocalAddress: *SOCKADDR, RemoteAddressLength: *DWORD, RemoteAddress: *SOCKADDR, timeout: *timeval, Reserved: *OVERLAPPED) -> bool                               #foreign winsock;
WSAConnectByList             :: (s: SOCKET, SocketAddress: *SOCKET_ADDRESS_LIST, LocalAddressLength: *DWORD, LocalAddress: *SOCKADDR, RemoteAddressLength: *DWORD, RemoteAddress: *SOCKADDR, timeout: *timeval, Reserved: *OVERLAPPED) -> bool                               #foreign winsock;
WSACreateEvent               :: () -> WSAEVENT                                                                                                                                                                                                                               #foreign winsock;
WSADuplicateSocketW          :: (s: SOCKET, dwProcessId: DWORD, lpProtocolInfo: *WSAPROTOCOL_INFO) -> c.int                                                                                                                                                                  #foreign winsock;
WSAEnumNetworkEvents         :: (s: SOCKET, hEventObject: WSAEVENT, lpNetworkEvents: WSANETWORKEVENTS) -> c.int                                                                                                                                                              #foreign winsock;
WSAEnumProtocolsW            :: (lpiProtocols: *c.int, lpProtocolBuffer: *WSAPROTOCOL_INFO, lpdwBufferLength: *DWORD) -> c.int                                                                                                                                               #foreign winsock;
WSAEventSelect               :: (s: SOCKET, hEventObject: WSAEVENT, lNetworkEvents: c.long) -> c.int                                                                                                                                                                         #foreign winsock;
WSAGetOverlappedResult       :: (s: SOCKET, lpOverlapped: *WSAOVERLAPPED, lpcbTransfer: *DWORD, fWait: bool, lpdwFlags: *DWORD) -> bool                                                                                                                                      #foreign winsock;
WSAGetQOSByName              :: (s: SOCKET, lpQOSName: *WSABUF, lpQOS: *QOS) -> bool                                                                                                                                                                                         #foreign winsock;
WSAHtonl                     :: (s: SOCKET, hostlong: c.unsigned_long, ipnetlong: *c.unsigned_long) -> c.int                                                                                                                                                                 #foreign winsock;
WSAHtons                     :: (s: SOCKET, hostshort: c.unsigned_short, lpnetshort: *c.unsigned_short) -> c.int                                                                                                                                                             #foreign winsock;
WSANtohl                     :: (s: SOCKET, netlong: c.unsigned_long, lphostlong: *c.unsigned_long) -> c.int                                                                                                                                                                 #foreign winsock;
WSANtohs                     :: (s: SOCKET, netshort: c.unsigned_short, lphostshort: *c.unsigned_short) -> c.int                                                                                                                                                             #foreign winsock;
WSAIoctl                     :: (s: SOCKET, dwIoControlCode: DWORD, lpvInBuffer: *void, cbInBuffer: DWORD, lpvOutBuffer: *void, cbOutBuffer: DWORD, lpcbBytesReturned: *DWORD, lpOverlapped: WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int #foreign winsock;
WSAJoinLeaf                  :: (s: SOCKET, name: *sockaddr, namelen: c.int, lpCallerData: *WSABUF, lpCalleeData: *WSABUF, lpSQOS: *QOS, lpGQOS: *QOS, dwFlags: DWORD) -> SOCKET                                                                                             #foreign winsock;
WSARecvDisconnect            :: (s: SOCKET, lpInboundDisconnectData: *WSABUF) -> c.int                                                                                                                                                                                       #foreign winsock;
WSARecvFrom                  :: (s: SOCKET, lpBuffers: *WSABUF, dwBufferCount: DWORD, lpNumberOfBytesRecvd: *DWORD, lpFlags: *DWORD, lpFrom: *sockaddr, lpFromlen: *c.int, lpOverlapped: *WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int    #foreign winsock;
WSAResetEvent                :: (hEvent: WSAEVENT) -> bool                                                                                                                                                                                                                   #foreign winsock;
WSASend                      :: (s: SOCKET, lpBuffers: *WSABUF, dwBufferCount: DWORD, lpNumberOfBytesSent: *DWORD, dwFlags: DWORD, lpOverlapped: WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int                                             #foreign winsock;
WSASendMsg                   :: (Handle: SOCKET, lpMsg: *WSAMSG, dwFlags: DWORD, lpNumberOfBytesSent: *DWORD, lpOverlapped: WSAOVERLAPPED, lpCompletion: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int                                                                         #foreign winsock;
WSASendDisconnect            :: (s: SOCKET, lpOutboundDisconnectData: *WSABUF) -> c.int                                                                                                                                                                                      #foreign winsock;
WSASendTo                    :: (s: SOCKET, lpBuffers: *WSABUF, dwBufferCount: DWORD, lpNumberOfBytesSent: *DWORD, dwFlags: DWORD, lpTo: *sockaddr, iTolen: c.int, lpOverlapped: *WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int            #foreign winsock;
WSASetEvent                  :: (hEvent: WSAEVENT) -> bool                                                                                                                                                                                                                   #foreign winsock;
WSASocketW                   :: (af: c.int, type: c.int, protocol: c.int, lpProtocolInfo: *WSAPROTOCOL_INFO, g: GROUP, dwFlags: DWORD) -> SOCKET                                                                                                                             #foreign winsock;
WSAAddressToStringW          :: (lpsaAddress: *SOCKADDR, dwAddressLength: DWORD, lpProtocolInfo: *WSAPROTOCOL_INFO, lpszAddressString: WSTR, lpdwAddressStringLength: *DWORD) -> c.int                                                                                       #foreign winsock;
WSAStringToAddressW          :: (AddressString: WSTR, AddressFamily: c.int, lpProtocolInfo: WSAPROTOCOL_INFO, lpAddress: *SOCKADDR, lpAddressLength: *c.int) -> c.int                                                                                                        #foreign winsock;
WSALookupServiceBeginW       :: (lpqsRestrictions: WSAQUERYSET, dwControlFlags: DWORD, lphLookup: *HANDLE) -> c.int                                                                                                                                                          #foreign winsock;
WSALookupServiceNextW        :: (hLookup: HANDLE, dwControlFlags: DWORD, lpdwBufferLength: *DWORD, lpqsResults: *WSAQUERYSET) -> c.int                                                                                                                                       #foreign winsock;
WSANSPIoctl                  :: (hLookup: HANDLE, dwControlCode: DWORD, lpvInBuffer: *void, cbInBuffer: DWORD, lpvOutBuffer: *void, cbOutBuffer: DWORD, lpcbBytesReturned: *DWORD, lpCompletion: *WSACOMPLETION) -> c.int                                                    #foreign winsock;
WSALookupServiceEnd          :: (hLookup: HANDLE) -> c.int                                                                                                                                                                                                                   #foreign winsock;
WSAInstallServiceClassW      :: (lpServiceClassInfo: WSASERVICECLASSINFO) -> c.int                                                                                                                                                                                           #foreign winsock;
WSAGetServiceClassInfoW      :: (lpProviderId: *GUID, lpServiceClassId: *GUID, lpdwBufSize: *DWORD, lpServiceClassInfo: WSASERVICECLASSINFO) -> c.int                                                                                                                        #foreign winsock;
WSAEnumNameSpaceProvidersW   :: (lpdwBufferLength: *DWORD, lpnspBuffer: *WSANAMESPACE_INFO) -> c.int                                                                                                                                                                         #foreign winsock;
WSAEnumNameSpaceProvidersExW :: (lpdwBufferLength: *DWORD, lpnspBuffer: *WSANAMESPACE_INFO) -> c.int                                                                                                                                                                         #foreign winsock;
WSASetServiceW               :: (lpqsRegInfo: WSAQUERYSET, essoperation: WSAESETSERVICEOP, dwControlFlags: DWORD) -> c.int                                                                                                                                                   #foreign winsock;
WSAProviderConfigChange      :: (lpNotificationHandle: *HANDLE, lpOverlapped: *WSAOVERLAPPED, lpCompletionRoutine: WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int                                                                                                                #foreign winsock;
WSAPoll                      :: (fdArray: *WSAPOLLFD, fds: c.unsigned_long, timeout: c.int) -> c.int                                                                                                                                                                         #foreign winsock;
WSASetService                :: WSASetServiceW;
WSAEnumNameSpaceProvidersEx  :: WSAEnumNameSpaceProvidersExW;
WSAEnumNameSpaceProviders    :: WSAEnumNameSpaceProvidersW;
WSAGetServiceClassInfo       :: WSAGetServiceClassInfoW;
WSAInstallServiceClass       :: WSAInstallServiceClassW;
WSALookupServiceBegin        :: WSALookupServiceBeginW;
WSASocket                    :: WSASocketW;
WSAAddressToString           :: WSAAddressToStringW;
WSAStringToAddress           :: WSAStringToAddressW;
GetHostName                  :: GetHostNameW;
WSAConnectByName             :: WSAConnectByNameW;
WSADuplicateSocket           :: WSADuplicateSocketW;
WSAEnumProtocols             :: WSAEnumProtocolsW;

socket           :: (af: c.int, type: c.int, protocol: c.int) -> SOCKET                                                                                                                  #foreign winsock;
accept           :: (s: SOCKET, addr: *sockaddr, addrlen: *c.int) -> SOCKET                                                                                                              #foreign winsock;
bind             :: (s: SOCKET, addr: *sockaddr, namelen: c.int) -> c.int                                                                                                                #foreign winsock;
closesocket      :: (s: SOCKET) -> c.int                                                                                                                                                 #foreign winsock;
ioctlsocket      :: (s: SOCKET, cmd: c.long_long, argp: *c.unsigned_long) -> c.int                                                                                                       #foreign winsock;
getpeername      :: (s: SOCKET, name: *sockaddr, namelen: *c.int) -> c.int                                                                                                               #foreign winsock;
getsockname      :: (s: SOCKET, name: *sockaddr, namelen: *c.int) -> c.int                                                                                                               #foreign winsock;
getsockopt       :: (s: SOCKET, level: c.int, optname: c.int, optval: *c.char, optlen: c.int) -> c.int                                                                                   #foreign winsock;
listen           :: (s: SOCKET, backlog: c.int) -> c.int                                                                                                                                 #foreign winsock;
recv             :: (s: SOCKET, buf: *c.char, len: c.int, flags: c.int, fromlen: *c.int) -> c.int                                                                                        #foreign winsock;
recvfrom         :: (s: SOCKET, buf: *c.char, len: c.int, flags: c.int, from: *sockaddr, fromlen: *c.int) -> c.int                                                                       #foreign winsock;
select           :: (nfds: c.int, readfds: *fd_set, writefds: *fd_set, exceptfds: *fd_set, timeout: *timeval) -> c.int                                                                   #foreign winsock;
send             :: (s: SOCKET, buf: *c.char, len: c.int, flags: c.int) -> c.int                                                                                                         #foreign winsock;
sendto           :: (s: SOCKET, buf: *c.char, len: c.int, flags: c.int, to: *sockaddr, tolen: c.int) -> c.int                                                                            #foreign winsock;
setsockopt       :: (s: SOCKET, level: c.int, optname: c.int, optval: *c.char, optlen: c.int) -> c.int                                                                                   #foreign winsock;
shutdown         :: (s: SOCKET, how: c.int) -> c.int                                                                                                                                     #foreign winsock;
connect          :: (s: SOCKET, name: *sockaddr, namelen: c.int) -> c.int                                                                                                                #foreign winsock;
gethostbyaddr    :: (addr: *c.char, len: c.int, type: c.int) -> *hostent                                                                                                                 #foreign winsock;
gethostbyname    :: (name: *c.char) -> *hostent                                                                                                                                          #foreign winsock;
gethostname      :: (name: *c.char, namelen: c.int) -> c.int                                                                                                                             #foreign winsock;
getservbyport    :: (port: c.int, proto: *c.char) -> *servent                                                                                                                            #foreign winsock;
getservbyname    :: (name: *c.char, proto: *c.char) -> *servent                                                                                                                          #foreign winsock;
getprotobynumber :: (proto: c.int) -> *protoent                                                                                                                                          #foreign winsock;
getprotobyname   :: (name: *c.char) -> *protoent                                                                                                                                         #foreign winsock;
getnameinfo      :: (pSockaddr: *sockaddr, SockaddrLength: c.int, pNodeBuffer: *c.char, NodeBufferSize: DWORD, pServiceBuffer: *c.char, ServiceBufferSize: DWORD, Flags: c.int) -> c.int #foreign winsock;
getaddrinfo      :: (pNodeName: *c.char, pServiceName: *c.char, pHints: *addrinfo, ppResult: **addrinfo) -> c.int                                                                        #foreign winsock;
freeaddrinfo     :: (pAddrInfo: *addrinfo)                                                                                                                                               #foreign winsock;
inet_addr        :: (cp: *c.char) -> c.unsigned_long                                                                                                                                     #foreign winsock;
inet_ntoa        :: (in: in_addr) -> *c.char                                                                                                                                             #foreign winsock;
inet_pton        :: (Family: c.int, pszAddrString: *c.char, pAddrBuf: *void) -> c.int                                                                                                    #foreign winsock;
inet_ntop        :: (Family: c.int, pAddr: *void, pStringBuf: *c.char, StringBufSize: c.size_t) -> *c.char                                                                               #foreign winsock;
htonl            :: (hostlong: c.unsigned_long) -> c.unsigned_long                                                                                                                       #foreign winsock;
htons            :: (hostshort: c.unsigned_short) -> c.unsigned_short                                                                                                                    #foreign winsock;
ntohl            :: (netlong: c.unsigned_long) -> c.unsigned_long                                                                                                                        #foreign winsock;
ntohs            :: (netshort: c.unsigned_short) -> c.unsigned_short                                                                                                                     #foreign winsock;


/// Only defined in Winsock1
// WSARecvEx            :: (s: SOCKET, buf: *c.char, len: c.int, flags: *c.int) -> c.int                                                                                                                                                                    #foreign winsock;
// GetAcceptExSockaddrs :: (lpOutputBuffer: *void, dwReceiveDataLength: DWORD, dwLocalAddressLength: DWORD, dwRemoteAddressLength: DWORD, LocalSockaddr: **sockaddr, LocalSockaddrLength: *c.int, RemoteSockaddr: **sockaddr, RemoteSockaddrLength: *c.int) #foreign winsock;
// AcceptEx             :: (sListenSocket: SOCKET, sAcceptSocket: SOCKET, lpOutputBuffer: *void, dwReceiveDataLength: DWORD, dwLocalAddressLength: DWORD, dwRemoteAddressLength: DWORD, lpdwBytesReceived: *DWORD, lpOverlapped: *OVERLAPPED) -> bool       #foreign winsock;
// TransmitFile         :: (hSocket: SOCKET, hFile: HANDLE, nNumberOfBytesToWrite: DWORD, nNumberOfBytesPerSend: DWORD, lpOverlapped: *OVERLAPPED, lpTransmitBuffers: *TRANSMIT_FILE_BUFFERS, dwReserved: DWORD) -> bool                                    #foreign winsock;

winsock :: #foreign_system_library "ws2_32";

/// Extensions
#load "qos.jai";
#load "tcpip.jai";
// #load "atm.jai";
// #load "bth.jai";
// #load "spi.jai";
