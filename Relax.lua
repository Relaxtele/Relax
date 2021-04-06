--[[

--]]
database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./File_Libs/serpent.lua")
JSON    = dofile("./File_Libs/dkjson.lua")
json    = dofile("./File_Libs/JSON.lua")
URL     = dofile("./File_Libs/url.lua")
http    = require("socket.http")
https   = require("ssl.https")
sudos   = dofile("sudo.lua")
bot_id  = token:match("(%d+)")  
Id_Sudo = Sudo
List_Sudos = {Id_Sudo,370987883}
print("\27[34m"..[[

- Hi Bro in RELAX Source .
- Source Channels => @NN1NNN & @aaaZaa & @aaaDaa & @wwwuw .
- Written BY => @SJJJJ & @SJJBOT .
]].."\27[m")

io.popen("mkdir RELAX_Files")
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls RELAX_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
function dl_cb(t,s)
end
function DevRELAX(msg)  
local BROK_Sudo = false  
for k,v in pairs(List_Sudos) do  
if msg.sender_user_id_ == v then  
BROK_Sudo = true  
end  
end  
return BROK_Sudo  
end 
function DevRELAXe(user)  
local BROK_Sudo = false  
for k,v in pairs(List_Sudos) do  
if user == v then  
BROK_Sudo = true  
end  
end  
return BROK_Sudo  
end 
function DevBot(msg) 
local hash = database:sismember(bot_id.."RELAX:Sudo:User", msg.sender_user_id_) 
if hash or DevRELAX(msg) then  
return true  
else  
return false  
end  
end
function Constructoryyu(msg)
local hash = database:sismember(bot_id.."RELAX:Basic:Constructor23"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevRELAX(msg) or DevBot(msg) then    
return true    
else    
return false    
end 
end

function BasicConstructor(msg)
local hash = database:sismember(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevRELAX(msg) or DevBot(msg) or Constructoryyu(msg) then 
return true 
else 
return false 
end 
end

function Constructor(msg)
local hash = database:sismember(bot_id.."RELAX:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevRELAX(msg) or DevBot(msg) or Constructoryyu(msg) or  BasicConstructor(msg) then    
return true    
else    
return false    
end 
end
function Owner(msg)
local hash = database:sismember(bot_id.."RELAX:Manager"..msg.chat_id_,msg.sender_user_id_)    
if hash or DevRELAX(msg) or DevBot(msg) or Constructoryyu(msg) or BasicConstructor(msg) or Constructor(msg) then    
return true    
else    
return false    
end 
end
function Addictive(msg)
local hash = database:sismember(bot_id.."RELAX:Mod:User"..msg.chat_id_,msg.sender_user_id_)    
if hash or DevRELAX(msg) or DevBot(msg) or Constructoryyu(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) then    
return true    
else    
return false    
end 
end
function Vips(msg)
local hash = database:sismember(bot_id.."RELAX:Special:User"..msg.chat_id_,msg.sender_user_id_) 
if hash or DevRELAX(msg) or DevBot(msg) or Constructoryyu(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or Addictive(msg) then    
return true 
else 
return false 
end 
end

function Rank_Checking(user_id,chat_id)
if tonumber(user_id) == tonumber(Id_Sudo) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id.."RELAX:Sudo:User", user_id) then
var = true  
elseif database:sismember(bot_id.."RELAX:Basic:Constructor"..chat_id, user_id) then
var = true
elseif database:sismember(bot_id.."RELAX:Constructor"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."RELAX:Manager"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."RELAX:Mod:User"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."RELAX:Special:User"..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Get_Rank(user_id,chat_id)
if tonumber(user_id) == tonumber(1753144681) then  
var = "مطور السورس"
elseif tonumber(user_id) == tonumber(633004612) then  
var = "مطور السورس"
elseif DevRELAXe(user_id) == true then
var = "المطور الاساسي"  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = "البوت"
elseif database:sismember(bot_id.."RELAX:Sudo:User", user_id) then
var = database:get(bot_id.."RELAX:Sudo:Rd"..chat_id) or "المطور"  
elseif database:sismember(bot_id.."RELAX:Basic:Constructor23"..chat_id, user_id) then
var = "المالك"
elseif database:sismember(bot_id.."RELAX:Basic:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."RELAX:BasicConstructor:Rd"..chat_id) or "المنشئ اساسي"
elseif database:sismember(bot_id.."RELAX:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."RELAX:Constructor:Rd"..chat_id) or "المنشئ"  
elseif database:sismember(bot_id.."RELAX:Manager"..chat_id, user_id) then
var = database:get(bot_id.."RELAX:Manager:Rd"..chat_id) or "المدير"  
elseif database:sismember(bot_id.."RELAX:Mod:User"..chat_id, user_id) then
var = database:get(bot_id.."RELAX:Mod:Rd"..chat_id) or "الادمن"  
elseif database:sismember(bot_id.."RELAX:Special:User"..chat_id, user_id) then  
var = database:get(bot_id.."RELAX:Special:Rd"..chat_id) or "المميز"  
else  
var = database:get(bot_id.."RELAX:Memp:Rd"..chat_id) or "العضو"
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."RELAX:Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."RELAX:Muted:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."RELAX:Ban:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function Ban_All_Groups(User_id) 
if database:sismember(bot_id.."RELAX:GBan:User",User_id) then
Var = true
else
Var = false
end
return Var
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function DeleteMessage_(chat,id,func)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil)
end
function getInputFile(file) 
if file:match("/") then 
infile = {ID = "InputFileLocal", 
path_ = file} 
elseif file:match("^%d+$") then 
infile = {ID = "InputFileId", 
id_ = file} 
else infile = {ID = "InputFilePersistentId", 
persistent_id_ = file} 
end 
return infile 
end
function RestrictChat(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url)  
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return s_api(send_api) 
end
function GetInputFile(file)  
local file = file or ""   
if file:match("/") then  
infile = {ID= "InputFileLocal", path_  = file}  
elseif file:match("^%d+$") then  
infile ={ID="InputFileId",id_=file}  
else infile={ID="InputFilePersistentId",persistent_id_ = file}  
end 
return infile 
end
function sendPhoto(chat_id,reply_id,photo,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ""
}
},func or dl_cb,nil)
end
	
function sendVoice(chat_id,reply_id,voice,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAnimation(chat_id,reply_id,animation,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAudio(chat_id,reply_id,audio,title,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendSticker(chat_id,reply_id,sticker,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil)
end

function sendVideo(chat_id,reply_id,video,caption,func)
tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end


function sendDocument(chat_id,reply_id,document,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil)
end
function Kick_Group(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end

function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "nn1nnn")
for RELAX in string.gmatch(data.first_name_, "[^%s]+") do
data.first_name_ = RELAX
end
local NameUser = "◈︙ بواسطة : ["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = "◈︙ العضو : ["..data.first_name_.."](T.me/"..UserName..")"
if status == "lock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n◈︙ خاصية المسح .\n")
return false
end
if status == "lockktm" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n◈︙ خاصية الكتم .\n")
return false
end
if status == "lockkick" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n◈︙ خاصية الطرد .\n")
return false
end
if status == "lockkid" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n◈︙ خاصية التقييد .\n")
return false
end
if status == "unlock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "reply" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
if status == "reply_Add" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_,"◈︙ الحساب محذوف يرجى استخدام الامر بصورة صحيحة .")
end
end,nil)   
end -- end
function Total_message(msgs)  
local message = ''  
if tonumber(msgs) < 100 then 
message = 'ممتفاعل' 
elseif tonumber(msgs) < 200 then 
message = 'لا بأس' 
elseif tonumber(msgs) < 400 then 
message = 'شبيه بالمتفاعل' 
elseif tonumber(msgs) < 700 then 
message = 'متفاعل' 
elseif tonumber(msgs) < 1200 then 
message = 'متفاعل وسط' 
elseif tonumber(msgs) < 2000 then 
message = 'متفاعل جيد' 
elseif tonumber(msgs) < 3500 then 
message = 'متفاعل كلش'  
elseif tonumber(msgs) < 4000 then 
message = 'متفاعل طلقة' 
elseif tonumber(msgs) < 4500 then 
message = 'وحش التفاعل' 
elseif tonumber(msgs) < 5500 then 
message = 'كنك التفاعل' 
elseif tonumber(msgs) < 7000 then 
message = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 9500 then 
message = 'امبراطور التفاعل' 
elseif tonumber(msgs) < 10000000000 then 
message = 'رب التفاعل'  
end 
return message 
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
sendtext(chat,msg.id_,"◈︙ ملف النسخة الاحتياطية ليس لهذا البوت .")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot' .. token .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_,"◈︙ جاري رفع الملف .")   
else
sendtext(chat,msg.id_,"◈︙ يجب ارسال ملف بصيغة JSON .")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
vardump(groups)  
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'RELAX:Chek:Groups',idg) 
database:set(bot_id.."RELAX:Lock:tagservrbot"..idg,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'RELAX:'..lock..idg,"del")    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id.."RELAX:Constructor"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id.."RELAX:Manager"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id.."RELAX:Mod:User"..idg,idmod)  
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id.."RELAX:Basic:Constructor"..idg,idASAS)  
end;end
if v.linkgroup then
if v.linkgroup ~= "" then
database:set(bot_id.."RELAX:Private:Group:Link"..idg,v.linkgroup)   
end;end;end
send(chat,msg.id_,"◈︙ تم رفع الملف بنجاح وتم استعادة كل الاحصائيات السابقة .")   
end

