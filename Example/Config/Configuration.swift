//
//  Configuration.swift
//  Example
//
//  Created by Dino Trnka on 11. 2. 2021..
//

import Foundation

enum PList {
  case environment
  case baseUrl

  func value() -> String {
    switch self {
    case .environment: return "Environment"
    case .baseUrl: return "BaseUrl"
    }
  }
}

enum Environment: String {
  case development
  case staging
  case production
}


class Configuration {

  static let shared = Configuration()
  var environment: Environment

  init() {
    environment = Environment(rawValue: Configuration.get(.environment)) ?? .production
  }

  static func get(_ key: PList) -> String {
    if let infoDict = Bundle.main.infoDictionary {
      switch key {
      case .environment:
        return infoDict[PList.environment.value()] as? String ?? ""
      case .baseUrl:
        return infoDict[PList.baseUrl.value()] as? String ?? ""
      }
    }
    return ""
  }
}

extension Configuration {

  enum EnvironmentVariable {
    case segmentWriteKey
  }

  var segmentWriteKey: String {
    switch environment {
    case .development: return "segment-key-dev"
    case .staging: return "segment-key-stg"
    case .production: return "segment-key-prod"
    }
  }

}
