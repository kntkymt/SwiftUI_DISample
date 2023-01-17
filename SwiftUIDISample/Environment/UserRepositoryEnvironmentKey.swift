import SwiftUI

enum UserRepositoryEnvironmentKey: EnvironmentKey {
    #if DEBUG
    static var defaultValue: any UserRepositoryProtocol = StubUserRepository(data: "environment")
    #else
    static var defaultValue: any UserRepositoryProtocol = UserRepository(apiClient: APIClientKey.liveValue)
    #endif
}

extension EnvironmentValues {
  var userRepsoitory: any UserRepositoryProtocol {
      get { self[UserRepositoryEnvironmentKey.self] }
      set { self[UserRepositoryEnvironmentKey.self] = newValue }
  }
}
