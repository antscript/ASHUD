# ASHUD
## A HUD utils for OS X wrote in Swift



# Installation
Clone and copy ASHUD.swift and ASTimeUtils.swift to your project.


# Usage
```
ASHUD.sharedHUD.showHUD(msg: String ,
        	         		delayTime: NSTimeInterval = 3,
		                 	position: ASHUDPosition = .Center,
		                 	size: ASHUDSize = .Medium,
                 			style: ASHUDStyle = .Dark,
                 			bordered: Bool = false
                 )

example:

// a Large HUD with Dark style in the Center of screen
ASHUD.sharedHUD.showHUD("Center Large Dark",delayTime:3,position:.Center,size:.Large,style:.Dark,bordered:false)
        
// a Medium HUD with Border and Dark style in the Bottom of screen
ASHUD.sharedHUD.showHUD("Bottom Medium Dark Border",delayTime:3,position:.Bottom,size:.Medium,style:.Dark,bordered:true)
        
// a Small HUD with Light style in the Bottom of screen
ASHUD.sharedHUD.showHUD("Top Small Light , Top Small Light , Top Small Light  Top Small Light , Top Small Light , Top Small Light  ",delayTime:3,position:.Bottom,size:.Small,style:.Light,bordered:false)
        
// a Large HUD with Border and Light style in the Center of screen
ASHUD.sharedHUD.showHUD("BIG HUD",delayTime:3,position:.Center,size:.Large,style:.Light,bordered:true)

```


# License
MIT license. See LICENSE for details.