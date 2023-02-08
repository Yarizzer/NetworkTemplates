//
//  AppCoreContract.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

protocol AppNetworkable {
    var networkLayer: NetworkLayerType { get }
}

protocol AppDeviceable {
    var deviceLayer: DeviceLayerType { get }
}

protocol AppStyleable {
    var styleLayer: StyleLayerType { get }
}
