import Foundation
import SwiftKeychainWrapper

enum KeychainStorageKey: String {
    case accessToken
    case refreshToken
}

protocol KeychainStorage {

    func bool(for key: KeychainStorageKey) -> Bool?
    func string(for key: KeychainStorageKey) -> String?

    @discardableResult
    func set(_ value: Bool, for key: KeychainStorageKey) -> Bool

    @discardableResult
    func set(_ value: String, for key: KeychainStorageKey) -> Bool

    @discardableResult
    func removeObject(for key: KeychainStorageKey) -> Bool

}

extension KeychainWrapper: KeychainStorage {

    func bool(for key: KeychainStorageKey) -> Bool? {
        bool(forKey: key.rawValue, withAccessibility: nil)
    }

    func string(for key: KeychainStorageKey) -> String? {
        string(forKey: key.rawValue, withAccessibility: nil)
    }

    func set(_ value: Bool, for key: KeychainStorageKey) -> Bool {
        set(value, forKey: key.rawValue, withAccessibility: nil)
    }

    func set(_ value: String, for key: KeychainStorageKey) -> Bool {
        set(value, forKey: key.rawValue, withAccessibility: nil)
    }

    func removeObject(for key: KeychainStorageKey) -> Bool {
        removeObject(forKey: key.rawValue, withAccessibility: nil)
    }

}
