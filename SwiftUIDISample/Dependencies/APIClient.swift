protocol APIClientProtocol {
    func fetchData() -> String
}

final class APIClient: APIClientProtocol {
    func fetchData() -> String {
        return "live data"
    }
}

final class StubAPIClient: APIClientProtocol {
    func fetchData() -> String {
        return "stub data"
    }
}
