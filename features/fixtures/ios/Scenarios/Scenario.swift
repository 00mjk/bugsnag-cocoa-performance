//
//  Scenario.swift
//  Fixture
//
//  Created by Nick Dowell on 26/09/2022.
//

import BugsnagPerformance
import Foundation

class Scenario: NSObject {
    
    static let mazeRunnerURL = "http://bs-local.com:9339"
    
    var config = BugsnagPerformanceConfiguration.loadConfig()
    
    func configure() {
        bsg_autoTriggerExportOnBatchSize = 1;
        config.apiKey = "12312312312312312312312312312312"
        config.autoInstrumentAppStarts = false
        config.autoInstrumentNetwork = false
        config.autoInstrumentViewControllers = false
        config.samplingProbability = 1
        config.endpoint = "\(Scenario.mazeRunnerURL)/traces"
    }
    
    func clearPersistentData() {
        NSLog("Scenario.clearPersistentData()")
        UserDefaults.standard.removePersistentDomain(
            forName: Bundle.main.bundleIdentifier!)
    }
    
    func startBugsnag() {
        BugsnagPerformance.start(configuration: config)
    }
    
    func run() {
        fatalError("To be implemented by subclass")
    }
}
