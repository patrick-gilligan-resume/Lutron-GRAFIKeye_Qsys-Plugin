--Copy paste from the Lua plugin - --Lutron QSE-NWK-E (GRAFIK Eye) Control Plug-in

--Main variables
Address = Controls.Ipa.String
Port = tonumber(Controls.PortNum.String)
Cmd = Controls.Command.String..'\x0d\x0a'
CmdBox = Controls.Command.String
Sock = TcpSocket.New()
Login = Controls.Login.String

--Secondary variables
Iid = Controls.IidNum.String
Output = Controls.OutNum.String
Iidlen = string.len(Iid)
OutputLen = string.gsub(string.len(Output), "%s+", "")
Btn1Iid = Controls.Btn1IidNum.String
--Btn2Iid = Controls.Btn2IidNum.String
SubI = (14 + Iidlen + OutputLen)
SubJ = (SubI + 4)

--Timeout utilities
Sock.ReadTimeout = 0
Sock.WriteTimeout = 0
Sock.ReconnectTimeout = 5

--Connection/Command basics
Sock.Connected = function(Sock)
  print("TCP Socket is connected")
end
Sock.Reconnect = function(Sock)
  print("TCP Socket is reconnecting")
end
Sock.Closed = function(Sock)
  print("TCP Socket was closed by the remote end")
end
Sock.Error = function(Sock, err)
  print("TCP Socket had an error:",err)
end
Sock.Timeout = function(Sock, err)
  print("TCP Socket timed out",err)
end

--Basic EventHandlers
Controls.Trigger.EventHandler = function()
  Sock:Write(Cmd) 
end
Controls.Clear.EventHandler = function() 
  Controls.FbBox.String = ""
  end
Controls.Command.EventHandler = function()
  if Cmd ~= nil then
    Cmd = CmdBox
    print(Cmd)
  end
end
    
--Dynamic ip and Port update reconnection  
Controls.Ipa.EventHandler = function()
  Reconnect()
end
Controls.PortNum.EventHandler = function()
  Reconnect()
end


--Incoming data pipeline
Sock.Data = function()
  Fb = Sock:Read(Sock.BufferLength)
  Fbstr = string.sub(Fb, SubI, SubJ)
  Fbnum = tonumber(Fbstr) 
    -- functions to call
    FbBoxx()  
    IntenseBoxx()
    Timer.CallAfter(keepAlive,0.5)
    Timer.CallAfter(FaderFb,2)
    Btn1Fb()
    Btn2Fb()
    ExtTx()
end

--External Script Communication
ExtRx = function() 
  local Rx = Controls.ExtRead.String
  if Rx ~= nil then
    Sock:Write(Rx)
    CmdBox = Rx
  end
end  
Controls.ExtRead.EventHandler = function()
  ExtRx()
end
ExtTx = function()
  if Fb ~= nil then
    Controls.ExtWrite.String = Fb
  end
end
Controls.ExtWrite.EventHandler = function()
  ExtTx()
end
   
--Box readout functions
Controls.Ipa.EventHandler = function()
  if Address ~= nil then
    Ipa = Address
  end
  print("Ip Address changed to "..Ipa)
end  
Controls.PortNum.EventHandler = function()
  if Controls.PortNum.String ~= nil then
    Port = tonumber(Controls.PortNum.String)
    print("Port changed to "..Port) 
  end
end 
function FbBoxx()
  if Fb ~= nil then
    Controls.FbBox.String = Fb
    print(Fb)
    end
end
Controls.IidNum.EventHandler = function()
  if Controls.IidNum.String ~= nil then
    Iid = Controls.IidNum.String
    end
  print("Iid changed to "..Iid)
end
Controls.OutNum.EventHandler = function()
  if Controls.OutNum.String ~= nil then
    Output = Controls.OutNum.String
    end
  print("Output number changed to "..Output)
end
function IntenseBoxx()
  if Fbstr ~= nil then
    Controls.Intensity.String = Fbstr
    end
end 
Controls.Btn1IidNum.EventHandler = function()
  if Controls.Btn1IidNum.String ~= nil then
    Btn1Iid = Controls.Btn1IidNum.String
  end
  Btn1Fb()
