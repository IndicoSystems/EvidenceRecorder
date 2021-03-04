// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct FileCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - caseId
  ///   - caseBatchId
  ///   - albumBatchId
  ///   - blurHash
  ///   - clientMediaId
  ///   - checksum
  ///   - checksumAddition
  ///   - eventAddition
  ///   - fileMetadata
  ///   - fileSize
  ///   - duration
  ///   - width
  ///   - dpi
  ///   - height
  ///   - persons
  ///   - bookmarks
  ///   - captureStartedAt
  ///   - clientIdentity
  ///   - longitude
  ///   - latitude
  ///   - postArea
  ///   - location
  ///   - mime
  ///   - originBlob
  ///   - metadata
  ///   - name
  ///   - description
  ///   - inherit
  ///   - album
  public init(caseId: Swift.Optional<String?> = nil, caseBatchId: Swift.Optional<String?> = nil, albumBatchId: Swift.Optional<String?> = nil, blurHash: Swift.Optional<String?> = nil, clientMediaId: Swift.Optional<String?> = nil, checksum: Swift.Optional<String?> = nil, checksumAddition: Swift.Optional<ChecksumCreateInput?> = nil, eventAddition: Swift.Optional<[BlobEventCreateInput]?> = nil, fileMetadata: Swift.Optional<Json?> = nil, fileSize: PositiveNonZeroInt, duration: Swift.Optional<PositiveInt?> = nil, width: Swift.Optional<PositiveInt?> = nil, dpi: Swift.Optional<PositiveInt?> = nil, height: Swift.Optional<PositiveInt?> = nil, persons: Swift.Optional<PersonCreateManyInput?> = nil, bookmarks: Swift.Optional<[BookmarkCreateWithoutFileInput]?> = nil, captureStartedAt: DateTime, clientIdentity: Swift.Optional<String?> = nil, longitude: Swift.Optional<Longitude?> = nil, latitude: Swift.Optional<Latitude?> = nil, postArea: Swift.Optional<String?> = nil, location: Swift.Optional<LocationInput?> = nil, mime: MimeType, originBlob: Swift.Optional<GraphQLID?> = nil, metadata: Swift.Optional<[MetadataCreateWithoutFileInput]?> = nil, name: Swift.Optional<ShortString?> = nil, description: Swift.Optional<LongString?> = nil, inherit: Swift.Optional<Bool?> = nil, album: Swift.Optional<AlbumWhereUniqueInputWithConnect?> = nil) {
    graphQLMap = ["caseId": caseId, "caseBatchId": caseBatchId, "albumBatchId": albumBatchId, "blurHash": blurHash, "clientMediaId": clientMediaId, "checksum": checksum, "checksumAddition": checksumAddition, "eventAddition": eventAddition, "fileMetadata": fileMetadata, "fileSize": fileSize, "duration": duration, "width": width, "dpi": dpi, "height": height, "persons": persons, "bookmarks": bookmarks, "captureStartedAt": captureStartedAt, "clientIdentity": clientIdentity, "longitude": longitude, "latitude": latitude, "postArea": postArea, "location": location, "mime": mime, "originBlob": originBlob, "metadata": metadata, "name": name, "description": description, "inherit": inherit, "album": album]
  }

  public var caseId: Swift.Optional<String?> {
    get {
      return graphQLMap["caseId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "caseId")
    }
  }

  public var caseBatchId: Swift.Optional<String?> {
    get {
      return graphQLMap["caseBatchId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "caseBatchId")
    }
  }

  public var albumBatchId: Swift.Optional<String?> {
    get {
      return graphQLMap["albumBatchId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "albumBatchId")
    }
  }

  public var blurHash: Swift.Optional<String?> {
    get {
      return graphQLMap["blurHash"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "blurHash")
    }
  }

  public var clientMediaId: Swift.Optional<String?> {
    get {
      return graphQLMap["clientMediaId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientMediaId")
    }
  }

  public var checksum: Swift.Optional<String?> {
    get {
      return graphQLMap["checksum"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "checksum")
    }
  }

  public var checksumAddition: Swift.Optional<ChecksumCreateInput?> {
    get {
      return graphQLMap["checksumAddition"] as? Swift.Optional<ChecksumCreateInput?> ?? Swift.Optional<ChecksumCreateInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "checksumAddition")
    }
  }

  public var eventAddition: Swift.Optional<[BlobEventCreateInput]?> {
    get {
      return graphQLMap["eventAddition"] as? Swift.Optional<[BlobEventCreateInput]?> ?? Swift.Optional<[BlobEventCreateInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventAddition")
    }
  }

  public var fileMetadata: Swift.Optional<Json?> {
    get {
      return graphQLMap["fileMetadata"] as? Swift.Optional<Json?> ?? Swift.Optional<Json?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fileMetadata")
    }
  }

  public var fileSize: PositiveNonZeroInt {
    get {
      return graphQLMap["fileSize"] as! PositiveNonZeroInt
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fileSize")
    }
  }

  public var duration: Swift.Optional<PositiveInt?> {
    get {
      return graphQLMap["duration"] as? Swift.Optional<PositiveInt?> ?? Swift.Optional<PositiveInt?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "duration")
    }
  }

  public var width: Swift.Optional<PositiveInt?> {
    get {
      return graphQLMap["width"] as? Swift.Optional<PositiveInt?> ?? Swift.Optional<PositiveInt?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "width")
    }
  }

  public var dpi: Swift.Optional<PositiveInt?> {
    get {
      return graphQLMap["dpi"] as? Swift.Optional<PositiveInt?> ?? Swift.Optional<PositiveInt?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "dpi")
    }
  }

  public var height: Swift.Optional<PositiveInt?> {
    get {
      return graphQLMap["height"] as? Swift.Optional<PositiveInt?> ?? Swift.Optional<PositiveInt?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "height")
    }
  }

  public var persons: Swift.Optional<PersonCreateManyInput?> {
    get {
      return graphQLMap["persons"] as? Swift.Optional<PersonCreateManyInput?> ?? Swift.Optional<PersonCreateManyInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "persons")
    }
  }

  public var bookmarks: Swift.Optional<[BookmarkCreateWithoutFileInput]?> {
    get {
      return graphQLMap["bookmarks"] as? Swift.Optional<[BookmarkCreateWithoutFileInput]?> ?? Swift.Optional<[BookmarkCreateWithoutFileInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bookmarks")
    }
  }

  public var captureStartedAt: DateTime {
    get {
      return graphQLMap["captureStartedAt"] as! DateTime
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "captureStartedAt")
    }
  }

  public var clientIdentity: Swift.Optional<String?> {
    get {
      return graphQLMap["clientIdentity"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientIdentity")
    }
  }

  public var longitude: Swift.Optional<Longitude?> {
    get {
      return graphQLMap["longitude"] as? Swift.Optional<Longitude?> ?? Swift.Optional<Longitude?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var latitude: Swift.Optional<Latitude?> {
    get {
      return graphQLMap["latitude"] as? Swift.Optional<Latitude?> ?? Swift.Optional<Latitude?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var postArea: Swift.Optional<String?> {
    get {
      return graphQLMap["postArea"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postArea")
    }
  }

  public var location: Swift.Optional<LocationInput?> {
    get {
      return graphQLMap["location"] as? Swift.Optional<LocationInput?> ?? Swift.Optional<LocationInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var mime: MimeType {
    get {
      return graphQLMap["mime"] as! MimeType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mime")
    }
  }

  public var originBlob: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["originBlob"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "originBlob")
    }
  }

  public var metadata: Swift.Optional<[MetadataCreateWithoutFileInput]?> {
    get {
      return graphQLMap["metadata"] as? Swift.Optional<[MetadataCreateWithoutFileInput]?> ?? Swift.Optional<[MetadataCreateWithoutFileInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "metadata")
    }
  }

  public var name: Swift.Optional<ShortString?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<ShortString?> ?? Swift.Optional<ShortString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var description: Swift.Optional<LongString?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<LongString?> ?? Swift.Optional<LongString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var inherit: Swift.Optional<Bool?> {
    get {
      return graphQLMap["inherit"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "inherit")
    }
  }

  public var album: Swift.Optional<AlbumWhereUniqueInputWithConnect?> {
    get {
      return graphQLMap["album"] as? Swift.Optional<AlbumWhereUniqueInputWithConnect?> ?? Swift.Optional<AlbumWhereUniqueInputWithConnect?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "album")
    }
  }
}

public struct ChecksumCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - type
  ///   - value
  public init(type: CheckSumTypes, value: ShortReqString) {
    graphQLMap = ["type": type, "value": value]
  }

  public var type: CheckSumTypes {
    get {
      return graphQLMap["type"] as! CheckSumTypes
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var value: ShortReqString {
    get {
      return graphQLMap["value"] as! ShortReqString
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

public enum CheckSumTypes: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case md5
  case sha0
  case sha1
  case sha_224
  case sha_256
  case sha_384
  case sha_512
  case sha_512_224
  case sha_512_256
  case sha3_224
  case sha3_256
  case sha3_384
  case sha3_512
  case shake_128
  case shake_256
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MD5": self = .md5
      case "SHA0": self = .sha0
      case "SHA1": self = .sha1
      case "SHA_224": self = .sha_224
      case "SHA_256": self = .sha_256
      case "SHA_384": self = .sha_384
      case "SHA_512": self = .sha_512
      case "SHA_512_224": self = .sha_512_224
      case "SHA_512_256": self = .sha_512_256
      case "SHA3_224": self = .sha3_224
      case "SHA3_256": self = .sha3_256
      case "SHA3_384": self = .sha3_384
      case "SHA3_512": self = .sha3_512
      case "SHAKE_128": self = .shake_128
      case "SHAKE_256": self = .shake_256
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .md5: return "MD5"
      case .sha0: return "SHA0"
      case .sha1: return "SHA1"
      case .sha_224: return "SHA_224"
      case .sha_256: return "SHA_256"
      case .sha_384: return "SHA_384"
      case .sha_512: return "SHA_512"
      case .sha_512_224: return "SHA_512_224"
      case .sha_512_256: return "SHA_512_256"
      case .sha3_224: return "SHA3_224"
      case .sha3_256: return "SHA3_256"
      case .sha3_384: return "SHA3_384"
      case .sha3_512: return "SHA3_512"
      case .shake_128: return "SHAKE_128"
      case .shake_256: return "SHAKE_256"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CheckSumTypes, rhs: CheckSumTypes) -> Bool {
    switch (lhs, rhs) {
      case (.md5, .md5): return true
      case (.sha0, .sha0): return true
      case (.sha1, .sha1): return true
      case (.sha_224, .sha_224): return true
      case (.sha_256, .sha_256): return true
      case (.sha_384, .sha_384): return true
      case (.sha_512, .sha_512): return true
      case (.sha_512_224, .sha_512_224): return true
      case (.sha_512_256, .sha_512_256): return true
      case (.sha3_224, .sha3_224): return true
      case (.sha3_256, .sha3_256): return true
      case (.sha3_384, .sha3_384): return true
      case (.sha3_512, .sha3_512): return true
      case (.shake_128, .shake_128): return true
      case (.shake_256, .shake_256): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CheckSumTypes] {
    return [
      .md5,
      .sha0,
      .sha1,
      .sha_224,
      .sha_256,
      .sha_384,
      .sha_512,
      .sha_512_224,
      .sha_512_256,
      .sha3_224,
      .sha3_256,
      .sha3_384,
      .sha3_512,
      .shake_128,
      .shake_256,
    ]
  }
}

public struct BlobEventCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - type
  ///   - start
  ///   - startFrame
  ///   - end
  ///   - endFrame
  public init(id: Swift.Optional<GraphQLID?> = nil, type: BlobEventType, start: Swift.Optional<DateTime?> = nil, startFrame: Swift.Optional<Int?> = nil, end: Swift.Optional<DateTime?> = nil, endFrame: Swift.Optional<Int?> = nil) {
    graphQLMap = ["id": id, "type": type, "start": start, "startFrame": startFrame, "end": end, "endFrame": endFrame]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var type: BlobEventType {
    get {
      return graphQLMap["type"] as! BlobEventType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var start: Swift.Optional<DateTime?> {
    get {
      return graphQLMap["start"] as? Swift.Optional<DateTime?> ?? Swift.Optional<DateTime?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "start")
    }
  }

  public var startFrame: Swift.Optional<Int?> {
    get {
      return graphQLMap["startFrame"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startFrame")
    }
  }

  public var end: Swift.Optional<DateTime?> {
    get {
      return graphQLMap["end"] as? Swift.Optional<DateTime?> ?? Swift.Optional<DateTime?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "end")
    }
  }

  public var endFrame: Swift.Optional<Int?> {
    get {
      return graphQLMap["endFrame"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endFrame")
    }
  }
}

public enum BlobEventType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case recording
  case incomingCall
  case lowPower
  case lowMemory
  case fatal
  case unknown
  case userEnded
  case started
  case paused
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Recording": self = .recording
      case "IncomingCall": self = .incomingCall
      case "LowPower": self = .lowPower
      case "LowMemory": self = .lowMemory
      case "Fatal": self = .fatal
      case "Unknown": self = .unknown
      case "UserEnded": self = .userEnded
      case "Started": self = .started
      case "Paused": self = .paused
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .recording: return "Recording"
      case .incomingCall: return "IncomingCall"
      case .lowPower: return "LowPower"
      case .lowMemory: return "LowMemory"
      case .fatal: return "Fatal"
      case .unknown: return "Unknown"
      case .userEnded: return "UserEnded"
      case .started: return "Started"
      case .paused: return "Paused"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: BlobEventType, rhs: BlobEventType) -> Bool {
    switch (lhs, rhs) {
      case (.recording, .recording): return true
      case (.incomingCall, .incomingCall): return true
      case (.lowPower, .lowPower): return true
      case (.lowMemory, .lowMemory): return true
      case (.fatal, .fatal): return true
      case (.unknown, .unknown): return true
      case (.userEnded, .userEnded): return true
      case (.started, .started): return true
      case (.paused, .paused): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [BlobEventType] {
    return [
      .recording,
      .incomingCall,
      .lowPower,
      .lowMemory,
      .fatal,
      .unknown,
      .userEnded,
      .started,
      .paused,
    ]
  }
}

public struct PersonCreateManyInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - create
  ///   - connect
  public init(create: Swift.Optional<[PersonCreateInput]?> = nil, connect: Swift.Optional<[PersonWhereUniqueInput]?> = nil) {
    graphQLMap = ["create": create, "connect": connect]
  }

  public var create: Swift.Optional<[PersonCreateInput]?> {
    get {
      return graphQLMap["create"] as? Swift.Optional<[PersonCreateInput]?> ?? Swift.Optional<[PersonCreateInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "create")
    }
  }

  public var connect: Swift.Optional<[PersonWhereUniqueInput]?> {
    get {
      return graphQLMap["connect"] as? Swift.Optional<[PersonWhereUniqueInput]?> ?? Swift.Optional<[PersonWhereUniqueInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "connect")
    }
  }
}

public struct PersonCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - personalId
  ///   - firstName
  ///   - lastName
  ///   - email
  ///   - phoneNumber
  ///   - gender
  ///   - dateOfBirth
  ///   - nationality
  ///   - workPlace
  ///   - address
  ///   - address2
  ///   - zipCode
  ///   - postArea
  ///   - country
  public init(personalId: Swift.Optional<ShortReqString?> = nil, firstName: Swift.Optional<ShortReqString?> = nil, lastName: Swift.Optional<ShortReqString?> = nil, email: Swift.Optional<Email?> = nil, phoneNumber: Swift.Optional<ShortReqString?> = nil, gender: Swift.Optional<ShortReqString?> = nil, dateOfBirth: Swift.Optional<DateTime?> = nil, nationality: Swift.Optional<ShortReqString?> = nil, workPlace: Swift.Optional<ShortReqString?> = nil, address: Swift.Optional<ShortReqString?> = nil, address2: Swift.Optional<ShortReqString?> = nil, zipCode: Swift.Optional<ShortReqString?> = nil, postArea: Swift.Optional<ShortReqString?> = nil, country: Swift.Optional<ShortReqString?> = nil) {
    graphQLMap = ["personalId": personalId, "firstName": firstName, "lastName": lastName, "email": email, "phoneNumber": phoneNumber, "gender": gender, "dateOfBirth": dateOfBirth, "nationality": nationality, "workPlace": workPlace, "address": address, "address2": address2, "zipCode": zipCode, "postArea": postArea, "country": country]
  }

  public var personalId: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["personalId"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "personalId")
    }
  }

  public var firstName: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var email: Swift.Optional<Email?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<Email?> ?? Swift.Optional<Email?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var phoneNumber: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["phoneNumber"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  public var gender: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var dateOfBirth: Swift.Optional<DateTime?> {
    get {
      return graphQLMap["dateOfBirth"] as? Swift.Optional<DateTime?> ?? Swift.Optional<DateTime?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "dateOfBirth")
    }
  }

  public var nationality: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["nationality"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "nationality")
    }
  }

  public var workPlace: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["workPlace"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "workPlace")
    }
  }

  public var address: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["address"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var address2: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["address2"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address2")
    }
  }

  public var zipCode: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["zipCode"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zipCode")
    }
  }

  public var postArea: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["postArea"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postArea")
    }
  }

  public var country: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["country"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "country")
    }
  }
}

