/// Type-defs
SERVICETYPE        :: c.unsigned_long;
LPQOS_OBJECT_HDR   :: *QOS_OBJECT_HDR;
LPQOS_SD_MODE      :: *QOS_SD_MODE;
LPQOS_SHAPING_RATE :: *QOS_SHAPING_RATE;

/// Defines
SERVICETYPE_NOTRAFFIC           :: 0x00000000;  /* No data in this direction */
SERVICETYPE_BESTEFFORT          :: 0x00000001;  /* Best Effort */
SERVICETYPE_CONTROLLEDLOAD      :: 0x00000002;  /* Controlled Load */
SERVICETYPE_GUARANTEED          :: 0x00000003;  /* Guaranteed */
SERVICETYPE_NETWORK_UNAVAILABLE :: 0x00000004;  /* Used to notify change to user */
SERVICETYPE_GENERAL_INFORMATION :: 0x00000005;  /* corresponds to "General Parameters" defined by IntServ */
SERVICETYPE_NOCHANGE            :: 0x00000006;  /* used to indicate that the flow spec contains no change from any previous one */
SERVICETYPE_NONCONFORMING       :: 0x00000009;  /* Non-Conforming Traffic */
SERVICETYPE_NETWORK_CONTROL     :: 0x0000000A;  /* Network Control traffic */
SERVICETYPE_QUALITATIVE         :: 0x0000000D;  /* Qualitative applications */ 

// These are defined but the comment above them says:
// "The usage of these is currently not supported." - qos.h
SERVICE_BESTEFFORT     :: 0x80010000;
SERVICE_CONTROLLEDLOAD :: 0x80020000;
SERVICE_GUARANTEED     :: 0x80040000;
SERVICE_QUALITATIVE    :: 0x80200000;

SERVICE_NO_TRAFFIC_CONTROL :: 0x81000000;
SERVICE_NO_QOS_SIGNALING   :: 0x40000000;

QOS_NOT_SPECIFIED      :: 0xFFFFFFFF;
POSITIVE_INFINITY_RATE :: 0xFFFFFFFE;

QOS_GENERAL_ID_BASE     :: 2000;
QOS_OBJECT_END_OF_LIST  :: (0x00000001 + QOS_GENERAL_ID_BASE); /* QOS_End_of_list structure passed */
QOS_OBJECT_SD_MODE      :: (0x00000002 + QOS_GENERAL_ID_BASE); /* QOS_ShapeDiscard structure passed */
QOS_OBJECT_SHAPING_RATE :: (0x00000003 + QOS_GENERAL_ID_BASE); /* QOS_ShapingRate structure */
QOS_OBJECT_DESTADDR     :: (0x00000004 + QOS_GENERAL_ID_BASE); /* QOS_DestAddr structure (defined in qossp.h) */

TC_NONCONF_BORROW      :: 0;
TC_NONCONF_SHAPE       :: 1;
TC_NONCONF_DISCARD     :: 2;
TC_NONCONF_BORROW_PLUS :: 3; // Not supported currently (for some reason)

// Structs
QOS :: struct {
    SendingFlowspec   : FLOWSPEC;
    ReceivingFlowspec : FLOWSPEC;
    ProviderSpecific  : WSABUF;
}

FLOWSPEC :: struct {
    TokenRate          : c.unsigned_long;
    TokenBucketSize    : c.unsigned_long;
    PeakBandwidth      : c.unsigned_long;
    Latency            : c.unsigned_long;
    DelayVariation     : c.unsigned_long;
    ServiceType        : SERVICETYPE;
    MaxSduSize         : c.unsigned_long;
    MinimumPolicedSize : c.unsigned_long;
}

QOS_OBJECT_HDR :: struct {
    ObjectType   : ULONG;
    ObjectLength : ULONG;  
} 

QOS_SD_MODE :: struct {
    ObjectHdr        : QOS_OBJECT_HDR;
    ShapeDiscardMode : ULONG;
}

QOS_SHAPING_RATE :: struct {
    ObjectHdr   : QOS_OBJECT_HDR;
    ShapingRate : ULONG;
}


/// Private types
#scope_file;
ULONG :: c.unsigned_long;
