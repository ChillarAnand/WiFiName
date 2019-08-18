//
//  ViewController.swift
//  WiFiName
//
//  Created by anand on 8/13/19.
//  Copyright © 2019 chillar. All rights reserved.
//

import Cocoa
import MenuBar


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaaa")
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
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

