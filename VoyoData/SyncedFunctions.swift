//
//  SyncedFunctions.swift
//  VoyoData
//
//  Created by Eric Domeier on 5/2/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

private var vdlock = VDLock()
class VDLock { init() {} }

func syncedWithAfter(lock: AnyObject, closure: () -> (()->())) {
    objc_sync_enter(lock ?? vdlock)
    let after = closure()
    objc_sync_exit(lock ?? vdlock)
    after()
}
public func synced<T>(lock: AnyObject?, closure: () -> (T)) -> T {
    objc_sync_enter(lock ?? vdlock)
    let t = closure()
    objc_sync_exit(lock ?? vdlock)
    return t
}