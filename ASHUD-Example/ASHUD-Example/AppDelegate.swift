//
//  AppDelegate.swift
//  ASHUD-Example
//
//  Created by AntScript on 6/7/16.
//  Copyright © 2016 antscript. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        
        ASTimeUtils.delay(1){
            self.showHUD()
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    
    func showHUD() {
        // a Large HUD with Dark style in the Center of screen
        ASHUD.sharedHUD.showHUD("Center Large Dark",delayTime:3,position:.Center,size:.Large,style:.Dark,bordered:false)
        
        // a Medium HUD with Border and Dark style in the Bottom of screen
//        ASHUD.sharedHUD.showHUD("Bottom Medium Dark Border",delayTime:3,position:.Bottom,size:.Medium,style:.Dark,bordered:true)
        
        // a Small HUD with Light style in the Bottom of screen
//        ASHUD.sharedHUD.showHUD("Top Small Light , Top Small Light , Top Small Light  Top Small Light , Top Small Light , Top Small Light  ",delayTime:3,position:.Bottom,size:.Small,style:.Light,bordered:false)
        
        // a Large HUD with Border and Light style in the Center of screen
//        ASHUD.sharedHUD.showHUD("BIG HUD",delayTime:3,position:.Center,size:.Large,style:.Light,bordered:true)

    }


}

