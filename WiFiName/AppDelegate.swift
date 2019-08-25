//
//  AppDelegate.swift
//  WiFiName
//
//  Created by anand on 8/13/19.
//  Copyright © 2019 chillar. All rights reserved.
//

import Cocoa
import SystemConfiguration.CaptiveNetwork
import CoreWLAN


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    var wifiName = ""
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        showWiFiName()
    }
    
    func showWiFiName() {
        wifiName = getWiFiName()
        statusItem.button?.title = wifiName
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }
    
    func getWiFiName() -> String {
        return CWInterface(interfaceName: nil).ssid() ?? "Not connected"
    }
    
    @objc func showSettings() {
        let item: NSMenu = NSMenu()
        let quitItem = NSMenuItem(title: "Quit WiFiName", action: nil, keyEquivalent: "")
        item.addItem(quitItem)
        
    }
    
    @objc func quitWiFiName() {
        print("Quitting WiFiName")
    }

}
