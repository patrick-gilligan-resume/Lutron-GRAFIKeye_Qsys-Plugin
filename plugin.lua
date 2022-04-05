-- Lutron GRAFIK_EYE
-- by Patrick Gilligan
-- November 2021 

-- Information block for the plugin
--[[ #include "info.lua" ]]

-- Define the color of the plugin object in the design
function GetColor(props)
  return { 51,51,51 }
end

--GetProperies() function is needed
function GetProperties()
  props = {}
  return props
end

-- The name that will initially display when dragged into a design
function GetPrettyName(props)
  return "Lutron GRAFIK_EYE, version " .. PluginInfo.Version
end

-- Defines the Controls used within the plugin
function GetControls(props)
  ctrls = {}
  --[[ #include "controls.lua" ]]
  return ctrls
end

--Layout of controls and graphics for the plugin UI to display
function GetControlLayout(props)
  local layout = {}
  local graphics = {}
  --[[ #include "layout.lua" ]]
  return layout, graphics
end

--Start event based logic
if Controls then
  --[[ #include "runtime.lua" ]]
end
