protocol UserRepositoryProtocol {
    func fetchData() -> String
}

final class UserRepository: UserRepositoryProtocol {
    private var apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchData() -> String {
        return apiClient.fetchData()
    }
}

final class StubUserRepository: UserRepositoryProtocol {
    func fetchData() -> String {
        return "stub data"
    }
}
