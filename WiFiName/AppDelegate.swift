//
//  AppDelegate.swift
//  WiFiName
//
//  Created by anand on 8/13/19.
//  Copyright © 2019 chillar. All rights reserved.
//

import Cocoa
import MenuBar

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    var wifiName = "Test"
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("asdf")
        showWiFiName2()
    }
    
    func getWiFiName() {
        wifiName = "wifi name"
    }
    
    func showWiFiName() {
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusBarItem.button?.title = wifiName
        
        let statusBarMenu = NSMenu(title: "\(wifiName)")
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.quitWiFiName),
            keyEquivalent: "")
        
    }
    
    func showWiFiName2() {
        let menuBar = MenuBar(descriptors: [
            .item([.title("This is a title of an item of a menu bar")]),
            .item([.enabled(false), .title("You can set the enabled status of the item")]),
            .item([.state(.on), .title("Also you can mark a item with a on or off state")]),
            .item([.action({ print("click") }), .title("This is how you set action to be executed when item is clicked")]),
            .separator, // and this is just a separator that will be visible between the items
            .menu([.title("And this is a menu or a submenu in this case")], [
                .item([.title("Items in which can be configured in the same exact way")])
                ])
            ])
        menuBar.title = wifiName
        sleep(20)
    }
    
    @objc func quitWiFiName() {
        print("Quitting WiFiName")
    }

}
