import Foundation
import TaxiShared

final class KmpTokenProviderAdapter: NSObject, TokenProvider {
    private let provider: TaxiAccessTokenProvider

    init(provider: TaxiAccessTokenProvider) {
        self.provider = provider
        super.init()
    }

    @objc func getAccessToken() -> String {
        let token = provider.getAccessToken()
        print("🔑 getAccessToken called, token empty: \(token.isEmpty)")
        return token
    }
}
