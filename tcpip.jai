/// Type-defs
LOOKUPSERVICE_COMPLETION_ROUTINE :: #type (dwError: DWORD, dwBytes: DWORD, lpOverlapped: *WSAOVERLAPPED) #c_call; 

SOCKET_SECURITY_PROTOCOL :: enum u32 {
    DEFAULT;
    IPSEC;
    IPSEC2;
    INVALID;
}

/// Defines
UDP_NOCHECKSUM        :: 1;
UDP_CHECKSUM_COVERAGE :: 20;

EAI_AGAIN        :: WSATRY_AGAIN;
EAI_BADFLAGS     :: WSAEINVAL;
EAI_FAIL         :: WSANO_RECOVERY;
EAI_FAMILY       :: WSAEAFNOSUPPORT;
EAI_MEMORY       :: WSA_NOT_ENOUGH_MEMORY;
EAI_NOSECURENAME :: WSA_SECURE_HOST_NOT_FOUND;
EAI_NONAME       :: WSAHOST_NOT_FOUND;
EAI_SERVICE      :: WSATYPE_NOT_FOUND;
EAI_SOCKTYPE     :: WSAESOCKTNOSUPPORT;
EAI_IPSECPOLICY  :: WSA_IPSEC_NAME_POLICY_ERROR;
EAI_NODATA       :: EAI_NONAME;

SOCKET_SETTINGS_GUARANTEE_ENCRYPTION :: 0x00000001;
SOCKET_SETTINGS_ALLOW_INSECURE       :: 0x00000002;

SOCKET_INFO_CONNECTION_SECURED   :: 0x00000001;
SOCKET_INFO_CONNECTION_ENCRYPTED :: 0x00000002;

/// Structs
SOCKET_SECURITY_SETTINGS :: struct {
    SecurityProtocol : SOCKET_SECURITY_PROTOCOL;
    SecurityFlags    : c.unsigned_long;
}

SOCKET_SECURITY_QUERY_INFO :: struct {
    SecurityProtocol                 : SOCKET_SECURITY_PROTOCOL;
    Flags                            : c.unsigned_long;
    PeerApplicationAccessTokenHandle : u64;
    PeerMachineAccessTokenHandle     : u64;
}

SOCKET_SECURITY_QUERY_TEMPLATE :: struct {
    SecurityProtocol    : SOCKET_SECURITY_PROTOCOL;
    PeerAddress         : SOCKADDR_STORAGE;
    PeerTokenAccessMask : c.unsigned_long;   
}

SOCKET_PEER_TARGET_NAME :: struct {
    SecurityProtocol        : SOCKET_SECURITY_PROTOCOL;
    PeerAddress             : SOCKADDR_STORAGE;
    PeerTargetNameStringLen : c.unsigned_long;
    AllStrings              : [0]c.wchar_t; 
}

/// Procedures
WSASetSocketSecurity          :: (Socket: SOCKET, SecuritySettings: SOCKET_SECURITY_SETTINGS, SecuritySettingsLen: c.unsigned_long, Overlapped: *WSAOVERLAPPED, CompletionRoutine: WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int                                                                                                          #foreign ipsec;
WSAQuerySocketSecurity        :: (Socket: SOCKET, SecurityQueryTemplate: *SOCKET_SECURITY_QUERY_TEMPLATE, SecurityQueryTemplateLen: c.unsigned_long, SecurityQueryInfo: *SOCKET_SECURITY_QUERY_INFO, SecurityQueryInfoLen: *c.unsigned_long, Overlapped: *WSAOVERLAPPED, CompletionRoutine: WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int #foreign ipsec;
WSASetSocketPeerTargetName    :: (Socket: SOCKET, PeerTargetName: *SOCKET_PEER_TARGET_NAME, PeerTargetNameLen: c.unsigned_long, Overlapped: *WSAOVERLAPPED, CompletionRoutine: WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int                                                                                                              #foreign ipsec;
WSADeleteSocketPeerTargetName :: (Socket: SOCKET, PeerAddr: *sockaddr, PeerAddrLen: c.unsigned_long, Overlapped: WSAOVERLAPPED, CompletionRoutine: WSAOVERLAPPED_COMPLETION_ROUTINE) -> c.int                                                                                                                                          #foreign ipsec;
WSAImpersonateSocketPeer      :: (Socket: SOCKET, PeerAddr: *sockaddr, PeerAddrLen: c.unsigned_long) -> c.int                                                                                                                                                                                                                          #foreign ipsec;
WSARevertImpersonation        :: () -> c.int                                                                                                                                                                                                                                                                                           #foreign ipsec;

ipsec :: #foreign_system_library "Fwpuclnt";