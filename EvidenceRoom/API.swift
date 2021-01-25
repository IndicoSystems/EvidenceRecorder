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
                displayName
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
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(formType: FormType) {
              self.init(unsafeResultMap: ["__typename": "RequiredFormSettings", "formType": formType.resultMap])
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

            public struct FormType: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["FormType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("displayName", type: .nonNull(.scalar(Json.self))),
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
          }
        }
      }
    }
  }
}
