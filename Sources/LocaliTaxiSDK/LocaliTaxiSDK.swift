import TaxiShared

public enum LocaliTaxiSDK {
    nonisolated(unsafe) private static var tokenProviderAdapter: KmpTokenProviderAdapter?

    public static func initialize(accessTokenProvider: TaxiAccessTokenProvider) {
        let adapter = KmpTokenProviderAdapter(provider: accessTokenProvider)
        tokenProviderAdapter = adapter
        TaxiSdk.companion.doInit(tokenProvider: adapter)
    }
}