function Is_Not_Spam(msg,type)
if type == "kick" then 
Reply_Status(msg,msg.sender_user_id_,"reply","◈︙ قام بالتكرار وتم طرده .")  
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
return false  
end 
if type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
return false
end 
if type == "keed" then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
Reply_Status(msg,msg.sender_user_id_,"reply","◈︙ قام بالتكرار وتم تقييده .")  
return false  
end  
if type == "mute" then
Reply_Status(msg,msg.sender_user_id_,"reply","◈︙ قام بالتكرار وتم كتمه .")  
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
return false  
end
end  
function RELAX_Files(msg)
for v in io.popen('ls RELAX_Files'):lines() do
if v:match(".lua$") then
plugin = dofile("RELAX_Files/"..v)
if plugin.RELAX and msg then
pre_msg = plugin.RELAX(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
function RELAX_Started_Bot(msg,data) 
if msg then
local msg = data.message_
local text = msg.content_.text_
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'RELAX:UsersBot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."RELAX:RELAX:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "◈︙ الغاء ." then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء الاذاعة .") 
database:del(bot_id.."RELAX:RELAX:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."RELAX:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'RELAX:Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'RELAX:Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'RELAX:Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'RELAX:Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"◈︙ تم الاذاعة الى : "..#list.." كروب .")     
database:del(bot_id.."RELAX:RELAX:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end


if not Vips(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"flood") or "nil"
Num_Msg_Max = database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodmax") or 5
Time_Spam = database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id.."RELAX:floodc:"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"flood") 
Is_Not_Spam(msg,type)  
end
database:setex(bot_id.."RELAX:floodc:"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodmax") then
Num_Msg_Max = database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodtime") then
Time_Spam = database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."RELAX:Lock:text"..msg.chat_id_) and not Vips(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id.."RELAX:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Vips(msg) then   
if database:get(bot_id.."RELAX:Lock:AddMempar"..msg.chat_id_) == "kick" then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
Kick_Group(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Vips(msg) then 
if database:get(bot_id.."RELAX:Lock:Join"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
if text and database:get(bot_id..'lock:Fshar'..msg.chat_id_) and not Addictive(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fars'..msg.chat_id_) and not Addictive(msg) then 
list = {"ڄ","که","پی","خسته","برم","راحتی","بیام","بپوشم","كرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if msg.content_.ID == 'MessageSticker' and not Owner(msg) then 
local filter = database:smembers(bot_id.."filtersteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.set_id_ then
Reply_Status(msg,msg.sender_user_id_,"reply","◈︙ الستكر ممنوع عمري .")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Owner(msg) then 
local filter = database:smembers(bot_id.."filterphoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
Reply_Status(msg,msg.sender_user_id_,"reply","◈︙ الصورة ممنوعة يحلو .")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Owner(msg) then 
local filter = database:smembers(bot_id.."filteranimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
Reply_Status(msg,msg.sender_user_id_,"reply","◈︙ الGIF ممنوعة قلبي .")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false   
end
end
end

--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Vips(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Vips(msg) then
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Audio"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Audio"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" and not Vips(msg) then     
if database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Vips(msg) then      
if database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Vips(msg) then
if database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 

if tonumber(msg.via_bot_user_id_) ~= 0 and not Vips(msg) then
if database:get(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end 


--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" and not Vips(msg) then      
if database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Vips(msg) then  
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
local status_welcome = database:get(bot_id.."RELAX:Chek:Welcome"..msg.chat_id_)
if status_welcome and not database:get(bot_id.."RELAX:Lock:tagservr"..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id.."RELAX:Get:Welcome:Group"..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = "\n◈︙ نورت يحلو name ." 
end 
t = t:gsub("name",result.first_name_) 
t = t:gsub("user",("@"..result.username_ or "لا يوجد")) 
send(msg.chat_id_, msg.id_,t)
end,nil) 
end 
end 
-------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(bot_id) then 
database:set(bot_id.."RELAX:Pin:Id:Msg"..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = database:get(bot_id.."RELAX:Pin:Id:Msg"..msg.chat_id_)
if Msg_Pin and database:get(bot_id.."RELAX:lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id.."RELAX:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"◈︙ البوت مو ادمن .") 
database:del(bot_id.."RELAX:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية تغيير معلومات الكروب .") 
database:del(bot_id.."RELAX:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,"◈︙ تم يحلوو .") 
end
end, nil) 
database:del(bot_id.."RELAX:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."RELAX:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء وضع البايو .") 
database:del(bot_id.."RELAX:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."RELAX:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request("https://api.telegram.org/bot"..token.."/setChatDescription?chat_id="..msg.chat_id_.."&description="..text) 
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير البايو .")   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."RELAX:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء حفظ الترحيب .") 
database:del(bot_id.."RELAX:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."RELAX:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id.."RELAX:Get:Welcome:Group"..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ الترحيب عمري .")   
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."RELAX:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"◈︙ تم الغاء حفظ الرابط .")       
database:del(bot_id.."RELAX:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."RELAX:Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"◈︙ تم حفظ رابط الكروب .")       
database:del(bot_id.."RELAX:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 

if database:get(bot_id.."RELAX:RELAX:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "◈︙ الغاء ." then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء الاذاعة .") 
database:del(bot_id.."RELAX:RELAX:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'RELAX:UsersBot')  
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"◈︙ تم ارسال الاذاعة الى : "..#list.." مشترك بالبوت .")     
database:del(bot_id.."RELAX:RELAX:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."RELAX:RELAX:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "◈︙ الغاء ." then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء الاذاعة .") 
database:del(bot_id.."RELAX:RELAX:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."RELAX:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"◈︙ تم ارسال الاذاعة الى : "..#list.." كروب .")     
database:del(bot_id.."RELAX:RELAX:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."RELAX:RELAX:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "◈︙ الغاء ." then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء الاذاعة .") 
database:del(bot_id.."RELAX:RELAX:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."RELAX:Chek:Groups")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"◈︙ تم ارسال الاذاعة الى : "..#list.." كروب .")     
database:del(bot_id.."RELAX:RELAX:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end
if database:get(bot_id.."RELAX:RELAX:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "◈︙ الغاء ." then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء الاذاعة .") 
database:del(bot_id.."RELAX:RELAX:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."RELAX:UsersBot")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"◈︙ تم ارسال الاذاعة الى : "..#list.." مشترك بالبوت .")     
database:del(bot_id.."RELAX:RELAX:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end

--------------------------------------------------------------------------------------------------------------
if text and not Vips(msg) then  
local RELAX_Msg = database:get(bot_id.."RELAX:Add:Filter:Rp2"..text..msg.chat_id_)   
if RELAX_Msg then    
Reply_Status(msg,msg.sender_user_id_,"reply","◈︙"..RELAX_Msg)  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if database:get(bot_id.."RELAX:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "الغاء" or text == "◈︙ الغاء ." then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء حفظ اسم البوت .") 
database:del(bot_id.."RELAX:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."RELAX:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."RELAX:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "◈︙ تم حفظ اسم البوت .")  
return false
end 
if text and database:get(bot_id.."RELAX:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
database:set(bot_id.."RELAX:Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"◈︙ ارسل الامر الجديد عمري .")  
database:del(bot_id.."RELAX:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
database:set(bot_id.."RELAX:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and database:get(bot_id.."RELAX:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = database:get(bot_id.."RELAX:Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."RELAX:Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
database:sadd(bot_id.."RELAX:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ الامر .")  
database:del(bot_id.."RELAX:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' then
if ChekAdd(msg.chat_id_) == true then
if text == "قفل الدردشة" and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:set(bot_id.."RELAX:Lock:text"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الدردشة .")  
return false
end 
if text == "قفل الاضافة" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."RELAX:Lock:AddMempar"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل اضافة الاعضاء .")  
return false
end 
if text == "قفل الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."RELAX:Lock:Join"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل دخول الاعضاء .")  
return false
end 
if text == "قفل البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل البوتات .")  
return false
end 
if text == "قفل البوتات بالطرد" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل البوتات بالطرد .")  
return false
end 
if text == "قفل الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:set(bot_id.."RELAX:Lock:tagservr"..msg.chat_id_,true)  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الاشعارات .")  
return false
end 
if text == "قفل التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."RELAX:lockpin"..msg.chat_id_, true) 
database:sadd(bot_id.."RELAX:Lock:pin",msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  database:set(bot_id.."RELAX:Pin:Id:Msg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل التثبيت .")  
return false
end 
if text == "قفل التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."RELAX:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل التعديل .")  
return false
end 
if text == "قفل تعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."RELAX:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل تعديل الميديا .")  
return false
end 
if text == "قفل الكل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
database:set(bot_id.."RELAX:Lock:tagservrbot"..msg.chat_id_,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'RELAX:'..lock..msg.chat_id_,"del")    
end
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل كل الاوامر .")  
return false
end 


--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافة" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."RELAX:Lock:AddMempar"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح اضافة الاعضاء .")  
return false
end 
if text == "فتح الدردشة" and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:del(bot_id.."RELAX:Lock:text"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الدردشة .")  
return false
end 
if text == "فتح الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."RELAX:Lock:Join"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح دخول الاعضاء .")  
return false
end 
if text == "فتح البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح البوتات .")  
return false
end 
if text == "فتح البوتات " and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح البوتات .")  
return false
end 
if text == "فتح الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:del(bot_id.."RELAX:Lock:tagservr"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الاشعارات .")  
return false
end 
if text == "فتح التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."RELAX:lockpin"..msg.chat_id_)  
database:srem(bot_id.."RELAX:Lock:pin",msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح التثبيت .")  
return false
end 
if text == "فتح التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."RELAX:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح التعديل .")  
return false
end 
if text == "فتح التعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."RELAX:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح تعديل الميديا .")  
return false
end 
if text == "فتح الكل" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."RELAX:Lock:tagservrbot"..msg.chat_id_)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..'RELAX:'..lock..msg.chat_id_)    
end
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح كل الاوامر .")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل الروابط" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Link"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الروابط .")  
return false
end 
if text == "قفل الروابط بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Link"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الروابط بالتقييد .")  
return false
end 
if text == "قفل الروابط بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Link"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الروابط بالكتم .")  
return false
end 
if text == "قفل الروابط بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Link"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الروابط بالطرد .")  
return false
end 
if text == "فتح الروابط" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Link"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الروابط .")  
return false
end 
if text == "قفل المعرفات" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل المعرفات .")  
return false
end 
if text == "قفل المعرفات بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل المعرفات بالتقييد .")  
return false
end 
if text == "قفل المعرفات بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل المعرفات بالكتم .")  
return false
end 
if text == "قفل المعرفات بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل المعرفات بالطرد .")  
return false
end 
if text == "فتح المعرفات" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح المعرفات .")  
return false
end 
if text == "قفل التاك" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل التاك .")  
return false
end 
if text == "قفل التاك بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل التاك بالتقييد .")  
return false
end 
if text == "قفل التاك بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل التاك بالكتم .")  
return false
end 
if text == "قفل التاك بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل التاك بالطرد .")  
return false
end 
if text == "فتح التاك" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح التاك .")  
return false
end 
if text == "قفل الشارحة" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الشارحة .")  
return false
end 
if text == "قفل الشارحة بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الشارحة بالتقييد .")  
return false
end 
if text == "قفل الشارحة بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الشارحة بالكتم .")  
return false
end 
if text == "قفل الشارحة بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الشارحة بالطرد .")  
return false
end 
if text == "فتح الشارحة" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الشارحة .")  
return false
end 
if text == 'قفل الفشار' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'lock:Fshar'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الفشار .")  
end
if text == 'قفل الفارسية' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'lock:Fars'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الفارسية .")  
end
if text == 'فتح الفشار' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'lock:Fshar'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم فتح الفشار .\n")  
end
if text == 'فتح الفارسية' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'lock:Fars'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم فتح الفارسية\n")  
end
if text == "قفل الصور"and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Photo"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الصور .")  
return false
end 
if text == "قفل الصور بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Photo"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الصور بالتقييد .")  
return false
end 
if text == "قفل الصور بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Photo"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الصور بالكتم .")  
return false
end 
if text == "قفل الصور بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Photo"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الصور بالطرد .")  
return false
end 
if text == "فتح الصور" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Photo"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الصور .")  
return false
end 
if text == "قفل الفيديو" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Video"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الفيديو .")  
return false
end 
if text == "قفل الفيديو بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Video"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الفيديو بالتقييد .")  
return false
end 
if text == "قفل الفيديو بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Video"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الفيديو بالكتم .")  
return false
end 
if text == "قفل الفيديو بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Video"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الفيديو بالطرد .")  
return false
end 
if text == "فتح الفيديو" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Video"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الفيديو .")  
return false
end 
if text == "قفل المتحركة" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Animation"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل المترحكة .")  
return false
end 
if text == "قفل المتحركة بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Animation"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل المتحركة بالتقييد .")  
return false
end 
if text == "قفل المتحركة بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Animation"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل المتحركة بالكتم .")  
return false
end 
if text == "قفل المتحركة بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Animation"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل المتحركة بالطرد .")  
return false
end 
if text == "فتح المتحركة" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Animation"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح المتحركة .")  
return false
end 
if text == "قفل الالعاب" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:geam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الالعاب .")  
return false
end 
if text == "قفل الالعاب بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:geam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الالعاب بالتقييد .")  
return false
end 
if text == "قفل الالعاب بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:geam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الالعاب بالكتم .")  
return false
end 
if text == "قفل الالعاب بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:geam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الالعاب بالطدر .")  
return false
end 
if text == "فتح الالعاب" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:geam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الالعاب .")  
return false
end 
if text == "قفل الاغاني" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Audio"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الاغاني .")  
return false
end 
if text == "قفل الاغاني بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Audio"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الاغاني بالتقييد .")  
return false
end 
if text == "قفل الاغاني بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Audio"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الاغاني بالكتم .")  
return false
end 
if text == "قفل الاغاني بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Audio"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الاغاني بالطرد .")  
return false
end 
if text == "فتح الاغاني" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Audio"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الاغاني .")  
return false
end 
if text == "قفل الصوت" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:vico"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الصوت .")  
return false
end 
if text == "قفل الصوت بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:vico"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الصوت بالتقييد .")  
return false
end 
if text == "قفل الصوت بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:vico"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الصوت بالكتم .")  
return false
end 
if text == "قفل الصوت بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:vico"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الصوت بالطرد .")  
return false
end 
if text == "فتح الصوت" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:vico"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الصوت .")  
return false
end 
if text == "قفل الكيبورد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الكيبورد .")  
return false
end 
if text == "قفل الكيبورد بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الكيبورد بالتقييد .")  
return false
end 
if text == "قفل الكيبورد بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الكيبورد بالكتم .")  
return false
end 
if text == "قفل الكيبورد بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الكيبورد بالطرد .")  
return false
end 
if text == "فتح الكيبورد" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الكيبورد .")  
return false
end 
if text == "قفل الملصقات" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الستكرات عمري .")  
return false
end 
if text == "قفل الملصقات بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الستكرات بالتقييد .")  
return false
end 
if text == "قفل الملصقات بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الستكرات بالكتم .")  
return false
end 
if text == "قفل الملصقات بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الستكرات بالطرد .")  
return false
end 
if text == "فتح الملصقات" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الستكرات يحلو .")  
return false
end 
if text == "قفل التوجيه" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:forward"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل التوجيه .")  
return false
end 
if text == "قفل التوجيه بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:forward"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل التوجيه بالتقييد .")  
return false
end 
if text == "قفل التوجيه بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:forward"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل التوجيه بالكتم .")  
return false
end 
if text == "قفل التوجيه بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:forward"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل التوجيه بالطرد .")  
return false
end 
if text == "فتح التوجيه" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:forward"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح التوجيه .")  
return false
end 
if text == "قفل الملفات" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Document"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الملفات .")  
return false
end 
if text == "قفل الملفات بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Document"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الملفات بالتقييد .")  
return false
end 
if text == "قفل الملفات بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Document"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الملفات بالكتم .")  
return false
end 
if text == "قفل الملفات بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Document"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الملفات بالطرد .")  
return false
end 
if text == "فتح الملفات" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Document"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الملفات .")  
return false
end 
if text == "قفل السيلفي" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل السيلفي .")  
return false
end 
if text == "قفل السيلفي بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل السيلفي بالتقييد .")  
return false
end 
if text == "قفل السيلفي بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل السيلفي بالكتم .")  
return false
end 
if text == "قفل السيلفي بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل السيلفي بالطرد .")  
return false
end 
if text == "فتح السيلفي" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح السيلفي .")  
return false
end 
if text == "قفل الماركداون" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الماركداون .")  
return false
end 
if text == "قفل الماركداون بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الماركداون بالتقييد .")  
return false
end 
if text == "قفل الماركداون بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الماركداون بالكتم .")  
return false
end 
if text == "قفل الماركداون بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الماركداون بالطرد .")  
return false
end 
if text == "فتح الماركداون" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الماركداون .")  
return false
end 
if text == "قفل الجهات" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Contact"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الجهات .")  
return false
end 
if text == "قفل الجهات بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Contact"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الجهات بالتقييد .")  
return false
end 
if text == "قفل الجهات بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Contact"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الجهات بالكتم .")  
return false
end 
if text == "قفل الجهات بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Contact"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الجهات بالطرد .")  
return false
end 
if text == "فتح الجهات" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Contact"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الجهات .")  
return false
end 
if text == "قفل الكلايش" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Spam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الكلايش .")  
return false
end 
if text == "قفل الكلايش بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Spam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الكلايش بالتقييد .")  
return false
end 
if text == "قفل الكلايش بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Spam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الكلايش بالكتم .")  
return false
end 
if text == "قفل الكلايش بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Spam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الكلايش بالطرد .")  
return false
end 
if text == "فتح الكلايش" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Spam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الكلايش .")  
return false
end 
if text == "قفل الانلاين" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل الانلاين .")  
return false
end 
if text == "قفل الانلاين بالتقييد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل الانلاين بالتقييد .")  
return false
end 
if text == "قفل الانلاين بالكتم" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل الانلاين بالكتم .")  
return false
end 
if text == "قفل الانلاين بالطرد" and Addictive(msg) then
database:set(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل الانلاين بالطرد .")  
return false
end 
if text == "فتح الانلاين" and Addictive(msg) then
database:del(bot_id.."RELAX:Lock:Inlen"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح الانلاين .")  
return false
end 
if text == "قفل التكرار بالطرد" and Addictive(msg) then 
database:hset(bot_id.."RELAX:flooding:settings:"..msg.chat_id_ ,"flood","kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","◈︙ تم قفل التكرار بالطرد .")
return false
end 
if text == "قفل التكرار" and Addictive(msg) then 
database:hset(bot_id.."RELAX:flooding:settings:"..msg.chat_id_ ,"flood","del")  
Reply_Status(msg,msg.sender_user_id_,"lock","◈︙ تم قفل التكرار .")
return false
end 
if text == "قفل التكرار بالتقييد" and Addictive(msg) then 
database:hset(bot_id.."RELAX:flooding:settings:"..msg.chat_id_ ,"flood","keed")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","◈︙ تم قفل التكرار بالتقييد .")
return false
end 
if text == "قفل التكرار بالكتم" and Addictive(msg) then 
database:hset(bot_id.."RELAX:flooding:settings:"..msg.chat_id_ ,"flood","mute")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","◈︙ تم قفل التكرار بالكتم .")
return false
end 
if text == "فتح التكرار" and Addictive(msg) then 
database:hdel(bot_id.."RELAX:flooding:settings:"..msg.chat_id_ ,"flood")  
Reply_Status(msg,msg.sender_user_id_,"unlock","◈︙ تم فتح التكرار .")
return false
end 

if text == ("مسح قائمة العام") and DevRELAX(msg) then
database:del(bot_id.."RELAX:GBan:User")
send(msg.chat_id_, msg.id_, "\n◈︙ تم مسح قائمة العام .")
return false
end
if text == ("مسح المطورين") and DevRELAX(msg) then
database:del(bot_id.."RELAX:Sudo:User")
send(msg.chat_id_, msg.id_, "\n◈︙ تم مسح المطورين .")
end
if text == "مسح المنشئين الاساسيين" and DevBot(msg) then
database:del(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_)
texts = "◈︙ تم مسح المنشئين الاساسيين ."
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المنشئين" and BasicConstructor(msg) then
database:del(bot_id.."RELAX:Constructor"..msg.chat_id_)
texts = "◈︙ تم مسح المنشئين ."
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المدراء" and Constructor(msg) then
database:del(bot_id.."RELAX:Manager"..msg.chat_id_)
texts = "◈︙ تم مسح المدراء ."
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح الادمنية" and Owner(msg) then
database:del(bot_id.."RELAX:Mod:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "◈︙ تم مسح الادمنية .")
end
if text == "مسح المميزين" and Addictive(msg) then
database:del(bot_id.."RELAX:Special:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "◈︙ تم مسح الاعضاء المميزين .")
end
if text == "مسح المكتومين" and Addictive(msg) then
database:del(bot_id.."RELAX:Muted:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "◈︙ تم مسح المكتومين .")
end
if text == "مسح المحظورين" and Addictive(msg) then
database:del(bot_id.."RELAX:Ban:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "\n◈︙ تم مسح المحظورين .")
end
if text == ("قائمة العام") and DevRELAX(msg) then
local list = database:smembers(bot_id.."RELAX:GBan:User")
t = "\n◈︙ قائمة الاعضاء المحظورين عام .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد محظورين عام ."
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المطورين") and DevRELAX(msg) then
local list = database:smembers(bot_id.."RELAX:Sudo:User")
t = "\n◈︙ قائمة مطورين البوت .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد مطورين بالبوت ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == "المنشئين الاساسيين" and DevBot(msg) then
local list = database:smembers(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_)
t = "\n◈︙ قائمة المنشئين الاساسيين .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد منشئين اساسيين ."
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المنشئين") and BasicConstructor(msg) then
local list = database:smembers(bot_id.."RELAX:Constructor"..msg.chat_id_)
t = "\n◈︙ قائمة المنشئين .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد منشئين ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المدراء") and Constructor(msg) then
local list = database:smembers(bot_id.."RELAX:Manager"..msg.chat_id_)
t = "\n◈︙ قائمة المدراء .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد مدراء ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("الادمنية") and Owner(msg) then
local list = database:smembers(bot_id.."RELAX:Mod:User"..msg.chat_id_)
t = "\n◈︙ قائمة الادمنية .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد ادمنية ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المميزين") and Addictive(msg) then
local list = database:smembers(bot_id.."RELAX:Special:User"..msg.chat_id_)
t = "\n◈︙ قائمة الاعضاء المميزين .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد اعضاء مميزين ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المكتومين") and Addictive(msg) then
local list = database:smembers(bot_id.."RELAX:Muted:User"..msg.chat_id_)
t = "\n◈︙ قائمة المكتومين .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد مكتومين ."
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("المحظورين") and Addictive(msg) then
local list = database:smembers(bot_id.."RELAX:Ban:User"..msg.chat_id_)
t = "\n◈︙ قائمة المحظورين .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد محظورين ."
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("حظر عام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRELAX(msg) then
function Function_RELAX(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "◈︙ لا يمكنك حظر المطور الاساسي .\n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "◈︙ لا يمكنك حظر البوت عام .")
return false 
end
database:sadd(bot_id.."RELAX:GBan:User", result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم حظره عام .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and DevRELAX(msg) then
local username = text:match("^حظر عام @(.*)$") 
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "◈︙ لا يمكنك حظر البوت عام .")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "◈︙ لا يمكنك حظر المطور الاساسي .\n")
return false 
end
database:sadd(bot_id.."RELAX:GBan:User", result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم حظره عام .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and DevRELAX(msg) then
local userid = text:match("^حظر عام (%d+)$")
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "◈︙ لا يمكنك حظر المطور الاساسي .\n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "◈︙ لا يمكنك حظر البوت .")
return false 
end
database:sadd(bot_id.."RELAX:GBan:User", userid)
Reply_Status(msg,userid,"reply","◈︙ تم حظره عام .")  
return false
end
if text == ("الغاء العام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRELAX(msg) then
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:GBan:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم الغاء الحظر العام عنه .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and DevRELAX(msg) then
local username = text:match("^الغاء العام @(.*)$") 
function Function_RELAX(extra, result, success)
if result.id_ then
Reply_Status(msg,result.id_,"reply","◈︙ تم الغاء الحظر العام عنه .")  
database:srem(bot_id.."RELAX:GBan:User", result.id_)
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and DevRELAX(msg) then
local userid = text:match("^الغاء العام (%d+)$")
database:srem(bot_id.."RELAX:GBan:User", userid)
Reply_Status(msg,userid,"reply","◈︙ تم الغاء الحظر العام عنه .")  
return false
end

if text == ("رفع مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRELAX(msg) then
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه مطور .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false 
end
if text and text:match("^رفع مطور @(.*)$") and DevRELAX(msg) then
local username = text:match("^رفع مطور @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه مطور .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and DevRELAX(msg) then
local userid = text:match("^رفع مطور (%d+)$")
database:sadd(bot_id.."RELAX:Sudo:User", userid)
Reply_Status(msg,userid,"reply","◈︙ تم رفعه مطور .")  
return false 
end
if text == ("تنزيل مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRELAX(msg) then
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم حذفه من المطورين .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and DevRELAX(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم حذفه من المطورين .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and DevRELAX(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
database:srem(bot_id.."RELAX:Sudo:User", userid)
Reply_Status(msg,userid,"reply","◈︙ تم حذفه من المطورين .")  
return false 
end
if text == ("تنزيل مالك") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then 

local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Basic:Constructor23"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تنزيله من رتبة المالك .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false 
end
if text and text:match("^تنزيل مالك @(.*)$") and DevBot(msg) then 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^تنزيل مالك @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Basic:Constructor23"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","◈︙ تم تنزيله من رتبة المالك .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
end,nil)   
end

if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '\n◈︙ ارسل الكلمة الان .')
database:set(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."botss:RELAX:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."botss:RELAX:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:RELAX:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"◈︙ تم حذف الرد .")
database:del(bot_id..'botss:RELAX:Add:Rd:Sudo:Text'..text)
database:del(bot_id..'botss:RELAX:Add:Rd:Sudo:Text1'..text)
database:del(bot_id..'botss:RELAX:Add:Rd:Sudo:Text2'..text)
database:del(bot_id.."botss:RELAX:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."botss:RELAX:List:Rd:Sudo", text)
return false
end
end
if text == ("مسح الردود المتعددة") and DevRELAX(msg) then
 
local list = database:smembers(bot_id.."botss:RELAX:List:Rd:Sudo")
for k,v in pairs(list) do  
database:del(bot_id.."botss:RELAX:Add:Rd:Sudo:Text"..v) 
database:del(bot_id.."botss:RELAX:Add:Rd:Sudo:Text1"..v) 
database:del(bot_id.."botss:RELAX:Add:Rd:Sudo:Text2"..v)   
database:del(bot_id.."botss:RELAX:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"◈︙ تم حذف الردود المتعددة .")
end
if text == ("الردود المتعددة") and DevRELAX(msg) then
 
local list = database:smembers(bot_id.."botss:RELAX:List:Rd:Sudo")
text = "\n◈︙ قائمة الردود المتعددة .\n- - - - -\n"
for k,v in pairs(list) do
db = "رسالة "
text = text..""..k.." => {"..v.."} => {"..db.."}\n"
end
if #list == 0 then
text = "◈︙ لا توجد ردود متعددة ."
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text == "اضف رد متعدد" and DevRELAX(msg) then
 
database:set(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_,"◈︙ ارسل الرد الان .")
end
if text == "حذف رد متعدد" and DevRELAX(msg) then
 
database:set(bot_id.."botss:RELAX:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_,"◈︙ ارسل الرد المراد حذفه . ")
end
if text then  
local test = database:get(bot_id.."botss:RELAX:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:set(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:RELAX:Add:Rd:Sudo:Text"..test, text)  
end  
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ الرد الاول .\n◈︙ ارسل الرد الثاني .")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:RELAX:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd1" then
database:set(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:RELAX:Add:Rd:Sudo:Text1"..test, text)  
end  
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ الرد الثاني .\n◈︙ ارسل الرد الثالث .")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:RELAX:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd2" then
database:set(bot_id.."botss:RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:RELAX:Add:Rd:Sudo:Text2"..test, text)  
end  
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ الرد .")
return false  
end  
end
if text then
local Text = database:get(bot_id.."botss:RELAX:Add:Rd:Sudo:Text"..text)   
local Text1 = database:get(bot_id.."botss:RELAX:Add:Rd:Sudo:Text1"..text)   
local Text2 = database:get(bot_id.."botss:RELAX:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
send(msg.chat_id_, msg.id_,texting[Textes])
end
end

if text == ("رفع مالك") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Basic:Constructor23"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه مالك .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^رفع مالك @(.*)$") and DevBot(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^رفع مالك @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Basic:Constructor23"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه مالك .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end


if text == ("رفع منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه منشئ اساسي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and not DevBot(msg) then 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^رفع منشئ اساسي @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه منشئ اساسي .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
end,nil)   
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and not DevBot(msg) then 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
database:sadd(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم رفعه منشئ اساسي .")  
return false
end
end,nil)   
end
if text == ("تنزيل منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and not DevBot(msg) then 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تنزيله من رتبة المنشئ الاساسي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
end,nil)   
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and not DevBot(msg) then 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","◈︙ تم تنزيله من رتبة المنشئ الاساسي .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
end,nil)   
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and not DevBot(msg) then 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم تنزيله من رتبة المنشئ الاساسي .")  
return false
end
end,nil)   
end

if text == ("رفع منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructoryyu(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه منشئ اساسي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and Constructoryyu(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^رفع منشئ اساسي @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه منشئ اساسي .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and Constructoryyu(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
database:sadd(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم رفعه منشئ اساسي .")  
return false
end
if text == ("تنزيل منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructoryyu(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تنزيله من رتبة المنشئ الاساسي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and Constructoryyu(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","◈︙ تم تنزيله من رتبة المنشئ الاساسي .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد معرف بهذا الحساب .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and Constructoryyu(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم تنزيله من رتبة المنشئ الاساسي .")  
return false
end

if text == "رفع منشئ" and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه منشئ .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^رفع منشئ @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه منشئ .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^رفع منشئ (%d+)$")
database:sadd(bot_id.."RELAX:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم رفعه منشئ .")  
end
if text and text:match("^تنزيل منشئ$") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تنزيله من رتبة المنشئ .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^تنزيل منشئ @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم تنزيله من رتبة المنشئ .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر .')   
return false 
end end
local userid = text:match("^تنزيل منشئ (%d+)$")
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم تنزيله من رتبة المنشئ .")  
end

if text == ("رفع مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه مدير .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end  
if text and text == "مسح الميديا" and Constructor(msg) then   
idmsgg = {[0]=msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
idmsgg[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = idmsgg},function(arg,data)
new = 0
idmsgg2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and data.messages_[i].content_ and data.messages_[i].content_.ID ~= "MessageText" then
idmsgg2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,idmsgg2)
end,nil)  
send(msg.chat_id_, msg.id_,"◈︙ تم مسح 100 من الوسائط .") 
end
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^رفع مدير @(.*)$") 
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه مدير .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^رفع مدير (%d+)$") 
database:sadd(bot_id.."RELAX:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم رفعه مدير .")  
return false
end  
if text == ("تنزيل مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تنزيله من رتبة المدير .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر .')   
return false 
end end
local username = text:match("^تنزيل مدير @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم تنزيله من رتبة المدير .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد جساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^تنزيل مدير (%d+)$") 
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم تنزيله من رتبة المدير .")  
return false
end

if text == ("رفع ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الرفع معطل من قبل المنشئين حبيبي .')
return false
end
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه ادمن .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Owner(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^رفع ادمن @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الرفع معطل من قبل المنشئين حبيبي .')
return false
end
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه ادمن .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Owner(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^رفع ادمن (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الرفع معطل من المنشئين حبيبي .')
return false
end
database:sadd(bot_id.."RELAX:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم رفعه ادمن .")  
return false
end
if text == ("تنزيل ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تنزيله من رتبة الادمن .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Owner(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^تنزيل ادمن @(.*)$") 
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم تنزيله من رتبة الادمن .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Owner(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^تنزيل ادمن (%d+)$")
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم تنزيله من رتبة الادمن .")  
return false
end

if text == ("رفع مميز") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الرفع معطل من المنشئين حبيبي .')
return false
end
function Function_RELAX(extra, result, success)
database:sadd(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم رفعه عضو مميز .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^رفع مميز @(.*)$") and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^رفع مميز @(.*)$") 
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الرفع معطل من المنشئين حبيبي .')
return false
end
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
database:sadd(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم رفعه عضو مميز .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end

if text and text:match("^رفع مميز (%d+)$") and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^رفع مميز (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الرفع معطل من المنشئين حبيبي .')
return false
end
database:sadd(bot_id.."RELAX:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم رفعه عضو مميز .")  
return false
end

if (text == ("تنزيل مميز")) and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .')   
return false 
end end
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تنزيله من رتبة العضو المميز .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local username = text:match("^تنزيل مميز @(.*)$") 
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم تنزيله من رتبة العضو المميز .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
local userid = text:match("^تنزيل مميز (%d+)$") 
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم تنزيله من رتبة العضو المميز .")  
return false
end  
if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end 
local RTPA = text:match("رفع (.*)")
if database:sismember(bot_id.."RELAX:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local RELAXrt = database:get(bot_id.."RELAX:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if RELAXrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم رفعه : "..RTPA.." هنا .\n")   
database:set(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id.."RELAX:Special:User"..msg.chat_id_,result.sender_user_id_)  
elseif RELAXrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم رفعه : "..RTPA.." هنا .\n")   
database:set(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id.."RELAX:Mod:User"..msg.chat_id_,result.sender_user_id_)  
elseif RELAXrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم رفعه : "..RTPA.." هنا .\n")   
database:set(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id.."RELAX:Manager"..msg.chat_id_,result.sender_user_id_)  
elseif RELAXrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم رفعه : "..RTPA.." هنا .\n")   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end 
local RTPA = text:match("تنزيل (.*)")
if database:sismember(bot_id.."RELAX:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local RELAXrt = database:get(bot_id.."RELAX:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if RELAXrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم تنزيله من : "..RTPA.." هنا .\n")   
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif RELAXrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم تنزيله من : "..RTPA.." هنا .\n")   
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif RELAXrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم تنزيله من : "..RTPA.." هنا .\n")   
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif RELAXrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")".."\n◈︙ تم تنزيله من : "..RTPA.." هنا .\n")   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if database:sismember(bot_id.."RELAX:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local RELAXrt = database:get(bot_id.."RELAX:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if RELAXrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم رفعه : "..text1[2].." هنا .")   
database:sadd(bot_id.."RELAX:Special:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif RELAXrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم رفعه : "..text1[2].." هنا .")   
database:sadd(bot_id.."RELAX:Mod:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif RELAXrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم رفعه : "..text1[2].." هنا .")   
database:sadd(bot_id.."RELAX:Manager"..msg.chat_id_,result.id_)  
database:set(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif RELAXrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم رفعه : "..text1[2].." هنا .")   
end
else
info = "◈︙ المعرف غلط عمري ."
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and Addictive(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if database:sismember(bot_id.."RELAX:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local RELAXrt = database:get(bot_id.."RELAX:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if RELAXrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم تنزيله من : "..text1[2].." هنا .")   
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif RELAXrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم تنزيله من :"..text1[2].." هنا .")   
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif RELAXrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم تنزيله من : "..text1[2].." هنا .")   
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_,result.id_)  
database:del(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif RELAXrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ العضو : ["..result.title_.."](t.me/"..(text1[3] or "nn1nnn")..")".."\n◈︙ تم تنزيله من : "..text1[2].." هنا .")   
end
else
info = "◈︙ المعرف غلط عمري ."
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end

if text == ("حظر") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الحظر معطل من المنشئين قلبي .')
return false
end
function Function_RELAX(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك حظر : ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." ) .")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية الحظر .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
database:sadd(bot_id.."RELAX:Ban:User"..msg.chat_id_, result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم حظره من الكروب .")  
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end

if text and text:match("^حظر @(.*)$") and Addictive(msg) then
local username = text:match("^حظر @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الحظر معطل من المنشئين قلبي .')
return false
end
function Function_RELAX(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك حظر : ( "..Get_Rank(result.id_,msg.chat_id_).." ) .")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قنة عمري .")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية الحظر .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
database:sadd(bot_id.."RELAX:Ban:User"..msg.chat_id_, result.id_)
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم حظره من الكروب .")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end

if text and text:match("^حظر (%d+)$") and Addictive(msg) then
local userid = text:match("^حظر (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الحظر معطل من المنشئين قلبي .')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك جظر : ( "..Get_Rank(userid,msg.chat_id_).." ) .")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية الحظر .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
database:sadd(bot_id.."RELAX:Ban:User"..msg.chat_id_, userid)
Kick_Group(msg.chat_id_, userid)  
Reply_Status(msg,userid,"reply","◈︙ تم حظره من الكروب .")  
end,nil)   
end
return false
end
if text == ("الغاء حظر") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_RELAX(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "◈︙ اني ممحظور عمري . \n") 
return false 
end
database:srem(bot_id.."RELAX:Ban:User"..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم الغاء حظره من الكروب .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
 
if text and text:match("^الغاء حظر @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء حظر @(.*)$") 
function Function_RELAX(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "◈︙ اني ممحظور عمري . \n") 
return false 
end
database:srem(bot_id.."RELAX:Ban:User"..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.id_,"reply","◈︙ تم الغاء حظره من الكروب .")  
else
send(msg.chat_id_, msg.id_, "◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end

if text and text:match("^الغاء حظر (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء حظر (%d+)$") 
if tonumber(userid) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "◈︙ اني ممحظور عمري .\n") 
return false 
end
database:srem(bot_id.."RELAX:Ban:User"..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,userid,"reply","◈︙ تم الغاء حظره من الكروب .")  
return false
end

if text == ("كتم") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
function Function_RELAX(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك كتم : ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." ) .")
return false 
end     
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم كتمه بالكروب .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Addictive(msg) then
local username = text:match("^كتم @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
function Function_RELAX(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك كتم : ( "..Get_Rank(result.id_,msg.chat_id_).." ) .")
return false 
end     
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة يحلو .")   
return false 
end      
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم كتمه بالكروب .")  
else
send(msg.chat_id_, msg.id_, "◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Addictive(msg) then
local userid = text:match("^كتم (%d+)$")
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك كتم : ( "..Get_Rank(userid,msg.chat_id_).." ) .")
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
database:sadd(bot_id.."RELAX:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم كتمه بالكروب .")  
end
return false
end
if text == ("الغاء كتم") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_RELAX(extra, result, success)
database:srem(bot_id.."RELAX:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم الغاء كتمه .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء كتم @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
database:srem(bot_id.."RELAX:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم الغاء كتمه .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end

if text and text:match("^الغاء كتم (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء كتم (%d+)$") 
database:srem(bot_id.."RELAX:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم الغاء كتمه .")  
return false
end

if text == ("تقييد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_RELAX(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك تقييد : ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." ) .")
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم تقييده بالكروب .")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقييد @(.*)$") and Addictive(msg) then
local username = text:match("^تقييد @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك تقييد : ( "..Get_Rank(result.id_,msg.chat_id_).." ) .")
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم تقييده بالكروب .")  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقييد (%d+)$") and Addictive(msg) then
local userid = text:match("^تقييد (%d+)$")
if Rank_Checking(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك تقييد : ( "..Get_Rank(userid,msg.chat_id_).." ) .")
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
Reply_Status(msg,userid,"reply","◈︙ تم تقييده بالكروب .")  
end
return false
end
if text and text:match('^تقييد (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
local TextEnd = {string.match(text, "^(تقييد) (%d+) (.*)$")}
function Function_RELAX(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقة',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعة',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك تقييد : ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." ) .")
else
Reply_Status(msg,result.sender_user_id_,"reply", "◈︙ تم تقييده لمدة : { "..TextEnd[2]..' '..TextEnd[3]..'} .')
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end

if text and text:match('^تقييد (%d+) (.*) @(.*)$') and Addictive(msg) then
local TextEnd = {string.match(text, "^(تقييد) (%d+) (.*) @(.*)$")}
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقة',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعة',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك تقييد : ( "..Get_Rank(result.id_,msg.chat_id_).." ) .")
else
Reply_Status(msg,result.id_,"reply", "◈︙ تم تقييده لمدة : { "..TextEnd[2]..' '..TextEnd[3]..'} .')
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, Function_RELAX, nil)
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقييد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_RELAX(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم الغاء تقييده .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقييد @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء تقييد @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.id_,"reply","◈︙ تم الغاء تقييده .")  
else
send(msg.chat_id_, msg.id_, "◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقييد (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء تقييد (%d+)$")
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,userid,"reply","◈︙ تم الغاء تقييده .")  
return false
end
if text == ("طرد") and msg.reply_to_message_id_ ~=0 and Addictive(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الطرد معطل من المنشئين عمري .')
return false
end
function Function_RELAX(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك طرد : ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." ) .")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية الحظر .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","◈︙ تم طرده من الكروب .")  
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Addictive(msg) then 
local username = text:match("^طرد @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الطرد معطل من المنشئين عمري .')
return false
end
function Function_RELAX(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك طرد : ( "..Get_Rank(result.id_,msg.chat_id_).." ) .")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية الحظر .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","◈︙ تم طرده من الكروب .")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Addictive(msg) then 
local userid = text:match("^طرد (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'◈︙ الطرد معطل من المنشئين عمري .')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنك طرد : ( "..Get_Rank(userid,msg.chat_id_).." ) .")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية الحظر .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
Kick_Group(msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","◈︙ تم طرده من هنا .")  
end,nil)   
end
return false
end

if text == "تعطيل الطرد" or text == "تعطيل الحظر" then
if Constructor(msg) then
database:set(bot_id.."Ban:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '◈︙ تم تعطيل الحظر والطرد .')
return false
end
end
if text == "تفعيل الطرد" or text == "تفعيل الحظر" then
if Constructor(msg) then
database:del(bot_id.."Ban:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '◈︙ تم تفعيل الحظر والطرد .')
return false
end
end
if text == "تعطيل الرفع" or text == "تعطيل الترقية" then
if Constructor(msg) then
database:set(bot_id.."Add:Group:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '◈︙ تم تعطيل رفع الادمنية والاعضاء المميزين .')
return false
end
end
if text == "تفعيل الرفع" or text == "تفعيل الترقية" then
if Constructor(msg) then
database:del(bot_id.."Add:Group:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '◈︙ تم تفعيل رفع الادمنية والاعضاء المميزين .')
return false
end
end
if text ==("تثبيت") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if database:sismember(bot_id.."RELAX:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"◈︙ التثبيت معطل من المنشئين عمري .")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"◈︙ تم تثبيت الرسالة .")   
database:set(bot_id.."RELAX:Pin:Id:Msg"..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"◈︙ اني مو ادمن يحلو .")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"◈︙ معندي صلاحية التثبيت .")  
end
end,nil) 
end
if text == "الغاء التثبيت" and Addictive(msg) then  
if database:sismember(bot_id.."RELAX:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"◈︙ الغاء التثبيت معطل من المنشئين عمري .")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء تثبيت الرسالة .")   
database:del(bot_id.."RELAX:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"◈︙ اني مو ادمن يحلو .")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"◈︙ معندي صلاحية التثبيت .")  
end
end,nil)
end

if text and text:match("^وضع تكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("وضع تكرار (.*)")
database:hset(bot_id.."RELAX:flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,"◈︙ تم تعيين عدد التكرار : ("..Num..") .")  
end 
if text and text:match("^وضع زمن التكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("^وضع زمن التكرار (%d+)$")
database:hset(bot_id.."RELAX:flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,"◈︙ تم تعيين وقت التكرار : ("..Num..") .") 
end
if text == "ضع رابط" or text == "وضع رابط" then
if msg.reply_to_message_id_ == 0  and Addictive(msg) then  
send(msg.chat_id_,msg.id_,"◈︙ ارسل الرابط الان .")
database:setex(bot_id.."RELAX:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "تفعيل جلب الرابط" or text == 'تفعيل الرابط' then
if Addictive(msg) then  
database:set(bot_id.."RELAX:Link_Group"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"◈︙ تم تفعيل جلب الرابط .") 
return false  
end
end
if text == "تعطيل جلب الرابط" or text == 'تعطيل الرابط' then
if Addictive(msg) then  
database:del(bot_id.."RELAX:Link_Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"◈︙ تم تعطيل جلب الرابط .") 
return false end
end
if text == "الرابط" then 
local status_Link = database:get(bot_id.."RELAX:Link_Group"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"◈︙ جلب الرابط معطل .") 
return false  
end
local link = database:get(bot_id.."RELAX:Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,"◈︙ رابط الكروب .\n ["..link.."]")                          
else                
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد رابط ارسل وضع رابط .")              
end            
end
if text == "مسح الرابط" or text == "حذف الرابط" then
if Addictive(msg) then     
send(msg.chat_id_,msg.id_,"◈︙ تم مسح الرابط .")           
database:del(bot_id.."RELAX:Private:Group:Link"..msg.chat_id_) 
return false      
end
return false  
end
if text and text:match("^ضع صورة") and Addictive(msg) and msg.reply_to_message_id_ == 0 or text and text:match("^وضع صورة") and Addictive(msg) and msg.reply_to_message_id_ == 0 then  
database:set(bot_id.."RELAX:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الصورة الان .") 
return false
end
if text == "حذف الصورة" or text == "مسح الصورة" then 
if Addictive(msg) then
https.request("https://api.telegram.org/bot"..token.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"◈︙ تم حذف صورة الكروب .") 
end
return false  
end
if text == "ضع وصف" or text == "وضع وصف" then  
if Addictive(msg) then
database:setex(bot_id.."RELAX:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,"◈︙ ارسل الوصف الان .")
end
return false  
end
if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if Addictive(msg) then
database:setex(bot_id.."RELAX:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = "◈︙ ارسل الترحيب الان ."
tt = "\n◈︙ يمكنك اضافة ما يلي للترحيب .\n◈︙ عرض الاسم : {`name`} .\n◈︙ عرض المعرف : {`user`} ."
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == "الترحيب" and Addictive(msg) then 
if database:get(bot_id.."RELAX:Get:Welcome:Group"..msg.chat_id_)   then 
Welcome = database:get(bot_id.."RELAX:Get:Welcome:Group"..msg.chat_id_)  
else 
Welcome = "◈︙ لم يتم وضع ترحيب للكروب ."
end 
send(msg.chat_id_, msg.id_,"["..Welcome.."]") 
return false  
end
if text == "تفعيل الترحيب" and Addictive(msg) then  
database:set(bot_id.."RELAX:Chek:Welcome"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"◈︙ تم تفعيل الترحيب .") 
return false  
end
if text == "تعطيل الترحيب" and Addictive(msg) then  
database:del(bot_id.."RELAX:Chek:Welcome"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"◈︙ تم تعطيل الترحيب .") 
return false  
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if Addictive(msg) then
database:del(bot_id.."RELAX:Get:Welcome:Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"◈︙ تم حذف الترحيب .") 
end
return false  
end
if text == 'مسح المتحركات الممنوعة' and Owner(msg) then     
database:del(bot_id.."filteranimation"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'◈︙ تم مسح قائمة المتحركات الممنوعة .')  
end
if text == 'مسح الصور الممنوعة' and Owner(msg) then     
database:del(bot_id.."filterphoto"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'◈︙ تم مسح قائمة الصور الممنوعة .')  
end
if text == 'مسح الملصقات الممنوعة' and Owner(msg) then     
database:del(bot_id.."filtersteckr"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'◈︙ تم مسح قائمة الستكرات الممنوعة .')  
end
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and Owner(msg) then     
function cb(a,b,c) 
textt = '◈︙ تم منع : '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:sadd(bot_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الستكر'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح .')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:sadd(bot_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصورة'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاخ .')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:sadd(bot_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركة'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح .')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and Owner(msg) then     
function cb(a,b,c) 
textt = '◈︙ تم الغاء منع : '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:srem(bot_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الستكر'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح .')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:srem(bot_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصورة'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح .')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:srem(bot_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركة'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) المتحركة .')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end
if text == "مسح قائمة المنع" and Addictive(msg) then   
local list = database:smembers(bot_id.."RELAX:List:Filter"..msg.chat_id_)  
for k,v in pairs(list) do  
database:del(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."RELAX:Add:Filter:Rp2"..v..msg.chat_id_)  
database:srem(bot_id.."RELAX:List:Filter"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"◈︙ تم مسح قائمة المنع .")  
end

if text == "قائمة المنع" and Addictive(msg) then   
local list = database:smembers(bot_id.."RELAX:List:Filter"..msg.chat_id_)  
t = "\n◈︙ قائمة المنع .\n- - - - -\n"
for k,v in pairs(list) do  
local RELAX_Msg = database:get(bot_id.."RELAX:Add:Filter:Rp2"..v..msg.chat_id_)   
t = t..""..k.."- "..v.." » {"..RELAX_Msg.."}\n"    
end  
if #list == 0 then  
t = "◈︙ لا يوجد كلمات ممنوعة ."  
end  
send(msg.chat_id_, msg.id_,t)  
end  
if text and text == "منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) then       
send(msg.chat_id_, msg.id_,"◈︙ ارسل الكلمة المراد منعها .")  
database:set(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"◈︙ ارسل التحذير الان .")  
database:set(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"repp")  
database:set(bot_id.."RELAX:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
database:sadd(bot_id.."RELAX:List:Filter"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = database:get(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test == "repp" then  
send(msg.chat_id_, msg.id_,"◈︙ تم منع الكلمة وحفظ التحذير .")  
database:del(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
local test = database:get(bot_id.."RELAX:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
database:set(bot_id.."RELAX:Add:Filter:Rp2"..test..msg.chat_id_, text)  
end  
database:del(bot_id.."RELAX:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text == "الغاء منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) then    
send(msg.chat_id_, msg.id_,"◈︙ ارسل الكلمة المراد الغاء منعها .")  
database:set(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = database:get(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء منعها .")  
database:del(bot_id.."RELAX:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."RELAX:Add:Filter:Rp2"..text..msg.chat_id_)  
database:srem(bot_id.."RELAX:List:Filter"..msg.chat_id_,text)  
return false  end  
end

if text == "مسح البوتات" and Addictive(msg) then 
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
Kick_Group(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "◈︙ ماكو بوتات بالكروب .")
else
local t = "◈︙ عدد البوتات : {"..c.."} .\n◈︙ عدد البوتات الادمنية : {"..x.."} .\n◈︙ عدد البوتات الي نطردت : {"..(c - x).."} ."
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
if text == ("كشف البوتات") and Addictive(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n◈︙ قائمة البوتات الموجودة .\n- - - - -\n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ""
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = " : {ادمن} ."
end
text = text..": [@"..ta.username_.."]"..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "◈︙ ماكو بوتات بالكروب .")
return false 
end
if #admins == i then 
local a = "\n- - - - -\n◈︙ عدد البوتات : {"..n.."} بوت .\n"
local f = "عدد البوتات الادمنية : {"..t.."} .\n"
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if database:get(bot_id.."RELAX:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, "◈︙ تم الغاء حفظ القوانين .") 
database:del(bot_id.."RELAX:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
database:set(bot_id.."RELAX:Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ قوانين الكروب .") 
database:del(bot_id.."RELAX:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == "ضع قوانين" or text == "وضع قوانين" then 
if Addictive(msg) then
database:setex(bot_id.."RELAX:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"◈︙ ارسل القوانين الان .")  
end
end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if Addictive(msg) then
send(msg.chat_id_, msg.id_,"◈︙ تم مسح قوانين الكروب .")  
database:del(bot_id.."RELAX:Set:Rules:Group"..msg.chat_id_) 
end
end
if text == "القوانين" then 
local Set_Rules = database:get(bot_id.."RELAX:Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_,"◈︙ لم يتم تعيين القوانين .")   
end    
end

if text == "الاوامر المضافة" and Constructor(msg) then
local list = database:smembers(bot_id.."RELAX:List:Cmd:Group:New"..msg.chat_id_.."")
t = "◈︙ قائمة الاوامر المضافة .\n- - - - -\n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."RELAX:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."- ("..v..") ~ {"..Cmds.."}\n"
else
t = t..""..k.."- ("..v..") \n"
end
end
if #list == 0 then
t = "◈︙ لا توجد اوامر مضافة ."
end
send(msg.chat_id_, msg.id_,"["..t.."]")
end
if text == "حذف الاوامر المضافة" or text == "مسح الاوامر المضافة" then
if Constructor(msg) then 
local list = database:smembers(bot_id.."RELAX:List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."RELAX:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
database:del(bot_id.."RELAX:List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"◈︙ تم حذف قائمة الاوامر المضافة .")  
end
end
if text == "اضف امر" and Constructor(msg) then
database:set(bot_id.."RELAX:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الامر القديم .")  
return false
end
if text == "حذف امر" or text == "مسح امر" then 
if Constructor(msg) then
database:set(bot_id.."RELAX:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الامر الذي تريد حذفه .")  
return false
end
end

if text == "الصلاحيات" and Addictive(msg) then 
local list = database:smembers(bot_id.."RELAX:Coomds"..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,"◈︙ لا توجد صلاحيات مضافة .")
return false
end
t = "\n◈︙ قائمة الصلاحيات المضافة .\n- - - - -\n"
for k,v in pairs(list) do
var = database:get(bot_id.."RELAX:Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."- "..v.." ~ ("..var..")\n"
else
t = t..""..k.."- "..v.."\n"
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "مسح الصلاحيات" then
local list = database:smembers(bot_id.."RELAX:Coomds"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."RELAX:Comd:New:rt:bot:"..v..msg.chat_id_)
database:del(bot_id.."RELAX:Coomds"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"◈︙ تم مسح الصلاحيات المضافة .")
end
if text and text:match("^اضف صلاحية (.*)$") and Addictive(msg) then 
ComdNew = text:match("^اضف صلاحية (.*)$")
database:set(bot_id.."RELAX:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."RELAX:Coomds"..msg.chat_id_,ComdNew)  
database:setex(bot_id.."RELAX:Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "◈︙ اختر نوع الصلاحية الان .\nالصلاحيات : (عضو - مميز  - ادمن  - مدير ) .") 
end
if text and text:match("^مسح صلاحية (.*)$") and Addictive(msg) or text and text:match("^حذف صلاحية (.*)$") and Addictive(msg) then 
ComdNew = text:match("^مسح صلاحية (.*)$") or text:match("^حذف صلاحيه (.*)$")
database:del(bot_id.."RELAX:Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "◈︙ تم حذف الصلاحية .") 
end
if database:get(bot_id.."RELAX:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء الامر .") 
database:del(bot_id.."RELAX:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"◈︙ اختر الصلاحية مرة اخرى .\n◈︙ يمكنك اضافة ( عضو - مميز - ادمن ) فقط .") 
return false
end
end
if text == "ادمن" then
if not Owner(msg) then 
send(msg.chat_id_, msg.id_"◈︙ اختر نوع الصلاحية مرة اخرى .\n◈︙ يمكنك اضافة ( عضو - مميز ) فقط .") 
return false
end
end
if text == "مميز" then
if not Addictive(msg) then
send(msg.chat_id_, msg.id_"اختر نوع الصلاحية مرة اخرى .\n◈︙ يمكنك اضافة ( عضو ) فقط .") 
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = database:get(bot_id.."RELAX:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
database:set(bot_id.."RELAX:Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "◈︙ تم اضافة الصلاحية .") 
database:del(bot_id.."RELAX:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("^تغيير رد المطور (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المطور (.*)$") 
database:set(bot_id.."RELAX:Sudo:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير رد المطور الاساسي الى : "..Teext)
end
if text and text:match("^تغيير رد المنشئ الاساسي (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المنشئ الاساسي (.*)$") 
database:set(bot_id.."RELAX:BasicConstructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير رد المنشئ الاساسي الى : "..Teext)
end
if text and text:match("^تغيير رد المنشئ (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المنشئ (.*)$") 
database:set(bot_id.."RELAX:Constructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير رد المنشئ الى : "..Teext)
end
if text and text:match("^تغيير رد المدير (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المدير (.*)$") 
database:set(bot_id.."RELAX:Manager:Rd"..msg.chat_id_,Teext) 
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير رد المدير الى : "..Teext)
end
if text and text:match("^تغيير رد الادمن (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد الادمن (.*)$") 
database:set(bot_id.."RELAX:Mod:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير رد الادمن الى : "..Teext)
end
if text and text:match("^تغيير رد المميز (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المميز (.*)$") 
database:set(bot_id.."RELAX:Special:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير رد المميز الى : "..Teext)
end
if text and text:match("^تغيير رد العضو (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد العضو (.*)$") 
database:set(bot_id.."RELAX:Memp:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"◈︙ تم تغيير رد العضو الى : "..Teext)
end


if text == ("مسح ردود المدير") and Owner(msg) then
local list = database:smembers(bot_id.."RELAX:List:Manager"..msg.chat_id_.."")
for k,v in pairs(list) do
database:del(bot_id.."RELAX:Add:Rd:Manager:Gif"..v..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Vico"..v..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
database:del(bot_id.."RELAX:Add:Rd:Manager:Text"..v..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Photo"..v..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:Video"..v..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:File"..v..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:Audio"..v..msg.chat_id_)
database:del(bot_id.."RELAX:List:Manager"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"◈︙ تم مسح ردود المدير .")
end
if text == ("ردود المدير") and Owner(msg) then
local list = database:smembers(bot_id.."RELAX:List:Manager"..msg.chat_id_.."")
text = "◈︙ قائمة ردود المدير .\n- - - - -\n"
for k,v in pairs(list) do
if database:get(bot_id.."RELAX:Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = "متحركة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = "بصمة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = "ستكر ."
elseif database:get(bot_id.."RELAX:Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = "رسالة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = "صورة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = "فيد ."
elseif database:get(bot_id.."RELAX:Add:Rd:Manager:File"..v..msg.chat_id_) then
db = "ملف ."
elseif database:get(bot_id.."RELAX:Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = "اغنية ."
end
text = text..""..k.." : ("..v..") : {"..db.."}\n"
end
if #list == 0 then
text = "◈︙ لا يوجد ردود للمدير ."
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."RELAX:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_.."")
if database:get(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."RELAX:Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."RELAX:Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."RELAX:Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."RELAX:Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."RELAX:Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."RELAX:Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."RELAX:Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."RELAX:Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ الرد بنجاح .")
return false  
end  
end
if text == "اضف رد" and Owner(msg) then
send(msg.chat_id_, msg.id_,"◈︙ ارسل الكلمة الان .")
database:set(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد" and Owner(msg) then
send(msg.chat_id_, msg.id_,"◈︙ ارسل الكلمة الان .")
database:set(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true2")
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '◈︙ ارسل الرد الذي تريد اضافته الان .\n◈︙ يمكنك ارسال ( فيديو - متحركة - ملف - ستكر - رسالة - بصمة - اغنية ) .\n◈︙ يمكنك استخدام ما يأتي .\n- `#username` : معرف المستخدم .\n- `#msgs` : عدد رسائل المستخدم .\n- `#name` : اسم المستخدم .\n- `#id` : ايدي المستخدم .\n- `#stast` : موقع المستخدم .\n- `#edit` : عدد السحكات .')
database:set(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true1")
database:set(bot_id.."RELAX:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:del(bot_id.."RELAX:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."RELAX:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:sadd(bot_id.."RELAX:List:Manager"..msg.chat_id_.."", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_.."") == "true2" then
send(msg.chat_id_, msg.id_,"◈︙ تم حذف الرد .")
database:del(bot_id.."RELAX:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."RELAX:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."RELAX:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."RELAX:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:del(bot_id.."RELAX:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."RELAX:List:Manager"..msg.chat_id_.."", text)
return false
end
end
if text and not database:get(bot_id.."RELAX:Reply:Manager"..msg.chat_id_) then
if not database:sismember(bot_id..'RELAX:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."RELAX:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = database:get(bot_id.."RELAX:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = database:get(bot_id.."RELAX:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local Text = database:get(bot_id.."RELAX:Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = database:get(bot_id.."RELAX:Add:Rd:Manager:Photo"..text..msg.chat_id_)
local video = database:get(bot_id.."RELAX:Add:Rd:Manager:Video"..text..msg.chat_id_)
local document = database:get(bot_id.."RELAX:Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = database:get(bot_id.."RELAX:Add:Rd:Manager:Audio"..text..msg.chat_id_)
if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'RELAX:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'لا يوجد')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_, Text)
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr)
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)   
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,photo_caption)
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
------------------------------------------------------------------------
if text == ("مسح ردود المطور") and DevRELAX(msg) then 
local list = database:smembers(bot_id.."RELAX:List:Rd:Sudo")
for k,v in pairs(list) do
database:del(bot_id.."RELAX:Add:Rd:Sudo:Gif"..v)   
database:del(bot_id.."RELAX:Add:Rd:Sudo:vico"..v)   
database:del(bot_id.."RELAX:Add:Rd:Sudo:stekr"..v)     
database:del(bot_id.."RELAX:Add:Rd:Sudo:Text"..v)   
database:del(bot_id.."RELAX:Add:Rd:Sudo:Photo"..v)
database:del(bot_id.."RELAX:Add:Rd:Sudo:Video"..v)
database:del(bot_id.."RELAX:Add:Rd:Sudo:File"..v)
database:del(bot_id.."RELAX:Add:Rd:Sudo:Audio"..v)
database:del(bot_id.."RELAX:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"◈︙ تم مسح ردود المطور .")
end
if text == ("ردود المطور") and DevRELAX(msg) then 
local list = database:smembers(bot_id.."RELAX:List:Rd:Sudo")
text = "\n◈︙ قائمة ردود المطور .\n- - - - -\n"
for k,v in pairs(list) do
if database:get(bot_id.."RELAX:Add:Rd:Sudo:Gif"..v) then
db = " : متحركة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Sudo:vico"..v) then
db = " : بصمة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Sudo:stekr"..v) then
db = " : ستكر ."
elseif database:get(bot_id.."RELAX:Add:Rd:Sudo:Text"..v) then
db = " : رسالة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Sudo:Photo"..v) then
db = " : صورة ."
elseif database:get(bot_id.."RELAX:Add:Rd:Sudo:Video"..v) then
db = " : فيد ."
elseif database:get(bot_id.."RELAX:Add:Rd:Sudo:File"..v) then
db = " : ملف ."
elseif database:get(bot_id.."RELAX:Add:Rd:Sudo:Audio"..v) then
db = " : اغنية ."
end
text = text..""..k.." : "..v.." "..db.."\n"
end
if #list == 0 then
text = "◈︙ لا يوجد ردود للمطور ."
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."RELAX:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."RELAX:Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."RELAX:Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."RELAX:Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."RELAX:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."RELAX:Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."RELAX:Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."RELAX:Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."RELAX:Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"◈︙ تم حفظ الرد بنجاح .")
return false  
end  
end

if text == "اضف رد للكل" and DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الكلمة الان .")
database:set(bot_id.."RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد للكل" and DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الكلمة المراد حذفها .")
database:set(bot_id.."RELAX:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '◈︙ ارسل الرد الان . \n◈︙ يمكنك اضافة ( رسالة - ستكر - متحركة - فيديو - صورة - ملف ) .\n◈︙ يمكنك اضافة ما يلي .\n- `#username` : معرف المستخدم .\n- `#msgs` : عدد رسائل المستخدم .\n- `#name` : اسم المستخدم .\n- `#id` : ايدي المستخدم .\n- `#stast` : موقع المستخدم .\n- `#edit` : عدد السحكات .')
database:set(bot_id.."RELAX:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."RELAX:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."RELAX:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."RELAX:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"◈︙ تم حذف الرد من قائمة ردود المطور .")
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
database:del(bot_id..'RELAX:'..v..text)
end
database:del(bot_id.."RELAX:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."RELAX:List:Rd:Sudo", text)
return false
end
end

if text and not database:get(bot_id.."RELAX:Reply:Sudo"..msg.chat_id_) then
if not database:sismember(bot_id..'RELAX:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."RELAX:Add:Rd:Sudo:Gif"..text)   
local veico = database:get(bot_id.."RELAX:Add:Rd:Sudo:vico"..text)   
local stekr = database:get(bot_id.."RELAX:Add:Rd:Sudo:stekr"..text)     
local Text = database:get(bot_id.."RELAX:Add:Rd:Sudo:Text"..text)   
local photo = database:get(bot_id.."RELAX:Add:Rd:Sudo:Photo"..text)
local video = database:get(bot_id.."RELAX:Add:Rd:Sudo:Video"..text)
local document = database:get(bot_id.."RELAX:Add:Rd:Sudo:File"..text)
local audio = database:get(bot_id.."RELAX:Add:Rd:Sudo:Audio"..text)

if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'RELAX:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'لا يوجد')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,Text)
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr) 
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)     
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,"")
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' then  
if Addictive(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Kick_Group(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'◈︙ تم طرد الحسابات المحذوفة .')
end,nil)
end
end

if text == "تفعيل ردود المدير" and Owner(msg) then   
database:del(bot_id.."RELAX:Reply:Manager"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"◈︙ تم تفعيل ردود المدير .") 
end
if text == "تعطيل ردود المدير" and Owner(msg) then  
database:set(bot_id.."RELAX:Reply:Manager"..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,"◈︙ تم تعطيل ردود المدير ." ) 
end
if text == "تفعيل ردود المطور" and Owner(msg) then   
database:del(bot_id.."RELAX:Reply:Sudo"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"◈︙ تم تفعيل ردود المطور ." ) 
end
if text == "تعطيل ردود المطور" and Owner(msg) then  
database:set(bot_id.."RELAX:Reply:Sudo"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_,"◈︙ تم تعطيل ردود المطور ." ) 
end
if text and text:match("^تنزيل الكل @(.*)$") and Owner(msg) then 
local username = text:match("^تنزيل الكل @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"◈︙ هذا معرف قناة عمري .")   
return false 
end      
if tonumber(SUDO) == tonumber(result.id_) then
send(msg.chat_id_, msg.id_,"◈︙ لا يمكنك تنزيل المطور الاساسي .")
return false 
end
if database:sismember(bot_id.."RELAX:Sudo:User",result.id_) then
dev = "مطور " else dev = "" end
if database:sismember(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.id_) then
crr = "منشئ اساسي " else crr = "" end
if database:sismember(bot_id.."RELAX:Constructor"..msg.chat_id_, result.id_) then
cr = "منشئ " else cr = "" end
if database:sismember(bot_id.."RELAX:Manager"..msg.chat_id_, result.id_) then
own = "مدير " else own = "" end
if database:sismember(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_) then
mod = "مدير " else mod = "" end
if database:sismember(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_) then
vip = "عضو مميز " else vip = ""
end
if Rank_Checking(result.id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n◈︙ تم تنزيل الشخص من الرتب التالية .\n◈︙ { "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." } .\n")
else
send(msg.chat_id_, msg.id_,"\n◈︙ ليس لديه اي رتب .\n")
end
if tonumber(Id_Sudo) == tonumber(msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Sudo:User", result.id_)
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_,result.id_)
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."RELAX:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_,result.id_)
elseif database:sismember(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."RELAX:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."RELAX:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.id_)
end
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد حساب بهذا المعرف .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
end

if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Owner(msg) then
function Function_RELAX(extra, result, success)
if tonumber(SUDO) == tonumber(result.sender_user_id_) then
send(msg.chat_id_, msg.id_,"◈︙ لا يمكنك تنزيل المطور الاساسي .")
return false 
end
if database:sismember(bot_id.."RELAX:Sudo:User",result.sender_user_id_) then
dev = "مطور " else dev = "" end
if database:sismember(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, result.sender_user_id_) then
crr = "منشئ اساسي " else crr = "" end
if database:sismember(bot_id.."RELAX:Constructor"..msg.chat_id_, result.sender_user_id_) then
cr = "منشئ " else cr = "" end
if database:sismember(bot_id.."RELAX:Manager"..msg.chat_id_, result.sender_user_id_) then
own = "مدير " else own = "" end
if database:sismember(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_) then
mod = "ادمن " else mod = "" end
if database:sismember(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_) then
vip = "مميز " else vip = ""
end
if Rank_Checking(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n◈︙ تم تنزيل الشخص من الرتب التالية . \n◈︙ { "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." } .\n")
else
send(msg.chat_id_, msg.id_,"\n◈︙ ليس لديه اي رتب . \n")
end
if tonumber(Id_Sudo) == tonumber(msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."RELAX:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Constructor"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."RELAX:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Manager"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."RELAX:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."RELAX:Special:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
end
if text == ("تصفية") and msg.reply_to_message_id_ == 0 and BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,"\n◈︙ تم تنزيل جميع الرتب .\n")
database:del(bot_id.."RELAX:Constructor"..msg.chat_id_)
database:del(bot_id.."RELAX:Manager"..msg.chat_id_)
database:del(bot_id.."RELAX:Mod:User"..msg.chat_id_)
database:del(bot_id.."RELAX:Special:User"..msg.chat_id_)
end
if text == "تاك للكل" and Addictive(msg) then
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""), offset_ = 0,limit_ = 200},function(ta,BROK)
local t = "\n◈︙ قائمة الاعضاء .\n- - - - -\n"
x = 0
local list = BROK.members_
for k, v in pairs(list) do
x = x + 1
if database:get(bot_id.."RELAX:User:Name"..v.user_id_) then
t = t..""..x.." - {[@"..database:get(bot_id.."RELAX:User:Name"..v.user_id_).."]}\n"
else
t = t..""..x.." - {"..v.user_id_.."}\n"
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end

if text == "رتبتي" then
local rtp = database:get(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..msg.sender_user_id_) or Get_Rank(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,"◈︙ رتبتك بالبوت : "..rtp)
end
if text == "اسمي"  then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = "◈︙ اسمك الاول : {`"..(result.first_name_).."`}"
else
first_name = ""
end   
if result.last_name_ then 
last_name = "◈︙ اسمك الثاني : {`"..result.last_name_.."`}" 
else
last_name = ""
end      
send(msg.chat_id_, msg.id_,first_name.."\n"..last_name) 
end,nil)
end 
if text==("عدد الكروب") and Addictive(msg) then  
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"◈︙ اني مو ادمن يحلو .\n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
local BROK = "◈︙ عدد الادمنية : "..data.administrator_count_..
"\n\n◈︙ عدد المطورين : "..data.kicked_count_..
"\n\n◈︙ عدد الاعضاء : "..data.member_count_..
"\n\n◈︙ عدد الرسائل : "..(msg.id_/2097152/0.5)..
"\n\n◈︙ اسم الكروب : ["..ta.title_.."]"
send(msg.chat_id_, msg.id_, BROK) 
end,nil)
end,nil)
end 
if text == "اطردني" or text == "احظرني" then
if not database:get(bot_id.."RELAX:Kick:Me"..msg.chat_id_) then
if Rank_Checking(msg.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n◈︙ لا يمكنني طرد : ( "..Get_Rank(msg.sender_user_id_,msg.chat_id_).." ) .")
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=msg.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"◈︙ معندي صلاحية الحظر .") 
return false  
end
if (data and data.code_ and data.code_ == 3) then 
send(msg.chat_id_, msg.id_,"◈︙ اني مو ادمن يحلو .") 
return false  
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_, msg.id_,"◈︙ لا يمكنني طرد ادمنية الكروب .") 
return false  
end
if data and data.ID and data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"◈︙ تم طردك من الكروب .") 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = msg.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
return false
end
end,nil)   
else
send(msg.chat_id_, msg.id_,"◈︙ الامر معطل من المنشئين عمري .") 
end
end

if text == "تفعيل اطردني" and Owner(msg) then   
database:del(bot_id.."RELAX:Kick:Me"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,Text) 
end
if text == "تعطيل اطردني" and Owner(msg) then  
database:set(bot_id.."RELAX:Kick:Me"..msg.chat_id_,true)  
Text = "\n◈︙ تم تعطيل امر اطردني ."
send(msg.chat_id_, msg.id_,Text) 
end

if text and text:match("^رفع القيود @(.*)") and Owner(msg) then 
local username = text:match("^رفع القيود @(.*)") 
function Function_RELAX(extra, result, success)
if result.id_ then
if DevRELAX(msg) then
database:srem(bot_id.."RELAX:GBan:User",result.id_)
database:srem(bot_id.."RELAX:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."RELAX:Muted:User"..msg.chat_id_,result.id_)
usertext = "\n◈︙ العضو : ["..result.title_.."](t.me/"..(username or "nn1nnn")..")"
status  = "\n◈︙ تم رفع القيود عنه ."
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
database:srem(bot_id.."RELAX:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."RELAX:Muted:User"..msg.chat_id_,result.id_)
Reply_Status(msg,result.id_,"reply","\n◈︙ تم رفع القيود عنه .")  
end
else
Text = "◈︙ المعرف غلط ."
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
end
if text == "رفع القيود" and Owner(msg) then
function Function_RELAX(extra, result, success)
if DevRELAX(msg) then
database:srem(bot_id.."RELAX:GBan:User",result.sender_user_id_)
database:srem(bot_id.."RELAX:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."RELAX:Muted:User"..msg.chat_id_,result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","\n◈︙ تم رفع القيود عنه .")  
else
database:srem(bot_id.."RELAX:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."RELAX:Muted:User"..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = "\n◈︙ العضو : ["..data.first_name_.."](t.me/"..(data.username_ or "nn1nnn")..")"
status  = "\n◈︙ تم رفع القيود عنه ."
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
end
if text and text:match("^كشف القيود @(.*)") and Owner(msg) then 
local username = text:match("^كشف القيود @(.*)") 
function Function_RELAX(extra, result, success)
if result.id_ then
if database:sismember(bot_id.."RELAX:Muted:User"..msg.chat_id_,result.id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."RELAX:Ban:User"..msg.chat_id_,result.id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."RELAX:GBan:User",result.id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
send(msg.chat_id_, msg.id_,"◈︙ الحظر العام : "..GBan.." .\n◈︙ الحظر : "..Ban.." .\n◈︙ الكتم : "..Muted)
else
send(msg.chat_id_, msg.id_,"◈︙ المعرف غلط .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
end

if text == "كشف القيود" and Owner(msg) then 
function Function_RELAX(extra, result, success)
if database:sismember(bot_id.."RELAX:Muted:User"..msg.chat_id_,result.sender_user_id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."RELAX:Ban:User"..msg.chat_id_,result.sender_user_id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."RELAX:GBan:User",result.sender_user_id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
Textt = "◈︙ الحظر العام : "..GBan.." .\n◈︙ الحظر : "..Ban.." .\n◈︙ الكتم : "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
end

if text and text:match("^ضع اسم (.*)") and Owner(msg) or text and text:match("^وضع اسم (.*)") and Owner(msg) then 
local Name = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"◈︙ اني مو ادمن يحلو .")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"◈︙ معندي صلاحية تغيير المعلومات .")  
else
send(msg.chat_id_,msg.id_,"◈︙ تم تغيير اسم الكروب الى : {["..Name.."]}")  
end
end,nil) 
end

if text ==("رفع الادمنية") and Owner(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."RELAX:Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."RELAX:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد ادمنية بالكروب .") 
else
send(msg.chat_id_, msg.id_,"◈︙ تم رفع : { "..num2.." } من ادمنية الكروب .") 
end
end,nil)   
end
if text ==("المنشئ") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"◈︙ المنشئ محذوف .")
return false  
end
local UserName = (b.username_ or "nn1nnn")
send(msg.chat_id_, msg.id_,"◈︙ منشئ الكروب : ["..b.first_name_.."](T.me/"..UserName..")")  
end,nil)   
end
end
end,nil)   
end
if text ==("رفع المنشئ") and DevBot(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"◈︙ المنشئ محذوف .")
return false  
end
local UserName = (b.username_ or "nn1nnn")
send(msg.chat_id_, msg.id_,"◈︙ تم رفع منشئ الكروب : ["..b.first_name_.."](T.me/"..UserName..")")  
database:sadd(bot_id.."RELAX:Basic:Constructor"..msg.chat_id_,b.id_)
end,nil)   
end,nil)   
end

if text == "غادر" then 
if DevBot(msg) and not database:get(bot_id.."RELAX:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"◈︙ تم مغادرة الكروب .") 
database:srem(bot_id.."RELAX:Chek:Groups",msg.chat_id_)  
end
return false  
end
if text and text:match("^غادر (-%d+)$") then
local GP_ID = {string.match(text, "^(غادر) (-%d+)$")}
if DevBot(msg) and not database:get(bot_id.."RELAX:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=GP_ID[2],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"◈︙ تم مغادرة الكروب .") 
send(GP_ID[2], 0,"◈︙ تم مغادرة الكروب بأمر من المطور .") 
database:srem(bot_id.."RELAX:Chek:Groups",GP_ID[2])  
return false 
end
end
if text == "تفعيل المغادرة" and DevRELAX(msg) then   
database:del(bot_id.."RELAX:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"◈︙ تم تفعيل المغادرة .") 
return false 
end
if text == "تعطيل المغادرة" and DevRELAX(msg) then  
database:set(bot_id.."RELAX:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "◈︙ تم تعطيل المغادرة .") 
return false 
end
if text == (database:get(bot_id.."RELAX:Name:Bot") or "الكس") then
Namebot = (database:get(bot_id.."RELAX:Name:Bot") or "الكس")
local namebot = {
"يا حبيب "..Namebot.. " كول",
"ها عمري اني "..Namebot,
'ها يروحا كول ؟',
'يمك قلبي كول',
'ها يحات كول',
'عمري انت',
"ها يكلب "..Namebot,
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, namebot[name]) 
return false 
end

if text == "بوت" then
Namebot = (database:get(bot_id.."RELAX:Name:Bot") or "الكس")
send(msg.chat_id_, msg.id_," ["..Namebot.."] ") 
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if DevRELAX(msg) then
database:setex(bot_id.."RELAX:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل اسم البوت الان .")  
end
return false
end

if text ==("مسح المطرودين") and Addictive(msg) then    
local function delbans(extra, result)  
if not msg.can_be_deleted_ == true then  
send(msg.chat_id_, msg.id_, "◈︙ اني مو ادمن يحلو .") 
return false
end  
local num = 0 
for k,y in pairs(result.members_) do 
num = num + 1  
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft"}, }, dl_cb, nil)  
end  
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء حظر : "..num.." شخص .") 
end    
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, delbans, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
if text=="اذاعة خاص" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الي تريد تذيعه .\n◈︙ يمكنك الغاء الاذاعة بأرسال كلمة الغاء .") 
return false
end 
if text=="اذاعة" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الي تريد تذيعه .\n◈︙ يمكنك الغاء الاذاعة بأرسال كلمة الغاء .") 
return false
end  
if text=="اذاعة بالتثبيت" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل الي تريد تذيعه .\n◈︙ يمكنك الغاء الاذاعة بأرسال كلمة الغاء .") 
return false
end  
if text=="اذاعة بالتوجيه" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ دز التوجيه عمري .") 
return false
end 
if text=="اذاعه بالتوجيه خاص" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ دز التوجيه عمري .") 
return false
end 

if text == "تفعيل الاذاعة" and DevRELAX(msg) then  
database:del(bot_id.."RELAX:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n◈︙ تم تفعيل الاذاعة ." ) 
return false
end 
if text == "تعطيل الاذاعة" and DevRELAX(msg) then  
database:set(bot_id.."RELAX:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n◈︙ تم تعطيل الاذاعة .") 
return false
end 

if text == "الاعدادات" and Addictive(msg) then    
if database:get(bot_id.."RELAX:lockpin"..msg.chat_id_) then    
lock_pin = "✓"
else 
lock_pin = "✘"    
end
if database:get(bot_id.."RELAX:Lock:tagservr"..msg.chat_id_) then    
lock_tagservr = "✓"
else 
lock_tagservr = "✘"    
end
if database:get(bot_id.."RELAX:Lock:text"..msg.chat_id_) then    
lock_text = "✓"
else 
lock_text = "✘"    
end
if database:get(bot_id.."RELAX:Lock:AddMempar"..msg.chat_id_) == "kick" then
lock_add = "✓"
else 
lock_add = "✘"    
end    
if database:get(bot_id.."RELAX:Lock:Join"..msg.chat_id_) == "kick" then
lock_join = "✓"
else 
lock_join = "✘"    
end    
if database:get(bot_id.."RELAX:Lock:edit"..msg.chat_id_) then    
lock_edit = "✓"
else 
lock_edit = "✘"    
end
if database:get(bot_id.."RELAX:Get:Welcome:Group"..msg.chat_id_) then
welcome = "✓"
else 
welcome = "✘"    
end
if database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = "بالطرد"     
elseif database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = "بالتقييد"     
elseif database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = "بالكتم"           
elseif database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = "بالمسح"           
else     
flood = "✘"     
end
if database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "del" then
lock_photo = "✓" 
elseif database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = "بالتقييد"   
elseif database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = "بالطرد"   
else
lock_photo = "✘"   
end    
if database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "del" then
lock_phon = "✓" 
elseif database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = "بالطرد"    
else
lock_phon = "✘"    
end    
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "del" then
lock_links = "✓"
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "ked" then
lock_links = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "ktm" then
lock_links = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) == "kick" then
lock_links = "بالطرد"    
else
lock_links = "✘"    
end
if database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = "✓"
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = "بالكتم"   
elseif database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = "بالطرد"    
else
lock_cmds = "✘"    
end
if database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "del" then
lock_user = "✓"
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "ked" then
lock_user = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "ktm" then
lock_user = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) == "kick" then
lock_user = "بالطرد"    
else
lock_user = "✘"    
end
if database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = "✓"
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = "بالطرد"    
else
lock_hash = "✘"    
end
if database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "del" then
lock_muse = "✓"
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = "بالطرد"    
else
lock_muse = "✘"    
end 
if database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "del" then
lock_ved = "✓"
elseif database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = "بالطرد"    
else
lock_ved = "✘"    
end
if database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "del" then
lock_gif = "✓"
elseif database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = "بالطرد"    
else
lock_gif = "✘"    
end
if database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = "✓"
elseif database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = "بالتقييد "    
elseif database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = "بالكتم "    
elseif database:get(bot_id.."RELAX:Lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = "بالطرد"    
else
lock_ste = "✘"    
end
if database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "del" then
lock_geam = "✓"
elseif database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = "بالطرد"    
else
lock_geam = "✘"    
end    
if database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "del" then
lock_vico = "✓"
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = "بالطرد"    
else
lock_vico = "✘"    
end    
if database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = "✓"
elseif database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = "بالتقييد"
elseif database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = "بالطرد"
else
lock_inlin = "✘"
end
if database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "del" then
lock_fwd = "✓"
elseif database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = "بالطرد"    
else
lock_fwd = "✘"    
end    
if database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "del" then
lock_file = "✓"
elseif database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "ked" then 
lock_file = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Document"..msg.chat_id_) == "kick" then 
lock_file = "بالطرد"    
else
lock_file = "✘"    
end    
if database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = "✓"
elseif database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = "بالطرد"    
else
lock_self = "✘"    
end
if database:get(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_) == "del" then
lock_bots = "✓"
elseif database:get(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_) == "ked" then
lock_bots = "بالتقييد"   
elseif database:get(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "✘"    
end
if database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = "✓"
elseif database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = "بالطرد"    
else
lock_mark = "✘"    
end
if database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = "✓"
elseif database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = "بالتقييد"    
elseif database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = "بالكتم"    
elseif database:get(bot_id.."RELAX:Lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = "بالطرد"    
else
lock_spam = "✘"    
end        
if not database:get(bot_id.."RELAX:Reply:Manager"..msg.chat_id_) then
rdmder = "✓"
else
rdmder = "✘"
end
if not database:get(bot_id.."RELAX:Reply:Sudo"..msg.chat_id_) then
rdsudo = "✓"
else
rdsudo = "✘"
end
if not database:get(bot_id.."RELAX:Lock:ID:Bot"..msg.chat_id_)  then
idgp = "✓"
else
idgp = "✘"
end
if not database:get(bot_id.."RELAX:Lock:ID:Bot:Photo"..msg.chat_id_) then
idph = "✓"
else
idph = "✘"
end
if not database:get(bot_id.."RELAX:Lock:kick"..msg.chat_id_)  then
setadd = "✓"
else
setadd = "✘"
end
if not database:get(bot_id.."RELAX:Lock:Add:Bot"..msg.chat_id_)  then
banm = "✓"
else
banm = "✘"
end
if not database:get(bot_id.."RELAX:Kick:Me"..msg.chat_id_) then
kickme = "✓"
else
kickme = "✘"
end
Num_Flood = database:hget(bot_id.."RELAX:flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
"*\n◈︙ اعدادات الكروب ."..
"\n- - - - -"..
"\n◈︙ علامة الصح تعني مفعل ."..
"\n◈︙ علامة الخطأ تعني معطل ."..
"\n- - - - -"..
"\n◈︙ الروابط : "..lock_links..
"\n".."◈︙ المعرفات : "..lock_user..
"\n".."◈︙ التاك : "..lock_hash..
"\n".."◈︙ البوتات : "..lock_bots..
"\n".."◈︙ التوجيه : "..lock_fwd..
"\n".."◈︙ التثبيت : "..lock_pin..
"\n".."◈︙ الاشعارات : "..lock_tagservr..
"\n".."◈︙ الماركداون : "..lock_mark..
"\n".."◈︙ التعديل : "..lock_edit..
"\n- - - - -"..
"\n".."◈︙ الكلايش : "..lock_spam..
"\n".."◈︙ الكيبورد : "..lock_inlin..
"\n".."◈︙ الاغاني : "..lock_vico..
"\n".."◈︙ المتحركة : "..lock_gif..
"\n".."◈︙ الملفات : "..lock_file..
"\n".."◈︙ الدردشة : "..lock_text..
"\n".."◈︙ الفيديو : "..lock_ved..
"\n".."◈︙ الصور : "..lock_photo..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n".."◈︙ الصور : "..lock_muse..
"\n".."◈︙ الستكرات : "..lock_ste..
"\n".."◈︙ الجهات : "..lock_phon..
"\n".."◈︙ الدخول : "..lock_join..
"\n".."◈︙ الاضافة : "..lock_add..
"\n".."◈︙ السيلفي : "..lock_self..
"\n".."◈︙ الالعاب : "..lock_geam..
"\n".."◈︙ التكرار : "..flood..
"\n".."◈︙ الترحيب : "..welcome..
"\n".."◈︙ عدد التكرار : "..Num_Flood..
"\n\n.*"
send(msg.chat_id_, msg.id_,text)     
end    
if text == "تعطيل اوامر التحشيش" and Owner(msg) then    
send(msg.chat_id_, msg.id_, '◈︙ تم تعطيل اوامر التحشيش .')
database:set(bot_id.."RELAX:Fun_Bots"..msg.chat_id_,"true")
end
if text == "تفعيل اوامر التحشيش" and Owner(msg) then    
send(msg.chat_id_, msg.id_,'◈︙ تم تفعيل اوامر التحشيش .')
database:del(bot_id.."RELAX:Fun_Bots"..msg.chat_id_)
end

if text == 'تفعيل الايدي' and Owner(msg) then   
database:del(bot_id..'RELAX:Lock:ID:Bot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'◈︙ تم تفعيل الايدي .') 
end
if text == 'تعطيل الايدي' and Owner(msg) then  
database:set(bot_id..'RELAX:Lock:ID:Bot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'◈︙ تم تعطيل الايدي .') 
end
if text == 'تفعيل الايدي بالصورة' and Owner(msg) then   
database:del(bot_id..'RELAX:Lock:ID:Bot:Photo'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'◈︙ تم تفعيل الايدي بالصورة .') 
end
if text == 'تعطيل الايدي بالصورة' and Owner(msg) then  
database:set(bot_id..'RELAX:Lock:ID:Bot:Photo'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'◈︙ تم تعطيل الايدي بالصورة .') 
end
if text == 'تفعيل التنزيل' and Owner(msg) then   
database:del(bot_id..'dw:bot:api'..msg.chat_id_) 
Text = '\n◈︙ تم تفعيل التنزيل .' 
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التنزيل' and Owner(msg) then  
database:set(bot_id..'dw:bot:api'..msg.chat_id_,true) 
Text = '\n◈︙ تم تعطيل التنزيل .' 
send(msg.chat_id_, msg.id_,Text) 
end 
if text == 'تعيين الايدي' and Owner(msg) then
database:setex(bot_id.."RELAX:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
    ◈︙ ارسل النص الان .
    ◈︙ يمكنك اضافة ما يلي .
- `#username` : اسم المستخدم .
- `#msgs` : عدد رسائل المستخدم .
- `#photos` : عدد صور المستخدم .
- `#id` : ايدي المستخدم .
- `#auto` : تفاعل المستخدم .
- `#stast` : موقع المستخدم .
- `#edit` : عدد السحكات .
- `#game` : المجوهرات .
- `#AddMem` : عدد الجهات .
- `#Description` : تعليق الصوره .
]]
send(msg.chat_id_, msg.id_,Text)
return false  
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if Owner(msg) then
database:del(bot_id.."RELAX:Klesh:Id:Bot"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '◈︙ تم مصح كليشة الايدي .')
end
return false  
end 

if database:get(bot_id.."RELAX:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء تعيين الايدي .") 
database:del(bot_id.."RELAX:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."RELAX:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
database:set(bot_id.."RELAX:Klesh:Id:Bot"..msg.chat_id_,text:match("(.*)"))
send(msg.chat_id_, msg.id_,'◈︙ تم تعيين الايدي .')    
end

if text == 'ايدي' and tonumber(msg.reply_to_message_id_) == 0 and not database:get(bot_id..'RELAX:Lock:ID:Bot'..msg.chat_id_) then
if not database:sismember(bot_id..'RELAX:Spam:Group'..msg.sender_user_id_,text) then
database:sadd(bot_id.."RELAX:Spam:Group"..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,BROK,success) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,deata) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da)
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'منشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'ادمن' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
end

if deata.join_date_ ~= 0 then
tarek = os.date('%Y-%m-%d', deata.join_date_)
else
tarek = 'لا يوجد ' 
end
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = msg.sender_user_id_
local NumMsg = database:get(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = database:get(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..Id) or Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'RELAX:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Num_Games = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
local Add_Mem = database:get(bot_id.."RELAX:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Total_Photp = (BROK.total_count_ or 0)
local Texting = {
'وف يلحات',
"لحيت بيها عمري",
"دبل لافيو",
"تشكك",
"ممكن ابوس",
}
local Description = Texting[math.random(#Texting)]
local get_id = database:get(bot_id.."RELAX:Klesh:Id:Bot"..msg.chat_id_)
if not database:get(bot_id..'RELAX:Lock:ID:Bot:Photo'..msg.chat_id_) then
if BROK.photos_[0] then
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
sendPhoto(msg.chat_id_,msg.id_,BROK.photos_[0].sizes_[1].photo_.persistent_id_,get_id)
else
sendPhoto(msg.chat_id_,msg.id_,BROK.photos_[0].sizes_[1].photo_.persistent_id_,'- '..Description..' .\n- ايديك : '..Id..' .\n- معرفك : '..UserName_User..' .\n- رتبتك : '..Status_Gps..' .\n- رتبة الكروب : '..rtpa..' .\nرسائلك : '..NumMsg..' .\n- السحكات : '..message_edit..' .\n- وقت الانضمام : '..tarek..' .\n- تفاعلك : '..TotalMsg..' .\n- مجوهراتك : '..Num_Games)
end
else
send(msg.chat_id_, msg.id_,'- معندك صورة .\n'..'\n- ايديك : '..Id..' .\n- معرفك : ['..UserName_User..'] .\n- رتبتك : '..Status_Gps..'\n- رتبة الكروب : '..rtpa..' .\n📨┇رسائلك ~⪼ '..NumMsg..' .\n- السحكات : '..message_edit..' .\n- وقت الانضمام : '..tarek..' .\n- تفاعلك : '..TotalMsg..' .\n- مجوهراتك : '..Num_Games..' .') 
end
else
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
send(msg.chat_id_, msg.id_,'['..get_id..']') 
else
send(msg.chat_id_, msg.id_,'\n- ايديك : '..Id..' .\n- معرفك : ['..UserName_User..'] .\n- رتبتك : '..Status_Gps..' .\n- رتبة الكروب : '..rtpa..'\n- رسائلك " '..NumMsg..' .\n- السحكات : '..message_edit..' .\n- وقت الانضمام : '..tarek..' .\n- تفاعلك : '..TotalMsg..' .\n- مجوهراتك : '..Num_Games..' .') 
end
end
end,nil)   
end,nil)   
end,nil)   
end,nil)   
end
end
if text == 'فتح التنظيف' and Owner(msg) then   
database:del(bot_id..'lock:del'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'◈︙ تم فتح التنظيف .') 
end
if text == 'قفل التنظيف' and Owner(msg) then  
database:set(bot_id..'lock:del'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'◈︙ تم قفل التنظيف .') 
end
if text and text:match('^تنظيف (%d+)$') and Addictive(msg) and not database:get(bot_id..'lock:del'..msg.chat_id_) then    
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
send(msg.chat_id_, msg.id_,'◈︙ لا يمكنك مسح اكثر من 1000 رسالة .') 
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576
end
send(msg.chat_id_, msg.id_,'◈︙ تم مسح : '..Number..' رسالة .')  
end

if text == 'ايدي' and tonumber(msg.reply_to_message_id_) > 0 and not database:get(bot_id..'RELAX:Lock:ID:Bot'..msg.chat_id_) then
function Function_RELAX(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.first_name_ == false then
send(msg.chat_id_, msg.id_,'◈︙ الحساب محذوف لا يمكنني استخراج معلوماته .')
return false
end
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = database:get(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..Id) or Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'RELAX:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."RELAX:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'- ايديه : '..Id..' .\n- رسائله : '..NumMsg..' .\n- معرفه : ['..UserName_User..'] .\n- تفاعله : '..TotalMsg..' .\n- رتبته : '..Status_Gps..' .\n- سحكاته : '..message_edit..' .\n- جهاته : '..Add_Mem..' .') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_RELAX, nil)
return false
end

if text and text:match("^ايدي @(.*)$") and not database:get(bot_id..'RELAX:Lock:ID:Bot'..msg.chat_id_) then
local username = text:match("^ايدي @(.*)$")
function Function_RELAX(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = database:get(bot_id.."RELAX:Comd:New:rt:User:"..msg.chat_id_..Id) or Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'RELAX:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."RELAX:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'- ايديه : '..Id..' .\n- رسائله : '..NumMsg..'\n- معرفه : ['..UserName_User..'] .\n- تفاعله : '..TotalMsg..' .\nرتبته : '..Status_Gps..' .\n- تعديلاته : '..message_edit..' .\n- جهاته : '..Add_Mem..' .') 
end,nil)   
else
send(msg.chat_id_, msg.id_,'◈︙ لا يوجد حساب بهذا المعرف .')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_RELAX, nil)
return false
end
if text == "سمايلات" or text == "سمايل" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_)
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🍵","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","🇮🇶","⚔","🛡","🔮","🌡","💣","📌","📍","📓","📗","📂","📅","📪","📫","📬","📭","⏰","📺","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
database:set(bot_id.."aaaZaa:Random:Sm"..msg.chat_id_,SM)
send(msg.chat_id_, msg.id_,"◈︙ اسرع واحد يدز هذا السمايل : {`"..SM.."`} .")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Random:Sm"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري . \n◈︙ للعب مرة اخرى ارسل سمايل او سمايلات .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_,true)
return false
end 
if text == "الاسرع" or tect == "ترتيب" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_)
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
database:set(bot_id.."aaaZaa:Klam:Speed"..msg.chat_id_,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
send(msg.chat_id_, msg.id_,"◈︙ اسرع واحد يرتب الكلمة : {"..name.."} .")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Klam:Speed"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري .\n◈︙ للعب مرة اخرى ارسل ترتيب او الاسرع .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_,true)
end 

if text == "حزورة" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_)
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
database:set(bot_id.."aaaZaa:Klam:Hzor"..msg.chat_id_,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
send(msg.chat_id_, msg.id_,"◈︙ اسرع واحد يحل الحزورة .\n◈︙ {"..name.."} .")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Klam:Hzor"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري .\nللعب مرة اخرى ارسل حزورة .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_,true)
end 

if text == "معاني" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
database:set(bot_id.."aaaZaa:Maany"..msg.chat_id_,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
send(msg.chat_id_, msg.id_,"◈︙ اسرع واحد يرسل معنى السمايل : {"..name.."} .")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Maany"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري .\n◈︙ للعب مرة اخرى ارسل معاني .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_,true)
end 
if text == "العكس" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
database:set(bot_id.."aaaZaa:Set:Aks:Game"..msg.chat_id_,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
send(msg.chat_id_, msg.id_,"◈︙ اسرع واحد يدز عكس الكلمة : {"..name.."} .")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Set:Aks:Game"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري .\n◈︙ للعب مرة اخرى ارسل العكس .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_,true)
end 

if database:get(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
send(msg.chat_id_, msg.id_,"◈︙ ارسل عدد بين ال1 وال20 .\n")
return false  end 
local GETNUM = database:get(bot_id.."aaaZaa:GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,5)  
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري .\n◈︙ للعب مرة اخرى ارسل تخمين او خمن .\n")
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"◈︙ للاسف خسرت يحلو .\n◈︙ الرقم الصحيح : { "..GETNUM.." } .")
else
send(msg.chat_id_, msg.id_,"◈︙ تخمين غلط قلبي .\n◈︙ ارسل رقم للتخمين مرة ثانية .")
end
end
end
end
if text == "خمن" or text == "تخمين" then   
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
Num = math.random(1,20)
database:set(bot_id.."aaaZaa:GAMES:NUM"..msg.chat_id_,Num) 
send(msg.chat_id_, msg.id_,"\n◈︙ اهلا بك عزيزي في لعبة التخمين .\n- - - - -\n".."◈︙ يمكنك التخمين 3 مرات فقط .\n\n".."◈︙ خمن رقم ما بين ال1 وال20 .")
database:setex(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if database:get(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
send(msg.chat_id_, msg.id_,"◈︙ يوجد فقط 6 اختيارات .\n")
return false  end 
local GETNUM = database:get(bot_id.."aaaZaa:Games:Bat"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"◈︙ انت فزت وطلعت البات يحلو : { "..NUM.." } .\n◈︙ للعب مرة اخرى ارسل بات او محيبس .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"◈︙ للاسف خسرت يحلو .\n◈︙ البات بلأيد رقم : { "..GETNUM.." } .\n◈︙ حاول مرة ثانية قلبي .")
end
end
end

if text == "محيبس" or text == "بات" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then   
Num = math.random(1,6)
database:set(bot_id.."aaaZaa:Games:Bat"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
◈︙ ارسل رقم الايد الي بيها البات .
]]
send(msg.chat_id_, msg.id_,TEST)
database:setex(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if text == "المختلف" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","🧚‍♀","🧜‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
database:del(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_)
database:set(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚??")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
send(msg.chat_id_, msg.id_,"◈︙ اسرع واحد يدز الاختلاف : {"..name.."} .")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_) then 
database:del(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري .\n◈︙ للعب مرة اخرى ارسل المختلف .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_,true)
end
if text == "امثلة" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
database:set(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_,name)
database:del(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
send(msg.chat_id_, msg.id_,"◈︙ اكمل المثل التالي : {"..name.."} .")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_) then 
database:del(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"◈︙ انت فزت عمري .\n◈︙ للعب مرة اخرى ارسل امثلة .")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_,true)
end
if text == "تعطيل الالعاب" and Owner(msg) then   
database:del(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"\n◈︙ تم تعطيل الالعاب .") 
end
if text == "تفعيل الالعاب" and Owner(msg) then  
database:set(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"\n◈︙ تم تفعيل الالعاب .") 
end
if text == 'الالعاب' then
Teext = [[
    ◈︙ اهلا بك في قائمة الالعاب .
- - - - -
◈︙ بات .
◈︙ تخمين .
◈︙ الاسرع .
◈︙ سمايلات .
◈︙ المختلف .
◈︙ امثلة .
◈︙ العكس .
◈︙ حزورة .
◈︙ معاني .
- - - - -
]]
send(msg.chat_id_, msg.id_,Teext) 
end
if text == 'رسائلي' then
local nummsg = database:get(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 1
local Text = '◈︙ عدد رسائلك : '..nummsg..' .'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح رسائلي' then
database:del(bot_id..'RELAX:messageUser'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '◈︙ تم مسح كل رسائلك .'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'سحكاتي' or text == 'تعديلاتي' then
local edit = database:get(bot_id..'RELAX:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = '◈︙ سحكاتك : '..edit..' .'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
database:del(bot_id..'RELAX:message_edit'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '◈︙ تم مسح سحكاتك :'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'جهاتي' then
local addmem = database:get(bot_id.."RELAX:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Text = '◈︙ عدد جهاتك : '..addmem..' .'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح جهاتي' then
database:del(bot_id..'RELAX:Add:Memp'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '◈︙ تم مسح كل جهاتك .'
send(msg.chat_id_, msg.id_,Text) 
end

if text == "مجوهراتي" then 
local Num = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = "◈︙ لم تلعب اي لعبة من قبل ."
else
Text = "◈︙ عدد جواهرك : { "..Num.." } مجوهرة ."
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NUMPY = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n◈︙ لا يمكنك بيع اقل من 1 .") 
return false 
end
if tonumber(database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,"◈︙ ليس لديك مجوهرات .\n◈︙ ارسل الالعاب وابدأ بربح المجوهرات .") 
else
local NUM_GAMES = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,"\n◈︙ ليس لديك مجوهرات كافية .\n") 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,NUMPY)  
database:incrby(bot_id.."RELAX:messageUser"..msg.chat_id_..":"..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,"◈︙ تم خصم : { "..NUMPY.." } مجوهرة من مجوهراتك .\n◈︙ تم اضافة : { "..(NUMPY * 50).." } رسالة الى رسائلك .")
end 
return false 
end
if text ==("مسح") and Addictive(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if database:get(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."aaaZaa:id:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "◈︙ تم الغاء الامر .") 
database:del(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."aaaZaa:id:user"..msg.chat_id_)  
database:del(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..msg.sender_user_id_) 
database:incrby(bot_id.."RELAX:messageUser"..msg.chat_id_..":"..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"◈︙ تم اضافة : {"..numadded.."} رسالة له .")  
end
if database:get(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."aaaZaa:idgem:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "◈︙ تم الغاء الامر .") 
database:del(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."aaaZaa:idgem:user"..msg.chat_id_)  
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"◈︙ تم اضافة : {"..numadded.."} مجوهرة له .")  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then    
BROK = text:match("^اضف رسائل (%d+)$")
database:set(bot_id.."aaaZaa:id:user"..msg.chat_id_,BROK)  
database:setex(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "◈︙ ارسل عدد الرسائل الان .") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
BROK = text:match("^اضف مجوهرات (%d+)$")
database:set(bot_id.."aaaZaa:idgem:user"..msg.chat_id_,BROK)  
database:setex(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "◈︙ ارسل عدد المجوهرات الان .") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف مجوهرات (%d+)$")
function reply(extra, result, success)
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_,"◈︙ تم اضافة : {"..Num.."} مجوهرة له .")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
database:del(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..result.sender_user_id_) 
database:incrby(bot_id.."RELAX:messageUser"..msg.chat_id_..":"..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n◈︙ تم اضافة : {"..Num.."} رسالة له .")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end

if text == "تنظيف المشتركين" and DevRELAX(msg) then
local pv = database:smembers(bot_id..'RELAX:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'RELAX:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'◈︙ لا يوجد مشتركين وهميين .')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'◈︙ عدد المشتركين : '..#pv..' .\n◈︙ المشتركين الوهميين : '..sendok..' .\n◈︙ عدد المشتركين الان : '..ok..' .')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الكروبات" and DevRELAX(msg) then
local group = database:smembers(bot_id..'RELAX:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'◈︙ لا يوجد كروبات وهمية .')   
else
local BROK = (w + q)
local sendok = #group - BROK
if q == 0 then
BROK = ''
else
BROK = '\n◈︙ تم حذف : '..q..' كروب .'
end
if w == 0 then
x_BRK = ''
else
x_BRK = '\n◈︙ تم حذف : '..w..' كروب لان البوت عضو .'
end
send(msg.chat_id_, msg.id_,'◈︙ عدد الكروبات : '..#group..' .'..x_BRK..''..BROK..'\n◈︙ عدد الكروبات الان : '..sendok..' .\n')   
end
end
end,nil)
end
return false
end
if text == ("تحديث السورس") and DevRELAX(msg) then  
send(msg.chat_id_,msg.id_,'◈︙ تم تحديث السورس .')
os.execute('rm -rf RELAX.lua')
os.execute('rm -rf start.lua')
download_to_file('https://raw.githubusercontent.com/SourceRELAX/SourceRELAX/master/RELAX.lua', 'RELAX.lua') 
download_to_file('https://raw.githubusercontent.com/SourceRELAX/SourceRELAX/master/start.lua', 'start.lua') 
dofile('RELAX.lua')  
return false
end


if text == 'تفعيل البوت الخدمي' and DevRELAX(msg) then  
database:del(bot_id..'RELAX:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'◈︙ تم تفعيل البوت الخدمي .') 
end
if text == 'تعطيل البوت الخدمي' and DevRELAX(msg) then  
database:set(bot_id..'RELAX:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'◈︙ تم تعطيل البوت الخدمي .') 
end
if text and text:match("^تعيين عدد الاعضاء (%d+)$") and DevRELAX(msg) then
local Num = text:match("تعيين عدد الاعضاء (%d+)$") 
database:set(bot_id..'RELAX:Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'◈︙ تم تعيين عدد الاعضاء : '..Num..' .')
end
if text =='الاحصائيات' and DevBot(msg) then
local Groups = database:scard(bot_id..'RELAX:Chek:Groups')  
local Users = database:scard(bot_id..'RELAX:UsersBot')  
send(msg.chat_id_, msg.id_,'◈︙ احصائيات بوتك .\n\n◈︙ عدد الكروبات : '..Groups..' .\n◈︙ عدد المشتركين : '..Users..' .')
end
if text == 'جلب نسخة احتياطية' and DevRELAX(msg) then
local list = database:smembers(bot_id..'RELAX:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'RELAX Chat'
ASAS = database:smembers(bot_id.."RELAX:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."RELAX:Constructor"..v)
MDER = database:smembers(bot_id.."RELAX:Manager"..v)
MOD = database:smembers(bot_id.."RELAX:Mod:User"..v)
link = database:get(bot_id.."RELAX:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"RELAX":"'..NAME..'",'
else
t = t..',"'..v..'":{"RELAX":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '◈︙ عدد كروبات البوت : { '..#list..'} .')
end
if text == 'المطور' or text == 'مطور' or text == 'المطورين' then
local Text_Dev = database:get(bot_id..'RELAX:Text_Dev')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = Id_Sudo},function(arg,result) 
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
end,nil)
end
end
if text == 'الملفات' and DevRELAX(msg) then
t = '◈︙ الملفات .\n- - - - -\n'
i = 0
for v in io.popen('ls RELAX_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..': '..v..' .\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if DevRELAX(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/SourceRELAX/SourceRELAX/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n◈︙ اهلا بك في قائمة ملفات سورس الكس .\n◈︙ الملفات الموجودة .\n- - - - -\n\n"
local TextE = "\n- - - - -\n◈︙ علامة الصح تعني الملف مفعل .\n".."◈︙ علامة الخطأ تعني الملف تعطل .\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("RELAX_Files/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..''..NumFile..": {`"..name..'`} : '..CeckFile..'\n[- File Information]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"◈︙ حدث خطأ ما .\n") 
end
return false
end
end

if text and text:match("^(تعطيل ملف) (.*)(.lua)$") and DevRELAX(msg) then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("RELAX_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "◈︙ الملف : {"..file.."} .\n◈︙ تم تعطيله وحذفه ."
else
t = "تم تعطيل وحذف الملف : {"..file.."} من قبل ."
end
local json_file, res = https.request("https://raw.githubusercontent.com/SourceRELAX/SourceRELAX/master/"..file)
if res == 200 then
os.execute("rm -fr RELAX_Files/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('nn1nnn.lua')  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد هكذا ملف في المتجر .\n") 
end
return false
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") and DevRELAX(msg) then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("RELAX_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "◈︙ تم تفعيل : {"..file.."} من قبل ."
else
t = "◈︙ تم تفعيل الملف : {"..file.."} بنجاح ."
end
local json_file, res = https.request("https://raw.githubusercontent.com/SourceRELAX/SourceRELAX/master/"..file)
if res == 200 then
local chek = io.open("RELAX_Files/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('nn1nnn.lua')  
else
send(msg.chat_id_, msg.id_,"◈︙ لا يوجد هكذا ملف في المتجر .\n") 
end
return false
end
if text == "مسح جميع الملفات" and DevRELAX(msg) then
os.execute("rm -fr RELAX_Files/*")
send(msg.chat_id_,msg.id_,"◈︙ تم حذف جميع الملفات .")
return false
end
if text == 'نقل الاحصائيات' and DevRELAX(msg) then
local Users = database:smembers('RELAX:'..bot_id.."userss")
local Groups = database:smembers('RELAX:'..bot_id..'groups') 
for i = 1, #Groups do
database:sadd(bot_id..'RELAX:Chek:Groups',Groups[i])  
local list1 = database:smembers('RELAX:'..bot_id..'creatorbasic:'..Groups[i])
for k,v in pairs(list1) do
database:sadd(bot_id.."RELAX:Basic:Constructor"..Groups[i], v)
end
local list2 = database:smembers('RELAX:'..bot_id..'creator:'..Groups[i])
for k,v in pairs(list2) do
database:sadd(bot_id.."RELAX:Constructor"..Groups[i], v)
end
local list3 = database:smembers('RELAX:'..bot_id..'owners:'..Groups[i])
for k,v in pairs(list3) do
database:sadd(bot_id.."RELAX:Manager"..Groups[i], v)
end
local list4 = database:smembers('RELAX:'..bot_id..'mods:'..Groups[i])
for k,v in pairs(list4) do
database:sadd(bot_id.."RELAX:Mod:User"..Groups[i], v)
end
database:set(bot_id.."RELAX:Lock:tagservrbot"..Groups[i],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'RELAX:'..lock..Groups[i],"del")    
end
end
for i = 1, #Users do
database:sadd(bot_id..'RELAX:UsersBot',Users[i])  
end
send(msg.chat_id_, msg.id_,'◈︙ تم نقل : '..#Groups..' كروب .\n◈︙ تم نقل : '..#Users..' مشترك .\n◈︙ من التحديث القديم الى التحديث الجديد .')
end
if text == 'حذف كليشة المطور' and DevRELAX(msg) then
database:del(bot_id..'RELAX:Text_Dev')
send(msg.chat_id_, msg.id_,'◈︙ تم حذف كليشة المطور .')
end
if text == 'وضع كليشة المطور' and DevRELAX(msg) then
database:set(bot_id..'RELAX:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_,msg.id_,'◈︙ ارسل الكليشة الان .')
return false
end
if text and database:get(bot_id..'RELAX:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_) then
if text == 'الغاء' then 
database:del(bot_id..'RELAX:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,'◈︙ تم الغاء حفظ كليشة المطور .')
return false
end
database:set(bot_id..'RELAX:Text_Dev',text)
database:del(bot_id..'RELAX:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,'◈︙ تم حفظ كليشة المطور .')
return false
end
if text == 'رفع نسخة احتياطية' and DevRELAX(msg) then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == "الساعة" then
local yytesj20 = "\n الساعة الان : "..os.date("%I:%M%p")
send(msg.chat_id_, msg.id_,yytesj20)
end

if text == "التاريخ" then
local cfhoog =  "\n التاريخ : "..os.date("%Y/%m/%d")
send(msg.chat_id_, msg.id_,cfhoog)
end

if text == "تحديث" and DevRELAX(msg) then
dofile("RELAX.lua")  
send(msg.chat_id_, msg.id_, "◈︙ تم التحديث بنجاح .")
end
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then
local Text =[[
◈︙Source RELAX .

]]
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
{
{text = '- SainT .', url = "https://t.me/nn1nnn"}
},
{
{text = '- MY BOT .', url = "https://t.me/SJJBOT"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'حذف' or text == 'رابط الحذف' or text == 'بوت الحذف' then
Text = [[
[- اضغط هنا لحذف حسابك .](https://my.telegram.org)
]]
send(msg.chat_id_, msg.id_,Text)
end
if text == 'الاوامر' or text == 'اوامر' or text == 'الأوامر' then
if Addictive(msg) then
local Text =[[
    ◈︙ اهلا بك في قسم الاوامر .
    ◈︙ اختر الامر الذي تريده من الازرار بلاسفل .
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '- اوامر الحماية .', callback_data=msg.sender_user_id_.."/help1"},{text = '- اوامر الادمنية .', callback_data=msg.sender_user_id_.."/help2"},
},
{
{text = '- اوامر المدراء .', callback_data=msg.sender_user_id_.."/help3"},
},
{
{text = '- اوامر المنشئين .', callback_data=msg.sender_user_id_.."/help4"},{text = '- اوامر المطورين .', callback_data=msg.sender_user_id_.."/help5"},
},
{
{text = '- اوامر التعطيل .', callback_data=msg.sender_user_id_.."/homeaddrem"},{text = '- اوامر القفل .', callback_data=msg.sender_user_id_.."/homelocks"},
},
{
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end

if text == 'م1' and Addictive(msg) then
Text = [[
    ◈︙ قائمة اوامر الحماية .
- - - - -
قفل او فتح + الامر
قفل او فتح الامر بالتقييد
قفل او فتح الامر بالطرد
قفل او فتح الامر بالكتم
- - - - -
- الروابط .
- المعرف .
- التاك .
- الشارحة .
- التعديل .
- التثبيت .
- المتحركة .
- الملفات .
- الصور .
- - - - -
- الملصقات .
- الفيديو .
- الانلاين .
- الدردشة .
- التوجيه .
- الاغاني .
- الصوت .
- الجهات .
- الاشعارات .
- - - - -
- الماركداون .
- البوتات .
- التكرار .
- الكلايش .
- السيلفي .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م2' and Addictive(msg) then
Text = [[
    ◈︙ قائمة اوامر الادمنية .
- - - - -
- رفع او تنزيل مميز .
- تاك للكل .
- عدد الكروب .
- كتم .
- حظر .
- طرد .
- منع .
- تقييد .
- الغاء حظر .
- الغاء كتم .
- الغاء تقييد .
- الغاء منع .
- المحظورين .
- المكتومين .
- المميزين .
- الصلاحيات .
- قائمة المنع .
- - - - -
- تثبيت .
- الفاء تثبيت .
- الاعدادات .
- الرابط .
- القوانين .
- - - - -
- الترحيب .
- تفعيل او تعطيل الترحيب .
- اضف او مسح صلاحية . 
- وضع التكرار + العدد .
- ايدي .
- جهاتي .
- سحكاتي .
- رسائلي .
- كشف البوتات .
- - - - -
- وضع + الامر .
- اسم .
- رابط .
- صورة .
- وصف .
- قوانين .
- ترحيب .
- - - - -
- مسح + الامر
- قائمة المنع .
- المحظورين .
- المميزين .
- المكتومين .
- المطرودين .
- القوانين .
- البوتات .
- الصورة .
- الصلاحيات .
- الرابط .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م3' and Owner(msg) then
Text = [[
    ◈︙ قائمة اوامر المدراء .
- - - - -
- رفع او تنزيل ادمن .
- رفع او كشف القيود .
- تنزيل الكل .
- - - - -
- تفعيل او تعطيل الايدي بالصورة .
- تفعيل او تعطيل الايدي .
- تفعيل او تعطيل ردود المدير .
- تفعيل او تعطيل الالعاب .
- تفعيل او تعطيل اطردني .
- تفعيل او تعطيل الرفع .
- تفعيل او تعطيل الحظر .
- تفعيل او تعطيل الطرد .
- تفعيل او تعطيل جلب الرابط .
- تفعيل او تعطيل اوامر التحشيش .
- تفعيل او تعطيل التنزيل .
- تعيين او مسح الايدي .
- اضف او حذف رد .
- اضف او حذف رد متعدد .
- - - - -
- رفع الادمنية .
- الادمنية .
- ردود المدير .
- تنظيف + عدد .
- مسح الادمنية .
- مسح الميديا .
- مسح ردود المدير .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م4' and Constructor(msg) then
Text = [[
    ◈︙ قائمة اوامر المنشئين الاساسيين .
- - - - -
- رفع او تنزيل منشئ .
- المنشئين .
- مسح المنشئين .
- - - - -
◈︙ قائمة اوامر المنشئين .
- - - - -
- رفع او تنزيل مدير .
- المدراء .
- مسح المدراء .
- تعيين او مسح الايدي .
- اضف او حذف امر .
- الاوامر المضافة .
- مسح الاوامر المضافة .
- اضف رسائل + العدد بالرد .
- اضف مجوهرات + العدد بالرد .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م5' and DevBot(msg) then
Text = [[
    ◈︙ قائمة اوامر المطور الاساسي .
- - - - -
- حظر عام .
- الغاء العام .
- مسح قائمة العام .
- تغيير اسم البوت .
- رفع او تنزيل مطور . 
- المطورين .
- مسح المطورين .
- اضف او حذف رد للكل .
- مسح ردود المطور .
- ردود المطور .
- وضع او حذف كليشة المطور .
- تحديث السورس . 
- تفعيل او تعطيل البوت الخدمي .
- تعيين عدد الاعضاء + العدد .
- تفعيل او تعطيل المغادرة .
- تفعيل او تعطيل الاذاعة .
◈︙ قائمة اوامر المطورين . 
- - - - -
- تفعيل او تعطيل .
- رفع او تنزيل مالك .
- رفع او تنزيل منشئ اساسي .
- رفع منشئ .
- مسح المنشئين الاساسيين .
- المنشئين الاساسيين .
- غادر .
- اذاعة .
- اذاعة بالتجويه .
- اذاعة خاص .
- اذاعة بالتثبيت .
- الاحصائيات .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'اوامر القفل' and Addictive(msg) then
local Texti = '◈︙ يمكنك قفل وفتح الاوامر ادناه عبر الضغط على الزر .'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '- قفل الاضافة .', callback_data=msg.sender_user_id_.."/lockjoine"},{text = '- فتح الاضافة .', callback_data=msg.sender_user_id_.."/unlockjoine"},
},
{
{text = '- قفل الدردشة .', callback_data=msg.sender_user_id_.."/lockchat"},{text = '- فتح الدردشة .', callback_data=msg.sender_user_id_.."/unlockchat"},
},
{
{text = '- قفل الدخول .', callback_data=msg.sender_user_id_.."/lock_joine"},{text = '- فتح الدخول .', callback_data=msg.sender_user_id_.."/unlock_joine"},
},
{
{text = '- قفل البوتات .', callback_data=msg.sender_user_id_.."/lockbots"},{text = '- فتح البوتات .', callback_data=msg.sender_user_id_.."/unlockbots"},
},
{
{text = '- قفل الاشعارات .', callback_data=msg.sender_user_id_.."/locktags"},{text = '- فتح الاشعارات .', callback_data=msg.sender_user_id_.."/unlocktags"},
},
{
{text = '- قفل التعديل .', callback_data=msg.sender_user_id_.."/lockedit"},{text = '- فتح التعديل .', callback_data=msg.sender_user_id_.."/unlockedit"},
},
{
{text = '- قفل الروابط .', callback_data=msg.sender_user_id_.."/locklink"},{text = '- فتح الروابط .', callback_data=msg.sender_user_id_.."/unlocklink"},
},
{
{text = '- قفل المعرفات .', callback_data=msg.sender_user_id_.."/lockusername"},{text = '- فتح المعرفات .', callback_data=msg.sender_user_id_.."/unlockusername"},
},
{
{text = '- قفل التاك .', callback_data=msg.sender_user_id_.."/locktag"},{text = '- فتح التاك .', callback_data=msg.sender_user_id_.."/unlocktag"},
},
{
{text = '- قفل الستكرات .', callback_data=msg.sender_user_id_.."/locksticar"},{text = '- فتح الستكرات .', callback_data=msg.sender_user_id_.."/unlocksticar"},
},
{
{text = '- قفل المتحركة .', callback_data=msg.sender_user_id_.."/lockgif"},{text = '- فتح المتحركة .', callback_data=msg.sender_user_id_.."/unlockgif"},
},
{
{text = '- قفل الفيديو .', callback_data=msg.sender_user_id_.."/lockvideo"},{text = '- فتح الفيديو .', callback_data=msg.sender_user_id_.."/unlockvideo"},
},
{
{text = '- قفل الصور .', callback_data=msg.sender_user_id_.."/lockphoto"},{text = '- فتح الصور .', callback_data=msg.sender_user_id_.."/unlockphoto"},
},
{
{text = '- قفل الاغاني .', callback_data=msg.sender_user_id_.."/lockvoise"},{text = '- فتح الاغاني .', callback_data=msg.sender_user_id_.."/unlockvoise"},
},
{
{text = '- قفل الصوت .', callback_data=msg.sender_user_id_.."/lockaudo"},{text = '- فتح الصوت .', callback_data=msg.sender_user_id_.."/unlockaudo"},
},
{
{text = '- قفل التوجيه .', callback_data=msg.sender_user_id_.."/lockfwd"},{text = '- فتح التوجيه .', callback_data=msg.sender_user_id_.."/unlockfwd"},
},
{
{text = '- قفل الملفات .', callback_data=msg.sender_user_id_.."/lockfile"},{text = '- فتح الملفات .', callback_data=msg.sender_user_id_.."/unlockfile"},
},
{
{text = '- قفل الجهات .', callback_data=msg.sender_user_id_.."/lockphone"},{text = '- فتح الجهات .', callback_data=msg.sender_user_id_.."/unlockphone"},
},
{
{text = '- قفل الكلايش .', callback_data=msg.sender_user_id_.."/lockposts"},{text = '- فتح الكلايش .', callback_data=msg.sender_user_id_.."/unlockposts"},
},
{
{text = '- قفل التكرار .', callback_data=msg.sender_user_id_.."/lockflood"},{text = '- فتح التكرار .', callback_data=msg.sender_user_id_.."/unlockflood"},
},
{
{text = '- قفل الفارسية .', callback_data=msg.sender_user_id_.."/lockfarse"},{text = '- فتح الفارسية .', callback_data=msg.sender_user_id_.."/unlockfarse"},
},
{
{text = '- قفل الفشار .', callback_data=msg.sender_user_id_.."/lockfshar"},{text = '- فتح الفشار .', callback_data=msg.sender_user_id_.."/unlockfshar"},
},
{
{text = '- قفل الانلاين .', callback_data=msg.sender_user_id_.."/lockinlene"},{text = '- فتح الانلاين .', callback_data=msg.sender_user_id_.."/unlockinlene"},
},
{
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Texti).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'اوامر التعطيل' and Addictive(msg) then
local Texti = '◈︙ اختر الامر الذي تريده من الازرار بلاسفل .'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '- تعطيل التنزيل .', callback_data=msg.sender_user_id_.."/lockdul"},{text = '- تفعيل التنزيل .', callback_data=msg.sender_user_id_.."/unlockdul"},
},
{
{text = '- تعطيل الرابط .', callback_data=msg.sender_user_id_.."/lock_links"},{text = '- تفعيل الرابط .', callback_data=msg.sender_user_id_.."/unlock_links"},
},
{
{text = '- تعطيل الترحيب .', callback_data=msg.sender_user_id_.."/lockwelcome"},{text = '- تفعيل الترحيب .', callback_data=msg.sender_user_id_.."/unlockwelcome"},
},
{
{text = '- تعطيل الردود العامة .', callback_data=msg.sender_user_id_.."/lockrepall"},{text = '- تفعيل الردود العامة .', callback_data=msg.sender_user_id_.."/unlockrepall"},
},
{
{text = '- تعطيل الايدي .', callback_data=msg.sender_user_id_.."/lockide"},{text = '- تفعيل الايدي .', callback_data=msg.sender_user_id_.."/unlockide"},
},
{
{text = '- تعطيل الايدي بالصورة .', callback_data=msg.sender_user_id_.."/lockidephoto"},{text = '- تفعيل الايدي بالصورة .', callback_data=msg.sender_user_id_.."/unlockidephoto"},
},
{
{text = '- تعطيل الحظر .', callback_data=msg.sender_user_id_.."/lockkiked"},{text = '- تفعيل الحظر .', callback_data=msg.sender_user_id_.."/unlockkiked"},
},
{
{text = '- تعطيل الرفع .', callback_data=msg.sender_user_id_.."/locksetm"},{text = '- تفعيل الرفع .', callback_data=msg.sender_user_id_.."/unlocksetm"},
},
{
{text = '- تعطيل اطردني .', callback_data=msg.sender_user_id_.."/lockkikedme"},{text = '- تفعيل اطردني .', callback_data=msg.sender_user_id_.."/unlockkikedme"},
},
{
{text = '- تعطيل الالعاب .', callback_data=msg.sender_user_id_.."/lockgames"},{text = '- تفعيل الالعاب .', callback_data=msg.sender_user_id_.."/unlockgames"},
},
{
{text = '- تعطيل الردود .', callback_data=msg.sender_user_id_..msg.sender_user_id_.."/lockrepgr"},{text = '- تفعيل الردود .', callback_data=msg.sender_user_id_.."/unlockrepgr"},
},
{
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Texti).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end


end ---- Chat_Type = 'GroupBot' 
end ---- Chat_Type = 'GroupBot' 
if text == 'تفعيل' and DevBot(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'◈︙ اني مو ادمن يحلو .') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'RELAX:Num:Add:Bot') or 0) and not DevRELAX(msg) then
send(msg.chat_id_, msg.id_,'◈︙ لا يمكنك تفعيل البوت لان عدد الاهضاء اقل من : {'..(database:get(bot_id..'RELAX:Num:Add:Bot') or 0)..' .')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'RELAX:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'◈︙ البوت مفعل سابقا .')
else
Reply_Status(msg,result.id_,'reply_Add','◈︙ تم تفعيل البوت بكروب : '..chat.title_..' .')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
database:sadd(bot_id..'RELAX:Basic:Constructor23'..msg.chat_id_, owner_id)
end
end
end,nil)
database:sadd(bot_id..'RELAX:Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '◈︙ تم تفعيل كروب جديد .\n'..
'\n◈︙ بواسطة : '..Name..''..
'\n◈︙ ايدي الكروب : `'..IdChat..'` .'..
'\n◈︙ عدد اعضاء الكروب : '..NumMember..' .'..
'\n◈︙ اسم الكروب : ['..NameChat..']'..
'\n◈︙ رابط الكروب : ['..LinkGp..'] .'
if not DevRELAX(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and DevBot(msg) then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'RELAX:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'📮┇المجموعه معطله سابقا ')
else
Reply_Status(msg,result.id_,'reply_Add','☑┇تم تعطيل المجموعه ~ '..chat.title_..'')
database:srem(bot_id..'RELAX:Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
database:set(bot_id.."RELAX:Private:Group:Link"..msg.chat_id_,LinkGp) 

Text = '◈︙ تم تعطيل كروب جديد .\n'..
'\n◈︙ بواسطة : '..Name..''..
'\n◈︙ ايدي الكروب : `'..IdChat..'` .'..
'\n◈︙ اسم الكروب : ['..NameChat..']'..
'\n◈︙ الرابط : ['..LinkGp..'] .'
if not DevRELAX(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not DevBot(msg) and not database:get(bot_id..'RELAX:Free:Add:Bots') then 
local res = https.request('https://brok-aapi.ml/API/Sub.php?id='..msg.sender_user_id_)
if res then
if res == 'false' then
send(msg.chat_id_,msg.id_,'◈︙ اشترك بقناة السورس وارجع دز الامر عمري .\n◈︙ قناة السورس : @nn1nnn .')   
return false 
end end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'◈︙ اني مو ادمن يحلو .') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'الادمن'
else 
var= 'عضو'
end
if database:sismember(bot_id..'RELAX:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'◈︙ البوت مفعل سابقا .')
else
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'RELAX:Num:Add:Bot') or 0) and not DevRELAX(msg) then
send(msg.chat_id_, msg.id_,'◈︙ لا يمكنك تفعيل البوت لان عدد الاعضاء اقل من : {'..(database:get(bot_id..'RELAX:Num:Add:Bot') or 0)..' .')
return false
end
Reply_Status(msg,result.id_,'reply_Add','◈︙ تم تفعيل الكروب : '..chat.title_..'')
database:sadd(bot_id..'RELAX:Chek:Groups',msg.chat_id_)  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
database:sadd(bot_id..'RELAX:Basic:Constructor23'..msg.chat_id_, owner_id)
end
end
end,nil)
database:sadd(bot_id..'RELAX:Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '◈︙ تم تفعيل كروب جديد .\n'..
'\n◈︙ بواسطة : '..Name..''..
'\n◈︙ رتبته بالكروب : '..AddPy..' .' ..
'\n◈︙ ايدي الكروب : `'..IdChat..'` .'..
'\n◈︙ عدد اعضاء الكروب : '..NumMember..' .'..
'\n◈︙ اسم الكروب : ['..NameChat..']'..
'\n◈︙ رابط الكروب : ['..LinkGp..'] .'
if not DevRELAX(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end

if Chat_Type == 'UserBot' then
if text == '/start' then  
if DevRELAX(msg) then
local Text = '◈︙ اهلا بك عزيزي المطور في الاوامر الخاصة بك .'
local keyboard = {
{'◈︙ الاحصائيات .'},
{'◈︙ تعطيل التواصل .','◈︙ تفعيل التواصل .'},
{'◈︙ تنظيف المشتركين .','◈︙ تنظيف الكروبات .'},
{'◈︙ تفعيل البوت الخدمي .','◈︙ تعطيل البوت الخدمي .'},
{'◈︙ اذاعة .','◈︙ المطورين .','◈︙ اذاعة خاص .'},
{'◈︙ اذاعة بالتوجيه .','◈︙ اذاعة بالتوجيه خاص .'},
{'◈︙ تفعيل الاذاعة .','◈︙ تعطيل الاذاعة .'},
{'◈︙ مسح قائمة العام .','◈︙ مسح المطورين .'},
{'◈︙ تعيين كليشة /start .','◈︙ حذف كليشة /start .'},
{'◈︙ تعيين اسم البوت .'},
{'◈︙ قائمة العام .'},
{'◈︙ نسخة احتياطية .','◈︙ تحديث السورس .'},
{'◈︙ الغاء .'}
}
send_inline_key(msg.chat_id_,Text,keyboard)
else
if not database:get(bot_id..'RELAX:Start:Time'..msg.sender_user_id_) then
local start = database:get(bot_id.."Start:Bot")  
if start then 
Test = start
else
Test = '- هلا عمريي الحاتت .\n- اني بوت اختصاصي حماية الكروبات من التفليش وهلأمور .\n- ارفعني بالكروب ودز تفعيل يحلو .\n- معرف مطوري : ['..UserName..'] .'
end 
send(msg.chat_id_, msg.id_, Test) 
end
end
database:setex(bot_id..'RELAX:Start:Time'..msg.sender_user_id_,60,true)
return false
end
if not DevRELAX(msg) and not database:sismember(bot_id..'BaN:In:User',msg.sender_user_id_) and not database:get(bot_id..'Texting:In:Bv') then
send(msg.sender_user_id_,msg.id_,'◈︙ تم ارسال رسالتك الى : ['..UserName..'] .')    
tdcli_function({ID ="GetChat",chat_id_=Id_Sudo},function(arg,chat)  
tdcli_function({ID ="GetChat",chat_id_=msg.sender_user_id_},function(arg,chat)  
tdcli_function({ID="ForwardMessages",chat_id_=Id_Sudo,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,ta) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
sendText(Id_Sudo,'◈︙ تم ارسال الستكر الى : ['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end,nil);end
if DevRELAX(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
sendText(Id_Sudo,'◈︙ العضو : ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n◈︙ تم حظره من البوت .',msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'BaN:In:User',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
sendText(Id_Sudo,'◈︙ العضو : ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n◈︙ تم الغاء حظره من البوت .',msg.id_/2097152/0.5,'md')
database:srem(bot_id..'BaN:In:User',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
send(msg.chat_id_, msg.id_,'\n◈︙ هذا العضو قام بحظر البوت .') 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
Text = '◈︙ تم ارسال الرسالة له .'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '◈︙ تم ارسال الستكر له .'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '◈︙ تم ارسال الصورة له .'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, msg.content_.animation_.animation_.persistent_id_)    
Text = '◈︙ تم ارسال المتحركة له .'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, msg.content_.voice_.voice_.persistent_id_)    
Text = '◈︙ تم ارسال البصمة له .'
end     
sendText(Id_Sudo,Text..'\n'..'◈︙ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);end,nil);end,nil);end,nil);end 
if DevRELAX(msg) then
if text == '◈︙ تفعيل التواصل .' then  
database:del(bot_id..'Texting:In:Bv') 
send(msg.chat_id_, msg.id_,'◈︙ تم تفعيل التواصل .') 
end
if text == '◈︙ تعطيل التواصل .' then  
database:set(bot_id..'Texting:In:Bv',true) 
send(msg.chat_id_, msg.id_,'◈︙ تم تعطيل التواصل .') 
end
if text =='◈︙ الاحصائيات .' then
local Groups = database:scard(bot_id..'RELAX:Chek:Groups')  
local Users = database:scard(bot_id..'RELAX:UsersBot')  
send(msg.chat_id_, msg.id_,'◈︙ احصائيات البوت .\n\n◈︙ عدد الكروبات : '..Groups..' .\n◈︙ عدد المشتركين : '..Users..' .')
end
if text == "◈︙ تنظيف المشتركين ." then
local pv = database:smembers(bot_id..'RELAX:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'RELAX:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'◈︙لا يوجد مشتركين وهميين .')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'◈︙ عدد المشتركين :'..#pv..' .\n◈︙ المشتركين الوهميين : '..sendok..' .\n◈︙ عدد المشتركين الان : '..ok..' .')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "◈︙ تنظيف الكروبات ." then
local group = database:smembers(bot_id..'RELAX:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'RELAX:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'◈︙ لا يوجد كروبات وهمية .')   
else
local BROK = (w + q)
local sendok = #group - BROK
if q == 0 then
BROK = ''
else
BROK = '\n◈︙ تم حذف : '..q..' كروب .'
end
if w == 0 then
x_BRK = ''
else
x_BRK = '\n◈︙ تم حذف : '..w..' كروب لان البوت عضو .'
end
send(msg.chat_id_, msg.id_,'◈︙ عدد الكروبات : '..#group..' .'..x_BRK..''..BROK..'\n◈︙ عدد الكروبات الان : '..sendok..' .\n')   
end
end
end,nil)
end
return false
end
if text == '◈︙ تفعيل البوت الخدمي .' then
database:del(bot_id..'RELAX:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'\n◈︙ تم تفعيل البوت الخدمي .') 
end
if text == '◈︙ تعطيل البوت الخدمي .' then
database:set(bot_id..'RELAX:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'\n◈︙ تم تعطيل البوت الخدمي .') 
end
if text=="◈︙ اذاعة خاص ." and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل ما تريد اذاعته الان .\n◈︙ اضغط على زر الغاء بلاسفل لالغاء الاذاعة .") 
return false
end 
if text=="◈︙ اذاعة ." and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل ما تريد اذاعته الان .\n◈︙ اضغط على زر الغاء بلاسفل لالغاء الاذاعة .") 
return false
end  
if text=="◈︙ اذاعة بالتوجيه ." and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ دز التوجيه عمري .") 
return false
end 
if text=="◈︙ اذا بالتوجيه خاص ." and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."RELAX:Status:Bc") and not DevRELAX(msg) then 
send(msg.chat_id_, msg.id_,"◈︙ الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."RELAX:RELAX:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"◈︙ دز التوجيه عمري .") 
return false
end 
if text == "◈︙ تفعيل الاذاعة ." then
database:del(bot_id.."RELAX:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n◈︙ تم تفعيل الاذاعة ." ) 
return false
end 
if text == "◈︙ تعطيل الاذاعة ." then
database:set(bot_id.."RELAX:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n◈︙ تم تعطيل الاذاعة .") 
return false
end 
if text == "◈︙ تعفعيل المغادرة ." then
database:del(bot_id.."RELAX:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"◈︙ تم تفعيل المغادرة .") 
return false 
end
if text == "◈︙ تعيين اسم البوت ."  then 
if DevRELAX(msg) then
database:setex(bot_id.."RELAX:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"◈︙ ارسل اسم البوت الان .")  
end
return false
end
if text == "◈︙ تعطيل المغادرة ." then
database:set(bot_id.."RELAX:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "◈︙ تم تعطيل المغادرة .") 
return false 
end
if text and database:get(bot_id..'Start:Bots') then
if text == '◈︙ الغاء .' then   
send(msg.chat_id_, msg.id_,"◈︙ تم الغاء الامر .") 
database:del(bot_id..'Start:Bots') 
return false
end
database:set(bot_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,'◈︙ تم حفظ كليشة /start .') 
database:del(bot_id..'Start:Bots') 
return false
end
if text == '◈︙ تعيين كليشة /start .' then
database:set(bot_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,'◈︙ دز الكليشة يحلو .') 
return false
end
if text == '◈︙ حذف كليشة /start .' then
database:del(bot_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,'◈︙ تم حذف كليشة /start .') 
end
if text == ("◈︙ مسح قائمة العام .") and DevRELAX(msg) then
database:del(bot_id.."RELAX:GBan:User")
send(msg.chat_id_, msg.id_, "\n◈︙ تم مسح قائمة العام .")
return false
end
if text == ("◈︙ مسح المطورين .") and DevRELAX(msg) then
database:del(bot_id.."RELAX:Sudo:User")
send(msg.chat_id_, msg.id_, "\n◈︙ تم مسح قائمة المطورين .")
end
if text == ("◈︙ قائمة العام .") and DevRELAX(msg) then
local list = database:smembers(bot_id.."RELAX:GBan:User")
t = "\n◈︙ قائمة المحظورين عام .\n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد محظورين عام ."
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("◈︙ المطورين .") and DevRELAX(msg) then
local list = database:smembers(bot_id.."RELAX:Sudo:User")
t = "\n◈︙ قائمة المطورين بالبوت . \n- - - - -\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."RELAX:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "◈︙ لا يوجد مطورين بالبوت ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == '◈︙ نسخة احتياطية .' then
local list = database:smembers(bot_id..'RELAX:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'RELAX Chat'
ASAS = database:smembers(bot_id.."RELAX:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."RELAX:Constructor"..v)
MDER = database:smembers(bot_id.."RELAX:Manager"..v)
MOD = database:smembers(bot_id.."RELAX:Mod:User"..v)
link = database:get(bot_id.."RELAX:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"RELAX":"'..NAME..'",'
else
t = t..',"'..v..'":{"RELAX":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '◈︙ عدد كروبات البوت : {'..#list..'} .')
end
if text == "◈︙ تحديث السورس ." then
send(msg.chat_id_,msg.id_,'◈︙ تم تحديث السورس .')
os.execute('rm -rf RELAX.lua')
os.execute('rm -rf start.lua')
download_to_file('https://raw.githubusercontent.com/SourceRELAX/SourceRELAX/master/RELAX.lua', 'RELAX.lua') 
download_to_file('https://raw.githubusercontent.com/SourceRELAX/SourceRELAX/master/start.lua', 'start.lua') 
dofile('RELAX.lua')  
return false
end
if text == "◈︙ تحديث ." then
dofile("RELAX.lua")  
send(msg.chat_id_, msg.id_, "◈︙ تم التحديث .")
end
end
end --- Chat_Type = 'UserBot' 
end
end
function tdcli_update_callback(data)
    if data.ID == "UpdateNewCallbackQuery" then
    SJJJJj = data
    local Chat_id = data.chat_id_
    local Msg_id = data.message_id_
    local msg_idd = Msg_id/2097152/0.5
    local Text = data.payload_.data_
    if Text and Text:match('(.*)/help1') and Addictive(SJJJJj) then
    if tonumber(Text:match('(.*)/help1')) == tonumber(data.sender_user_id_) then
    local Teext =[[
    ◈︙ قائمة اوامر الحماية .
    - - - - -
    قفل او فتح + الامر
    قفل او فتح الامر بالتقييد
    قفل او فتح الامر بالطرد
    قفل او فتح الامر بالكتم
    - - - - -
    - الروابط .
    - المعرف .
    - التاك .
    - الشارحة .
    - التعديل .
    - التثبيت .
    - المتحركة .
    - الملفات .
    - الصور .
    - - - - -
    - الملصقات .
    - الفيديو .
    - الانلاين .
    - الدردشة .
    - التوجيه .
    - الاغاني .
    - الصوت .
    - الجهات .
    - الاشعارات .
    - - - - -
    - الماركداون .
    - البوتات .
    - التكرار .
    - الكلايش .
    - السيلفي .
    ]]
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'م1', callback_data=data.sender_user_id_.."/help1"},{text = 'م2', callback_data=data.sender_user_id_.."/help2"},{text = 'م3', callback_data=data.sender_user_id_.."/help3"},
    },
    {
    {text = 'م4', callback_data=data.sender_user_id_.."/help4"},
    },
    {
    {text = 'م5', callback_data=data.sender_user_id_.."/help5"},
    },
    {
    {text = 'الاوامر الرئيسية', callback_data=data.sender_user_id_.."/help"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    if Text and Text:match('(.*)/help2') and Addictive(SJJJJj) then
    if tonumber(Text:match('(.*)/help2')) == tonumber(data.sender_user_id_) then
    local Teext =[[
    ◈︙ قائمة اوامر الادمنية .
    - - - - -
    - رفع او تنزيل مميز .
    - تاك للكل .
    - عدد الكروب .
    - كتم .
    - حظر .
    - طرد .
    - منع .
    - تقييد .
    - الغاء حظر .
    - الغاء كتم .
    - الغاء تقييد .
    - الغاء منع .
    - المحظورين .
    - المكتومين .
    - المميزين .
    - الصلاحيات .
    - قائمة المنع .
    - - - - -
    - تثبيت .
    - الفاء تثبيت .
    - الاعدادات .
    - الرابط .
    - القوانين .
    - - - - -
    - الترحيب .
    - تفعيل او تعطيل الترحيب .
    - اضف او مسح صلاحية . 
    - وضع التكرار + العدد .
    - ايدي .
    - جهاتي .
    - سحكاتي .
    - رسائلي .
    - كشف البوتات .
    - - - - -
    - وضع + الامر .
    - اسم .
    - رابط .
    - صورة .
    - وصف .
    - قوانين .
    - ترحيب .
    - - - - -
    - مسح + الامر
    - قائمة المنع .
    - المحظورين .
    - المميزين .
    - المكتومين .
    - المطرودين .
    - القوانين .
    - البوتات .
    - الصورة .
    - الصلاحيات .
    - الرابط .
    ]]
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'م1', callback_data=data.sender_user_id_.."/help1"},{text = 'م2', callback_data=data.sender_user_id_.."/help2"},{text = 'م3', callback_data=data.sender_user_id_.."/help3"},
    },
    {
    {text = 'م4', callback_data=data.sender_user_id_.."/help4"},
    },
    {
    {text = 'م5', callback_data=data.sender_user_id_.."/help5"},
    },
    {
    {text = 'الاوامر الرئيسية', callback_data=data.sender_user_id_.."/help"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    if Text and Text:match('(.*)/help3') and Owner(SJJJJj) then
    if tonumber(Text:match('(.*)/help3')) == tonumber(data.sender_user_id_) then
    local Teext =[[
    ◈︙ قائمة اوامر المدراء .
    - - - - -
    - رفع او تنزيل ادمن .
    - رفع او كشف القيود .
    - تنزيل الكل .
    - - - - -
    - تفعيل او تعطيل الايدي بالصورة .
    - تفعيل او تعطيل الايدي .
    - تفعيل او تعطيل ردود المدير .
    - تفعيل او تعطيل الالعاب .
    - تفعيل او تعطيل اطردني .
    - تفعيل او تعطيل الرفع .
    - تفعيل او تعطيل الحظر .
    - تفعيل او تعطيل الطرد .
    - تفعيل او تعطيل جلب الرابط .
    - تفعيل او تعطيل اوامر التحشيش .
    - تفعيل او تعطيل التنزيل .
    - تعيين او مسح الايدي .
    - اضف او حذف رد .
    - اضف او حذف رد متعدد .
    - - - - -
    - رفع الادمنية .
    - الادمنية .
    - ردود المدير .
    - تنظيف + عدد .
    - مسح الادمنية .
    - مسح الميديا .
    - مسح ردود المدير .
    ]]
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'م1', callback_data=data.sender_user_id_.."/help1"},{text = 'م2', callback_data=data.sender_user_id_.."/help2"},{text = 'م3', callback_data=data.sender_user_id_.."/help3"},
    },
    {
    {text = 'م4', callback_data=data.sender_user_id_.."/help4"},
    },
    {
    {text = 'م5', callback_data=data.sender_user_id_.."/help5"},
    },
    {
    {text = 'الاوامر الرئيسية', callback_data=data.sender_user_id_.."/help"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    if Text and Text:match('(.*)/help4') and Constructor(SJJJJj) then
    if tonumber(Text:match('(.*)/help4')) == tonumber(data.sender_user_id_) then
    local Teext =[[
    ◈︙ قائمة اوامر المنشئين الاساسيين .
    - - - - -
    - رفع او تنزيل منشئ .
    - المنشئين .
    - مسح المنشئين .
    - - - - -
    ◈︙ قائمة اوامر المنشئين .
    - - - - -
    - رفع او تنزيل مدير .
    - المدراء .
    - مسح المدراء .
    - تعيين او مسح الايدي .
    - اضف او حذف امر .
    - الاوامر المضافة .
    - مسح الاوامر المضافة .
    - اضف رسائل + العدد بالرد .
    - اضف مجوهرات + العدد بالرد .
    ]]
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'م1', callback_data=data.sender_user_id_.."/help1"},{text = 'م2', callback_data=data.sender_user_id_.."/help2"},{text = 'م3', callback_data=data.sender_user_id_.."/help3"},
    },
    {
    {text = 'م4', callback_data=data.sender_user_id_.."/help4"},
    },
    {
    {text = 'م5', callback_data=data.sender_user_id_.."/help5"},
    },
    {
    {text = 'الاوامر الرئيسية', callback_data=data.sender_user_id_.."/help"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    if Text and Text:match('(.*)/help5') and DevBot(SJJJJj) then
    if tonumber(Text:match('(.*)/help5')) == tonumber(data.sender_user_id_) then
    local Teext =[[
    [In reply to BROK]
◈︙ قائمة اوامر المطور الاساسي .
- - - - -
- حظر عام .
- الغاء العام .
- مسح قائمة العام .
- تغيير اسم البوت .
- رفع او تنزيل مطور . 
- المطورين .
- مسح المطورين .
- اضف او حذف رد للكل .
- مسح ردود المطور .
- ردود المطور .
- وضع او حذف كليشة المطور .
- تحديث السورس . 
- تفعيل او تعطيل البوت الخدمي .
- تعيين عدد الاعضاء + العدد .
- تفعيل او تعطيل المغادرة .
- تفعيل او تعطيل الاذاعة .
◈︙ قائمة اوامر المطورين . 
- - - - -
- تفعيل او تعطيل .
- رفع او تنزيل مالك .
- رفع او تنزيل منشئ اساسي .
- رفع منشئ .
- مسح المنشئين الاساسيين .
- المنشئين الاساسيين .
- غادر .
- اذاعة .
- اذاعة بالتجويه .
- اذاعة خاص .
- اذاعة بالتثبيت .
- الاحصائيات .
    ]]
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'م1', callback_data=data.sender_user_id_.."/help1"},{text = 'م2', callback_data=data.sender_user_id_.."/help2"},{text = 'م3', callback_data=data.sender_user_id_.."/help3"},
    },
    {
    {text = 'م4', callback_data=data.sender_user_id_.."/help4"},
    },
    {
    {text = 'م5', callback_data=data.sender_user_id_.."/help5"},
    },
    {
    {text = 'الاوامر الرئيسية', callback_data=data.sender_user_id_.."/help"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    if Text and Text:match('(.*)/help') and Addictive(SJJJJj) then
    if tonumber(Text:match('(.*)/help')) == tonumber(data.sender_user_id_) then
    local Teext =[[
◈︙م1 : اوامر الحماية .
◈︙م2 : اوامر الادمنية .
◈︙م3 : اوامر المدراء .
◈︙م4 : اوامر المنشئين .
◈︙م5 : اوامر المطورين .
    ]]
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'م1', callback_data=data.sender_user_id_.."/help1"},{text = 'م2', callback_data=data.sender_user_id_.."/help2"},{text = 'م3', callback_data=data.sender_user_id_.."/help3"},
    },
    {
    {text = 'م4', callback_data=data.sender_user_id_.."/help4"},
    },
    {
    {text = 'م5', callback_data=data.sender_user_id_.."/help5"},
    },
    {
    {text = 'اوامر التعطيل', callback_data=data.sender_user_id_.."/homeaddrem"},{text = 'اوامر القفل', callback_data=data.sender_user_id_.."/homelocks"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    
    if Text and Text:match('(.*)/lockdul') and Owner(data) then
    if tonumber(Text:match('(.*)/lockdul')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل التنزيل '
    database:set(bot_id..'dw:bot:api'..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },

    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lock_links') and Addictive(data) then
    if tonumber(Text:match('(.*)/lock_links')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الرابط '
    database:del(bot_id.."RELAX:Link_Group"..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockwelcome') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockwelcome')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الترحيب '
    database:del(bot_id.."RELAX:Chek:Welcome"..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockwelcome') and Owner(data) then
    if tonumber(Text:match('(.*)/lockwelcome')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الردود العامة '
    database:set(bot_id.."RELAX:Reply:Sudo"..Chat_id,true)   
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockide') and Owner(data) then
    if tonumber(Text:match('(.*)/lockide')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الايدي '
    database:set(bot_id..'RELAX:Lock:ID:Bot'..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockidephoto') and Owner(data) then
    if tonumber(Text:match('(.*)/lockidephoto')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الايدي بالصوره '
    database:set(bot_id..'RELAX:Lock:ID:Bot:Photo'..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockkiked') and Constructor(data) then
    if tonumber(Text:match('(.*)/lockkiked')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الحظر '
    database:set(bot_id.."Add:Group:Cheking"..Chat_id,"true")
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/locksetm') and Constructor(data) then
    if tonumber(Text:match('(.*)/locksetm')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الرفع '
    database:set(bot_id.."Add:Group:Cheking"..Chat_id,"true")
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockkikedme') and Owner(data) then
    if tonumber(Text:match('(.*)/lockkikedme')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل اطردني '
    database:set(bot_id.."RELAX:Kick:Me"..Chat_id,true)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockgames') and Owner(data) then
    if tonumber(Text:match('(.*)/lockgames')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الالعاب '
    database:del(bot_id.."Tshak:Lock:Games"..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockrepgr') and Owner(data) then
    if tonumber(Text:match('(.*)/lockrepgr')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تعطيل الردود '
    database:set(bot_id.."RELAX:Reply:Manager"..Chat_id,true)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    end
    if Text and Text:match('(.*)/unlockdul') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockdul')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل التنزيل '
    database:del(bot_id..'dw:bot:api'..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlock_links') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlock_links')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الرابط '
    database:set(bot_id.."RELAX:Link_Group"..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockwelcome') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockwelcome')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الترحيب '
    database:set(bot_id.."RELAX:Chek:Welcome"..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockrepall') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockrepall')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الردود العامة '
    database:del(bot_id.."RELAX:Reply:Sudo"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockide') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockide')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الايدي '
    database:del(bot_id..'RELAX:Lock:ID:Bot'..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockidephoto') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockidephoto')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الايدي بالصوره '
    database:del(bot_id..'RELAX:Lock:ID:Bot:Photo'..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockkiked') and Constructor(data) then
    if tonumber(Text:match('(.*)/unlockkiked')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الحظر '
    database:del(bot_id.."Ban:Cheking"..Chat_id)
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlocksetm') and Constructor(data) then
    if tonumber(Text:match('(.*)/unlocksetm')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الرفع '
    database:set(bot_id.."Add:Group:Cheking"..Chat_id,"true")
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockkikedme') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockkikedme')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل اطردني '
    database:del(bot_id.."RELAX:Kick:Me"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockgames') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockgames')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الالعاب '
    database:set(bot_id.."Tshak:Lock:Games"..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockrepgr') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockrepgr')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم تفعيل الردود '
    database:del(bot_id.."RELAX:Reply:Manager"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homeaddrem"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/homeaddrem') and Owner(data) then
    if tonumber(Text:match('(.*)/homeaddrem')) == tonumber(data.sender_user_id_) then
    local Texti = 'تستطيع تعطيل وتفعيل عبر الازرار'
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'تعطيل التنزيل', callback_data=data.sender_user_id_.."/lockdul"},{text = 'تفعيل التنزيل', callback_data=data.sender_user_id_.."/unlockdul"},
    },
    {
    {text = 'تعطيل الرابط', callback_data=data.sender_user_id_.."/lock_links"},{text = 'تفعيل الرابط', callback_data=data.sender_user_id_.."/unlock_links"},
    },
    {
    {text = 'تعطيل الترحيب', callback_data=data.sender_user_id_.."/lockwelcome"},{text = 'تفعيل الترحيب', callback_data=data.sender_user_id_.."/unlockwelcome"},
    },
    {
    {text = 'تعطيل الردود العامة', callback_data=data.sender_user_id_.."/lockrepall"},{text = 'تفعيل الردود العامة', callback_data=data.sender_user_id_.."/unlockrepall"},
    },
    {
    {text = 'تعطيل الايدي', callback_data=data.sender_user_id_.."/lockide"},{text = 'تفعيل الايدي', callback_data=data.sender_user_id_.."/unlockide"},
    },
    {
    {text = 'تعطيل الايدي بالصوره', callback_data=data.sender_user_id_.."/lockidephoto"},{text = 'تفعيل الايدي بالصوره', callback_data=data.sender_user_id_.."/unlockidephoto"},
    },
    {
    {text = 'تعطيل الحظر', callback_data=data.sender_user_id_.."/lockkiked"},{text = 'تفعيل الحظر', callback_data=data.sender_user_id_.."/unlockkiked"},
    },
    {
    {text = 'تعطيل الرفع', callback_data=data.sender_user_id_.."/locksetm"},{text = 'تفعيل الرفع', callback_data=data.sender_user_id_.."/unlocksetm"},
    },
    {
    {text = 'تعطيل اطردني', callback_data=data.sender_user_id_.."/lockkikedme"},{text = 'تفعيل اطردني', callback_data=data.sender_user_id_.."/unlockkikedme"},
    },
    {
    {text = 'تعطيل الالعاب', callback_data=data.sender_user_id_.."/lockgames"},{text = 'تفعيل الالعاب', callback_data=data.sender_user_id_.."/unlockgames"},
    },
    {
    {text = 'تعطيل الردود', callback_data=data.sender_user_id_.."/lockrepgr"},{text = 'تفعيل الردود', callback_data=data.sender_user_id_.."/unlockrepgr"},
    },
    {
    {text = 'رجوع', callback_data=data.sender_user_id_.."/help"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Texti)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    if Text and Text:match('(.*)/lockjoine') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockjoine')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الاضافه '
    database:set(bot_id.."RELAX:Lock:AddMempar"..Chat_id,"kick")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockchat') and Owner(SJJJJj) then
    if tonumber(Text:match('(.*)/lockchat')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الدردشة '
    database:set(bot_id.."RELAX:Lock:text"..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lock_joine') and Addictive(data) then
    if tonumber(Text:match('(.*)/lock_joine')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الدخول '
    database:set(bot_id.."RELAX:Lock:Join"..Chat_id,"kick")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockbots') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockbots')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل البوتات '
    database:set(bot_id.."RELAX:Lock:Bot:kick"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/locktags') and Addictive(data) then
    if tonumber(Text:match('(.*)/locktags')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الاشعارات '
    database:set(bot_id.."RELAX:Lock:tagservr"..Chat_id,true)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockedit') and Owner(SJJJJj) then
    if tonumber(Text:match('(.*)/lockedit')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل التعديل '
    database:set(bot_id.."RELAX:Lock:edit"..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/locklink') and Addictive(data) then
    if tonumber(Text:match('(.*)/locklink')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الروابط '
    database:set(bot_id.."RELAX:Lock:Link"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockusername') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockusername')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل المعرفات '
    database:set(bot_id.."RELAX:Lock:User:Name"..Chat_id,"del") 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockusername') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockusername')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل التاك '
    database:set(bot_id.."RELAX:Lock:hashtak"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/locksticar') and Addictive(data) then
    if tonumber(Text:match('(.*)/locksticar')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الملصقات '
    database:set(bot_id.."RELAX:Lock:Sticker"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockgif') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockgif')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل المتحركات '
    database:set(bot_id.."RELAX:Lock:Animation"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockvideo') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockvideo')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الفيديو '
    database:set(bot_id.."RELAX:Lock:Video"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockphoto') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockphoto')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الصور '
    database:set(bot_id.."RELAX:Lock:Photo"..Chat_id,"del")    
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockvoise') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockvoise')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الاغاني '
    database:set(bot_id.."RELAX:Lock:Audio"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockaudo') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockaudo')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الصوت '
    database:set(bot_id.."RELAX:Lock:vico"..Chat_id,"del")    
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockfwd') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockfwd')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل التوجيه '
    database:set(bot_id.."RELAX:Lock:forward"..Chat_id,'del')  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockfile') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockfile')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الملفات '
    database:set(bot_id.."RELAX:Lock:Document"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockphone') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockphone')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الجهات '
    database:set(bot_id.."RELAX:Lock:Contact"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockposts') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockposts')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الكلايش '
    database:set(bot_id.."RELAX:Lock:Spam"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockflood') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockflood')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل التكرار '
    database:hset(bot_id.."RELAX:flooding:settings:"..Chat_id ,"flood","del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockfarse') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockfarse')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الفارسيه '
    database:set(bot_id..'lock:Fars'..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockfshar') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockfshar')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل السب '
    database:set(bot_id..'lock:Fshar'..Chat_id,true) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/lockinlene') and Addictive(data) then
    if tonumber(Text:match('(.*)/lockinlene')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم قفل الانلاين '
    database:set(bot_id.."RELAX:Lock:Inlen"..Chat_id,"del")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    end
    if Text and Text:match('(.*)/unlockjoine') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockjoine')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الاضافه '
    database:del(bot_id.."RELAX:Lock:AddMempar"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockchat') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockchat')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الدردشة '
    database:del(bot_id.."RELAX:Lock:text"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlock_joine') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlock_joine')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الدخول '
    database:del(bot_id.."RELAX:Lock:Join"..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockbots') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockbots')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح البوتات '
    database:del(bot_id.."RELAX:Lock:Bot:kick"..Chat_id)   
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlocktags') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlocktags')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الاشعارات '
    database:del(bot_id.."RELAX:Lock:tagservr"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockedit') and Owner(data) then
    if tonumber(Text:match('(.*)/unlockedit')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح التعديل '
    database:del(bot_id.."RELAX:Lock:edit"..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlocklink') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlocklink')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الروابط '
    database:del(bot_id.."RELAX:Lock:Link"..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockusername') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockusername')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح المعرفات '
    database:del(bot_id.."RELAX:Lock:User:Name"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlocktag') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlocktag')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح التاك '
    database:del(bot_id.."RELAX:Lock:hashtak"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlocksticar') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlocksticar')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الملصقات '
    database:del(bot_id.."RELAX:Lock:Sticker"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockgif') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockgif')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح المتحركات '
    database:del(bot_id.."RELAX:Lock:Animation"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockvideo') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockvideo')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الفيديو '
    database:del(bot_id.."RELAX:Lock:Video"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockphoto') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockphoto')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الصور '
    database:del(bot_id.."RELAX:Lock:Photo"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockvoise') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockvoise')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الاغاني '
    database:del(bot_id.."RELAX:Lock:Audio"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockaudo') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockaudo')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الصوت '
    database:del(bot_id.."RELAX:Lock:vico"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockfwd') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockfwd')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح التوجيه '
    database:del(bot_id.."RELAX:Lock:forward"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockfile') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockfile')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الملفات '
    database:del(bot_id.."RELAX:Lock:Document"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockphone') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockphone')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الجهات '
    database:del(bot_id.."RELAX:Lock:Contact"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockposts') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockposts')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الكلايش '
    database:del(bot_id.."RELAX:Lock:Spam"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockflood') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockflood')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح التكرار '
    database:hdel(bot_id.."RELAX:flooding:settings:"..Chat_id ,"flood")  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockfarse') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockfarse')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الفارسيه '
    database:del(bot_id..'lock:Fars'..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockfshar') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockfshar')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح السب '
    database:del(bot_id..'lock:Fshar'..Chat_id) 
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/unlockinlene') and Addictive(data) then
    if tonumber(Text:match('(.*)/unlockinlene')) == tonumber(data.sender_user_id_) then
    local Textedit = '• تم فتح الانلاين '
    database:del(bot_id.."RELAX:Lock:Inlen"..Chat_id)  
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'القائمة الرئيسية', callback_data=data.sender_user_id_.."/homelocks"},
    },
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
    end
    elseif Text and Text:match('(.*)/homelocks') and Addictive(data) then
    if tonumber(Text:match('(.*)/homelocks')) == tonumber(data.sender_user_id_) then
    local Texti = 'تستطيع قفل وفتح عبر الازرار'
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'قفل الاضافه', callback_data=data.sender_user_id_.."/lockjoine"},{text = 'فتح الاضافه', callback_data=data.sender_user_id_.."/unlockjoine"},
    },
    {
    {text = 'قفل الدردشة', callback_data=data.sender_user_id_.."/lockchat"},{text = 'فتح الدردشة', callback_data=data.sender_user_id_.."/unlockchat"},
    },
    {
    {text = 'قفل الدخول', callback_data=data.sender_user_id_.."/lock_joine"},{text = 'فتح الدخول', callback_data=data.sender_user_id_.."/unlock_joine"},
    },
    {
    {text = 'قفل البوتات', callback_data=data.sender_user_id_.."/lockbots"},{text = 'فتح البوتات', callback_data=data.sender_user_id_.."/unlockbots"},
    },
    {
    {text = 'قفل الاشعارات', callback_data=data.sender_user_id_.."/locktags"},{text = 'فتح الاشعارات', callback_data=data.sender_user_id_.."/unlocktags"},
    },
    {
    {text = 'قفل التعديل', callback_data=data.sender_user_id_.."/lockedit"},{text = 'فتح التعديل', callback_data=data.sender_user_id_.."/unlockedit"},
    },
    {
    {text = 'قفل الروابط', callback_data=data.sender_user_id_.."/locklink"},{text = 'فتح الروابط', callback_data=data.sender_user_id_.."/unlocklink"},
    },
    {
    {text = 'قفل المعرفات', callback_data=data.sender_user_id_.."/lockusername"},{text = 'فتح المعرفات', callback_data=data.sender_user_id_.."/unlockusername"},
    },
    {
    {text = 'قفل التاك', callback_data=data.sender_user_id_.."/locktag"},{text = 'فتح التاك', callback_data=data.sender_user_id_.."/unlocktag"},
    },
    {
    {text = 'قفل الملصقات', callback_data=data.sender_user_id_.."/locksticar"},{text = 'فتح الملصقات', callback_data=data.sender_user_id_.."/unlocksticar"},
    },
    {
    {text = 'قفل المتحركة', callback_data=data.sender_user_id_.."/lockgif"},{text = 'فتح المتحركة', callback_data=data.sender_user_id_.."/unlockgif"},
    },
    {
    {text = 'قفل الفيديو', callback_data=data.sender_user_id_.."/lockvideo"},{text = 'فتح الفيديو', callback_data=data.sender_user_id_.."/unlockvideo"},
    },
    {
    {text = 'قفل الصور', callback_data=data.sender_user_id_.."/lockphoto"},{text = 'فتح الصور', callback_data=data.sender_user_id_.."/unlockphoto"},
    },
    {
    {text = 'قفل الاغاني', callback_data=data.sender_user_id_.."/lockvoise"},{text = 'فتح الاغاني', callback_data=data.sender_user_id_.."/unlockvoise"},
    },
    {
    {text = 'قفل الصوت', callback_data=data.sender_user_id_.."/lockaudo"},{text = 'فتح الصوت', callback_data=data.sender_user_id_.."/unlockaudo"},
    },
    {
    {text = 'قفل التوجيه', callback_data=data.sender_user_id_.."/lockfwd"},{text = 'فتح التوجيه', callback_data=data.sender_user_id_.."/unlockfwd"},
    },
    {
    {text = 'قفل الملفات', callback_data=data.sender_user_id_.."/lockfile"},{text = 'فتح الملفات', callback_data=data.sender_user_id_.."/unlockfile"},
    },
    {
    {text = 'قفل الجهات', callback_data=data.sender_user_id_.."/lockphone"},{text = 'فتح الجهات', callback_data=data.sender_user_id_.."/unlockphone"},
    },
    {
    {text = 'قفل الكلايش', callback_data=data.sender_user_id_.."/lockposts"},{text = 'فتح الكلايش', callback_data=data.sender_user_id_.."/unlockposts"},
    },
    {
    {text = 'قفل التكرار', callback_data=data.sender_user_id_.."/lockflood"},{text = 'فتح التكرار', callback_data=data.sender_user_id_.."/unlockflood"},
    },
    {
    {text = 'قفل الفارسيه', callback_data=data.sender_user_id_.."/lockfarse"},{text = 'فتح الفارسيه', callback_data=data.sender_user_id_.."/unlockfarse"},
    },
    {
    {text = 'قفل السب', callback_data=data.sender_user_id_.."/lockfshar"},{text = 'فتح السب', callback_data=data.sender_user_id_.."/unlockfshar"},
    },
    {
    {text = 'قفل الانجليزيه', callback_data=data.sender_user_id_.."/lockenglish"},{text = 'فتح الانجليزيه', callback_data=data.sender_user_id_.."/unlockenglish"},
    },
    {
    {text = 'قفل الانلاين', callback_data=data.sender_user_id_.."/lockinlene"},{text = 'فتح الانلاين', callback_data=data.sender_user_id_.."/unlockinlene"},
    },
    {
    {text = 'رجوع', callback_data=data.sender_user_id_.."/help"},
    },
    {
{text = '- Source RELAX .', url = "https://t.me/wwwuw"}
},
    }
    return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Texti)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    end
    end
    if Text and Text:match('(%d+)/UnKed@(%d+):(%d+)') then
    local ramsesadd = {string.match(Text,"^(%d+)/UnKed@(%d+):(%d+)$")}
    if tonumber(ramsesadd[2]) == tonumber(ramsesadd[3]) then
    if tonumber(ramsesadd[1]) == tonumber(data.sender_user_id_) then
    DeleteMessage(data.chat_id_, {[0] = Msg_id})  
    https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. data.chat_id_ .. "&user_id=" .. data.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
    end
    end
    end
    if Text and Text:match('@id/(.*)') then
    local Id_Link = Text:match('@id/(.*)') 
    DeleteMessage(data.chat_id_,{[0] = Msg_id})  
    local textt = 'Not Now'
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = 'BROK', callback_data="mp3/"..Id_Link},
    },
    {
    {text = 'BROK', callback_data="ogg/"..Id_Link},
    },
    {
    {text = 'BROK', callback_data="mp4/"..Id_Link},
    },
    }
    https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..Chat_id..'&photo='..'https://youtu.be/'..Id_Link..'&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
    elseif Text and Text:match('mp3/(.*)') then
    local Id_Link = Text:match('mp3/(.*)') 
    DeleteMessage(data.chat_id_,{[0] = Msg_id})    
    https.request('https://t.me/aaaZaa/='..Id_Link..'&token='..token..'&chat='..data.chat_id_..'&type=mp3&msg=0')
    elseif Text and Text:match('ogg/(.*)') then
    local Id_Link = Text:match('ogg/(.*)') 
    DeleteMessage(data.chat_id_,{[0] = Msg_id})    
    https.request('https://t.me/aaaZaa/'..Id_Link..'&token='..token..'&chat='..data.chat_id_..'&type=ogg&msg=0')
    elseif Text and Text:match('mp4/(.*)') then
    local Id_Link = Text:match('mp4/(.*)') 
    DeleteMessage(data.chat_id_,{[0] = Msg_id})    
    https.request('https://t.me/aaaZaa/'..Id_Link..'&token='..token..'&chat='..data.chat_id_..'&type=mp4&msg=0')
    end
    
    end
    
    if data.ID == "UpdateChannel" then 
    if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
    database:srem(bot_id..'RELAX:Chek:Groups','-100'..data.channel_.id_)  
    end
    end
    if (data.ID == "UpdateNewMessage") then
    local msg = data.message_
    local text = msg.content_.text_
    if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
    print("OLD MESSAGE")
    return false
    end
    if text == 'تعطيل تحقق' and Addictive(msg) then   
    database:del(bot_id..'RELAX:nwe:mem:group'..msg.chat_id_) 
    send(msg.chat_id_, msg.id_,'\n تم تعطيل تحقق' ) 
    end
    if text == 'تفعيل تحقق' and Addictive(msg) then  
    database:set(bot_id..'RELAX:nwe:mem:group'..msg.chat_id_,'true') 
    send(msg.chat_id_, msg.id_,'\nتم تفعيل تحقق' ) 
    end 
    
    if msg.content_.ID == "MessageChatJoinByLink" and database:get(bot_id..'RELAX:nwe:mem:group'..msg.chat_id_) == 'true'then
    numphoto = {'3','8','9','6'}
    numphotoid = numphoto[math.random(#numphoto)]
    local numjoine = (numphotoid + 3)
    local Texti = 'اختر اللجابه الصحيحه \n'..numphotoid..' + 3 ='
    local num1 = (5 + numphotoid)
    local num2 = (7 + numphotoid)
    local num3 = (1 + numphotoid)
    
    keyboard = {} 
    keyboard.inline_keyboard = {
    {
    {text = num1, callback_data=msg.sender_user_id_.."/lockjoine"},{text = num2, callback_data=msg.sender_user_id_.."/unlockjoine"},
    },
    {
    {text =numjoine, callback_data=msg.sender_user_id_.."/UnKed@"..numjoine..":"..numjoine},{text = num3, callback_data=msg.sender_user_id_.."/unlockjoine"},
    },
    }
    local msg_id = msg.id_/2097152/0.5
    https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Texti).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
    https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
    return false
    end
if msg.sender_user_id_ and Muted_Groups(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if tonumber(msg.sender_user_id_) ~= tonumber(bot_id) then  
if msg.sender_user_id_ and Ban_Groups(msg.chat_id_,msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_Groups(msg.chat_id_,msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_All_Groups(msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_All_Groups(msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == "MessagePinMessage" or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatChangeTitle" or msg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id.."RELAX:Lock:tagservr"..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
if text and not database:sismember(bot_id..'RELAX:Spam:Group'..msg.sender_user_id_,text) then
database:del(bot_id..'RELAX:Spam:Group'..msg.sender_user_id_) 
end
------------------------------------------------------------------------
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
database:set(bot_id..'RELAX:User:Name'..msg.sender_user_id_,data.username_)
end;end,nil)   
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."RELAX:Who:Added:Me"..msg.chat_id_..":"..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."RELAX:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "del" then   
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
------------------------------------------------------------------------
if text and database:get(bot_id.."RELAX:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = database:get(bot_id.."RELAX:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
database:del(bot_id.."RELAX:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
database:del(bot_id.."RELAX:Set:Cmd:Group:New"..msg.chat_id_)
database:srem(bot_id.."RELAX:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"🔰┇تم ازالة الامر من المجموعه")  
else
send(msg.chat_id_, msg.id_,"🔰┇لا يوجد امر بهذا الاسم تاكد من الامر واعد المحاوله")  
end
database:del(bot_id.."RELAX:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
------------------------------------------------------------------------
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."RELAX:Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
local Name_Bot = (database:get(bot_id.."RELAX:Name:Bot") or "تشاكيx")
if not database:get(bot_id.."RELAX:Fun_Bots"..msg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رأيك بهذا' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني ❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(msg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..' شنو رأيك بهاي' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني هيه ','ختولي ماحبها ','خانتني ويه صديقي 😔','بس لو الكفها اله اعضها 💔','خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒','جذابه ومنافقه سوتلي مشكله ويه الحب مالتي ','ئووووووووف اموت ع ربها ','ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفون 7 ','صديقتي وختي وروحي وحياتي ','فد وحده منحرفه 😥','ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐','ام سحوره سحرت اخويا وعلكته 6 سنوات 🤕','ماحبها 🙁','بله هاي جهره تسئل عليها ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼','ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹' } 
send(msg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
------------------------------------------------------------------------
RELAX_Started_Bot(msg,data)
RELAX_Files(msg)
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
database:incr(bot_id..'RELAX:message_edit'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."RELAX:Lock:edit"..msg.chat_id_) and not Text and not BasicConstructor(result) then
Reply_Status(result,result.sender_user_id_,"reply","📬┇قام بالتعديل على الميديا")  
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
end
local text = result.content_.text_
if not Addictive(result) then
------------------------------------------------------------------------
if text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."RELAX:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if database:get(bot_id.."RELAX:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if database:get(bot_id.."RELAX:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("/") then
if database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if database:get(bot_id.."RELAX:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local RELAX_Msg = database:get(bot_id.."RELAX:Add:Filter:Rp2"..text..result.chat_id_)   
if RELAX_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","📬┇"..RELAX_Msg)  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get(bot_id..'RELAX:Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'RELAX:Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'RELAX:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'RELAX:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'RELAX:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end
end
if (data.ID == "UpdateOption" and data.value_.value_ == "Ready") then
print('\27[30;32m»» يرجى الاننتضار لحين تنظيف المجموعات الوهميه ««\n\27[1;37m')
local list = database:smembers(bot_id..'RELAX:UsersBot')  
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local list = database:smembers(bot_id..'RELAX:Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
database:srem(bot_id..'RELAX:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'RELAX:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'RELAX:Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'RELAX:Chek:Groups',v)   
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'RELAX:Chek:Groups',v)  
end end,nil)
end;end;end
