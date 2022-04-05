--this is the big group box
table.insert(graphics,{
  Type = "GroupBox",
  Text = "Lutron GRAFIK Eye 2021",
  Fill = {105,105,105},
  StrokeWidth = 1,
  Position = {1,1},
  Size = {893,287},
  HTextAlign = "Center" 
})

--this is the logo
Logo = "--[[ #encode "logo.png" ]]"

table.insert(graphics,{
  Type = "Image",
  Image = Logo,
  Position = {6,27},
  Size = {162,106}
})

--These are all the smaller group boxes
table.insert(graphics,{
  Type = "GroupBox",
  Text = "Connection Info",
  Fill = {157,156,156},
  StrokeWidth = 1,
  Position = {6,133},
  Size = {162,147},
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "GroupBox",
  Text = "Discreet Commands",
  Fill = {157,156,156},
  StrokeWidth = 1,
  Position = {168,27},
  Size = {312,253},
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "GroupBox",
  Text = "External Tx and Rx",
  Fill = {157,156,156},
  StrokeWidth = 1,
  Position = {480,27},
  Size = {183,253},
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "GroupBox",
  Text = "Fader",
  Fill = {157,156,156},
  StrokeWidth = 1,
  Position = {663,27},
  Size = {97,253},
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "GroupBox",
  Text = "Shades",
  Fill = {157,156,156},
  StrokeWidth = 1,
  Position = {760,27},
  Size = {123,253},
  HTextAlign = "Center"
})

--These are all the text boxes
table.insert(graphics,{
  Type = "Text",
  Text = "IP",
  Position = {31,165},
  Size = {36,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Port",
  Position = {23,199},
  Size = {44,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Login",
  Position = {23,243},
  Size = {44,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Trigger Command",
  Position = {182,52},
  Size = {108,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Clear Feedback",
  Position = {360,52},
  Size = {108,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Command to Send",
  Position = {182,112},
  Size = {286,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Command Feedback",
  Position = {182,149},
  Size = {286,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "External Read",
  Position = {496,52},
  Size = {151,20},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "External Write",
  Position = {496,128},
  Size = {151,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Integration ID:",
  Position = {664,170},
  Size = {96,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Output Number",
  Position = {664,208},
  Size = {96,31},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Integration ID:",
  Position = {779,52},
  Size = {82,18},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Shades Up",
  Position = {778,116},
  Size = {88,21},
  FontSize = 12,
  HTextAlign = "Center"
})
table.insert(graphics,{
  Type = "Text",
  Text = "Shades Down",
  Position = {778,191},
  Size = {83,21},
  FontSize = 12,
  HTextAlign = "Center"
})

--These are all the controls
layout["Ipa"] = {
  PrettyName = "IP Address",
  Style = "Textbox",
  Position = {67,165},
  Size = {83,16},
  Color = {255,255,255} 
}
layout["PortNum"] = {
  PrettyName = "Port Number",
  Style = "Textbox",
  Position = {67,204},
  Size = {83,16},
  Color = {255,255,255} 
}
layout["Login"] = {
  PrettyName = "Login",
  Style = "Textbox",
  Position = {67,243},
  Size = {83,16},
  Color = {255,255,255} 
}
layout["Trigger"] = {
  PrettyName = "Trigger Command",
  Style = "Button",
  Position = {182,73},
  Size = {108,25},
  Color = {124,124,124} 
}
layout["Clear"] = {
  PrettyName = "Clear Feedback",
  Style = "Button",
  Position = {360,73},
  Size = {108,25},
  Color = {124,124,124} 
}
layout["Command"] = {
  PrettyName = "Command to Send",
  Style = "Textbox",
  Position = {182,133},
  Size = {286,16},
  Color = {255,255,255} 
}
layout["FbBox"] = {
  PrettyName = "Command Feedback",
  Style = "Textbox",
  Position = {182,170},
  Size = {283,106},
  Color = {255,255,255} 
}
layout["ExtRead"] = {
  PrettyName = "External Read",
  Style = "Textbox",
  Position = {496,72},
  Size = {151,53},
  Color = {255,255,255} 
}
layout["ExtWrite"] = {
  PrettyName = "External Write",
  Style = "Textbox",
  Position = {496,149},
  Size = {151,53},
  Color = {255,255,255} 
}
layout["Fader"] = {
  PrettyName = "Fader",
  Style = "Fader",
  FaderStyle = "Classic",
  Position = {694,48},
  Size = {36,128},
  Color = {242,137,174}
}
layout["IidNum"] = {
  PrettyName = "Integration ID",
  Style = "Textbox",
  Position = {676,191},
  Size = {74,14},
  Color = {255,255,255} 
}
layout["OutNum"] = {
  PrettyName = "Output Number",
  Style = "Textbox",
  Position = {676,230},
  Size = {74,14},
  Color = {255,255,255}
}
layout["Btn1IidNum"] = {
  PrettyName = "Integration ID",
  Style = "Textbox",
  Position = {778,70},
  Size = {88,33},
  Color = {255,255,255} 
}
layout["TestBtn1"] = {
  PrettyName = "Shades Up",
  Style = "Button",
  Position = {778,137},
  Size = {88,33},
  Color = {124,124,124} 
}
layout["TestBtn2"] = {
  PrettyName = "Shades Down",
  Style = "Button",
  Position = {778,212},
  Size = {88,33},
  Color = {124,124,124} 
}