end
--[[ 
  --I'm keeping this to just one iid number for both buttons in the plugin version
Controls.Btn2IidNum.EventHandler = function()
  if Controls.Btn2IidNum.String ~= nil then
    Btn1Iid = Controls.Btn2IidNum.String
  end
  Btn2Fb()
end
]]--

-- Connect, disconnect, reconnect, keep alive
function IPConnect()
  if Address ~= "" and Port ~= "" then
    Sock:Connect(Address,Port)
  end
end
function IPDisconnect()
  Sock:Disconnect()
  print("TCP IP Connection has been closed locally")
end
function Reconnect()
  IPDisconnect()
  Timer.CallAfter(IPConnect, 0.5) 
end 
function keepAlive()
  if Fb ~= nil and string.find(Fb,'login:') then
    print("Login prompt")
    Sock:Write(Login.."\x0d\x0a")
    end
  end
  IPConnect()
  
-- Dynamic ip and Port update reconnection  
Controls.Ipa.EventHandler = function()
  Reconnect()
end
Controls.PortNum.EventHandler = function()
  Reconnect()
end

--Fader control
Controls.Fader.EventHandler = function()
  if Controls.Fader.Value ~= nil then
    Faderpos = string.sub(Controls.Fader.Value,0,4)
  end
  --Timer.CallAfter(Faderwait,0.5)
end

Faderwait = function()
  if Faderpos == Controls.Fader.Value then
    Sock:Write('#DEVICE,'..Iid..','..Output..',14,'..Faderpos..'\x0d\x0a')
    Cmd = '#DEVICE,'..Iid..','..Output..',14,'..string.sub(Controls.Fader.Value,0,4)  
  else
      Faderpos = string.sub(Controls.Fader.Value,0,4)
      Sock:Write('#DEVICE,'..Iid..','..Output..',14,'..Faderpos..'\x0d\x0a')
      Cmd = '#DEVICE,'..Iid..','..Output..',14,'..string.sub(Controls.Fader.Value,0,4)
      print("wasnt matched")
    end
end

--Dynamic feedback for testing Fader
FaderFb = function()
  if string.find(Fb,'~DEVICE,'..Iid..','..Output..',14') then
    Controls.Fader.Value = Fbnum
    end
  end

--Shade buttons
Controls.TestBtn1.EventHandler = function()
  if Controls.TestBtn1.Boolean then
    Sock:Write('#DEVICE,'..Btn1Iid..',0,14,100.00\x0d\x0a')
    Btn1Fb()
      else Sock:Write('#DEVICE,'..Btn1Iid..',0,14,0.00\x0d\x0a')
        print("test1 down")
        Btn1Fb()
  end
end
Controls.TestBtn2.EventHandler = function()
  if Controls.TestBtn2.Boolean then
    Sock:Write('#DEVICE,'..Btn1Iid..',0,14,100.00\x0d\x0a')
    Btn2Fb()
    print("test2 up")
      else Sock:Write('#DEVICE,'..Btn1Iid..',0,14,0.00\x0d\x0a')
      print("test2 down")
      Btn2Fb()
  end
end

--Dynamic Feedback for shade buttons
Btn1Fb = function()
  if string.find(Fb,'~DEVICE,'..Btn1Iid..',0,14,100.00') then
    Controls.TestBtn1.Color = "Green"
    Controls.TestBtn1.Legend = "Shades are up"
      else if string.find(Fb,'~DEVICE,'..Btn1Iid..',0,14,0.00') then
        Controls.TestBtn1.Color = "Red"
        Controls.TestBtn1.Legend = "Shades are down"
        end
    end
end
Btn2Fb = function()
  if string.find(Fb,'~DEVICE,'..Btn1Iid..',0,14,100.00') then
    Controls.TestBtn2.Color = "Green"
    Controls.TestBtn2.Legend = "Shades are up"
      else if string.find(Fb,'~DEVICE,'..Btn1Iid..',0,14,0.00') then
        Controls.TestBtn2.Color = "Red"
        Controls.TestBtn2.Legend = "Shades are down"
      end
  end
end

--Opens connection
function IPConnect()
  if Address ~= "" and Port ~= "" then
    Sock:Connect(Address, Port)
      else print("Please add IP and Port information")
  end
end