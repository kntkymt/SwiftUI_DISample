import SwiftUI

enum APIClientEnvironmentKey: EnvironmentKey {
    static var defaultValue: any APIClientProtocol = APIClient()
}

extension EnvironmentValues {
  var apiClient: any APIClientProtocol {
      get { self[APIClientEnvironmentKey.self] }
      set { self[APIClientEnvironmentKey.self] = newValue }
  }
}
