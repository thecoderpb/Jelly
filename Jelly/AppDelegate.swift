//
//  AppDelegate.swift
//  Jelly
//
//  Created by Pratik Byathnal on 27/05/20.
//  Copyright © 2020 Pratik Byathnal. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    private var popover : NSPopover!
    private var statusBarItem: NSStatusItem!
    private var buttonToggle = 0
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        // Create the popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
        
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        if let button = self.statusBarItem.button {
             button.image = NSImage(named: "Left Chevron")
             button.action = #selector(togglePopover(_:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        
        
        
            
    }
    
    // Create the status item
    @objc func togglePopover(_ sender: AnyObject?) {
        
        let event = NSApp.currentEvent!
        
         if let button = self.statusBarItem.button {
            if event.type == NSEvent.EventType.rightMouseUp{
                if self.popover.isShown {
                     self.popover.performClose(sender)
                } else {
                     self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
                }
            } else if event.type == NSEvent.EventType.leftMouseUp{
                if buttonToggle == 0{
                    button.image = NSImage(named: "Right Chevron")
                    buttonToggle = 1
                
                }else{
                    button.image = NSImage(named: "Left Chevron")
                    buttonToggle = 0
                }
                //change icon to right chevron
                //hide icons
            }
              
         }
    }
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
