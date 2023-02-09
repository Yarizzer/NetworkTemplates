//
//  BackgroundDownloadRequestSceneViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BackgroundDownloadRequestSceneViewModelType {
    func setupSubscription()
    
    var shouldUpdateProgress: Publisher<Bool?> { get }
    
    var sceneTitle: String { get }
    var progressLabel: String { get }
    var progress: Float { get }
    
    func sendRequest()
}

class BackgroundDownloadRequestSceneViewModel {
    init() {
        self.progressValue = Constants.initialProgressValue
        self.requestSent = false
    }
    
    func setupSubscription() {
        AppCore.shared.networkLayer.bgDownloadProgress.subscribe(self) { [weak self] data in
            self?.progressValue = data.newValue ?? 0.0
        }
    }
    
    var shouldUpdateProgress: Publisher<Bool?> = Publisher(nil)
    
    private var progressValue: Float {
        didSet {
            self.shouldUpdateProgress.value = true
        }
    }
    
    private var requestSent: Bool
}

extension BackgroundDownloadRequestSceneViewModel: BackgroundDownloadRequestSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitleValue }
    var progressLabel: String { requestSent ? Constants.initialProgressLabelValue : Constants.progressLabelValue + "\(progressValue)" }
    var progress: Float { return progressValue }
    
    func sendRequest() {
        AppCore.shared.networkLayer.call(with: .backgroundRequest)
    }
}

extension BackgroundDownloadRequestSceneViewModel {
    private struct Constants {
        static let initialProgressValue: Float = 0.0
        static let sceneTitleValue = "Background download request scene"
        static let initialProgressLabelValue = "Tap button below to start download"
        static let progressLabelValue = "Download in progress: "
    }
}
