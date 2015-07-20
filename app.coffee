# Responsive for iPhone
# by Way Chang

# Set background
bg = new BackgroundLayer 
	backgroundColor: "#000"

# Responsive Settings
# http://www.kylejlarson.com/blog/2015/iphone-6-screen-size-web-design-tips/
iphone5_w = 320 * 2 # 320 * 568 Real Screen Size
iphone6_w = 375 * 2 # 375 * 667 Real Screen Size
iphone6plus_w = 414 * 2  # 414 * 736 Real Screen Size
iphone5_h = 568 * 2 # 320 * 568 Real Screen Size
iphone6_h = 667 * 2 # 375 * 667 Real Screen Size
iphone6plus_h = 736 * 2  # 414 * 736 Real Screen Size

# to get device screen Rendered Pixels
screen_width = Framer.Device.screen.width # Rendered Pixels
screen_height = Framer.Device.screen.height # Rendered Pixels

# d_width = display width
d_width = iphone5_w # d_width -> default 640
if screen_width > iphone5_w # screen_width > 640
	d_width = iphone6_w # d_width -> 750
if screen_width > iphone6_w # screen_width > 750
	d_width = iphone6plus_w # d_width -> 828

d_height = iphone5_h
if screen_height > iphone5_h
	d_height = iphone6_h
if screen_height > iphone6plus_h
	d_height = iphone6plus_h

ratio = screen_width / d_width # responsive for fullscreen
Framer.Device.contentScale = ratio # responsive for fullscreen

screenRatio = d_width / iphone5_w # responsive for contents

# postTextAreaEnable = 1 -> to see text range
postTextAreaEnable = 0
if postTextAreaEnable == 1
	postTextArea = "#eee"
else
	postTextArea = ""

# Color Settings
primary_color = "#364F5F" # deep blue
highlight_color = "#FFB43D" # orange yellow
divider_color = "#E0E0E0" # light grey
card_bg_color = "white"
postInfo_color = "#B2B1AF" # light grey for text
bodyText = "#666360" # dark grey

# Variable Settings
margin = 16
statusBar_h = 40
navBar_h = 88
tabBar_h = 98
headShot_size = 80 * screenRatio
cardTop_h = headShot_size + margin * 2
descriptionText_h = 88 * screenRatio
postInfo_w = d_width / 3 - margin * 4
btn_w = 100
devider_h = 1 

navBarTitleText = 44 * screenRatio
cardTopNameText = 32 * screenRatio # Name
cardTopTimeText = 20 * screenRatio # Time
descriptionText = 24 * screenRatio # Description
postInfoText = 20 * screenRatio # Info

# CSS style
navBarTitle_style = { "font-size": navBarTitleText+"px", "color": "white", "text-align": "center", "line-height":"40px"}
cardTopName_style = { "font-size": cardTopNameText+"px", "color": bodyText, "line-height": cardTopNameText+"px" }
cardTopTime_style = {"font-size": cardTopTimeText+"px","color": postInfo_color, "line-height": cardTopTimeText+"px" }
descriptionText_style = { "font-size": descriptionText+"px", "color": bodyText, "line-height": descriptionText+"px" }
postInfo_style = { "font-size": postInfoText+"px", "color": postInfo_color, "line-height": postInfoText+"px" }

# Contents Settings
navBarTitleContent = "Home Feed"
headShot_image = "images/no_photo.jpg"
cardTopNameContent = "User Name"
cardTopTimeContent = "Yesterday 16:53"
descriptionContent = "Lorem ipsum dolor sit amet, sonet quidam eu mel, pri ex mutat clita. Iisque constituam vis te. Qui at malis senserit, qui nulla suavitate interpretaris no."
# post btn image path wh96
btnCell_h = 96
btn1_image = "images/post_btn_like@2x.png"
btn2_image = "images/post_btn_comment@2x.png"
btn3_image = "images/post_btn_collect@2x.png"
btn4_image = "images/post_btn_share@2x.png"
# post info contents
postInfo1Content = "Views 4096"
postInfo2Content = "Like 1024"	
postInfo3Content = "Comments 128"	
# tab image path w128 (d_width/5) h98
tab1_image = "images/tab_home_selected@2x.png"
tab2_image = "images/tab_discover@2x.png"
tab3_image = "images/tab_mainpage@2x.png"
tab4_image = "images/tab_notification@2x.png"
tab5_image = "images/tab_profile@2x.png"
tab_icon_scale = 0.6 * screenRatio # reset tab icon scale

