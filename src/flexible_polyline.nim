import std/[math, sugar]

type
    DeEncodeError* = object of ValueError

const
    defaultPrecision = 5
    encodingTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
    decodingTable = [
        62, -1, -1, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1,
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
        22, 23, 24, 25, -1, -1, -1, -1, 63, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
        36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51
    ]
    formatVersion = 1
    absent = 0
    level = 1
    altitude = 2
    elevation = 3
    #Reserved values 4 and 5 should not be selectable
    custom1 = 6
    custom2 = 7


func decodeChar(c: char): int {.inline.} =
    decodingTable[c.int - 45]

proc decodeUnsignedValues(encoded: string): seq[int] =
    var res, shift: int
    for c in encoded:
        let val = decodeChar(c)
        res = res or ((val and 0x1F) shl shift)
        if (val and 0x20) == 0:
            result.add res
            res = 0
            shift = 0
        else:
            shift += 5
    if shift > 0:
        raise newException(DeEncodeError, "Invalid encoding")


proc decodeHeader(version, encodedHeader: int): tuple[precision, thirdDim, thirdDimPrecision: int] =
    if version != formatVersion:
        raise newException(DeEncodeError, "Invalid format version")
    let headerNumber = encodedHeader
    result.precision = headerNumber and 15
    result.thirdDim = (headerNumber shr 4) and 7
    result.thirdDimPrecision = (headerNumber shr 7) and 15


func toSigned(val: int):int {.inline.} =
    # Decode the sign from an unsigned value
    result = val
    if (result and 1) != 0:
        result = not result
    result = result shr 1


proc decode*(encoded: string): tuple[precision, thirdDim, thirdDimPrecision: int, polyline: seq[seq[float]]] =
    let
        decoder = decodeUnsignedValues(encoded)
        header = decodeHeader(decoder[0], decoder[1])
        factorDegree = 10 ^ header.precision
        factorZ = 10 ^ header.thirdDimPrecision
        thirdDim = header.thirdDim
    result.precision = header.precision
    result.thirdDim = header.thirdDim
    result.thirdDimPrecision = header.thirdDimPrecision
    var
        lastLat, lastLng, lastZ: float
    let step =
        if thirdDim != 0:
            3
        else:
            2
    result.polyline = collect:
        for i in countup(2, decoder.high, step):
            let
                deltaLat = toSigned(decoder[i]) / factorDegree
                deltaLng = toSigned(decoder[i + 1]) / factorDegree
            lastLat += deltaLat
            lastLng += deltaLng
            if thirdDim != 0:
                let deltaZ = toSigned(decoder[i + 2]) / factorZ
                lastZ += deltaZ
                @[lastLat, lastLng, lastZ]
            else:
                @[lastLat, lastLng]
    


