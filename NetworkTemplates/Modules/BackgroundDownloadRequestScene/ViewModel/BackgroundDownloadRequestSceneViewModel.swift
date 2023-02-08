//
//  BackgroundDownloadRequestSceneViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BackgroundDownloadRequestSceneViewModelType {
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
    
    private var progressValue: Float
    private var requestSent: Bool
}

extension BackgroundDownloadRequestSceneViewModel: BackgroundDownloadRequestSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitleValue }
    var progressLabel: String { requestSent ? Constants.initialProgressLabelValue : Constants.progressLabelValue + "\(progressValue)" }
    var progress: Float { return progressValue }
    
    func sendRequest() {
        #warning("finish this part")
    }
}

extension BackgroundDownloadRequestSceneViewModel {
    private struct Constants {
        static let initialProgressValue: Float = 0.0
        static let sceneTitleValue = "Background download request scene"
        static let initialProgressLabelValue = "Tap button below to start download"
        static let progressLabelValue = "Dowload in progress: "
    }
}
