//
//  AppDelegate.swift
//  WiFiName
//
//  Created by anand on 8/13/19.
//  Copyright © 2019 chillar. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    var wifiName = "Test"
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        showWiFiName()
    }
    
    func getWiFiName() {
        wifiName = "wifi name"
    }
    
    func showWiFiName() {
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        statusBarItem.button?.title = wifiName
        
        let statusBarMenu = NSMenu(title: "\(wifiName)")
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.quitWiFiName),
            keyEquivalent: "")
        
    }
    
    @objc func quitWiFiName() {
        print("Quitting WiFiName")
    }

}
