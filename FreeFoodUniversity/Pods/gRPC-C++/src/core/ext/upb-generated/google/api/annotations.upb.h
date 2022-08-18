/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     google/api/annotations.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef GOOGLE_API_ANNOTATIONS_PROTO_UPB_H_
#define GOOGLE_API_ANNOTATIONS_PROTO_UPB_H_

#include "upb/msg_internal.h"
#include "upb/decode.h"
#include "upb/decode_fast.h"
#include "upb/encode.h"

#include "upb/port_def.inc"

#ifdef __cplusplus
extern "C" {
#endif

extern const upb_msglayout_ext google_api_http_ext;
struct google_protobuf_MethodOptions;
extern const upb_msglayout google_protobuf_MethodOptions_msginit;

UPB_INLINE bool google_api_has_http(const struct google_protobuf_MethodOptions *msg) { return _upb_msg_getext(msg, &google_api_http_ext) != NULL; }
UPB_INLINE const struct google_api_HttpRule* google_api_http(const struct google_protobuf_MethodOptions *msg) { const upb_msg_ext *ext = _upb_msg_getext(msg, &google_api_http_ext); UPB_ASSERT(ext); return *UPB_PTR_AT(&ext->data, 0, const struct google_api_HttpRule*); }
extern const upb_msglayout_file google_api_annotations_proto_upb_file_layout;

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port_undef.inc"

#endif  /* GOOGLE_API_ANNOTATIONS_PROTO_UPB_H_ */