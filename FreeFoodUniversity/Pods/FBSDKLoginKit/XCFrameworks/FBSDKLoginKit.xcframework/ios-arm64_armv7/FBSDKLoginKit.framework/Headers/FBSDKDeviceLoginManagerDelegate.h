/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

NS_ASSUME_NONNULL_BEGIN

/*!
 @abstract A delegate for `FBSDKDeviceLoginManager`.
 */
NS_SWIFT_NAME(DeviceLoginManagerDelegate)
@protocol FBSDKDeviceLoginManagerDelegate <NSObject>

/*!
 @abstract Indicates the device login flow has started. You should parse `codeInfo` to present the code to the user to enter.
 @param loginManager the login manager instance.
 @param codeInfo the code info data.
 */

- (void)deviceLoginManager:(FBSDKDeviceLoginManager *)loginManager
       startedWithCodeInfo:(FBSDKDeviceLoginCodeInfo *)codeInfo;

/*!
 @abstract Indicates the device login flow has finished.
 @param loginManager the login manager instance.
 @param result the results of the login flow.
 @param error the error, if available.
 @discussion The flow can be finished if the user completed the flow, cancelled, or if the code has expired.
 */
- (void)deviceLoginManager:(FBSDKDeviceLoginManager *)loginManager
       completedWithResult:(nullable FBSDKDeviceLoginManagerResult *)result
                     error:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
