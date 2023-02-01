//
//  AppCore.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

class AppCore {
    static let shared = AppCore()
    
    private init() {
        self.networkL = NetworkLayer()
        self.deviceL = DeviceLayer()
        self.styleL = StyleLayer()
    }
    
    func prepareSession() {
        networkLayer.runSubscription()
    }
    
    //Layers
    private var networkL: NetworkLayerType
    private var deviceL: DeviceLayerType
    private var styleL: StyleLayerType
}

extension AppCore: AppNetworkable {
    var networkLayer: NetworkLayerType { return networkL }
}

extension AppCore: AppDeviceable {
    var deviceLayer: DeviceLayerType { return deviceL }
}

extension AppCore: AppStyleable {
    var styleLayer: StyleLayerType { return styleL}
}
