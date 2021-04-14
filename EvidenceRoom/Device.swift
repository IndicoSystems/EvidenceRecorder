import Foundation

protocol Device {
    var id: String { get }
    var roomId: String? { get }
    var name: String { get }
    var address: String? { get }
}
