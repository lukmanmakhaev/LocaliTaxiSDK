import TaxiShared

@MainActor
public enum LocaliTaxiSDK {
    public static func initialize(accessTokenProvider: TaxiAccessTokenProvider) {
        let adapter = KmpTokenProviderAdapter(provider: accessTokenProvider)
        TaxiSdk.companion.doInit(tokenProvider: adapter)
    }
}
