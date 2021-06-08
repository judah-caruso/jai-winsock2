#import "Windows";

// === Private utilities, types, macros, etc. ===
#scope_file
c :: #import "C";

u_char  :: c.unsigned_char;
u_short :: c.unsigned_short;
u_int   :: c.unsigned_int;
u_long  :: c.unsigned_long;
u_int64 :: s64;

BYTE     :: c.unsigned_long;
WCHAR    :: u16;
WSTR     :: *WCHAR;
UINT_PTR :: SOCKET;

// === Public API ===
#scope_export
using #import "Winsock";

// Defines
WSAEVENT :: HANDLE;
GROUP    :: c.unsigned_int;
ADDR_ANY :: INADDR_ANY;
WSACOMPLETIONTYPE :: c.unsigned_int;

// SOCK_STREAM    :: 1;
// SOCK_DGRAM     :: 2;
// SOCK_RAW       :: 3;
// SOCK_RDM       :: 4;
// SOCK_SEQPACKET :: 5;

SO_EXCLUSIVEADDRUSE :: ~SO_REUSEADDR;

SO_GROUP_ID       :: 0x2001;
SO_GROUP_PRIORITY :: 0x2002;
SO_MAX_MSG_SIZE   :: 0x2003;
SO_PROTOCOL_INFOA :: 0x2004;
SO_PROTOCOL_INFOW :: 0x2005;

FROM_PROTOCOL_INFO :: -1;

PVD_CONFIG            :: 0x3001;
SO_CONDITIONAL_ACCEPT :: 0x3002;

MSG_PUSH_IMMEDIATE :: 0x20;
MSG_WAITALL        :: 0x8;
MSG_INTERRUPT      :: 0x10;

FD_READ_BIT      :: 0;
// FD_READ          :: 1 << FD_READ_BIT;
FD_WRITE_BIT     :: 1;
// FD_WRITE         :: 1 << FD_WRITE_BIT;
FD_OOB_BIT       :: 2;
// FD_OOB           :: 1 << FD_OOB_BIT;
FD_ACCEPT_BIT    :: 3;
// FD_ACCEPT        :: 1 << FD_ACCEPT_BIT;
FD_CONNECT_BIT   :: 4;
// FD_CONNECT       :: 1 << FD_CONNECT_BIT;
FD_CLOSE_BIT     :: 5;
// FD_CLOSE         :: 1 << FD_CLOSE_BIT;
FD_QOS_BIT       :: 6;
// FD_QOS           :: 1 << FD_QOS_BIT;
FD_GROUP_QOS_BIT :: 7;
// FD_GROUP_QOS     :: 1 << FD_GROUP_QOS_BIT;

FD_ROUTING_INTERFACE_CHANGE_BIT :: 8;
FD_ROUTING_INTERFACE_CHANGE     :: 1 << FD_ROUTING_INTERFACE_CHANGE_BIT;
FD_ADDRESS_LIST_CHANGE_BIT      :: 9;
FD_ADDRESS_LIST_CHANGE          :: 1 << FD_ADDRESS_LIST_CHANGE_BIT;
FD_MAX_EVENTS                   :: 10;
FD_ALL_EVENTS                   :: (1 << FD_MAX_EVENTS) - 1;

CONDITIONPROC                    :: #type (lpCallerId: *WSABUF, lpCallerData: *WSABUF, lpSQOS: *QOS, lpGQOS: *QOS, lpCalleeId: *WSABUF, lpCalleeData: *WSABUF, g: *GROUP, dwCallbackData: *DWORD) -> c.int;
WSAOVERLAPPED_COMPLETION_ROUTINE :: #type (dwError: DWORD, cbTransferred: DWORD, lpOverlapped: *WSAOVERLAPPED, dwFlags: DWORD);

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
NS_TCPIP_LOCAL :: 0;
NS_TCPIP_HOSTS :: 1;
NS_DNS         :: 2;
NS_NETBT       :: 3;
NS_WINS        :: 4;
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

// Enums
WSAECOMPARATOR :: enum
{
    COMP_EQUAL :: 0;
    COMP_NOTLESS;
}

WSAESETSERVICEOP :: enum
{
    RNRSERVICE_REGISTER :: 0;
    RNRSERVICE_DEREGISTER;
    RNRSERVICE_DELETE;
}

// Structs
WSAOVERLAPPED :: struct
{
    Internal     : DWORD;
    InternalHigh : DWORD;
    Offset       : DWORD;
    OffsetHigh   : DWORD;
    hEvent       : WSAEVENT;
}

WSANETWORKEVENTS :: struct
{
    lNetworkEvents : c.long;
    iErrorCode     : [FD_MAX_EVENTS]c.int;
}

