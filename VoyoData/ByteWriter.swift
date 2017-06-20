//
//  ByteWriter.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/29/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public class ByteWriter {
    private var data : [UInt8]
    init() {
        data = []
    }
    func getBytes() -> [UInt8] { return data }
    func getData() -> NSData { return NSData(bytes: data, length: data.count) }
    func write(val:UInt8) {
        data.append(val)
    }
    func write(val:UInt16) {
        data.append(UInt8((val>>8) & 0xFF))
        data.append(UInt8(val & 0xFF))
    }
    func write(val:UInt32) {
        data.append(UInt8((val>>24) & 0xFF))
        data.append(UInt8((val>>16) & 0xFF))
        data.append(UInt8((val>>8) & 0xFF))
        data.append(UInt8(val & 0xFF))
    }
    func write(val:UInt64) {
        data.append(UInt8((val>>56) & 0xFF))
        data.append(UInt8((val>>48) & 0xFF))
        data.append(UInt8((val>>40) & 0xFF))
        data.append(UInt8((val>>32) & 0xFF))
        data.append(UInt8((val>>24) & 0xFF))
        data.append(UInt8((val>>16) & 0xFF))
        data.append(UInt8((val>>8) & 0xFF))
        data.append(UInt8(val & 0xFF))
    }
}