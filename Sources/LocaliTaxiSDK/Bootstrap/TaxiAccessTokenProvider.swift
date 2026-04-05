import Foundation

public protocol TaxiAccessTokenProvider: Sendable {
    @MainActor
    func getAccessToken() -> String
}
