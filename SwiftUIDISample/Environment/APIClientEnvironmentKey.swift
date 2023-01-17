import SwiftUI

enum APIClientEnvironmentKey: EnvironmentKey {
    #if DEBUG
    static var defaultValue: any APIClientProtocol = StubAPIClient()
    #else
    static var defaultValue: any APIClientProtocol = APIClient()
    #endif
}

extension EnvironmentValues {
  var apiClient: any APIClientProtocol {
      get { self[APIClientEnvironmentKey.self] }
      set { self[APIClientEnvironmentKey.self] = newValue }
  }
}