public struct PersonWhereUniqueInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  public init(id: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["id": id]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct BookmarkCreateWithoutFileInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - style
  ///   - title
  ///   - description
  ///   - x
  ///   - y
  public init(style: Swift.Optional<Int?> = nil, title: Swift.Optional<ShortReqString?> = nil, description: Swift.Optional<LongString?> = nil, x: Swift.Optional<Double?> = nil, y: Swift.Optional<Double?> = nil) {
    graphQLMap = ["style": style, "title": title, "description": description, "x": x, "y": y]
  }

  public var style: Swift.Optional<Int?> {
    get {
      return graphQLMap["style"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "style")
    }
  }

  public var title: Swift.Optional<ShortReqString?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<ShortReqString?> ?? Swift.Optional<ShortReqString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: Swift.Optional<LongString?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<LongString?> ?? Swift.Optional<LongString?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var x: Swift.Optional<Double?> {
    get {
      return graphQLMap["x"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: Swift.Optional<Double?> {
    get {
      return graphQLMap["y"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }
}

public struct LocationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - longitude
  ///   - latitude
  ///   - horizontalAccuracy
  ///   - verticalAccuracy
  ///   - altitude
  ///   - fullAddress
  ///   - streetAddress
  ///   - postalCode
  ///   - country
  ///   - area1
  ///   - area2
  ///   - area3
  ///   - area4
  public init(longitude: Swift.Optional<Longitude?> = nil, latitude: Swift.Optional<Latitude?> = nil, horizontalAccuracy: Swift.Optional<Double?> = nil, verticalAccuracy: Swift.Optional<Double?> = nil, altitude: Swift.Optional<Double?> = nil, fullAddress: Swift.Optional<String?> = nil, streetAddress: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, country: Swift.Optional<String?> = nil, area1: Swift.Optional<String?> = nil, area2: Swift.Optional<String?> = nil, area3: Swift.Optional<String?> = nil, area4: Swift.Optional<String?> = nil) {
    graphQLMap = ["longitude": longitude, "latitude": latitude, "horizontalAccuracy": horizontalAccuracy, "verticalAccuracy": verticalAccuracy, "altitude": altitude, "fullAddress": fullAddress, "streetAddress": streetAddress, "postalCode": postalCode, "country": country, "area1": area1, "area2": area2, "area3": area3, "area4": area4]
  }

  public var longitude: Swift.Optional<Longitude?> {
    get {
      return graphQLMap["longitude"] as? Swift.Optional<Longitude?> ?? Swift.Optional<Longitude?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var latitude: Swift.Optional<Latitude?> {
    get {
      return graphQLMap["latitude"] as? Swift.Optional<Latitude?> ?? Swift.Optional<Latitude?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var horizontalAccuracy: Swift.Optional<Double?> {
    get {
      return graphQLMap["horizontalAccuracy"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "horizontalAccuracy")
    }
  }

  public var verticalAccuracy: Swift.Optional<Double?> {
    get {
      return graphQLMap["verticalAccuracy"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "verticalAccuracy")
    }
  }

  public var altitude: Swift.Optional<Double?> {
    get {
      return graphQLMap["altitude"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "altitude")
    }
  }

  public var fullAddress: Swift.Optional<String?> {
    get {
      return graphQLMap["fullAddress"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fullAddress")
    }
  }

  public var streetAddress: Swift.Optional<String?> {
    get {
      return graphQLMap["streetAddress"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "streetAddress")
    }
  }

  public var postalCode: Swift.Optional<String?> {
    get {
      return graphQLMap["postalCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postalCode")
    }
  }

  public var country: Swift.Optional<String?> {
    get {
      return graphQLMap["country"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "country")
    }
  }

  public var area1: Swift.Optional<String?> {
    get {
      return graphQLMap["area1"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "area1")
    }
  }

  public var area2: Swift.Optional<String?> {
    get {
      return graphQLMap["area2"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "area2")
    }
  }

  public var area3: Swift.Optional<String?> {
    get {
      return graphQLMap["area3"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "area3")
    }
  }

  public var area4: Swift.Optional<String?> {
    get {
      return graphQLMap["area4"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "area4")
    }
  }
}

public struct MetadataCreateWithoutFileInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - value
  ///   - field
  public init(value: Json, field: MetadataWhereUniqueInput) {
    graphQLMap = ["value": value, "field": field]
  }

  public var value: Json {
    get {
      return graphQLMap["value"] as! Json
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  public var field: MetadataWhereUniqueInput {
    get {
      return graphQLMap["field"] as! MetadataWhereUniqueInput
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "field")
    }
  }
}

public struct MetadataWhereUniqueInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  public init(id: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["id": id]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct AlbumWhereUniqueInputWithConnect: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - connect
  ///   - id
  public init(connect: Swift.Optional<IDID?> = nil, id: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["connect": connect, "id": id]
  }

  public var connect: Swift.Optional<IDID?> {
    get {
      return graphQLMap["connect"] as? Swift.Optional<IDID?> ?? Swift.Optional<IDID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "connect")
    }
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

/// Deprecated
public struct IDID: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public enum ViewPriorityEnum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case headline
  case shortSummary
  case fullSummary
  case `none`
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Headline": self = .headline
      case "ShortSummary": self = .shortSummary
      case "FullSummary": self = .fullSummary
      case "None": self = .none
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .headline: return "Headline"
      case .shortSummary: return "ShortSummary"
      case .fullSummary: return "FullSummary"
      case .none: return "None"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ViewPriorityEnum, rhs: ViewPriorityEnum) -> Bool {
    switch (lhs, rhs) {
      case (.headline, .headline): return true
      case (.shortSummary, .shortSummary): return true
      case (.fullSummary, .fullSummary): return true
      case (.none, .none): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ViewPriorityEnum] {
    return [
      .headline,
      .shortSummary,
      .fullSummary,
      .none,
    ]
  }
}

public enum ValueType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case int
  case string
  case float
  case date
  case dateTime
  case time
  case month
  case week
  case email
  case phone
  case url
  case file
  case null
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Int": self = .int
      case "String": self = .string
      case "Float": self = .float
      case "Date": self = .date
      case "DateTime": self = .dateTime
      case "Time": self = .time
      case "Month": self = .month
      case "Week": self = .week
      case "Email": self = .email
      case "Phone": self = .phone
      case "Url": self = .url
      case "File": self = .file
      case "Null": self = .null
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .int: return "Int"
      case .string: return "String"
      case .float: return "Float"
      case .date: return "Date"
      case .dateTime: return "DateTime"
      case .time: return "Time"
      case .month: return "Month"
      case .week: return "Week"
      case .email: return "Email"
      case .phone: return "Phone"
      case .url: return "Url"
      case .file: return "File"
      case .null: return "Null"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ValueType, rhs: ValueType) -> Bool {
    switch (lhs, rhs) {
      case (.int, .int): return true
      case (.string, .string): return true
      case (.float, .float): return true
      case (.date, .date): return true
      case (.dateTime, .dateTime): return true
      case (.time, .time): return true
      case (.month, .month): return true
      case (.week, .week): return true
      case (.email, .email): return true
      case (.phone, .phone): return true
      case (.url, .url): return true
      case (.file, .file): return true
      case (.null, .null): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ValueType] {
    return [
      .int,
      .string,
      .float,
      .date,
      .dateTime,
      .time,
      .month,
      .week,
      .email,
      .phone,
      .url,
      .file,
      .null,
    ]
  }
}

public enum InputHint: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case radio
  case input
  case textarea
  case checkbox
  case dropdown
  case divider
  case sectionHeader
  case pageBreak
  case slider
  case `switch`
  case confirm
  case videoOrAudio
  case capture
  case file
  case person
  case time
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Radio": self = .radio
      case "Input": self = .input
      case "Textarea": self = .textarea
      case "Checkbox": self = .checkbox
      case "Dropdown": self = .dropdown
      case "Divider": self = .divider
      case "SectionHeader": self = .sectionHeader
      case "PageBreak": self = .pageBreak
      case "Slider": self = .slider
      case "Switch": self = .switch
      case "Confirm": self = .confirm
      case "VideoOrAudio": self = .videoOrAudio
      case "Capture": self = .capture
      case "File": self = .file
      case "Person": self = .person
      case "Time": self = .time
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .radio: return "Radio"
      case .input: return "Input"
      case .textarea: return "Textarea"
      case .checkbox: return "Checkbox"
      case .dropdown: return "Dropdown"
      case .divider: return "Divider"
      case .sectionHeader: return "SectionHeader"
      case .pageBreak: return "PageBreak"
      case .slider: return "Slider"
      case .switch: return "Switch"
      case .confirm: return "Confirm"
      case .videoOrAudio: return "VideoOrAudio"
      case .capture: return "Capture"
      case .file: return "File"
      case .person: return "Person"
      case .time: return "Time"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: InputHint, rhs: InputHint) -> Bool {
    switch (lhs, rhs) {
      case (.radio, .radio): return true
      case (.input, .input): return true
      case (.textarea, .textarea): return true
      case (.checkbox, .checkbox): return true
      case (.dropdown, .dropdown): return true
      case (.divider, .divider): return true
      case (.sectionHeader, .sectionHeader): return true
      case (.pageBreak, .pageBreak): return true
      case (.slider, .slider): return true
      case (.switch, .switch): return true
      case (.confirm, .confirm): return true
      case (.videoOrAudio, .videoOrAudio): return true
      case (.capture, .capture): return true
      case (.file, .file): return true
      case (.person, .person): return true
      case (.time, .time): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [InputHint] {
    return [
      .radio,
      .input,
      .textarea,
      .checkbox,
      .dropdown,
      .divider,
      .sectionHeader,
      .pageBreak,
      .slider,
      .switch,
      .confirm,
      .videoOrAudio,
      .capture,
      .file,
      .person,
      .time,
    ]
  }
}

public enum FieldFeature: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case ocr
  case faceDetection
  case singleSession
  case discardable
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OCR": self = .ocr
      case "FaceDetection": self = .faceDetection
      case "SingleSession": self = .singleSession
      case "Discardable": self = .discardable
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .ocr: return "OCR"
      case .faceDetection: return "FaceDetection"
      case .singleSession: return "SingleSession"
      case .discardable: return "Discardable"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: FieldFeature, rhs: FieldFeature) -> Bool {
    switch (lhs, rhs) {
      case (.ocr, .ocr): return true
      case (.faceDetection, .faceDetection): return true
      case (.singleSession, .singleSession): return true
      case (.discardable, .discardable): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [FieldFeature] {
    return [
      .ocr,
      .faceDetection,
      .singleSession,
      .discardable,
    ]
  }
}

public enum CameraType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case axis
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Axis": self = .axis
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .axis: return "Axis"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CameraType, rhs: CameraType) -> Bool {
    switch (lhs, rhs) {
      case (.axis, .axis): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CameraType] {
    return [
      .axis,
    ]
  }
}

public struct SubmitFormInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - final
  ///   - files
  ///   - fields
  public init(`final`: Swift.Optional<Bool?> = nil, files: WhereIDin, fields: [SubmitFormFieldInput]) {
    graphQLMap = ["final": `final`, "files": files, "fields": fields]
  }

  public var `final`: Swift.Optional<Bool?> {
    get {
      return graphQLMap["final"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "final")
    }
  }

  public var files: WhereIDin {
    get {
      return graphQLMap["files"] as! WhereIDin
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "files")
    }
  }

  public var fields: [SubmitFormFieldInput] {
    get {
      return graphQLMap["fields"] as! [SubmitFormFieldInput]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fields")
    }
  }
}

public struct WhereIDin: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - idIn
  public init(idIn: Swift.Optional<[GraphQLID]?> = nil) {
    graphQLMap = ["id_in": idIn]
  }

  public var idIn: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["id_in"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id_in")
    }
  }
}

public struct SubmitFormFieldInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - value
  ///   - listValue
  ///   - files
  ///   - persons
  public init(id: GraphQLID, value: Swift.Optional<String?> = nil, listValue: Swift.Optional<[String]?> = nil, files: Swift.Optional<[FileWhereUniqueInput]?> = nil, persons: Swift.Optional<[PersonWithStatusWhereUniqueInput]?> = nil) {
    graphQLMap = ["id": id, "value": value, "listValue": listValue, "files": files, "persons": persons]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var value: Swift.Optional<String?> {
    get {
      return graphQLMap["value"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  public var listValue: Swift.Optional<[String]?> {
    get {
      return graphQLMap["listValue"] as? Swift.Optional<[String]?> ?? Swift.Optional<[String]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "listValue")
    }
  }

  public var files: Swift.Optional<[FileWhereUniqueInput]?> {
    get {
      return graphQLMap["files"] as? Swift.Optional<[FileWhereUniqueInput]?> ?? Swift.Optional<[FileWhereUniqueInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "files")
    }
  }

  public var persons: Swift.Optional<[PersonWithStatusWhereUniqueInput]?> {
    get {
      return graphQLMap["persons"] as? Swift.Optional<[PersonWithStatusWhereUniqueInput]?> ?? Swift.Optional<[PersonWithStatusWhereUniqueInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "persons")
    }
  }
}

public struct FileWhereUniqueInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - clientMediaId
  public init(id: Swift.Optional<GraphQLID?> = nil, clientMediaId: Swift.Optional<String?> = nil) {
    graphQLMap = ["id": id, "clientMediaId": clientMediaId]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var clientMediaId: Swift.Optional<String?> {
    get {
      return graphQLMap["clientMediaId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientMediaId")
    }
  }
}

public struct PersonWithStatusWhereUniqueInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  public init(id: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["id": id]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public final class CreateFileMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateFile($data: FileCreateInput!) {
      createFile(data: $data) {
        __typename
        id
        uploadPath
        storageKey
      }
    }
    """

  public let operationName: String = "CreateFile"

  public var data: FileCreateInput

  public init(data: FileCreateInput) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createFile", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(CreateFile.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createFile: CreateFile) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createFile": createFile.resultMap])
    }

    public var createFile: CreateFile {
      get {
        return CreateFile(unsafeResultMap: resultMap["createFile"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createFile")
      }
    }

    public struct CreateFile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["File"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("uploadPath", type: .nonNull(.scalar(String.self))),
          GraphQLField("storageKey", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, uploadPath: String, storageKey: String) {
        self.init(unsafeResultMap: ["__typename": "File", "id": id, "uploadPath": uploadPath, "storageKey": storageKey])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Path to where one should upload when creating the file.
      /// 
      /// Uploading using [TUS](https://tus.io/) is supported
      public var uploadPath: String {
        get {
          return resultMap["uploadPath"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "uploadPath")
        }
      }

      /// Key pointing to the underlying object in storage.
      public var storageKey: String {
        get {
          return resultMap["storageKey"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "storageKey")
        }
      }
    }
  }
}

public final class GetFormsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetForms {
      settings {
        __typename
        capture {
          __typename
          requiredForms {
            __typename
            forms {
              __typename
              formType {
                __typename
                displayName(ietf: true)
              }
              form {
                __typename
                id
                allowIncomplete
                fields(orderBy: order_ASC) {
                  __typename
                  id
                  personCategories {
                    __typename
                    key
                    localizations {
                      __typename
                      language
                      value
                    }
                  }
                  title(ietf: true)
                  placeholder(ietf: true)
                  description(ietf: true)
                  editable
                  required
                  viewPriority
                  valueType
                  inputHint
                  features
                  min
                  max
                  minCount
                  maxCount
                  step
                  pattern
                  listValues {
                    __typename
                    value
                    defaultSelected
                    displayName(ietf: true)
                  }
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetForms"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("settings", type: .nonNull(.object(Setting.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(settings: Setting) {
      self.init(unsafeResultMap: ["__typename": "Query", "settings": settings.resultMap])
    }

    public var settings: Setting {
      get {
        return Setting(unsafeResultMap: resultMap["settings"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "settings")
      }
    }

    public struct Setting: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Settings"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("capture", type: .object(Capture.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(capture: Capture? = nil) {
        self.init(unsafeResultMap: ["__typename": "Settings", "capture": capture.flatMap { (value: Capture) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var capture: Capture? {
        get {
          return (resultMap["capture"] as? ResultMap).flatMap { Capture(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "capture")
        }
      }

      public struct Capture: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CaptureSettings"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("requiredForms", type: .object(RequiredForm.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(requiredForms: RequiredForm? = nil) {
          self.init(unsafeResultMap: ["__typename": "CaptureSettings", "requiredForms": requiredForms.flatMap { (value: RequiredForm) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Any forms that should be used. Each entry will result in a seperate button in the app.
        public var requiredForms: RequiredForm? {
          get {
            return (resultMap["requiredForms"] as? ResultMap).flatMap { RequiredForm(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "requiredForms")
          }
        }

        public struct RequiredForm: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["RequiredFormSetting"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("forms", type: .nonNull(.list(.nonNull(.object(Form.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(forms: [Form]) {
            self.init(unsafeResultMap: ["__typename": "RequiredFormSetting", "forms": forms.map { (value: Form) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var forms: [Form] {
            get {
              return (resultMap["forms"] as! [ResultMap]).map { (value: ResultMap) -> Form in Form(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Form) -> ResultMap in value.resultMap }, forKey: "forms")
            }
          }

          public struct Form: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["RequiredFormSettings"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("formType", type: .nonNull(.object(FormType.selections))),
                GraphQLField("form", type: .nonNull(.object(Form.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(formType: FormType, form: Form) {
              self.init(unsafeResultMap: ["__typename": "RequiredFormSettings", "formType": formType.resultMap, "form": form.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var formType: FormType {
              get {
                return FormType(unsafeResultMap: resultMap["formType"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "formType")
              }
            }

            public var form: Form {
              get {
                return Form(unsafeResultMap: resultMap["form"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "form")
              }
            }

            public struct FormType: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["FormType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("displayName", arguments: ["ietf": true], type: .nonNull(.scalar(Json.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(displayName: Json) {
                self.init(unsafeResultMap: ["__typename": "FormType", "displayName": displayName])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var displayName: Json {
                get {
                  return resultMap["displayName"]! as! Json
                }
                set {
                  resultMap.updateValue(newValue, forKey: "displayName")
                }
              }
            }

            public struct Form: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Form"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("allowIncomplete", type: .nonNull(.scalar(Bool.self))),
                  GraphQLField("fields", arguments: ["orderBy": "order_ASC"], type: .list(.nonNull(.object(Field.selections)))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, allowIncomplete: Bool, fields: [Field]? = nil) {
                self.init(unsafeResultMap: ["__typename": "Form", "id": id, "allowIncomplete": allowIncomplete, "fields": fields.flatMap { (value: [Field]) -> [ResultMap] in value.map { (value: Field) -> ResultMap in value.resultMap } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var allowIncomplete: Bool {
                get {
                  return resultMap["allowIncomplete"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "allowIncomplete")
                }
              }

              public var fields: [Field]? {
                get {
                  return (resultMap["fields"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Field] in value.map { (value: ResultMap) -> Field in Field(unsafeResultMap: value) } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Field]) -> [ResultMap] in value.map { (value: Field) -> ResultMap in value.resultMap } }, forKey: "fields")
                }
              }

              public struct Field: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["FormField"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("personCategories", type: .nonNull(.list(.nonNull(.object(PersonCategory.selections))))),
                    GraphQLField("title", arguments: ["ietf": true], type: .nonNull(.scalar(Json.self))),
                    GraphQLField("placeholder", arguments: ["ietf": true], type: .nonNull(.scalar(Json.self))),
                    GraphQLField("description", arguments: ["ietf": true], type: .nonNull(.scalar(Json.self))),
                    GraphQLField("editable", type: .nonNull(.scalar(Bool.self))),
                    GraphQLField("required", type: .nonNull(.scalar(Bool.self))),
                    GraphQLField("viewPriority", type: .scalar(ViewPriorityEnum.self)),
                    GraphQLField("valueType", type: .nonNull(.scalar(ValueType.self))),
                    GraphQLField("inputHint", type: .nonNull(.scalar(InputHint.self))),
                    GraphQLField("features", type: .list(.nonNull(.scalar(FieldFeature.self)))),
                    GraphQLField("min", type: .scalar(Double.self)),
                    GraphQLField("max", type: .scalar(Double.self)),
                    GraphQLField("minCount", type: .scalar(Int.self)),
                    GraphQLField("maxCount", type: .scalar(Int.self)),
                    GraphQLField("step", type: .scalar(Int.self)),
                    GraphQLField("pattern", type: .scalar(String.self)),
                    GraphQLField("listValues", type: .nonNull(.list(.nonNull(.object(ListValue.selections))))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, personCategories: [PersonCategory], title: Json, placeholder: Json, description: Json, editable: Bool, `required`: Bool, viewPriority: ViewPriorityEnum? = nil, valueType: ValueType, inputHint: InputHint, features: [FieldFeature]? = nil, min: Double? = nil, max: Double? = nil, minCount: Int? = nil, maxCount: Int? = nil, step: Int? = nil, pattern: String? = nil, listValues: [ListValue]) {
                  self.init(unsafeResultMap: ["__typename": "FormField", "id": id, "personCategories": personCategories.map { (value: PersonCategory) -> ResultMap in value.resultMap }, "title": title, "placeholder": placeholder, "description": description, "editable": editable, "required": `required`, "viewPriority": viewPriority, "valueType": valueType, "inputHint": inputHint, "features": features, "min": min, "max": max, "minCount": minCount, "maxCount": maxCount, "step": step, "pattern": pattern, "listValues": listValues.map { (value: ListValue) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                public var personCategories: [PersonCategory] {
                  get {
                    return (resultMap["personCategories"] as! [ResultMap]).map { (value: ResultMap) -> PersonCategory in PersonCategory(unsafeResultMap: value) }
                  }
                  set {
                    resultMap.updateValue(newValue.map { (value: PersonCategory) -> ResultMap in value.resultMap }, forKey: "personCategories")
                  }
                }

                public var title: Json {
                  get {
                    return resultMap["title"]! as! Json
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "title")
                  }
                }

                public var placeholder: Json {
                  get {
                    return resultMap["placeholder"]! as! Json
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "placeholder")
                  }
                }

                public var description: Json {
                  get {
                    return resultMap["description"]! as! Json
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "description")
                  }
                }

                public var editable: Bool {
                  get {
                    return resultMap["editable"]! as! Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "editable")
                  }
                }

                public var `required`: Bool {
                  get {
                    return resultMap["required"]! as! Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "required")
                  }
                }

                public var viewPriority: ViewPriorityEnum? {
                  get {
                    return resultMap["viewPriority"] as? ViewPriorityEnum
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "viewPriority")
                  }
                }

                public var valueType: ValueType {
                  get {
                    return resultMap["valueType"]! as! ValueType
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "valueType")
                  }
                }

                public var inputHint: InputHint {
                  get {
                    return resultMap["inputHint"]! as! InputHint
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "inputHint")
                  }
                }

                public var features: [FieldFeature]? {
                  get {
                    return resultMap["features"] as? [FieldFeature]
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "features")
                  }
                }

                public var min: Double? {
                  get {
                    return resultMap["min"] as? Double
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "min")
                  }
                }

                public var max: Double? {
                  get {
                    return resultMap["max"] as? Double
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "max")
                  }
                }

                public var minCount: Int? {
                  get {
                    return resultMap["minCount"] as? Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "minCount")
                  }
                }

                public var maxCount: Int? {
                  get {
                    return resultMap["maxCount"] as? Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "maxCount")
                  }
                }

                public var step: Int? {
                  get {
                    return resultMap["step"] as? Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "step")
                  }
                }

                public var pattern: String? {
                  get {
                    return resultMap["pattern"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "pattern")
                  }
                }

                public var listValues: [ListValue] {
                  get {
                    return (resultMap["listValues"] as! [ResultMap]).map { (value: ResultMap) -> ListValue in ListValue(unsafeResultMap: value) }
                  }
                  set {
                    resultMap.updateValue(newValue.map { (value: ListValue) -> ResultMap in value.resultMap }, forKey: "listValues")
                  }
                }

                public struct PersonCategory: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Status"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("key", type: .nonNull(.scalar(String.self))),
                      GraphQLField("localizations", type: .list(.nonNull(.object(Localization.selections)))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(key: String, localizations: [Localization]? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Status", "key": key, "localizations": localizations.flatMap { (value: [Localization]) -> [ResultMap] in value.map { (value: Localization) -> ResultMap in value.resultMap } }])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var key: String {
                    get {
                      return resultMap["key"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "key")
                    }
                  }

                  public var localizations: [Localization]? {
                    get {
                      return (resultMap["localizations"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Localization] in value.map { (value: ResultMap) -> Localization in Localization(unsafeResultMap: value) } }
                    }
                    set {
                      resultMap.updateValue(newValue.flatMap { (value: [Localization]) -> [ResultMap] in value.map { (value: Localization) -> ResultMap in value.resultMap } }, forKey: "localizations")
                    }
                  }

                  public struct Localization: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Localization"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("language", type: .nonNull(.scalar(String.self))),
                        GraphQLField("value", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(language: String, value: String) {
                      self.init(unsafeResultMap: ["__typename": "Localization", "language": language, "value": value])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var language: String {
                      get {
                        return resultMap["language"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "language")
                      }
                    }

                    public var value: String {
                      get {
                        return resultMap["value"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "value")
                      }
                    }
                  }
                }

                public struct ListValue: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["ListValue"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("value", type: .nonNull(.scalar(String.self))),
                      GraphQLField("defaultSelected", type: .nonNull(.scalar(Bool.self))),
                      GraphQLField("displayName", arguments: ["ietf": true], type: .nonNull(.scalar(Json.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(value: String, defaultSelected: Bool, displayName: Json) {
                    self.init(unsafeResultMap: ["__typename": "ListValue", "value": value, "defaultSelected": defaultSelected, "displayName": displayName])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var value: String {
                    get {
                      return resultMap["value"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "value")
                    }
                  }

                  public var defaultSelected: Bool {
                    get {
                      return resultMap["defaultSelected"]! as! Bool
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "defaultSelected")
                    }
                  }

                  public var displayName: Json {
                    get {
                      return resultMap["displayName"]! as! Json
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "displayName")
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetRoomsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRooms {
      rooms {
        __typename
        id
        name
        description
        cameras {
          __typename
          id
          name
          description
          address
          type
        }
      }
    }
    """

  public let operationName: String = "GetRooms"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rooms", type: .nonNull(.list(.nonNull(.object(Room.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rooms: [Room]) {
      self.init(unsafeResultMap: ["__typename": "Query", "rooms": rooms.map { (value: Room) -> ResultMap in value.resultMap }])
    }

    public var rooms: [Room] {
      get {
        return (resultMap["rooms"] as! [ResultMap]).map { (value: ResultMap) -> Room in Room(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Room) -> ResultMap in value.resultMap }, forKey: "rooms")
      }
    }

    public struct Room: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Room"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(LongString.self)),
          GraphQLField("cameras", type: .list(.nonNull(.object(Camera.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, description: LongString? = nil, cameras: [Camera]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Room", "id": id, "name": name, "description": description, "cameras": cameras.flatMap { (value: [Camera]) -> [ResultMap] in value.map { (value: Camera) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: LongString? {
        get {
          return resultMap["description"] as? LongString
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var cameras: [Camera]? {
        get {
          return (resultMap["cameras"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Camera] in value.map { (value: ResultMap) -> Camera in Camera(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Camera]) -> [ResultMap] in value.map { (value: Camera) -> ResultMap in value.resultMap } }, forKey: "cameras")
        }
      }

      public struct Camera: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Camera"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(LongString.self)),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(CameraType.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, description: LongString? = nil, address: String, type: CameraType) {
          self.init(unsafeResultMap: ["__typename": "Camera", "id": id, "name": name, "description": description, "address": address, "type": type])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var description: LongString? {
          get {
            return resultMap["description"] as? LongString
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }

        public var type: CameraType {
          get {
            return resultMap["type"]! as! CameraType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }
      }
    }
  }
}

public final class GetCasesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetCases {
      cases {
        __typename
        id
        name
        description
        reports(first: 50) {
          __typename
          id
          name
          persons {
            __typename
            person {
              __typename
              firstName
              lastName
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetCases"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cases", type: .nonNull(.list(.nonNull(.object(Case.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cases: [Case]) {
      self.init(unsafeResultMap: ["__typename": "Query", "cases": cases.map { (value: Case) -> ResultMap in value.resultMap }])
    }

    public var cases: [Case] {
      get {
        return (resultMap["cases"] as! [ResultMap]).map { (value: ResultMap) -> Case in Case(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Case) -> ResultMap in value.resultMap }, forKey: "cases")
      }
    }

    public struct Case: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Case"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(LongString.self)),
          GraphQLField("reports", arguments: ["first": 50], type: .list(.nonNull(.object(Report.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, description: LongString? = nil, reports: [Report]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Case", "id": id, "name": name, "description": description, "reports": reports.flatMap { (value: [Report]) -> [ResultMap] in value.map { (value: Report) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: LongString? {
        get {
          return resultMap["description"] as? LongString
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var reports: [Report]? {
        get {
          return (resultMap["reports"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Report] in value.map { (value: ResultMap) -> Report in Report(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Report]) -> [ResultMap] in value.map { (value: Report) -> ResultMap in value.resultMap } }, forKey: "reports")
        }
      }

      public struct Report: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Report"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("persons", type: .list(.nonNull(.object(Person.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, persons: [Person]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Report", "id": id, "name": name, "persons": persons.flatMap { (value: [Person]) -> [ResultMap] in value.map { (value: Person) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var persons: [Person]? {
          get {
            return (resultMap["persons"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Person] in value.map { (value: ResultMap) -> Person in Person(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Person]) -> [ResultMap] in value.map { (value: Person) -> ResultMap in value.resultMap } }, forKey: "persons")
          }
        }

        public struct Person: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PersonWithStatus"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("person", type: .nonNull(.object(Person.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(person: Person) {
            self.init(unsafeResultMap: ["__typename": "PersonWithStatus", "person": person.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var person: Person {
            get {
              return Person(unsafeResultMap: resultMap["person"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "person")
            }
          }

          public struct Person: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Person"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .scalar(String.self)),
                GraphQLField("lastName", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(firstName: String? = nil, lastName: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Person", "firstName": firstName, "lastName": lastName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var firstName: String? {
              get {
                return resultMap["firstName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String? {
              get {
                return resultMap["lastName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }
          }
        }
      }
    }
  }
}

public final class SubmitFormMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SubmitForm($formInput: SubmitFormInput!) {
      submitForm(input: $formInput) {
        __typename
        ok
      }
    }
    """

  public let operationName: String = "SubmitForm"

  public var formInput: SubmitFormInput

  public init(formInput: SubmitFormInput) {
    self.formInput = formInput
  }

  public var variables: GraphQLMap? {
    return ["formInput": formInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("submitForm", arguments: ["input": GraphQLVariable("formInput")], type: .nonNull(.object(SubmitForm.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(submitForm: SubmitForm) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "submitForm": submitForm.resultMap])
    }

    /// Apply form-fields to multiple files
    public var submitForm: SubmitForm {
      get {
        return SubmitForm(unsafeResultMap: resultMap["submitForm"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "submitForm")
      }
    }

    public struct SubmitForm: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SubmitFormResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool) {
        self.init(unsafeResultMap: ["__typename": "SubmitFormResult", "ok": ok])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }
    }
  }
}

public final class CreatePersonMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreatePerson($person: PersonCreateInput!, $statuses: [String!]) {
      createPerson(input: {person: {create: $person}, statuses: $statuses}) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CreatePerson"

  public var person: PersonCreateInput
  public var statuses: [String]?

  public init(person: PersonCreateInput, statuses: [String]?) {
    self.person = person
    self.statuses = statuses
  }

  public var variables: GraphQLMap? {
    return ["person": person, "statuses": statuses]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createPerson", arguments: ["input": ["person": ["create": GraphQLVariable("person")], "statuses": GraphQLVariable("statuses")]], type: .nonNull(.object(CreatePerson.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPerson: CreatePerson) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPerson": createPerson.resultMap])
    }

    public var createPerson: CreatePerson {
      get {
        return CreatePerson(unsafeResultMap: resultMap["createPerson"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createPerson")
      }
    }

    public struct CreatePerson: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PersonWithStatus"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "PersonWithStatus", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}
