//
//  ASHUD.swift
//  UPer
//
//  Created by AntScript on 5/18/16.
//  Copyright © 2016 AApp.Space. All rights reserved.
//

import Foundation
import Cocoa

class ASHUD {
    
    static let sharedHUD = ASHUD()
    var window: NSWindow
    var hudView: NSView
    var hudTextField: NSTextField
    
    var delayTask:ASTimeUtils.Task?
    
    init() {
        window = NSWindow(contentRect: NSMakeRect(0, 0, 500, 160), styleMask: NSBorderlessWindowMask, backing: .Buffered, defer: false)
        window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.AssistiveTechHighWindowLevelKey))
        window.opaque = false
        window.backgroundColor = NSColor.clearColor()
        
        
        hudView = NSView()
        
        
        hudTextField = NSTextField()
        hudTextField.preferredMaxLayoutWidth = (NSScreen.mainScreen()?.visibleFrame.size.width)! - 50
        hudTextField.bordered = false
        hudTextField.editable = false
        hudTextField.drawsBackground = false
        hudTextField.alignment = .Center
        hudTextField.usesSingleLineMode = true
        hudTextField.cell?.wraps = false
        hudView.addSubview(hudTextField)
        
        hudTextField.translatesAutoresizingMaskIntoConstraints = false
        hudView.addConstraint(NSLayoutConstraint(item: hudTextField, attribute: .CenterY, relatedBy: .Equal , toItem: hudView, attribute: .CenterY, multiplier: 1, constant: 0))
        hudView.addConstraint(NSLayoutConstraint(item: hudTextField, attribute: .CenterX, relatedBy: .Equal , toItem: hudView, attribute: .CenterX, multiplier: 1, constant: 0))
        hudView.addConstraint(NSLayoutConstraint(item: hudTextField, attribute: .Width, relatedBy: .Equal , toItem: hudTextField, attribute: .Width, multiplier: 1, constant: 0))
        hudView.addConstraint(NSLayoutConstraint(item: hudTextField, attribute: .Height, relatedBy: .Equal , toItem: hudTextField, attribute: .Height, multiplier: 1, constant: 0))
        
        
        window.contentView? = hudView
        window.contentView?.wantsLayer = true
        window.contentView?.layer?.masksToBounds = true
        window.contentView?.layer?.cornerRadius = 10
        
        
        
        
        
        
        window.makeKeyWindow()
    }
    
    
    func showHUD(msg: String ,
                 delayTime: NSTimeInterval = 3,
                 position: ASHUDPosition = .Center,
                 size: ASHUDSize = .Medium,
                 style: ASHUDStyle = .Dark,
                 bordered: Bool = false
                 ) {
        
        guard let screenRect = NSScreen.mainScreen()?.visibleFrame else {
            
            return
        }
        
        ASTimeUtils.cancel(delayTask)
        
        hudTextField.stringValue = msg
        
        var borderWidth = 0
        switch size {
        case .Large:
            hudTextField.font = NSFont(name: (hudTextField.font?.fontName)!, size: 100)
            borderWidth = 5
        case .Medium:
            hudTextField.font = NSFont(name: (hudTextField.font?.fontName)!, size: 60)
            borderWidth = 3
        case .Small:
            hudTextField.font = NSFont(name: (hudTextField.font?.fontName)!, size: 20)
            borderWidth = 1
        }
        
        switch style {
        case .Dark:
            hudTextField.textColor = NSColor.whiteColor()
            hudView.layer?.backgroundColor = NSColor.blackColor().colorWithAlphaComponent(0.9).CGColor
            if bordered {
                hudView.layer?.borderWidth = CGFloat(borderWidth)
                hudView.layer?.borderColor = NSColor.whiteColor().CGColor
            } else {
                hudView.layer?.borderWidth = 0
            }
        case .Light:
            hudTextField.textColor = NSColor(red:0.15, green:0.16, blue:0.17, alpha:1.00)
            hudView.layer?.backgroundColor = NSColor.whiteColor().colorWithAlphaComponent(0.9).CGColor
            if bordered {
                hudView.layer?.borderWidth = CGFloat(borderWidth)
                hudView.layer?.borderColor = NSColor(red:0.15, green:0.16, blue:0.17, alpha:1.00).CGColor
            } else {
                hudView.layer?.borderWidth = 0
            }
        }
        
        
        hudTextField.sizeToFit()
        
        var displayBounds = NSMakeRect((screenRect.size.width - hudTextField.frame.size.width - 40) * 0.5, 0, hudTextField.frame.size.width + 40, hudTextField.frame.size.height + 40 )
        switch position {
        case .Bottom:
            displayBounds.origin.y = 50
        case .Center:
            displayBounds.origin.y = (screenRect.size.height - hudTextField.frame.size.height - 40) * 0.5
        case .Top:
            displayBounds.origin.y = (screenRect.size.height - hudTextField.frame.size.height - 40 - 50)
        }
        
        window.setFrame(displayBounds, display: true)
        window.makeKeyAndOrderFront(self)

        delayTask = ASTimeUtils.delay(delayTime) {
            self.hideHUD()
        }!
        
        self.window.contentView?.alphaValue = 0
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.1
            self.window.contentView?.animator().alphaValue = 1
        }) {
            
        }
    }
    
    func hideHUD(fade: Bool = true) {
        
        guard fade else {
            window.orderOut(self)
            return
        }
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.2
            self.window.contentView?.animator().alphaValue = 0
        }) {
            self.window.orderOut(self)
             self.window.contentView?.alphaValue = 0
        }
        
    }

}

enum ASHUDPosition:Int {
    case Top,Bottom,Center
}

enum ASHUDSize:Int {
    case Small,Medium,Large
}

enum ASHUDStyle:Int {
    case Dark,Light
}