# set "1" will see video in post index=1
videoEnable = 0
# Video Settings
videoRange_w = d_width
videoRange_h = d_width 
videoLink = "videos/video.mp4"
videoPicLink = "http://placehold.it/" + videoRange_w + "x" + videoRange_h

########################

# Create ScrollComponent
scroll = new ScrollComponent
	backgroundColor: "#D3D6DB"
	scrollHorizontal: false
	width: d_width
	y: statusBar_h
	height: d_height-statusBar_h-navBar_h
	borderRadius: 0
	
for i in [0..2]
	card = new Layer
		superLayer: scroll.content
		backgroundColor: card_bg_color
		width: d_width
		
	cardTop = new Layer
		superLayer: card
		backgroundColor: card_bg_color
		width: d_width
		height: cardTop_h	
		
	headShot = new Layer
		superLayer: card
		width: headShot_size, height: headShot_size
		image: headShot_image
		backgroundColor: postTextArea
		borderRadius: headShot_size / 2
		x: margin, y: margin
		
	cardTopName = new Layer
		superLayer: cardTop
		width: d_width-margin-headShot.width-margin-margin, 
		height: cardTopNameText #* ratio
		backgroundColor: postTextArea
		x: headShot.maxX+ margin
		y: margin + margin/2
	cardTopName.html = cardTopNameContent
	cardTopName.style = cardTopName_style
	
	cardTopTime = new Layer
		superLayer: cardTop
		width: d_width-margin-headShot.width-margin-margin
		height: cardTopTimeText
		backgroundColor: postTextArea
		x: headShot.maxX+margin
		y: cardTopName.maxY + margin*ratio/2
	cardTopTime.html = cardTopTimeContent
	cardTopTime.style = cardTopTime_style
	
	videoRange = new Layer
		superLayer: card
		backgroundColor: postTextArea
		image: videoPicLink
		width: videoRange_w
		height: videoRange_h
		opacity: 1
		y: cardTop.maxY
	
	if videoEnable == 1
		if card.index == 1
			video = new VideoLayer
				superLayer: videoRange
				video: videoLink
				width: videoRange_w
				height: videoRange_h
				backgroundColor: postTextArea
			video.player.autoplay = false
			video.player.loop = false
			
			playing = true
			home_playing = true
			
			video.on Events.Click, ->
				unless scroll.isMoving
					if playing
						video.player.pause()
						playing = false
						home_playing = false
					else
						video.player.play()
						playing = true
						home_playing = true
		
	btnCell = new Layer
		superLayer: card
		width: d_width, height: btnCell_h,
		y: videoRange.maxY
		backgroundColor: card_bg_color
		
	btn1Range = new Layer
		superLayer: btnCell
		width:d_width/4, height: btnCell.height
		backgroundColor: card_bg_color
	btn1 = new Layer
		superLayer: btn1Range, image: btn1_image
	btn1.center()
		
	btn2Range = new Layer
		superLayer: btnCell
		width:d_width/4, height: btnCell.height
		backgroundColor: card_bg_color
		x: btn1Range.maxX
	btn2 = new Layer
		superLayer: btn2Range, image: btn2_image
	btn2.center()
	
	btn3Range = new Layer
		superLayer: btnCell
		width:d_width/4, height: btnCell.height
		backgroundColor: card_bg_color
		x: btn2Range.maxX
	btn3 = new Layer
		superLayer: btn3Range, image: btn3_image
	btn3.center()
	
	btn4Range = new Layer
		superLayer: btnCell
		width:d_width/4, height: btnCell.height
		backgroundColor: card_bg_color
		x: btn3Range.maxX
	btn4 = new Layer
		superLayer: btn4Range, image: btn4_image
	btn4.center()
		
	divider_1 = new Layer
		superLayer: btnCell
		width: d_width-margin*2, height: 1,
		backgroundColor: divider_color,
		x: margin, y: btnCell.height - devider_h
	
	descriptionCell = new Layer
		superLayer: card
		width: d_width, height: descriptionText_h+margin*2,
		y: btnCell.maxY
		backgroundColor: card_bg_color
	
	divider_2 = new Layer
		superLayer: descriptionCell
		width: d_width, height: 1,
		backgroundColor: divider_color,
		y: descriptionCell.height - devider_h
		
	descriptionText = new Layer
		superLayer: descriptionCell
		width: d_width-margin*2, height: descriptionText_h,
		x: margin, y: margin,
		backgroundColor: postTextArea
	descriptionText.html = descriptionContent
	descriptionText.style = descriptionText_style
	
	postInfoCell = new Layer
		superLayer: card
		width: d_width, height: postInfoText+margin*2,
		y: descriptionCell.maxY
		backgroundColor: card_bg_color
		
	postInfo1 = new Layer
		superLayer: postInfoCell
		width: postInfo_w, height: postInfoText,
		x: margin, y: margin
		backgroundColor: postTextArea
	postInfo1.html = postInfo1Content
	postInfo1.style = postInfo_style
	
	postInfo2 = new Layer
		superLayer: postInfoCell
		width: postInfo_w, height: postInfoText,
		x: margin + postInfo1.maxX, y: margin
		backgroundColor: postTextArea
	postInfo2.html = postInfo2Content
	postInfo2.style = postInfo_style

	postInfo3 = new Layer
		superLayer: postInfoCell
		width: postInfo_w, height: postInfoText,
		x: margin + postInfo2.maxX, y: margin
		backgroundColor: postTextArea
	postInfo3.html = postInfo3Content
	postInfo3.style = postInfo_style	
		
	card.height = cardTop.height+videoRange.height+btnCell.height+descriptionCell.height+postInfoCell.height
	card.y = (card.height + margin) * i