WSAPROTOCOLCHAIN :: struct
{
    ChainLen     : c.int;
    ChainEntries : [MAX_PROTOCOL_CHAIN]DWORD;
}

WSAPROTOCOL_INFO :: struct
{
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

AFPROTOCOLS :: struct
{
    iAddressFamily : c.int;
    iProtocol      : c.int;
}

WSAVERSION :: struct
{
    dwVersion : DWORD;
    ecHow     : WSAECOMPARATOR;
}

WSAQUERYSET :: struct
{
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

WSANSCLASSINFO :: struct
{
    lpszName    : *WSTR;
    dwNameSpace : DWORD;
    dwValueType : DWORD;
    dwValueSize : DWORD;
    lpValue     : *void;
}

WSASERVICECLASSINFO :: struct
{
    lpServiceClassId     : *GUID;
    lpszServiceClassName : LPSTR;
    dwCount              : DWORD;
    lpClassInfos         : *WSANSCLASSINFO;
}

WSANAMESPACE_INFO :: struct
{
    NSProviderId   : GUID;
    dwNameSpace    : DWORD;
    fActive        : bool;
    dwVersion      : DWORD;
    lpszIdentifier : *WSTR;
}

WSANAMESPACE_INFOEX :: struct
{
    NSProviderId     : GUID;
    dwNameSpace      : DWORD;
    fActive          : bool;
    dwVersion        : DWORD;
    lpszIdentifier   : *WSTR;
    ProviderSpecific : BLOB;
}

WSAPOLLFD :: struct
{
    fd      : SOCKET;
    events  : c.short;
    revents : c.short;
}

WSABUF :: struct
{
    len: c.unsigned_long;
    buf: *c.char;
}

WSACOMPLETION :: struct
{
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

WSAMSG :: struct
{
    name          : *SOCKADDR;
    namelen       : c.int;
    lpBuffers     : *WSABUF;
    dwBufferCount : c.unsigned_long;
    Control       : WSABUF;
    dwFlags       : c.unsigned_long;
}

QOS :: struct
{
    SendingFlowspec   : FLOWSPEC;
    ReceivingFlowspec : FLOWSPEC;
    ProviderSpecific  : WSABUF;
}

// From qos.h
SERVICETYPE :: c.unsigned_long;
FLOWSPEC :: struct
{
    TokenRate          : c.unsigned_long;
    TokenBucketSize    : c.unsigned_long;
    PeakBandwidth      : c.unsigned_long;
    Latency            : c.unsigned_long;
    DelayVariation     : c.unsigned_long;
    ServiceType        : SERVICETYPE;
    MaxSduSize         : c.unsigned_long;
    MinimumPolicedSize : c.unsigned_long;
}

BLOB :: struct
{
    cbSize    : c.unsigned_long;
    pBlobData : *BYTE;
}

SOCKET_ADDRESS_LIST :: struct
{
    iAddressCount : c.int;
    Address       : [1]SOCKADDR;
}

_WS2_32_WINSOCK_SWAP_LONG :: (l: c.unsigned_long) -> c.unsigned_long
{
    return (((l >> 24) & 0x000000FF) |
            ((l >>  8) & 0x0000FF00) |
            ((l <<  8) & 0x00FF0000) |
            ((l << 24) & 0xFF000000) );
}

_WS2_32_WINSOCK_SWAP_LONGLONG :: (l: c.unsigned_long_long) -> c.unsigned_long_long
{
    return (((l >> 56) & 0x00000000000000FF) |
            ((l >> 40) & 0x000000000000FF00) |
            ((l >> 24) & 0x0000000000FF0000) |
            ((l >>  8) & 0x00000000FF000000) |
            ((l <<  8) & 0x000000FF00000000) |
            ((l << 24) & 0x0000FF0000000000) |
            ((l << 40) & 0x00FF000000000000) |
            ((l << 56) & 0xFF00000000000000) );
}

htonll :: inline (Value: c.unsigned_long_long) -> c.unsigned_long_long { return _WS2_32_WINSOCK_SWAP_LONGLONG(Value); }
ntohll :: inline (Value: c.unsigned_long_long) -> c.unsigned_long_long { return _WS2_32_WINSOCK_SWAP_LONGLONG(Value); }
// htonf  :: (Value: c.float)              -> c.float              #foreign winsock2;
// htond  :: (Value: c.double)             -> c.unsigned_long_long #foreign winsock2;
// nothd  :: (Value: c.unsigned_long_long) -> c.double             #foreign winsock2;

GetHostNameW                 :: (name: LPCWSTR, namelen: c.int)                                                                                                                                                                                                     -> c.int    #foreign winsock2;
WSAAccept                    :: (s: SOCKET, addr: *sockaddr, addrlen: *c.int, lpfnCondition: CONDITIONPROC, dwCallbackData: *DWORD)                                                                                                                                 -> SOCKET   #foreign winsock2;
WSACloseEvent                :: (hEvent: WSAEVENT)                                                                                                                                                                                                                  -> bool     #foreign winsock2;
WSAConnect                   :: (s: SOCKET, name: *sockaddr, namelen: c.int, lpCallerData: *WSABUF, lpCalleeData: *WSABUF, lpSQOS: *QOS, lpGQOS: *QOS)                                                                                                              -> c.int    #foreign winsock2;
WSAConnectByNameW            :: (s: SOCKET, nodename: *WSTR, servicename: *WSTR, LocalAddressLength: *DWORD, LocalAddress: *SOCKADDR, RemoteAddressLength: *DWORD, RemoteAddress: *SOCKADDR, timeout: *timeval, Reserved: *OVERLAPPED)                              -> bool     #foreign winsock2;
WSAConnectByList             :: (s: SOCKET, SocketAddress: *SOCKET_ADDRESS_LIST, LocalAddressLength: *DWORD, LocalAddress: *SOCKADDR, RemoteAddressLength: *DWORD, RemoteAddress: *SOCKADDR, timeout: *timeval, Reserved: *OVERLAPPED)                              -> bool     #foreign winsock2;
WSACreateEvent               :: ()                                                                                                                                                                                                                                  -> WSAEVENT #foreign winsock2;
WSADuplicateSocketW          :: (s: SOCKET, dwProcessId: DWORD, lpProtocolInfo: *WSAPROTOCOL_INFO)                                                                                                                                                                  -> c.int    #foreign winsock2;
WSAEnumNetworkEvents         :: (s: SOCKET, hEventObject: WSAEVENT, lpNetworkEvents: WSANETWORKEVENTS)                                                                                                                                                              -> c.int    #foreign winsock2;
WSAEnumProtocolsW            :: (lpiProtocols: *c.int, lpProtocolBuffer: *WSAPROTOCOL_INFO, lpdwBufferLength: *DWORD)                                                                                                                                               -> c.int    #foreign winsock2;
WSAEventSelect               :: (s: SOCKET, hEventObject: WSAEVENT, lNetworkEvents: c.long)                                                                                                                                                                         -> c.int    #foreign winsock2;
WSAGetOverlappedResult       :: (s: SOCKET, lpOverlapped: *WSAOVERLAPPED, lpcbTransfer: *DWORD, fWait: bool, lpdwFlags: *DWORD)                                                                                                                                     -> bool     #foreign winsock2;
WSAGetQOSByName              :: (s: SOCKET, lpQOSName: *WSABUF, lpQOS: *QOS)                                                                                                                                                                                        -> bool     #foreign winsock2;
WSAHtonl                     :: (s: SOCKET, hostlong: u_long, ipnetlong: *u_long)                                                                                                                                                                                   -> c.int    #foreign winsock2;
WSAHtons                     :: (s: SOCKET, hostshort: u_short, lpnetshort: *u_short)                                                                                                                                                                               -> c.int    #foreign winsock2;
WSANtohl                     :: (s: SOCKET, netlong: u_long, lphostlong: *u_long)                                                                                                                                                                                   -> c.int    #foreign winsock2;
WSANtohs                     :: (s: SOCKET, netshort: u_short, lphostshort: *u_short)                                                                                                                                                                               -> c.int    #foreign winsock2;
WSAIoctl                     :: (s: SOCKET, dwIoControlCode: DWORD, lpvInBuffer: *void, cbInBuffer: DWORD, lpvOutBuffer: *void, cbOutBuffer: DWORD, lpcbBytesReturned: *DWORD, lpOverlapped: WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int    #foreign winsock2;
WSAJoinLeaf                  :: (s: SOCKET, name: *sockaddr, namelen: c.int, lpCallerData: *WSABUF, lpCalleeData: *WSABUF, lpSQOS: *QOS, lpGQOS: *QOS, dwFlags: DWORD)                                                                                              -> SOCKET   #foreign winsock2;
WSARecvDisconnect            :: (s: SOCKET, lpInboundDisconnectData: *WSABUF) -> c.int #foreign winsock2;
WSARecvFrom                  :: (s: SOCKET, lpBuffers: *WSABUF, dwBufferCount: DWORD, lpNumberOfBytesRecvd: *DWORD, lpFlags: *DWORD, lpFrom: *sockaddr, lpFromlen: *c.int, lpOverlapped: *WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int #foreign winsock2;
WSAResetEvent                :: (hEvent: WSAEVENT) -> bool #foreign winsock2;
WSASend                      :: (s: SOCKET, lpBuffers: *WSABUF, dwBufferCount: DWORD, lpNumberOfBytesSent: *DWORD, dwFlags: DWORD, lpOverlapped: WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int #foreign winsock2;
WSASendMsg                   :: (Handle: SOCKET, lpMsg: *WSAMSG, dwFlags: DWORD, lpNumberOfBytesSent: *DWORD, lpOverlapped: WSAOVERLAPPED, lpCompletion: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int #foreign winsock2;
WSASendDisconnect            :: (s: SOCKET, lpOutboundDisconnectData: *WSABUF) -> c.int #foreign winsock2;
WSASendTo                    :: (s: SOCKET, lpBuffers: *WSABUF, dwBufferCount: DWORD, lpNumberOfBytesSent: *DWORD, dwFlags: DWORD, lpTo: *sockaddr, iTolen: c.int, lpOverlapped: *WSAOVERLAPPED, lpCompletionRoutine: *WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int #foreign winsock2;
WSASetEvent                  :: (hEvent: WSAEVENT) -> bool #foreign winsock2;
WSASocketW                   :: (af: c.int, type: c.int, protocol: c.int, lpProtocolInfo: *WSAPROTOCOL_INFO, g: GROUP, dwFlags: DWORD) -> SOCKET #foreign winsock2;
WSAAddressToStringW          :: (lpsaAddress: *SOCKADDR, dwAddressLength: DWORD, lpProtocolInfo: *WSAPROTOCOL_INFO, lpszAddressString: WSTR, lpdwAddressStringLength: *DWORD) -> c.int #foreign winsock2;
WSAStringToAddressW          :: (AddressString: WSTR, AddressFamily: c.int, lpProtocolInfo: WSAPROTOCOL_INFO, lpAddress: *SOCKADDR, lpAddressLength: *c.int) -> c.int #foreign winsock2;
WSALookupServiceBeginW       :: (lpqsRestrictions: WSAQUERYSET, dwControlFlags: DWORD, lphLookup: *HANDLE) -> c.int #foreign winsock2;
WSALookupServiceNextW        :: (hLookup: HANDLE, dwControlFlags: DWORD, lpdwBufferLength: *DWORD, lpqsResults: *WSAQUERYSET) -> c.int #foreign winsock2;
WSANSPIoctl                  :: (hLookup: HANDLE, dwControlCode: DWORD, lpvInBuffer: *void, cbInBuffer: DWORD, lpvOutBuffer: *void, cbOutBuffer: DWORD, lpcbBytesReturned: *DWORD, lpCompletion: *WSACOMPLETION) -> c.int #foreign winsock2;
WSALookupServiceEnd          :: (hLookup: HANDLE) -> c.int #foreign winsock2;
WSAInstallServiceClassW      :: (lpServiceClassInfo: WSASERVICECLASSINFO) -> c.int #foreign winsock2;
WSAGetServiceClassInfoW      :: (lpProviderId: *GUID, lpServiceClassId: *GUID, lpdwBufSize: *DWORD, lpServiceClassInfo: WSASERVICECLASSINFO) -> c.int #foreign winsock2;
WSAEnumNameSpaceProvidersW   :: (lpdwBufferLength: *DWORD, lpnspBuffer: *WSANAMESPACE_INFO) -> c.int #foreign winsock2;
WSAEnumNameSpaceProvidersExW :: (lpdwBufferLength: *DWORD, lpnspBuffer: *WSANAMESPACE_INFO) -> c.int #foreign winsock2;
WSASetServiceW               :: (lpqsRegInfo: WSAQUERYSET, essoperation: WSAESETSERVICEOP, dwControlFlags: DWORD) -> c.int #foreign winsock2;
WSAProviderConfigChange      :: (lpNotificationHandle: *HANDLE, lpOverlapped: *WSAOVERLAPPED, lpCompletionRoutine: WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int #foreign winsock2;
WSAPoll                      :: (fdArray: *WSAPOLLFD, fds: c.unsigned_long, timeout: c.int) -> c.int #foreign winsock2;

WSASetService               :: WSASetServiceW;
WSAEnumNameSpaceProvidersEx :: WSAEnumNameSpaceProvidersExW;
WSAEnumNameSpaceProviders   :: WSAEnumNameSpaceProvidersW;
WSAGetServiceClassInfo      :: WSAGetServiceClassInfoW;
WSAInstallServiceClass      :: WSAInstallServiceClassW;
WSALookupServiceBegin       :: WSALookupServiceBeginW;
WSASocket                   :: WSASocketW;
WSAAddressToString          :: WSAAddressToStringW;
WSAStringToAddress          :: WSAStringToAddressW;
GetHostName                 :: GetHostNameW;
WSAConnectByName            :: WSAConnectByNameW;
WSADuplicateSocket          :: WSADuplicateSocketW;
WSAEnumProtocols            :: WSAEnumProtocolsW;

winsock2 :: #foreign_system_library "ws2_32";

