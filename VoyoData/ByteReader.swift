//
//  ByteReader.swift
//  VoyoData
//
//  Created by Eric Domeier on 4/29/16.
//  Copyright © 2016 Eric Domeier. All rights reserved.
//

import Foundation

public class ByteReader {
    private var data : [UInt8]
    private var pos : Int
    private var bufPos : Int
    init(data:[UInt8]) {
        self.data = data
        pos = 0
        bufPos = -1
    }
    func posInRange(length:Int) -> Bool {
        return pos+length <= data.count && (bufPos < 0 || pos+length <= bufPos)
    }
    
    func readUInt8() -> UInt8 {
        if posInRange(1) {
            pos += 1
            return data[pos-1]
        } else {
            return 0
        }
    }
    func readUInt16() -> UInt16 {
        if posInRange(2) {
            pos += 2
            return (UInt16(data[pos-2]) << 8) | UInt16(data[pos-1])
        } else {
            return 0
        }
    }
    func readUInt32() -> UInt32 {
        if posInRange(4) {
            pos += 4
            return (UInt32(data[pos-4]) << 24) | (UInt32(data[pos-3] << 16)) | (UInt32(data[pos-2] << 8)) | UInt32(data[pos-1])
        } else {
            return 0
        }
    }
    func readUInt64() -> UInt64 {
        if posInRange(8) {
            return (UInt64(readUInt32()<<32)) | UInt64(readUInt32())
        } else {
            return 0
        }
    }
}