scroll.contentInset = 
	top: navBar_h + margin	
	bottom: margin


statusBar = new Layer
	width: d_width, height: statusBar_h, y: 0,
	backgroundColor: primary_color
statusBarDeep = new Layer
	width: d_width, height: statusBar_h, y: 0,
	backgroundColor: "black", opacity: 0.2

navBar = new Layer
	width: d_width, height: navBar_h,
	y: statusBar.maxY
	backgroundColor: primary_color
navBarTitle = new Layer
	superLayer: navBar
	width: d_width-btn_w*2, height: 44, 
	backgroundColor: "", opacity: 1,
navBarTitle.center()
navBarTitle.html = navBarTitleContent
navBarTitle.style = navBarTitle_style

tabBar = new Layer
	width: d_width, height: tabBar_h,
	y: d_height-tabBar_h
	backgroundColor: primary_color

tab1Range = new Layer
	superLayer: tabBar
	width: d_width / 5, height: tabBar.height
	backgroundColor: ""
tab1 = new Layer
	superLayer: tab1Range
	image: tab1_image
	scale: tab_icon_scale
tab1.center()

tab2Range = new Layer
	superLayer: tabBar
	width: d_width / 5, height: tabBar.height, x: tab1Range.maxX,
	backgroundColor: ""
tab2 = new Layer
	superLayer: tab2Range
	image: tab2_image
	scale: tab_icon_scale
tab2.center()

tab3Range = new Layer
	superLayer: tabBar
	width: d_width / 5, height: tabBar.height, x: tab2Range.maxX,
	backgroundColor: ""
tab3 = new Layer
	superLayer: tab3Range
	image: tab3_image
	scale: tab_icon_scale
tab3.center()

tab4Range = new Layer
	superLayer: tabBar
	width: d_width / 5, height: tabBar.height, x: tab3Range.maxX,
	backgroundColor: ""
tab4 = new Layer
	superLayer: tab4Range
	image: tab4_image
	scale: tab_icon_scale
tab4.center()

tab5Range = new Layer
	superLayer: tabBar
	width: d_width / 5, height: tabBar.height, x: tab4Range.maxX,
	backgroundColor: ""
tab5 = new Layer
	superLayer: tab5Range
	image: tab5_image
	scale: tab_icon_scale
tab5.center()

# End