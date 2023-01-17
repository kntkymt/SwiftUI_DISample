import SwiftUI

enum UserRepositoryEnvironmentKey: EnvironmentKey {
    static var defaultValue: any UserRepositoryProtocol = UserRepository()
}

extension EnvironmentValues {
  var userRepsoitory: any UserRepositoryProtocol {
      get { self[UserRepositoryEnvironmentKey.self] }
      set { self[UserRepositoryEnvironmentKey.self] = newValue }
  }
}
