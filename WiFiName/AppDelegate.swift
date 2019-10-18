//
//  AppDelegate.swift
//  WiFiName
//
//  Created by anand on 8/13/19.
//  Copyright © 2019 chillar. All rights reserved.
//

import Cocoa
import CoreWLAN


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, CWEventDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    var wifiName: String? = nil
    let wifiClient = CWWiFiClient.shared()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        listenSSIDChanges()
        showWiFiName()
        constructMenu()
    }

    func listenSSIDChanges () {
        wifiClient.delegate = self
        do {
            try wifiClient.startMonitoringEvent(with: .ssidDidChange)
        } catch {

        }
    }

    func showWiFiName() {
        wifiName = getWiFiName()
        statusItem.button?.title = wifiName ?? "Not connected"
        statusItem.button?.target = self
    }

    func getWiFiName() -> String? {
        let interface = wifiClient.interface()
        return interface?.ssid()
    }

    func ssidDidChangeForWiFiInterface(withName interfaceName: String) {
        DispatchQueue.main.async {
            self.showWiFiName()
        }
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit WiFiName", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
}
