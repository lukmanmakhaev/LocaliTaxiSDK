import Foundation

public protocol TaxiAccessTokenProvider: Sendable {
    func getAccessToken() -> String
}
