
--[[

   diviy

]]
--- Start  By zaeony King »»»»»»»
local tdcli = dofile("tdcli.lua")
local KPJS = dofile('./JSON.lua')
local serpent = dofile("serpent.lua")
local lgi = require("lgi")
local redis = require("redis")
local socket = require("socket")
local URL = require("socket.url")
local HTTPS = require ("ssl.https")
local http = require("socket.http")
local https = require("ssl.https")
local ltn12 = require("ltn12")
local json = dofile("./dkjson.lua") 
local redis = Redis.connect("127.0.0.1", 6379)
local notify = lgi.require("Notify")
local chats = {}
local minute = 60
local hour = 3600
local day = 86400
local week = 604800
local MaxChar = 15
local NumberReturn = 12
http.TIMEOUT = 10
notify.init("Telegram updates")
local senspost = {
cappost = 70,
cappostwithtag = 50,
textpost = 200,
textpostwithtag = 130
}
local color = {
black = {30, 40},
red = {31, 41},
green = {1, 42},
yellow = {33, 43},
blue = {34, 44},
magenta = {35, 45},
cyan = {36, 46},
white = {37, 47}
}
local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local dec = function(data)
data = string.gsub(data, "[^" .. b .. "=]", "")
return (data:gsub(".", function(x)
if x == "=" then
return ""
end
local r, f = "", b:find(x) - 1
for i = 6, 1, -1 do
r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and "1" or "0")
end
return r
end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
if #x ~= 8 then
return ""
end
local c = 0
for i = 1, 8 do
c = c + (x:sub(i, i) == "1" and 2 ^ (8 - i) or 0)
end
return string.char(c)
end))
end
local enc = function(data)
return (data:gsub(".", function(x)
local r, b = "", x:byte()
for i = 8, 1, -1 do
r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and "1" or "0")
end
return r
end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
if #x < 6 then
return ""
end
local c = 0
for i = 1, 6 do
c = c + (x:sub(i, i) == "1" and 2 ^ (6 - i) or 0)
end
return b:sub(c + 1, c + 1)
end) .. ({
"",
"==",
"="
})[#data % 3 + 1]
end



local dl_cb = function(extra, result)
end
function sleep(sec)
socket.sleep(sec)
end
local AutoSet = function()
io.write("\27[0;33m>>"..[[
Send Your iD Sudo : ]].."\n\027[00m")
local KpOwner_ = tonumber(io.read())
if not tostring(KpOwner_):match('%d+') then
KpOwner_ = 352568466
end
io.write("\27[0;36m>>"..[[
Send ( Token )Bot : ]].."\n\027[00m")
local Token_ = tostring(io.read())
Bot_ID_ = Token_:match("(%d+)")
local create = function(data, file, uglify)
file = io.open(file, "w+")
local serialized
if not uglify then
serialized = serpent.block(data, {comment = false, name = "_"})
else
serialized = serpent.dump(data)
end
file:write(serialized)
file:close()
end
local create_config_auto = function()
config = {
KpOwner = KpOwner_,
Bot_ID = Bot_ID_,
Sudo_Users = {},
Redis = "redis-server",
Run = "True",
Token = Token_,
}
create(config, "./Config.lua")
print("\027[" .. color.black[1] .. ";" .. color.green[2] .. "m\n➡➡[•• اكتمل تكوين الكونفك ••]▶\n\027[00m")
end
create_config_auto()

file = io.open("run", "w")  
file:write([[
#!/bin/bash 
token="]]..Token_..[["
while(true) do
rm -fr ../.telegram-cli
echo -e ""
echo -e ""
./tg -s ./KING.lua $@ --bot=$token
done
]])  
file:close()  
file = io.open("RUN", "w")  
file:write([[
killall screen
while(true) do
rm -fr ../.telegram-cli
screen ./run
done
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
os.execute('./RUN')
end
local serialize_to_file = function(data, file, uglify)
file = io.open(file, "w+")
local serialized
if not uglify then
serialized = serpent.block(data, {comment = false, name = "_"})
else
serialized = serpent.dump(data)
end
file:write(serialized)
file:close()
end

local load_redis = function()
local f = io.open("./Config.lua", "r")
if not f then
AutoSet()
else
f:close()
end
local config = loadfile("./Config.lua")()
return config
end
_redis = load_redis()
sudos = dofile("Config.lua") ---- all sudos
KING_SUDO = sudos.KpOwner   -------bot owner
KING_TOKEN = sudos.Token -----KING_TOKEN
bot_id = sudos.Bot_ID ---id bot
KING = tonumber(_redis.Bot_ID)

function Run()
print('\27[93m>Developer:\27[39m'..' '..'@King')
end
------------------------boT ID   BY King ----------------------
print(string.sub(_redis.Bot_ID,1,0))
local bot_id = redis:get(KING.."Bot:KpBotAccount") or tonumber(_redis.Bot_ID)
local save_config = function()
serialize_to_file(_config, "./Config.lua")
end
local setdata = function()
local config = loadfile("./Config.lua")()
for v, user in pairs(config.Sudo_Users) do
redis:sadd(KING.."Bot:KpSudos", user)
end
redis:setex(KING.."bot:reload", 7230, true)
redis:set(KING.."Bot:KpOwnerBot", config.KpOwner or 0)
redis:set(KING.."Bot:Run", config.Run or 0)
local Api = config.Token:match("(%d+)")
local RD = RNM or 0
if Api then
redis:set(KING.."Bot:Api_ID", Api)
end
function AuthoritiesEn()
local hash = "Bot:KpSudos"
local list = redis:smembers(KING..hash)
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local text = "List of Authorities :\n"
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local username = user_info_
if user_info_ then
text = text .. [[
> Bot Owner :

]] .. username
end
if #list ~= 0 then
text = text .. [[


> Bot Sudo Users :

]]
else
end
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. " - [" .. username .. "] \n"
end
end
local hash2 = "Bot:Admins"
local list2 = redis:smembers(KING..hash2)
if #list2 ~= 0 then
text = text .. [[


> Bot Admins :

]]
else
end
for k, v in pairs(list2) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. " - [" .. username .. "] \n"
end
end
redis:set(KING.."AuthoritiesEn", text)
end
function AuthoritiesFa()
local hash = "Bot:KpSudos"
local list = redis:smembers(KING..hash)
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local text = "◯↲ قائمه قاده المجموعه :\n"
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local username = user_info_
if user_info_ then
text = text .. "✧↲ المدراء : \n" .. username
end
if #list ~= 0 then
text = text .. "\n◯↲ المطورين :\n"
else
end
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. " - [" .. username .. "] \n"
end
end
local hash2 = "Bot:Admins"
local list2 = redis:smembers(KING..hash2)
if #list2 ~= 0 then
text = text .. "\n⇦ الادمنيــه :\n"
else
end
for k, v in pairs(list2) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. " - [" .. username .. "] \n"
end
end
redis:set(KING.."AuthoritiesFa", text)
end
AuthoritiesEn()
AuthoritiesFa()
end
---------------------deldata----------------------------------------
local deldata = function()
redis:del(KING.."Bot:KpSudos")
redis:del(KING.."Bot:KpOwnerBot")
redis:del(KING.."Bot:Token")
redis:del(KING.."Bot:Channel")
setdata()
end
local sendBotStartMessage = function(bot_user_id, chat_id, parameter, cb)
tdcli_function({
ID = "SendBotStartMessage",
bot_user_id_ = bot_user_id,
chat_id_ = chat_id,
parameter_ = parameter
}, cb or dl_cb, nil)
end
-------------------------------load_config------------------
local load_config = function()
local f = io.open("./Config.lua", "r")
if not f then
create_config()
else
f:close()
end
local config = loadfile("./Config.lua")()
deldata()
os.execute(' rm -fr ../.telegram-cli')
local usr = io.popen("whoami"):read("*a")-------whoami server
usr = string.gsub(usr, "^%s+", "")
usr = string.gsub(usr, "%s+$", "")
usr = string.gsub(usr, "[\n\r]+", " ")
redis:set(KING.."Bot:ServerUser", usr)----------ServerUser
redis:del(KING.."MatchApi")
redis:del(KING.."Set_Our_ID")
redis:del(KING.."Open:Chats")
local KPdata = redis:get(KING.."Botid" .. bot_id) or "\n"
local BotKPdata = redis:get(KING.."KpOwnerBot" .. config.KpOwner) or "\n"
if redis:get(KING.."Rank:Data") then
print("\027[" .. color.yellow[1] .. ";" .. color.black[2] .. "m" .. KPdata .. "\027[00m")
print("\027[" .. color.yellow[1] .. ";" .. color.black[2] .. "m" .. BotKPdata .. "\027[00m")
for v, user in pairs(config.Sudo_Users) do
local SudoData = redis:get(KING.."KpSudos" .. user)
if SudoData then
print("\027[" .. color.yellow[1] .. ";" .. color.black[2] .. "m" .. SudoData .. "\027[00m")
end
end
end
return config
end
local load_help = function()
local f = io.open("help.lua", "r")
if f then
f:close()
local help = loadfile("help.lua")()
return help
else
return false
end
end
local _config = load_config()
local _help = load_help()
local save_on_config = function()
serialize_to_file(_config, "./Config.lua")
end
local run_cmd = function(CMD)
local cmd = io.popen(CMD)
local result = cmd:read("*all")
return result
end
local BotInfo = function(extra, result)
redis:set(KING.."Our_ID", result.id_)
end
local getindex = function(t, id)
for i, v in pairs(t) do
if v == id then
return i
end
end
return nil
end
local setnumbergp = function()
local setnumbergp_two = function(user_id)
local hashs = "sudo:data:" .. user_id
local lists = redis:smembers(KING..hashs)
redis:del(KING.."SudoNumberGp" .. user_id)
for k, v in pairs(lists) do
redis:incr(KING.."SudoNumberGp" .. user_id)
end
end
local setnumbergp_three = function(user_id)
local hashss = "sudo:data:" .. user_id
local lists = redis:smembers(KING..hashss)
redis:del(KING.."SudoNumberGp" .. user_id)
for k, v in pairs(lists) do
redis:incr(KING.."SudoNumberGp" .. user_id)
end
end
local list = redis:smembers(KING.."Bot:Admins")
for k, v in pairs(list) do
setnumbergp_two(v)
end
local lists = redis:smembers(KING.."Bot:KpSudos")
for k, v in pairs(lists) do
setnumbergp_three(v)
end
redis:setex(KING.."bot:reload", 7230, true)
end

local Bot_Channel = redis:get(KING.."Bot:Channel") or tostring(_redis.Channel)
local sudo_users = _config.Sudo_Users
local Kp_Owner = redis:get(KING.."Bot:KpOwnerBot")
local run = redis:get(KING.."Bot:Run") or "True"
if not redis:get(KING.."setnumbergp") then
setnumbergp()
redis:setex(KING.."setnumbergp", 5 * hour, true)
end

print("\27[0;31m>>"..[[
   _____ _      ____  ____  _               
  / ____| |    / __ \|  _ \| |        /\    
 | |  __| |   | |  | | |_) | |       /  \   
 | | |_ | |   | |  | |  _ <| |      / /\ \  
 | |__| | |___| |__| | |_) | |____ / ____ \ 
  \_____|______\____/|____/|______/_/    \_\
]].."\n\027[00m")
print("\27[0;35m>>"..[[
--=> تمت برمجة السورس وتطويره
--==>> بواسطة @YYBYY <<==
-- للمزيد من المعلومات قناتنا @KING
]].."\n\027[00m")
-----------------------function is_devzain----------by King------------------------
local is_devzain = function(msg)
local var = false
if msg.sender_user_id_ == tonumber(Kp_Owner) then
var = true
end
return var
end
local is_KpiD = function(user_id)
local var = false
if user_id == tonumber(Kp_Owner) then
var = true
end
return var
end
----------------is_sudo----------------------------------------------
local is_sudo = function(msg)
local var = false
if redis:sismember(KING.."Bot:KpSudos", msg.sender_user_id_) then
var = true
end
if msg.sender_user_id_ == tonumber(Kp_Owner) then
var = true
end
return var
end
local is_sudoid = function(user_id)
local var = false
if redis:sismember(KING.."Bot:KpSudos", user_id) then
var = true
end
if user_id == tonumber(Kp_Owner) then
var = true
end
return var
end
local is_admin = function(user_id)
local var = false
local hashsb = "Bot:Admins"
local admin = redis:sismember(KING..hashsb, user_id)
if admin then
var = true
end
if redis:sismember(KING.."Bot:KpSudos", user_id) then
var = true
end
if user_id == tonumber(Kp_Owner) then
var = true
end
return var
end
---------------------------is_monshi---------------------------------
local is_monshi = function(user_id, chat_id)
local var = false
local hashssk = "bot:monshis:" .. chat_id
local monshi = redis:sismember(KING..hashssk, user_id)
local hashs = "Bot:Admins"
local admin = redis:sismember(KING..hashs, user_id)
if monshi then
var = true
end
if admin then
var = true
end
if redis:sismember(KING.."Bot:KpSudos", user_id) then
var = true
end
if user_id == tonumber(Kp_Owner) then
var = true
end
return var
end
-------------------------------is_owner---------------------------
local is_owner = function(user_id, chat_id)
local var = false
local hashssk = "bot:monshis:" .. chat_id
local monshi = redis:sismember(KING..hashssk, user_id)
local hashs = "Bot:Admins"
local admin = redis:sismember(KING..hashs, user_id)
local hash = "bot:owners:" .. chat_id
local owner = redis:sismember(KING..hash, user_id)
if monshi then
var = true
end
if admin then
var = true
end
if owner then
var = true
end
if redis:sismember(KING.."Bot:KpSudos", user_id) then
var = true
end
if user_id == tonumber(Kp_Owner) then
var = true
end
return var
end
------------------------------function---------------------------
local is_momod = function(user_id, chat_id)
local var = false
local hash = "bot:momod:" .. chat_id
local momod = redis:sismember(KING..hash, user_id)
local hashs = "Bot:Admins"
local admin = redis:sismember(KING..hashs, user_id)
local hashssk = "bot:monshis:" .. chat_id
local monshi = redis:sismember(KING..hashssk, user_id)
local hashss = "bot:owners:" .. chat_id
local owner = redis:sismember(KING..hashss, user_id)
local our_id = redis:get(KING.."Our_ID") or 0
if momod then
var = true
end
if owner then
var = true
end
if monshi then
var = true
end

if admin then
var = true
end
if redis:sismember(KING.."Bot:KpSudos", user_id) then
var = true
end
if user_id == tonumber(Kp_Owner) then
var = true
end
if user_id == tonumber(our_id) then
var = true
end
return var
end
---------------function is_vipmem -------------------------
local is_vipmem = function(user_id, chat_id)
local var = false
local hash = "bot:momod:" .. chat_id
local momod = redis:sismember(KING..hash, user_id)
local hashs = "Bot:Admins"
local admin = redis:sismember(KING..hashs, user_id)
local hashssk = "bot:monshis:" .. chat_id
local monshi = redis:sismember(KING..hashssk, user_id)
local hashss = "bot:owners:" .. chat_id
local owner = redis:sismember(KING..hashss, user_id)
local hashsss = "bot:vipmem:" .. chat_id
local vipmem = redis:sismember(KING..hashsss, user_id)
if vipmem then
var = true
end
if momod then
var = true
end
if owner then
var = true
end
if monshi then
var = true
end
if admin then
var = true
end
if redis:sismember(KING.."Bot:KpSudos", user_id) then
var = true
end
if user_id == tonumber(Kp_Owner) then
var = true
end
return var
end
--------------function  is_vipmems---------------------------------
local is_vipmems = function(user_id)
local var = false
local hashsss = "bot:vipmems:"
local vipmems = redis:sismember(KING..hashsss, user_id)
if vipmems then
var = true
end
if redis:sismember(KING.."Bot:KpSudos", user_id) then
var = true
end
if user_id == tonumber(Kp_Owner) then
var = true
end
return var
end
---------------function is_bot-----------------------------------------
local is_bot = function(msg)
local var = false
if msg.sender_user_id_ == tonumber(bot_id) then
var = true
end
return var
end
local is_bot = function(user_id)
local var = false
if user_id == tonumber(bot_id) then
var = true
end
return var
end
local is_banned = function(user_id, chat_id)
local var = false
local hash = "bot:banned:" .. chat_id
local banned = redis:sismember(KING..hash, user_id)
if banned then
var = true
end
return var
end
-------------function  gban----------------------------
local is_gbanned = function(user_id)
local var = false
local hash = "bot:gban:"
local gbanned = redis:sismember(KING..hash, user_id)
if gbanned then
var = true
end
return var
end
------------------function muted--------------------------------------------
local is_muted = function(user_id, chat_id)
local var = false
local hash = "bot:muted:" .. chat_id
local hash2 = "bot:muted:" .. chat_id .. ":" .. user_id
local muted = redis:sismember(KING..hash, user_id)
local muted2 = redis:get(KING..hash2)
if muted then
var = true
end
if muted2 then
var = true
end
return var
end
-----------------------------------------BY KING-----------------------------------
local Forward = function(chat_id, from_chat_id, message_id, cb)
tdcli_function({
ID = "ForwardMessages",
chat_id_ = chat_id,
from_chat_id_ = from_chat_id,
message_ids_ = message_id,
disable_notification_ = 0,
from_background_ = 1
}, cb or dl_cb, nil)
end
local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local delete_msg = function(chatid, mid)
tdcli_function({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
}, dl_cb, nil)
end
local resolve_username = function(username, cb)
tdcli_function({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
local changeChatMemberStatus = function(chat_id, user_id, status)
tdcli_function({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
}
}, dl_cb, nil)
end
local getInputFile = function(file)
if file:match("/") then
infile = {
ID = "InputFileLocal",
path_ = file
}
elseif file:match("^%d+$") then
infile = {
ID = "InputFileId",
id_ = file
}
else
infile = {
ID = "InputFilePersistentId",
persistent_id_ = file
}
end
return infile
end
function scandir(directory)
local i, t, popen = 0, {}, io.popen
for filename in popen("ls -a \"" .. directory .. "\""):lines() do
i = i + 1
t[i] = filename
end
return t
end
function exi_file(path, suffix)
local files = {}
local pth = tostring(path)
local psv = tostring(suffix)
for k, v in pairs(scandir(pth)) do
if v:match("." .. psv .. "$") then
table.insert(files, v)
end
end
return files
end
function file_exi(name, path, suffix)
local fname = tostring(name)
local pth = tostring(path)
local psv = tostring(suffix)
for k, v in pairs(exi_file(pth, psv)) do
if fname == v then
return true
end
end
return false
end
function forwardMessages(chat_id, from_chat_id, message_ids, disable_notification)
  tdcli_function ({
    ID = "ForwardMessages",
    chat_id_ = chat_id,
    from_chat_id_ = from_chat_id,
    message_ids_ = message_ids, -- vector
    disable_notification_ = disable_notification,
    from_background_ = 1
  }, dl_cb, nil)
end
------------------------sendRequest
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({
ID = request_id,
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = input_message_content
}, callback or dl_cb, extra)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageVoice",
voice_ = getInputFile(voice),
duration_ = duration or 0,
waveform_ = waveform,
caption_ = caption
}
sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local del_all_msgs = function(chat_id, user_id)
tdcli_function({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
local getChatId = function(id)
local chat = {}
local id = tostring(id)
if id:match("^-100") then
local channel_id = id:gsub("-100", "")
chat = {ID = channel_id, type = "channel"}
else
local group_id = id:gsub("-", "")
chat = {ID = group_id, type = "group"}
end
return chat
end
local chat_leave = function(chat_id, user_id)------chat_leave
changeChatMemberStatus(chat_id, user_id, "Left")
end
local from_username = function(msg)
local gfrom_user = function(extra, result)
if result.username_ then
F = result.username_
else
F = "nil"
end
return F
end
local username = getUser(msg.sender_user_id_, gfrom_user)
return username
end
local do_notify = function(user, msg)
local n = notify.Notification.new(user, msg)
n:show()
end
local utf8_len = function(char)
local chars = tonumber(string.len(char))
return chars
end
local chat_kick = function(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
local getParseMode = function(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == "markdown" or mode == "md" then
P = {
ID = "TextParseModeMarkdown"
}
elseif mode == "md" then
P = {
ID = "TextParseModemd"
}
end
end
return P
end
local Time = function()--------------Time--
if redis:get(KING.."GetTime") then
local data = redis:get(KING.."GetTime")
local jdat = json.decode(data)
local A = jdat.FAtime
local B = jdat.FAdate
local T = {time = A, date = B}
return T
else
local url, res = http.request("")
if res == 200 then
local jdat = json.decode(url)
redis:setex(KING.."GetTime", 10, url)
local A = jdat.FAtime
local B = jdat.FAdate
if A and B then
local T = {time = A, date = B}
return T
else
local S = {time = "---", date = "---"}
return S
end
else
local S = {time = "---", date = "---"}
return S
end
end
end
local calc = function(exp)
url = "http://api.mathjs.org/v1/"
url = url .. "?expr=" .. URL.escape(exp)
data, res = http.request(url)
text = nil
if res == 200 then
text = data
elseif res == 400 then
text = data
else
text = "ERR"
end
return text
end
local getMessage = function(chat_id, message_id, cb)
tdcli_function({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
local viewMessages = function(chat_id, message_ids)--------viewMessages
tdcli_function({
ID = "ViewMessages",
chat_id_ = chat_id,
message_ids_ = message_ids
}, dl_cb, cmd)
end
local importContacts = function(phone_number, first_name, last_name, user_id)
tdcli_function({
ID = "ImportContacts",
contacts_ = {
[0] = {
phone_number_ = tostring(phone_number),
first_name_ = tostring(first_name),
last_name_ = tostring(last_name),
user_id_ = user_id
}
}
}, cb or dl_cb, cmd)
end
local add_contact = function(phone, first_name, last_name, user_id)----add_contact-
importContacts(phone, first_name, last_name, user_id)
end
local sendContact = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
}
}
}, dl_cb, nil)                                ----- By KING-----
end
local sendPhoto = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
}
}, dl_cb, nil)
end
local getUserFull = function(user_id, cb)---------getUserFull
tdcli_function({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end
local delete_msg = function(chatid, mid)----------delete_msg
tdcli_function({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
}, dl_cb, nil)
end
local sendForwarded = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, from_chat_id, message_id, cb, cmd)
local input_message_content = {
ID = "InputMessageForwarded",
from_chat_id_ = from_chat_id,
message_id_ = message_id,
in_game_share_ = in_game_share
}
sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local send = function(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode
}
}, dl_cb, nil)
end
------------------function Join CH------------------------------------------
function Kp_JoinCh(msg)
local var = true
if redis:get(KING.."Kpjoin1") then
local channel = ''..redis:get(KING..'Kpch1')..''
local url , res = https.request('https://api.telegram.org/bot'..KING_TOKEN..'/getchatmember?chat_id='..channel..'&user_id='..msg.sender_user_id_)
local data = KPJS:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
send(msg.chat_id_,msg.id_, 1, "🔱» اشترك حتى تستطيع \n⭕️» استخدام البوت: ["..channel.."]\n", 1 , "md")
elseif data.ok then
return var
end
else
return var
end
end
local tmKing = function(msg)
if is_KpiD(msg.sender_user_id_) then
King  = "مطور اساسي 👨‍🔧"
elseif is_sudoid(msg.sender_user_id_) then
King = "مطور البوت 👨‍💻"
elseif is_admin(msg.sender_user_id_) then
King = "الادمن 🕵️‍♂️"
elseif is_vipmems(msg.sender_user_id_) then
King = "المميز عام 👨‍🚒"
elseif is_monshi(msg.sender_user_id_, msg.chat_id_) then
King = "المنشئ 👨‍✈️"
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
King = "المدير 👮‍♂️"
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
King = "الادمن 👨‍🎤"
elseif is_vipmem(msg.sender_user_id_, msg.chat_id_) then
King = "عضو مميز 🧛‍♂️"
else
King = "المستخدم 🤵"
end
return King
end
----------------KP_TM_NM----BY KING-----------------------------------
local KP_TM_NM = function(msgs)
local KP_TM = ''
if msgs < 100 then
 KP_TM = 'ضعيف 🌪'
elseif msgs < 400 then 
KP_TM = 'غير متفاعل ⚡️' 
elseif msgs < 755 then 
KP_TM = 'استمر بطل 💫'
elseif msgs < 2000 then 
KP_TM = 'استمر بالتفاعل 🌟' 
elseif msgs < 4000 then 
KP_TM = 'ملك التفاعل 🌙'
elseif msgs < 7000 then 
KP_TM = 'اسد التفاعل ✨' 
elseif msgs < 20000 then 
KP_TM = 'اقوى تفاعل 🔥'
elseif msgs < 40000 then 
KP_TM = 'اجمل تفاعل 💥' 
elseif msgs < 70000 then 
KP_TM = 'تفاعل روعه 🌜'
elseif msgs < 100000 then 
KP_TM = 'التفاعل المثالي ⭐️'
elseif msgs < 200000 then 
KP_TM = 'اقوى تفاعل 🌸'
end
return KP_TM
end
function s_api(web) 
local info, res = HTTPS.request(web) local req = KPJS:decode(info) if res ~= 200 then return false end if not req.ok then return false end return req 
end 
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} response.keyboard = keyboard response.inline_keyboard = inline response.resize_keyboard = true response.one_time_keyboard = false response.selective = false  local send_api = "https://api.telegram.org/bot"..KING_TOKEN.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(json.encode(response)) if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end return s_api(send_api) 
end
------------------send_large_msg--------------------------------------------
local function send_large_msg_callback(cb_extra, result)
local text_max = 4096
local chat_id = cb_extra._chat_id
local text = cb_extra.text
local text_len = string.len(text)
local num_msg = math.ceil(text_len / text_max)
local parse_mode = cb_extra.parse_mode
local disable_web_page_preview = cb_extra.disable_web_page_preview
local disable_notification = cb_extra.disable_notification
local reply_to_message_id = cb_extra.reply_to_message_id
if num_msg <= 1 then
send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
else
local my_text = string.sub(text, 1, 4096)
local rest = string.sub(text, 4096, text_len)
local cb_extra = {
_chat_id = chat_id,
text = text,
reply_to_message_id = reply_to_message_id,
disable_notification = disable_notification,
disable_web_page_preview = disable_web_page_preview,
parse_mode = parse_mode
}
local TextParseMode = getParseMode(parse_mode)
tdcli_function({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = my_text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode
}
}, send_large_msg_callback, nil)
end
end
local send_large_msg = function(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local cb_extra = {
_chat_id = chat_id,
text = text,
reply_to_message_id = reply_to_message_id,
disable_notification = disable_notification,
disable_web_page_preview = disable_web_page_preview,
parse_mode = parse_mode
}
send_large_msg_callback(cb_extra, true)
end
local sendmen = function(chat_id, reply_to_message_id, text, offset, length, userid)---sendmen
tdcli_function({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = 1,
clear_draft_ = 0,
entities_ = {
[0] = {
ID = "MessageEntityMentionName",
offset_ = offset,
length_ = length,
user_id_ = userid
}
}
}
}, dl_cb, nil)
end
function title_name(GroupID) 
tdcli_function({ID ="GetChat",chat_id_=GroupID},function(arg,data)---title_name
redis:set(KING..'group:name'..GroupID,data.title_) end,nil) return redis:get(KING..'group:name'..GroupID) end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageDocument",
document_ = getInputFile(document),
caption_ = caption
}
sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local sendaction = function(chat_id, action, progress)
tdcli_function({
ID = "SendChatAction",
chat_id_ = chat_id,
action_ = {
ID = "SendMessage" .. action .. "Action",
progress_ = progress or 100
}
}, dl_cb, nil)
end
local changetitle = function(chat_id, title)
tdcli_function({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
local importChatInviteLink = function(invite_link)
tdcli_function({
ID = "ImportChatInviteLink",
invite_link_ = invite_link
}, cb or dl_cb, nil)
end
local checkChatInviteLink = function(link, cb)
tdcli_function({
ID = "CheckChatInviteLink",
invite_link_ = link
}, cb or dl_cb, nil)             ---BY KING---
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageVideo",
video_ = getInputFile(video),
added_sticker_file_ids_ = {},
duration_ = duration or 0,
width_ = width or 0,
height_ = height or 0,
caption_ = caption
}
sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
------------------------EditMessageText----------------------------------
local edit = function(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode
}
}, dl_cb, nil)
end
local setphoto = function(chat_id, photo)
tdcli_function({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
-----------------------AddChatMember-----------------------------------------
local add_user = function(chat_id, user_id, forward_limit)
tdcli_function({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end
local pinmsg = function(channel_id, message_id, disable_notification)--PIN
tdcli_function({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
}, dl_cb, nil)
end
local unpinmsg = function(channel_id)
tdcli_function({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
local blockUser = function(user_id)
tdcli_function({ID = "BlockUser", user_id_ = user_id}, dl_cb, nil)--BlockUser
end
local unblockUser = function(user_id)
tdcli_function({
ID = "UnblockUser",
user_id_ = user_id
}, dl_cb, nil)
end
local checkChatInviteLink = function(link, cb)
tdcli_function({
ID = "CheckChatInviteLink",
invite_link_ = link
}, cb or dl_cb, nil)
end
local openChat = function(chat_id, cb)
tdcli_function({ID = "OpenChat", chat_id_ = chat_id}, cb or dl_cb, nil)-----OpenChat
end
local getBlockedUsers = function(offset, limit)
tdcli_function({
ID = "GetBlockedUsers",
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
local chat_del_user = function(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Editor")
end
local getChannelFull = function(channel_id, cb)
tdcli_function({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, cb or dl_cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end
-----------------------getGroupLink by ID---------------------------------------------
local getGroupLink = function(msg, chat_id)
local chat = tostring(chat_id)
link = redis:get(KING.."bot:group:link" .. chat)
if link then
send(msg.chat_id_, msg.id_, 1, "📮┇ رابط المجموعه :\n" .. link, 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🚫┇ لا يوجد رابط ", 1, "md")
end
end
local getChannelMembers = function(channel_id, offset, filter, limit, cb)
if not limit or limit > 200 then
limit = 200
end
tdcli_function({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, cb or dl_cb, cmd)
end
local deleteChatHistory = function(chat_id, cb)
tdcli_function({
ID = "DeleteChatHistory",
chat_id_ = chat_id,
remove_from_chat_list_ = 0
}, cb or dl_cb, nil)
end
function getChatHistory(chat_id, from_message_id, offset, limit,cb)
  tdcli_function ({
    ID = "GetChatHistory",
    chat_id_ = chat_id,
    from_message_id_ = from_message_id,
    offset_ = offset,
    limit_ = limit
  }, cb, nil)
end
local function changeChannelAbout(channel_id, about, cb, cmd)
  tdcli_function ({
    ID = "ChangeChannelAbout",
    channel_id_ = getChatId(channel_id).ID,
    about_ = about
  }, cb or dl_cb, cmd)
end
---------------------------sendSticker--------------------------------------------------
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = {
ID = "InputMessageSticker",
sticker_ = getInputFile(sticker),
width_ = 0,
height_ = 0
}
sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local getInputMessageContent = function(file, filetype, caption)
if file:match("/") or file:match(".") then
infile = {
ID = "InputFileLocal",
path_ = file
}
elseif file:match("^%d+$") then
infile = {
ID = "InputFileId",
id_ = file
}
else
infile = {
ID = "InputFilePersistentId",
persistent_id_ = file
}
end
local inmsg = {}
local filetype = filetype:lower()
if filetype == "animation" then
inmsg = {
ID = "InputMessageAnimation",
animation_ = infile,
caption_ = caption
}
elseif filetype == "audio" then
inmsg = {
ID = "InputMessageAudio",
audio_ = infile,
caption_ = caption
}
elseif filetype == "document" then
inmsg = {
ID = "InputMessageDocument",
document_ = infile,
caption_ = caption
}
elseif filetype == "photo" then
inmsg = {
ID = "InputMessagePhoto",
photo_ = infile,
caption_ = caption
}
elseif filetype == "sticker" then
inmsg = {
ID = "InputMessageSticker",
sticker_ = infile,
caption_ = caption
}
elseif filetype == "video" then
inmsg = {
ID = "InputMessageVideo",
video_ = infile,
caption_ = caption
}
elseif filetype == "voice" then
inmsg = {
ID = "InputMessageVoice",
voice_ = infile,
caption_ = caption
}
end
return inmsg
end
local downloadFile = function(file_id, cb)
tdcli_function({
ID = "DownloadFile",
file_id_ = file_id
}, cb or dl_cb, nil)
end
-------------SETING antispam-------------------------------------------------------------------------
local resetgroup = function(chat_id)
redis:del(KING.."bot:muteall" .. chat_id)
redis:del(KING.."bot:text:mute" .. chat_id)
redis:del(KING.."bot:photo:mute" .. chat_id)
redis:del(KING.."bot:video:mute" .. chat_id)
redis:del(KING.."bot:selfvideo:mute" .. chat_id)
redis:del(KING.."bot:gifs:mute" .. chat_id)
redis:del(KING.."anti-flood:" .. chat_id)
redis:del(KING.."flood:max:" .. chat_id)
redis:del(KING.."bot:sens:spam" .. chat_id)
redis:del(KING.."floodstatus" .. chat_id)
redis:del(KING.."bot:music:mute" .. chat_id)
redis:del(KING.."bot:bots:mute" .. chat_id)
redis:del(KING.."bot:duplipost:mute" .. chat_id)
redis:del(KING.."bot:inline:mute" .. chat_id)
redis:del(KING.."bot:cmds" .. chat_id)
redis:del(KING.."bot:bots:mute" .. chat_id)
redis:del(KING.."bot:voice:mute" .. chat_id)
redis:del(KING.."editmsg" .. chat_id)
redis:del(KING.."bot:links:mute" .. chat_id)
redis:del(KING.."bot:pin:mute" .. chat_id)
redis:del(KING.."bot:sticker:mute" .. chat_id)
redis:del(KING.."bot:tgservice:mute" .. chat_id)
redis:del(KING.."bot:webpage:mute" .. chat_id)
redis:del(KING.."bot:strict" .. chat_id)
redis:del(KING.."bot:hashtag:mute" .. chat_id)
redis:del(KING.."tags:lock" .. chat_id)
redis:del(KING.."bot:location:mute" .. chat_id)
redis:del(KING.."bot:contact:mute" .. chat_id)
redis:del(KING.."bot:english:mute" .. chat_id)
redis:del(KING.."bot:arabic:mute" .. chat_id)
redis:del(KING.."bot:forward:mute" .. chat_id)
redis:del(KING.."bot:member:lock" .. chat_id)
redis:del(KING.."bot:document:mute" .. chat_id)
redis:del(KING.."markdown:lock" .. chat_id)
redis:del(KING.."Game:lock" .. chat_id)
redis:del(KING.."bot:spam:mute" .. chat_id)
redis:del(KING.."post:lock" .. chat_id)
redis:del(KING.."bot:welcome" .. chat_id)
redis:del(KING.."delidstatus" .. chat_id)
redis:del(KING.."delpro:" .. chat_id)
redis:del(KING.."sharecont" .. chat_id)
redis:del(KING.."sayedit" .. chat_id)
redis:del(KING.."welcome:" .. chat_id)
redis:del(KING.."bot:group:link" .. chat_id)
redis:del(KING.."bot:filters:" .. chat_id)
redis:del(KING.."bot:muteall:Time" .. chat_id)
redis:del(KING.."bot:muteall:start" .. chat_id)
redis:del(KING.."bot:muteall:stop" .. chat_id)
redis:del(KING.."bot:muteall:start_Unix" .. chat_id)
redis:del(KING.."bot:muteall:stop_Unix" .. chat_id)
redis:del(KING.."bot:muteall:Run" .. chat_id)
redis:del(KING.."bot:muted:" .. chat_id)
end
local resetsettings = function(chat_id, cb)
redis:del(KING.."bot:muteall" .. chat_id)
redis:del(KING.."bot:text:mute" .. chat_id)
redis:del(KING.."bot:photo:mute" .. chat_id)
redis:del(KING.."bot:video:mute" .. chat_id)
redis:del(KING.."bot:selfvideo:mute" .. chat_id)
redis:del(KING.."bot:gifs:mute" .. chat_id)
redis:del(KING.."anti-flood:" .. chat_id)
redis:del(KING.."flood:max:" .. chat_id)
redis:del(KING.."bot:sens:spam" .. chat_id)
redis:del(KING.."bot:music:mute" .. chat_id)
redis:del(KING.."bot:bots:mute" .. chat_id)
redis:del(KING.."bot:duplipost:mute" .. chat_id)
redis:del(KING.."bot:inline:mute" .. chat_id)
redis:del(KING.."bot:cmds" .. chat_id)
redis:del(KING.."bot:voice:mute" .. chat_id)
redis:del(KING.."editmsg" .. chat_id)
redis:del(KING.."bot:links:mute" .. chat_id)
redis:del(KING.."bot:pin:mute" .. chat_id)
redis:del(KING.."bot:sticker:mute" .. chat_id)
redis:del(KING.."bot:tgservice:mute" .. chat_id)
redis:del(KING.."bot:webpage:mute" .. chat_id)
redis:del(KING.."bot:strict" .. chat_id)
redis:del(KING.."bot:hashtag:mute" .. chat_id)
redis:del(KING.."tags:lock" .. chat_id)
redis:del(KING.."bot:location:mute" .. chat_id)
redis:del(KING.."bot:contact:mute" .. chat_id)
redis:del(KING.."bot:english:mute" .. chat_id)
redis:del(KING.."bot:member:lock" .. chat_id)
redis:del(KING.."bot:arabic:mute" .. chat_id)
redis:del(KING.."bot:forward:mute" .. chat_id)
redis:del(KING.."bot:document:mute" .. chat_id)
redis:del(KING.."markdown:lock" .. chat_id)
redis:del(KING.."Game:lock" .. chat_id)
redis:del(KING.."bot:spam:mute" .. chat_id)
redis:del(KING.."post:lock" .. chat_id)
redis:del(KING.."sayedit" .. chat_id)
redis:del(KING.."bot:muteall:Time" .. chat_id)
redis:del(KING.."bot:muteall:start" .. chat_id)
redis:del(KING.."bot:muteall:stop" .. chat_id)
redis:del(KING.."bot:muteall:start_Unix" .. chat_id)
redis:del(KING.."bot:muteall:stop_Unix" .. chat_id)
redis:del(KING.."bot:muteall:Run" .. chat_id)
end
local panel_one = function(chat_id)
redis:set(KING.."bot:webpage:mute" .. chat_id, true)
redis:set(KING.."bot:inline:mute" .. chat_id, true)
redis:set(KING.."bot:bots:mute" .. chat_id, true)
redis:set(KING.."tags:lock" .. chat_id, true)
redis:set(KING.."markdown:lock" .. chat_id, true)
redis:set(KING.."bot:links:mute" .. chat_id, true)
redis:set(KING.."bot:hashtag:mute" .. chat_id, true)
redis:set(KING.."bot:spam:mute" .. chat_id, true)
redis:set(KING.."anti-flood:" .. chat_id, true)
redis:set(KING.."Game:lock" .. chat_id, true)
redis:set(KING.."bot:panel" .. chat_id, "one")
end
local panel_two = function(chat_id)
redis:set(KING.."bot:webpage:mute" .. chat_id, true)
redis:set(KING.."bot:inline:mute" .. chat_id, true)
redis:set(KING.."bot:bots:mute" .. chat_id, true)
redis:set(KING.."tags:lock" .. chat_id, true)
redis:set(KING.."markdown:lock" .. chat_id, true)
redis:set(KING.."bot:links:mute" .. chat_id, true)
redis:set(KING.."bot:hashtag:mute" .. chat_id, true)
redis:set(KING.."bot:spam:mute" .. chat_id, true)
redis:set(KING.."anti-flood:" .. chat_id, true)
redis:set(KING.."Game:lock" .. chat_id, true)
redis:set(KING.."post:lock" .. chat_id, true)
redis:set(KING.."bot:forward:mute" .. chat_id, true)
redis:set(KING.."bot:photo:mute" .. chat_id, true)
redis:set(KING.."bot:video:mute" .. chat_id, true)
redis:set(KING.."bot:selfvideo:mute" .. chat_id, true)
redis:set(KING.."bot:gifs:mute" .. chat_id, true)
redis:set(KING.."bot:sticker:mute" .. chat_id, true)
redis:set(KING.."bot:location:mute" .. chat_id, true)
redis:set(KING.."bot:document:mute" .. chat_id, true)
redis:set(KING.."bot:panel" .. chat_id, "two")
end
local panel_three = function(chat_id)
redis:set(KING.."bot:inline:mute" .. chat_id, true)
redis:set(KING.."bot:bots:mute" .. chat_id, true)
redis:set(KING.."markdown:lock" .. chat_id, true)
redis:set(KING.."bot:links:mute" .. chat_id, true)
redis:set(KING.."bot:spam:mute" .. chat_id, true)
redis:set(KING.."bot:sens:spam" .. chat_id, 500)
redis:set(KING.."anti-flood:" .. chat_id, true)
redis:set(KING.."Game:lock" .. chat_id, true)
redis:set(KING.."bot:cmds" .. chat_id, true)
redis:set(KING.."bot:duplipost:mute" .. chat_id, true)
redis:set(KING.."bot:panel" .. chat_id, "three")
end
local function exportChatInviteLink(chat_id, cb, cmd)
  tdcli_function ({
    ID = "ExportChatInviteLink",
    chat_id_ = chat_id
  }, cb or dl_cb, cmd)
end
function string:starts(text)
return text == string.sub(self, 1, string.len(text))
end
function download_to_file(url, file_name)
local respbody = {}
local options = {
url = url,
sink = ltn12.sink.table(respbody),
redirect = true
}
local response
if url:starts("https") then
options.redirect = false
response = {
https.request(options)
}
else
response = {
http.request(options)
}
end
local code = response[2]
local headers = response[3]
local status = response[4]
if code ~= 200 then
return nil
end
file_name = file_name or get_http_file_name(url, headers)
local file_path = "data/" .. file_name
file = io.open(file_path, "w+")
file:write(table.concat(respbody))
file:close()
return file_path
end
function get_file(file_name)
local respbody = {}
local options = {
sink = ltn12.sink.table(respbody),
redirect = true
}
local file_path = "data/" .. file_name
file = io.open(file_path, "w+")
file:write(table.concat(respbody))
file:close()
return file_path
end
----------------not Filtering-----------------------------------------
local filter_ok = function(value)
local var = true
if string.find(value, "@") then
var = false
end
if string.find(value, "-") then
var = false
end
if string.find(value, "_") then
var = false
end
if string.find(value, "/") then
var = false
end
if string.find(value, "#") then
var = false
end
return var
end
----------------------TiMe------------------------------------
local getTime = function(seconds)
local final = ""
local hours = math.floor(seconds / 3600)
seconds = seconds - hours * 60 * 60
local min = math.floor(seconds / 60)
seconds = seconds - min * 60
local S = hours .. ":" .. min .. ":" .. seconds
return S
end
local getTimeUptime = function(seconds, lang)
local days = math.floor(seconds / 86400)
seconds = seconds - days * 86400
local hours = math.floor(seconds / 3600)
seconds = seconds - hours * 60 * 60
local min = math.floor(seconds / 60)
seconds = seconds - min * 60
if days == 0 then
days = nil
else
end
if hours == 0 then
hours = nil
else
end
if min == 0 then
min = nil
else
end
if seconds == 0 then
seconds = nil
else
end
local text = ""
if lang == "Fa" then
if days then
if hours or min or seconds then
text = text .. days .. " يوم \n🔑┇»»» و"
else
text = text .. days .. " يوم \n🔑┇»»»"
end
end
if hours then
if min or seconds then
text = text .. hours .. " ساعه \n🔑┇»»» و"
else
text = text .. hours .. " ساعه \n🔑┇»»»"
end
end
if min then
if seconds then
text = text .. min .. " دقیقه \n🔑┇»»» و"
else
text = text .. min .. " دقیقه "
end
end
if seconds then
text = text .. seconds .. " ثانیه"
end
else
if days then
if hours or min or seconds then
text = text .. days .. " يوم \n🔑┇»»» و"
else
text = text .. days .. " يوم \n🔑┇»»»"
end
end
if hours then
if min or seconds then
text = text .. hours .. " ساعه \n🔑┇»»» و"
else
text = text .. hours .. " ساعه \n🔑┇»»»"
end
end
if min then
if seconds then
text = text .. min .. " دقیقه \n🔑┇»»» و"
else
text = text .. min .. " دقیقه"
end
end
if seconds then
text = text .. seconds .. " ثانیه"
end
end
return text
end
function GetUptimeServer(uptime, lang)
local uptime = io.popen("uptime -p"):read("*all")
days = uptime:match("up %d+ days")
hours = uptime:match(", %d+ hours")
minutes = uptime:match(", %d+ minutes")
if hours then
hours = hours
else
hours = ""
end
if days then
days = days
else
days = ""
end
if minutes then
minutes = minutes
else
minutes = ""
end
days = days:gsub("up", "")
local a_ = string.match(days, "%d+")
local b_ = string.match(hours, "%d+")
local c_ = string.match(minutes, "%d+")
if a_ then
a = a_ * 86400
else
a = 0
end
if b_ then
b = b_ * 3600
else
b = 0
end
if c_ then
c = c_ * 60
else
c = 0
end
x = b + a + c
local resultUp = getTimeUptime(x, lang)
return resultUp
end
------------function who_add---------------------------------------------------------------------
local who_add = function(chat)
local user_id
local user = false
local list1 = redis:smembers(KING.."Bot:KpSudos")
local list2 = redis:smembers(KING.."Bot:Admins")
for k, v in pairs(list1) do
local hash = "sudo:data:" .. v
local is_add = redis:sismember(KING..hash, chat)
if is_add then
user_id = v
end
end
for k, v in pairs(list2) do
local hash = "sudo:data:" .. v
local is_add = redis:sismember(KING..hash, chat)
if is_add then
user_id = v
end
end
local hash = "sudo:data:" .. Kp_Owner
if redis:sismember(KING..hash, chat) then
user_id = Kp_Owner
end
if user_id then
local user_info = redis:get(KING.."user:Name" .. user_id)
if user_info then
user = user_info
end
end
return user
end
local pray_api_key
local pray_base_api = "https://maps.googleapis.com/maps/api"
function get_latlong(area)
local api = pray_base_api .. "/geocode/json?"
local parameters = "address=" .. (URL.escape(area) or "")
if pray_api_key ~= nil then
parameters = parameters .. "&key=" .. pray_api_key
end
local res, code = https.request(api .. parameters)
if code ~= 200 then
return nil
end
local data = json.decode(res)
if data.status == "ZERO_RESULTS" then
return nil
end
if data.status == "OK" then
lat = data.results[1].geometry.location.lat
lng = data.results[1].geometry.location.lng
acc = data.results[1].geometry.location_type
types = data.results[1].types
return lat, lng, acc, types
end
end
function get_staticmap(area)
local api = pray_base_api .. "/staticmap?"
local lat, lng, acc, types = get_latlong(area)
local scale = types[1]
if scale == "locality" then
zoom = 8
elseif scale == "country" then
zoom = 4
else
zoom = 13
end
local parameters = "size=600x300" .. "&zoom=" .. zoom .. "&center=" .. URL.escape(area) .. "&markers=color:red" .. URL.escape("|" .. area)
if pray_api_key ~= nil and pray_api_key ~= "" then
parameters = parameters .. "&key=" .. pray_api_key
end
return lat, lng, api .. parameters
end
local check_filter_words = function(msg, value)
local hash = "bot:filters:" .. msg.chat_id_
if hash then
local names = redis:hkeys(KING..hash)
local text = ""
for i = 1, #names do
if string.match(value, names[i]) and not is_momod(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print("\027[" .. color.white[1] .. ";" .. color.red[2] .. "mDeleted [Filtering][For Word On List : " .. names[i] .. "]\027[00m")
end
end
end
end 
redis:set(KING.."bot:Uptime", os.time())
----------------tdcli_update_callback---------------------------------------------------------------------------
function tdcli_update_callback(data)
local our_id = redis:get(KING.."Our_ID") or 0
local api_id = redis:get(KING.."Bot:Api_ID") or 0
if data.ID == "UpdateNewMessage" then
local msg = data.message_
redis:incr(KING.."bot:allmsgs")
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
if not redis:sismember(KING.."bot:groups", msg.chat_id_) then
redis:sadd(KING.."bot:groups", msg.chat_id_)
end
elseif id:match("^(%d+)") then
if not redis:sismember(KING.."bot:userss", msg.chat_id_) then
redis:sadd(KING.."bot:userss", msg.chat_id_)
end
chat_type = 'user' 
elseif not redis:sismember(KING.."bot:groups", msg.chat_id_) then
redis:sadd(KING.."bot:groups", msg.chat_id_)
end
end

local d = data.disable_notification_
local chat = chats[msg.chat_id_]
redis:sadd(KING.."groups:users" .. msg.chat_id_, msg.sender_user_id_)--save users gp
redis:incr(KING.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_.."")--save msgs gp
if msg.content_.ID == "MessageChatDeleteMember" then
if tonumber(msg.content_.user_.id_) == tonumber(_redis.Bot_ID) then
local user_info_ = redis:get(KING.."user:Name" .. msg.sender_user_id_)
local UserKing = user_info_
if user_info_ then 
local sudoed = tonumber(Kp_Owner)
local iD_King = [[
🚷┇تم طردِ البوت ، من المجموعهہ‌‏ 🤖
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👤┇معلومات عن الشخص 👇🏾

🎟┇ايديـه ~ (]]..msg.sender_user_id_..[[)
🎭┇معرفه ~ []]..UserKing..[[]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔘┇معلومات المجموعهہ‌‏ 👇🏾

📮┇ اسم المجموعه :
• ]]..title_name(msg.chat_id_)..[[

🎫┇ ايدي المجموعه :
• ]]..msg.chat_id_..[[

‌‏]]
send(sudoed, 0, 1,iD_King, 1, "md")
redis:del(KING.."bot:enable:" .. msg.chat_id_)
redis:srem(KING.."bot:groups", msg.chat_id_)
end end end
if msg.content_.ID == "MessageChatAddMembers" then
redis:incr(KING..'kpaddcon'..msg.chat_id_..':'..msg.sender_user_id_)
if msg.date_ < os.time() - 40 then
print("\027[" .. color.white[1] .. ";" .. color.magenta[2] .. "m>>> OLD MSG <<<\027[00m")
return false
end
if not redis:get(KING.."Set_Our_ID") then
tdcli_function({ID = "GetMe"}, BotInfo, nil)
end
if tonumber(msg.sender_user_id_) == tonumber(api_id) then
print("\027[" .. color.magenta[1] .. ";" .. color.black[2] .. "m>>> MSG From Api Bot <<<\027[00m")
return false
end
if run == "False" or bot_id == 0 or Kp_Owner == 0 then
print("\027[" .. color.red[1] .. ";" .. color.black[2] .. "m>>>>>>> [ Config.Erorr ] : Configuration Information Is Incomplete !\027[00m")
return false
end
end
if not redis:get(KING.."Rank:Data") then
for v, user in pairs(sudo_users) do
do
-------------------function outputsudo--------------------------------------------------------
local outputsudo = function(extra, result)
local sudofname = result.first_name_ or "---"
local sudolname = result.last_name_ or ""
local sudoname = sudofname .. " " .. sudolname
if result.username_ then
sudousername = "@" .. result.username_
else
sudousername = "---"
end
local sudouserid = result.id_ or "---"
if result.first_name_ then
redis:set(KING.."KpSudos" .. user, "> Sudo User ID : " .. sudouserid .. [[

> Sudo User Name : ]] .. sudoname .. [[

> Sudo Username : ]] .. sudousername .. [[

---------------]])
end
end
getUser(user, outputsudo)
end
break
end
------------function outputbotowner ----------------------------------------
local outputbotowner = function(extra, result)
local botownerfname = result.first_name_ or "---"
local botownerlname = result.last_name_ or ""
local botownername = botownerfname .. " " .. botownerlname
if result.username_ then
botownerusername = result.username_
else
botownerusername = "---"
end
local botowneruserid = result.id_ or "---"
redis:set(KING.."KpOwnerBot" .. Kp_Owner, "> Bot Owner ID : " .. botowneruserid .. [[

> Bot Owner Name : ]] .. botownername .. [[

> Bot Owner Username : ]] .. botownerusername .. [[

---------------]])
end
getUser(Kp_Owner, outputbotowner)
--------------------function outputbot----------------------------------------
local outputbot = function(extra, result)
if result.id_ then
local botfname = result.first_name_ or "---"
local botlname = result.last_name_ or ""
local botname = botfname .. " " .. botlname
if result.username_ then
botusername = result.username_
else
botusername = "---"
end
local botuserid = result.id_ or "---"
redis:set(KING.."Botid" .. result.id_, "> Bot ID : " .. botuserid .. [[

> Bot Name : ]] .. botname .. [[

> Bot Username : ]] .. botusername .. [[

---------------]])
else
redis:set(KING.."Botid" .. bot_id, [[
> Bot ID : ---
> Bot Name : ---
> Bot Username : ---
---------------]])
end
end
getUser(bot_id, outputbot)
redis:setex(KING.."Rank:Data", 700, true)
end
if redis:get(KING.."bot:reload") and 30 > tonumber(redis:ttl(KING.."bot:reload")) then
load_config()
setnumbergp()
redis:setex(KING.."bot:reload", 7230, true)
print("\027[" .. color.black[1] .. ";" .. color.green[2] .. "m>>> Bot Reloaded <<<\027[00m")
end
if not redis:get(KING.."bot:reload2") then
redis:del(KING.."bot:groups")
redis:del(KING.."bot:userss")
redis:setex(KING.."bot:reloadingtime", 22 * hour, true)
redis:setex(KING.."bot:reload2", week, true)
redis:setex(KING.."bot:reload3", 2222 * day, true)
redis:setex(KING.."bot:reload4", 2222 * day, true)
end
if redis:get(KING.."bot:reload3") and 500 >= tonumber(redis:ttl(KING.."bot:reload3")) then
local hash = "bot:groups"
local list = redis:smembers(KING..hash)
for k, v in pairs(list) do
if not redis:get(KING.."bot:enable:" .. v) and not redis:get(KING.."bot:charge:" .. v) then
resetgroup(v)
chat_leave(v, bot_id)
redis:srem(KING..hash, v)
end
end
redis:del(KING.."bot:reload3")
end
if redis:get(KING.."bot:reload4") and redis:ttl(KING.."bot:reload4") <= 600 then
local reload_data_sudo = function()
local hashsudo = "Bot:KpSudos"
local listsudo = redis:smembers(KING..hashsudo)
for k, v in pairs(listsudo) do
local hashdata = "sudo:data:" .. v
local listdata = redis:smembers(KING..hashdata)
for k, gp in pairs(listdata) do
if not redis:sismember(KING.."bot:groups", gp) then
redis:srem(KING..hashdata, gp)
end
end
end
end
local reload_data_admins = function()
local hashadmin = "Bot:Admins"
local listadmin = redis:smembers(KING..hashadmin)
for k, v in pairs(listadmin) do
local hashdata = "sudo:data:" .. v
local listdata = redis:smembers(KING..hashdata)
for k, gp in pairs(listdata) do
if not redis:sismember(KING.."bot:groups", gp) then
redis:srem(KING..hashdata, gp)
end
end
end
end
reload_data_sudo()
reload_data_admins()
end
------------------------------EXpirepannel GP ----------------------------------------------------------
local expiretime = redis:ttl(KING.."bot:charge:" .. msg.chat_id_)
if not redis:get(KING.."bot:charge:" .. msg.chat_id_) and redis:get(KING.."bot:enable:" .. msg.chat_id_) then
redis:del(KING.."bot:enable:" .. msg.chat_id_)
redis:srem(KING.."bot:groups", msg.chat_id_)
end
if redis:get(KING.."bot:charge:" .. msg.chat_id_) and not redis:get(KING.."bot:enable:" .. msg.chat_id_) then
redis:set(KING.."bot:enable:" .. msg.chat_id_, true)
end
if not redis:get(KING.."bot:expirepannel:" .. msg.chat_id_) and redis:get(KING.."bot:charge:" .. msg.chat_id_) and tonumber(expiretime) < tonumber(day) and tonumber(expiretime) >= 3600 then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
local v = tonumber(Kp_Owner)
local list = redis:smembers(KING.."bot:owners:" .. msg.chat_id_)
if list[1] or list[2] or list[3] or list[4] then
user_info = redis:get(KING.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then
owner = user_info
else
owner = "لا يوجد "
end
local User = who_add(msg.chat_id_)
if User then
sudo = User
else
sudo = "لا يوجد  "
end
send(v, 0, 1, "👨‍🔧┇ سوف تنتهي صلاحيه المجموعه\n🔅┇الرابط : " .. (redis:get(KING.."bot:group:link" .. msg.chat_id_) or "لا يوجد ") .. "\n🎟┇ الايدي » " .. msg.chat_id_ .. "", 1, "html")
redis:setex(KING.."bot:expirepannel:" .. msg.chat_id_, 43200, true)
end
end
------------------------Autoleave FOR BOT----------------------------------------------------
if redis:get(KING.."autoleave") == "On" then
local id = tostring(msg.chat_id_)
if not redis:get(KING.."bot:enable:" .. msg.chat_id_) and id:match("-100(%d+)") and not redis:get(KING.."bot:autoleave:" .. msg.chat_id_) then
redis:setex(KING.."bot:autoleave:" .. msg.chat_id_, 1400, true)
end
local autoleavetime = tonumber(redis:ttl(KING.."bot:autoleave:" .. msg.chat_id_))
local time = 400
if tonumber(autoleavetime) < tonumber(time) and tonumber(autoleavetime) > 150 then
redis:set(KING.."lefting" .. msg.chat_id_, true)
end
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") and redis:get(KING.."lefting" .. msg.chat_id_) then
if not redis:get(KING.."bot:enable:" .. msg.chat_id_) and not redis:get(KING.."bot:charge:" .. msg.chat_id_) then
redis:del(KING.."lefting" .. msg.chat_id_)
redis:del(KING.."bot:autoleave:" .. msg.chat_id_)
chat_leave(msg.chat_id_, bot_id)
local v = tonumber(Kp_Owner)
send(v, 0, 1, "🚫┇ تم مغادره المجموعــه\n👤┇ الاسم » 👇🏾\n🏮┇ ("..title_name(msg.chat_id_)..")\n🎟┇ الايدي » " .. msg.chat_id_, 1, "html")
redis:srem(KING.."bot:groups", msg.chat_id_)
elseif redis:get(KING.."bot:enable:" .. msg.chat_id_) then
redis:del(KING.."lefting" .. msg.chat_id_)
end
end
elseif redis:get(KING.."bot:charge:" .. msg.chat_id_) == "Trial" and 500 > redis:ttl(KING.."bot:charge:" .. msg.chat_id_) then
local v = tonumber(Kp_Owner)
send(v, 0, 1, "🚫┇ تم مغادره المجموعــه\n👤┇ الاسم » ("..title_name(msg.chat_id_)..")\n🎟┇ الايدي » " .. msg.chat_id_, 1, "html")
redis:srem(KING.."bot:groups", msg.chat_id_)
chat_leave(msg.chat_id_, bot_id)
redis:del(KING.."bot:charge:" .. msg.chat_id_)
end
local idf = tostring(msg.chat_id_)
if idf:match("-100(%d+)") then
local chatname = chat and chat and chat.title_
local svgroup = "group:Name" .. msg.chat_id_
if chat and chatname then
redis:set(KING..svgroup, chatname)
end
end
local check_username = function(extra, result)
local fname = result.first_name_ or ""
local lname = result.last_name_ or ""
local name = fname .. " " .. lname
local username = result.username_
local svuser = "user:Name" .. result.id_
local id = result.id_
if username then
redis:set(KING..svuser, "@" .. username)
else
redis:set(KING..svuser, name)
end
end
getUser(msg.sender_user_id_, check_username)
if redis:get(KING.."clerk") == "On" then
local clerk = function(extra, result)
if not is_admin(result.id_) then
local textc = redis:get(KING.."textsec")
if not redis:get(KING.."secretary_:" .. msg.chat_id_) and textc then
textc = textc:gsub("FIRSTNAME", result.first_name_ or "")
textc = textc:gsub("LASTNAME", result.last_name_ or "")
if result.username_ then
textc = textc:gsub("USERNAME", "@" .. result.username_)
else
textc = textc:gsub("USERNAME", "")
end
textc = textc:gsub("USERID", result.id_ or "")
send(msg.chat_id_, msg.id_, 1, textc, 1, "html")
redis:setex(KING.."secretary_:" .. msg.chat_id_, day, true)
end
end
end
if idf:match("^(%d+)") and tonumber(msg.sender_user_id_) ~= tonumber(our_id) then
getUser(msg.sender_user_id_, clerk)
end
end
-----------------status_welcome IN GP-------------------------------------------------------------------------
local status_welcome = (redis:get(KING..'status:welcome:'..msg.chat_id_) or 'disable')
if status_welcome == 'enable' then
if msg.content_.ID == "MessageChatJoinByLink" then
if not is_banned(msg.chat_id_,msg.sender_user_id_) then
function wlc(extra,result,success)
if redis:get(KING..'welcome:'..msg.chat_id_) then
text = redis:get(KING..'welcome:'..msg.chat_id_)
else
text = 'دخول لو عافيه {firstname}\nنورت الكروب يگمر 💗'
end
local text = text:gsub('{firstname}',(result.first_name_ or '--'))
local text = text:gsub('{lastname}',(result.last_name_ or '--'))
local text = text:gsub('{username}',('[@'..result.username_..']'))
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
getUser(msg.sender_user_id_,wlc)
end
end
end
local status_welcome = (redis:get(KING..'status:welcome:'..msg.chat_id_) or 'disable')
if status_welcome == 'enable' then
if msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].type_.ID == 'UserTypeGeneral' then
if msg.content_.ID == "MessageChatAddMembers" then
if not is_banned(msg.chat_id_,msg.content_.members_[0].id_) then
function wlc_m(extra,result,success)
if redis:get(KING..'welcome:'..msg.chat_id_) then
text = redis:get(KING..'welcome:'..msg.chat_id_)
else
text = 'دخول لو عافيه {firstname}\nنورت الكروب يگمر 💗'
end
local text = text:gsub('{firstname}',(msg.content_.members_[0].first_name_ or '--'))
local text = text:gsub('{lastname}',(msg.content_.members_[0].last_name_ or '--'))
local text = text:gsub('{username}',('[@'..msg.content_.members_[0].username_..']'))
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
end
getUser(msg.sender_user_id_,wlc_m) 
end
end

---------------type the msg--------------------------------------------------
if msg.content_ then
if msg.content_.ID == "MessageText" then
redis:incr(KING.."text:"..msg.sender_user_id_..":"..msg.chat_id_.."")
text = msg.content_.text_
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Text ] <<\027[00m")
msg_type = "MSG:Text"
end
if msg.content_.ID == "MessagePhoto" then
redis:incr(KING.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Photo ] <<\027[00m")
msg_type = "MSG:Photo"
end
if msg.content_.ID == "MessageChatAddMembers" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ New User Add ] <<\027[00m")
msg_type = "MSG:NewUserAdd"
end
if msg.content_.ID == "MessageDocument" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Document ] <<\027[00m")
msg_type = "MSG:Document"
end
if msg.content_.ID == "MessageSticker" then
redis:incr(KING.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")
if not redis:get(KING.."lock_STCK"..msg.chat_id_) then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"منور انت ، 😙","اه باع وجهك شكد نضيف 😅","هذا منو ، 😏","تسمحلي ابوسك ☹️😹","مليان ضحك مليان 😹❤️","تف على هذا  ويهك 💦😹","اذا حاته ممكن الرقم 😆??","تدري صار "..(redis:get(KING.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")).." ملصق داز  شهالتبذير 🤔😹","كافي ملصقات مشايف 😫"}
send(msg.chat_id_, msg.id_, 1,""..KING[math.random(#KING)].."", 1, 'md')
end
end
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Sticker ] <<\027[00m")
msg_type = "MSG:Sticker"
end
if msg.content_.ID == "MessageAudio" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Audio ] <<\027[00m")
msg_type = "MSG:Audio"
end
if msg.content_.ID == "MessageGame" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Game ] <<\027[00m")
msg_type = "MSG:Game"
end
if msg.content_.ID == "MessageVoice" then
redis:incr(KING.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Voice ] <<\027[00m")
msg_type = "MSG:Voice"
end
if msg.content_.ID == "MessageVideo" then
redis:incr(KING.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Video ] <<\027[00m")
msg_type = "MSG:Video"
end
if msg.content_.ID == "MessageAnimation" then
redis:incr(KING.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Gif ] <<\027[00m")
msg_type = "MSG:Gif"
end
if msg.content_.ID == "MessageLocation" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Location ] <<\027[00m")
msg_type = "MSG:Location"
end
if msg.content_.ID == "MessageUnsupported" then
redis:incr(KING.."SelfVideo:"..msg.sender_user_id_..":"..msg.chat_id_.."")
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Self Video ] <<\027[00m")
msg_type = "MSG:SelfVideo"
end
if msg.content_.ID == "MessageChatJoinByLink" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Join By link ] <<\027[00m")
msg_type = "MSG:NewUserByLink"
end
if msg.content_.ID == "MessageChatDeleteMember" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Delete Members ] <<\027[00m")
msg_type = "MSG:DeleteMember"
end
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Inline ] <<\027[00m")
msg_type = "MSG:Inline"
end
if msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic") then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Markdown ] <<\027[00m")
text = msg.content_.text_
msg_type = "MSG:MarkDown"
end
if msg.content_.web_page_ then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Web Page ] <<\027[00m")
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Web Page ] <<\027[00m")
end
if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Mention ] <<\027[00m")
msg_type = "MSG:Mention"
end
if msg.content_.ID == "MessageContact" then
print("\027[" .. color.black[1] .. ";" .. color.yellow[2] .. "m>> [ Contact ] <<\027[00m")
msg_type = "MSG:Contact"
end end
----------------------------------save_rep_in_gp----------------------------------------------
text = msg.content_.text_
if msg.content_.text_  or msg.content_.video_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ then
local content_text = redis:get(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'save_repgp' then
redis:del(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
local content_text = redis:get(KING..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then
redis:set(KING..'video_repgp'..content_text..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.sticker_ then
redis:set(KING..'stecker_repgp'..content_text..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
redis:set(KING..'voice_repgp'..content_text..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.animation_ then
redis:set(KING..'gif_repgp'..content_text..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
redis:set(KING..'text_repgp'..content_text..''..msg.chat_id_..'', msg.content_.text_)
end
redis:sadd('rep_owner'..msg.chat_id_..'',content_text)
send(msg.chat_id_, msg.id_, 1, "☑┇ تم حفظ الرد بنجاح\n", 1, 'md')
redis:del(KING..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
return false end end
if msg.content_.text_ and not redis:get(KING..'lock_reeeep'..msg.chat_id_) then
if redis:get(KING..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'') then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, redis:get(KING..'video_repgp'..msg.content_.text_..''..msg.chat_id_..''))
end
if redis:get(KING..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, redis:get(KING..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..''))
end
if  redis:get(KING..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'') then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, redis:get(KING..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..''))
end
if redis:get(KING..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'') then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, redis:get(KING..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..''))
end
if redis:get(KING..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'') then
send(msg.chat_id_, msg.id_, 1, redis:get(KING..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'') ,  1, 'md')
end
end
---------------------------------in all gps---------------------------------------------------
text = msg.content_.text_
if msg.content_.text_  or msg.content_.video_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ then
local content_text = redis:get(KING.."add:repallt"..msg.sender_user_id_)
if content_text == 'save_rep' then
redis:del(KING.."add:repallt"..msg.sender_user_id_)
local content_text = redis:get(KING.."addreply2:"..msg.sender_user_id_)
if msg.content_.video_ then
redis:set(KING.."video_repall"..content_text, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.sticker_ then
redis:set(KING.."stecker_repall"..content_text, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
redis:set(KING.."voice_repall"..content_text, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.animation_ then
redis:set(KING.."gif_repall"..content_text, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
redis:set(KING.."text_repall"..content_text, msg.content_.text_)
end
redis:sadd('rep_sudo',content_text)
send(msg.chat_id_, msg.id_, 1, "☑┇ تم حفظ الرد بنجاح\n", 1, 'md')
redis:del(KING.."addreply2:"..msg.sender_user_id_)
return false end end
if msg.content_.text_ and not redis:get(KING..'lock_reeeep'..msg.chat_id_) then
if redis:get(KING.."video_repall"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, redis:get(KING.."video_repall"..msg.content_.text_))
end
if redis:get(KING.."voice_repall"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, redis:get(KING.."voice_repall"..msg.content_.text_))
end
if  redis:get(KING.."gif_repall"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, redis:get(KING.."gif_repall"..msg.content_.text_))
end
if redis:get(KING.."stecker_repall"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, redis:get(KING.."stecker_repall"..msg.content_.text_))
end
if redis:get(KING.."text_repall"..msg.content_.text_) then
send(msg.chat_id_, msg.id_, 1, redis:get(KING.."text_repall"..msg.content_.text_) ,  1, "md")
end
end
if not d and chat then
if msg.content_.ID == "MessageText" then
do_notify(chat and chat.title_, msg.content_.text_)
else
do_notify(chat and chat.title_, msg.content_.ID)
end
end
local flmax = "flood:max:" .. msg.chat_id_
if not redis:get(KING..flmax) then
floodMax = 5
else
floodMax = tonumber(redis:get(KING..flmax))
end
local pm = "flood:" .. msg.sender_user_id_ .. ":" .. msg.chat_id_ .. ":msgs"
if not redis:get(KING..pm) then
msgs = 0
else
msgs = tonumber(redis:get(KING..pm))
end
local TIME_CHECK = 2
local TIME_CHECK_PV = 2
local hashflood = "anti-flood:" .. msg.chat_id_
if msgs > floodMax - 1 then
if redis:get(KING.."floodstatus" .. msg.chat_id_) == "Kicked" then
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
chat_kick(msg.chat_id_, msg.sender_user_id_)
elseif redis:get(KING.."floodstatus" .. msg.chat_id_) == "DelMsg" then
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
else
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
end
end
local pmonpv = "antiattack:" .. msg.sender_user_id_ .. ":" .. msg.chat_id_ .. ":msgs"
if not redis:get(KING..pmonpv) then
msgsonpv = 0
else
msgsonpv = tonumber(redis:get(KING..pmonpv))
end
if msgsonpv > 12 then
blockUser(msg.sender_user_id_)
end
local idmem = tostring(msg.chat_id_)
if idmem:match("^(%d+)") and not is_admin(msg.sender_user_id_) and not redis:get(KING.."Filtering:" .. msg.sender_user_id_) then
redis:setex(KING..pmonpv, TIME_CHECK_PV, msgsonpv + 1)
end
function delmsg(extra, result)
for k, v in pairs(result.messages_) do
delete_msg(msg.chat_id_, {
[0] = v.id_
})
end end

local print_del_msg = function(text)
print("\027[" .. color.white[1] .. ";" .. color.red[2] .. "m" .. text .. "\027[00m")
end
----------lock keed helps----------------------------------
if not is_momod(msg.sender_user_id_, msg.chat_id_) and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].")) then
if redis:get(KING.."keed_link"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_link]")
end
end
end
if msg.content_.text_ then
text = msg.content_.text_
if text:match("كس") or text:match("طيز") or text:match("ديس") or text:match("زب") or text:match("انيجمك") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("اخ الكحبه") or text:match("اخو الكحبه") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("عير بطيزك") or text:match("كس امك") or text:match("امك الكحبه") or text:match("عيرك") or text:match("عير بيك") or text:match("صرمك") then
if redis:get(KING.."keed_fosh"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_fosh]")
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if redis:get(KING.."keed_user"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_user]")
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if redis:get(KING.."keed_user"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_user]")
end
end
if msg.content_.ID == "MessagePhoto" then
if redis:get(KING.."keed_photo" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_photo]")
end end
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].")) then
if redis:get(KING.."keed_link"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_link]")
end
end
if redis:get(KING.."keed_text"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_text]")
end
if text and text:match("(.*)(#)(.*)")  then
if redis:get(KING.."keed_hashtag"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_hashtag]")
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if redis:get(KING.."keed_fwd"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_fwd]")
end
end
end
if msg.content_.ID == "MessageSticker" then
if redis:get(KING.."keed_stecker"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_stecker]")
end
end
if msg.content_.ID == "MessageAudio" then
if redis:get(KING.."keed_audio"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_audio]")
end
end
if msg.content_.ID == "MessageVoice" then
if redis:get(KING.."keed_voice"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_voice]")
end
end
if msg.content_.ID == "MessageVideo" then
if redis:get(KING.."keed_video"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_video]")
end
end
if msg.content_.ID == "MessageAnimation" then
if redis:get(KING.."keed_gif"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_gif]")
end
end
if msg.content_.ID == "MessageContact" then
if redis:get(KING.."keed_contect"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_contect]")
end
end
if text and text:match("[\216-\219][\128-\191]") then
if redis:get(KING.."keed_arbic"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_arbic]")
end
end
if msg.content_.ID == "MessageDocument" then
if redis:get(KING.."keed_Document"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_Document]")
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if redis:get(KING.."keed_english"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_english]")
end
end
if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if redis:get(KING.."keed_markdon"..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
print_del_msg("Deleted Because [Lock] [keed_markdon]")
end
end
end
end
end
if msg.sender_user_id_ == 483853712 then
print("\027[" .. color.black[1] .. ";" .. color.green[2] .. "m>>> This is Welcomer Bots <<<\027[00m")
end
if is_banned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
return
end
if is_muted(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
return
end
if not redis:get(KING.."bot:muted:Time" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) and redis:sismember(KING.."bot:muted:" .. msg.chat_id_, msg.sender_user_id_) then
redis:srem(KING.."bot:muted:" .. msg.chat_id_, msg.sender_user_id_)
end
if is_gbanned(msg.sender_user_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
return
end
if redis:get(KING.."bot:muteall:Time" .. msg.chat_id_) then
local start_ = redis:get(KING.."bot:muteall:start" .. msg.chat_id_)
local start = start_:gsub(":", "")
local stop_ = redis:get(KING.."bot:muteall:stop" .. msg.chat_id_)
local stop = stop_:gsub(":", "")
local SVTime = os.date("%R")
local Time = SVTime:gsub(":", "")
if tonumber(Time) >= tonumber(start) and not redis:get(KING.."bot:muteall:Run" .. msg.chat_id_) then
local g = os.time()
redis:set(KING.."bot:muteall:start_Unix" .. msg.chat_id_, g)
local year_0 = os.date("%Y")
local Month_0 = os.date("%m")
local day_0 = os.date("%d")
if tonumber(start) > tonumber(stop) then
day_0 = day_0 + 1
end
local hour_ = stop_:match("%d+:")
local hour_0 = hour_:gsub(":", "")
local minute_ = stop_:match(":%d+")
local minute_0 = minute_:gsub(":", "")
local sec_0 = 0
local unix = os.time({day=tonumber(day_0),month=tonumber(Month_0),year=tonumber(year_0),hour=tonumber(hour_0),min=tonumber(minute_0),sec=0})+ 12600
redis:set(KING.."bot:muteall:stop_Unix" .. msg.chat_id_, unix)
redis:set(KING.."bot:muteall:Run" .. msg.chat_id_, true)
end
end
if redis:get(KING.."bot:muteall:Time" .. msg.chat_id_) and redis:get(KING.."bot:muteall:Run" .. msg.chat_id_) then
local SR = redis:get(KING.."bot:muteall:start_Unix" .. msg.chat_id_) or 0
local SP = redis:get(KING.."bot:muteall:stop_Unix" .. msg.chat_id_) or 0
local MsgTime = msg.date_
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) and tonumber(MsgTime) >= tonumber(SR) and tonumber(MsgTime) < tonumber(SP) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Auto] [Lock] [" .. SR .. "] [" .. SP .. "]")
end
if tonumber(MsgTime) >= tonumber(SP) then
redis:del(KING.."bot:muteall:Run" .. msg.chat_id_)
end
end
---------------------pinnedmsg----------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" and not msg.sender_user_id_ == our_id and not is_owner(msg.sender_user_id_, msg.chat_id_) and redis:get(KING.."pinnedmsg" .. msg.chat_id_) and redis:get(KING.."bot:pin:mute" .. msg.chat_id_) then
unpinmsg(msg.chat_id_)
local pin_id = redis:get(KING.."pinnedmsg" .. msg.chat_id_)
pinmsg(msg.chat_id_, pin_id, 0)
end
if not redis:get(KING.."Resetdatapost" .. msg.chat_id_) then
redis:del(KING.."Gp:Post" .. msg.chat_id_)
redis:setex(KING.."Resetdatapost" .. msg.chat_id_, 12 * hour, true)
end
----------------------com viewget -----------------------------------------------------
if redis:get(KING.."bot:viewget" .. msg.sender_user_id_) then
if not msg.forward_info_ then
send(msg.chat_id_, msg.id_, 1, "✯┇ حدث خطا حاول مره اخرى", 1, "md")
redis:del(KING.."bot:viewget" .. msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, "📛┇ عـــدد المشاهـــدات \n: " .. msg.views_ .. "", 1, "md")
redis:del(KING.."bot:viewget" .. msg.sender_user_id_)
end end
if redis:get(KING.."bot:viewmsg") == "On" then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
viewMessages(chat, msgs)
end
--------------save cam photo-------------------------------------------------------------------
if msg.content_.photo_ then
if redis:get(KING..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
send(msg.chat_id_, msg.id_, 1, '☑┇ تم وضع صوره للمجموعه', 1, 'md')
redis:del(KING..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
setphoto(msg.chat_id_, photo_id)
end
------------------------------------------------------------------------------------------------
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "◯↲  تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه",  1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
--«««««««««««««««««««««««« Welcome to Source KING »»»»»»»»»»»»»»»»»»»»»»»»»»»--
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Photo]")
end
if msg.content_.ID == "MessagePhoto" then
if redis:get(KING.."bot:photo:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Photo]")
end
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Photo]")
if redis:get(KING.."bot:strict" .. msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Photo]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Photo]")
end
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Photo]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Photo]")
end
--«««««««««««««««««««««««« Welcome to Source KING »»»»»»»»»»»»»»»»»»»»»»»»»»»--
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Photo]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Photo]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Photo]")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Photo]")
end
end
end
elseif msg_type == "MSG:MarkDown" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "◯↲ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [MarkDown]")
end
if redis:get(KING.."markdown:lock" .. msg.chat_id_) and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Markdown]")
end
end
elseif msg_type == "MSG:Game" then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
--«««««««««««««««««««««««« Welcome to Source KING »»»»»»»»»»»»»»»»»»»»»»»»»»»--
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end

if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Game]")
end
if redis:get(KING.."Game:lock" .. msg.chat_id_) and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Game]")
end
end
elseif msg_type == "MSG:Mention" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "◯↲ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Mention]")
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Mention]")
end
end
elseif msg_type == "MSG:Document" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Document]")
end
if redis:get(KING.."bot:document:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Document]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Document]")
if redis:get(KING.."bot:strict" .. msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Document]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Document]")
end
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Document]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Document]")
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Document]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Document]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Document]")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Document]")
end
end
end
elseif msg_type == "MSG:Inline" then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Inline]")
end
if redis:get(KING.."bot:inline:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Inline]")
end
end
elseif msg_type == "MSG:Sticker" then
local DownSticker = function(extra, result)
if result.content_.sticker_.sticker_.id_ then
local sticker_id = result.content_.sticker_.sticker_.id_
downloadFile(sticker_id, dl_cb)
end
end
if redis:get(KING.."clerk") == "On" or is_admin(msg.sender_user_id_) then
getMessage(msg.chat_id_, msg.id_, DownSticker)
end
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ",   1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Sticker]")
end
if redis:get(KING.."bot:sticker:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Sticker]")
end
end
elseif msg_type == "MSG:NewUserByLink" then
if redis:get(KING.."bot:tgservice:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tgservice] [JoinByLink]")
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) and redis:get(KING.."bot:member:lock" .. msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
elseif msg_type == "MSG:DeleteMember" then
if redis:get(KING.."bot:tgservice:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tgservice] [DeleteMember]")
end
elseif msg_type == "MSG:NewUserAdd" then
if redis:get(KING.."bot:tgservice:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tgservice] [NewUserAdd]")
end
if not is_momod(msg.sender_user_id_, msg.chat_id_) then
local list = msg.content_.members_
for i = 0, #list do
if list[i].type_.ID == "UserTypeBot" and not is_momod(list[i].id_, msg.chat_id_) and redis:get(KING.."bot:bots:mute" .. msg.chat_id_) then
chat_kick(msg.chat_id_, list[i].id_)
end
if list[i].type_.ID == "UserTypeBot" and not is_momod(list[i].id_, msg.chat_id_) and redis:get(KING.."bot:botskick" .. msg.chat_id_) then
chat_kick(msg.chat_id_, list[i].id_)
chat_kick(msg.chat_id_, msg.sender_user_id_)
local user_info_ = redis:get(KING..'user:Name' .. msg.sender_user_id_)
local UserKing = user_info_
if user_info_ then
send(msg.chat_id_, msg.id_, 1, "👤┇ المستخدم » (["..UserKing.."])\n🎟┇ الايدي » (*"..msg.sender_user_id_.."*)\n🤖┇ قام بأضافه بوت في المجموعهہ‌‏\n🚫┇ تم طرد البوت مع المستخدم \n✓", 1, "md")
end 
end
if list[i].type_.ID == "UserTypeBot" and not is_momod(list[i].id_, msg.chat_id_) and redis:get(KING.."keed_bots"..msg.chat_id_) then
chat_kick(msg.chat_id_, list[i].id_)
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. KING_TOKEN .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
redis:sadd(KING..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
local user_info_ = redis:get(KING..'user:Name' .. msg.sender_user_id_)
local UserKing = user_info_
if user_info_ then
send(msg.chat_id_, msg.id_, 1, "👤┇ المستخدم » (["..UserKing.."])\n🎟┇ الايدي » (*"..msg.sender_user_id_.."*)\n🤖┇ قام بأضافه بوت في المجموعهہ‌‏\n🚫┇ تم طرد البوت وتقييد المستخدم \n✓", 1, "md")
end
end
end
end
if redis:get(KING.."bot:member:lock" .. msg.chat_id_) and not is_vipmem(msg.content_.members_[0].id_, msg.chat_id_) and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
end

if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
end
elseif msg_type == "MSG:Contact" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Contact]")
end
if redis:get(KING.."bot:contact:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Contact]")
end
end
elseif msg_type == "MSG:Audio" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Audio]")
end
if redis:get(KING.."bot:music:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Audio]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Audio]")
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Audio]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Audio]")
end
--«««««««««««««««««««««««« Welcome to Source KING »»»»»»»»»»»»»»»»»»»»»»»»»»»--
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Audio]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Audio]")
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Audio]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Audio]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Audio]")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Audio]")
end
end
end
elseif msg_type == "MSG:Voice" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Voice]")
end
if redis:get(KING.."bot:voice:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Voice]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Voice]")
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Voice]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Voice]")
end
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Voice]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Voice]")
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Voice]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Voice]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Voice]")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Voice]")
end
end
end
elseif msg_type == "MSG:Location" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Location]")
end
if redis:get(KING.."bot:location:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Location]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Location]")
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Location]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Location]")
end
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Location]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Location]")
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Location]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Location]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Location]")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Location]")
end
end
end
elseif msg_type == "MSG:Video" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Video]")
end
if redis:get(KING.."bot:video:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Video]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Video]")
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Video]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Video]")
end
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Video]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Video]")
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Video]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Video]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Video] ")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Video]")
end
end
end
elseif msg_type == "MSG:SelfVideo" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end

if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Self Video]")
end
if redis:get(KING.."bot:selfvideo:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Self Video]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Self Video]")
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Self Video]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Self Video]")
end
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Self Video]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Self Video]")
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Self Video]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Self Video]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Self Video] ")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Self Video]")
end
end
end
elseif msg_type == "MSG:Gif" then
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
if msg.content_.caption_ then
if msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
if string.len(msg.content_.caption_) > senspost.cappostwithtag then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.caption_) > senspost.cappost then
local post = msg.content_.caption_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Gif]")
end
if redis:get(KING.."bot:gifs:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Gif]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) and (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://")) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Gif] ")
end
if msg.content_.caption_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Gif]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Gif]")
end
if msg.content_.caption_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Gif]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Gif]")
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.caption_:match("[Ww][Ww][Ww]") or msg.content_.caption_:match(".[Cc][Oo]") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Gif]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Gif]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.caption_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Gif]")
end
if (msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Gif]")
end
end
end
else
if msg_type == "MSG:Text" then
redis:setex(KING.."bot:editid" .. msg.id_, day, msg.content_.text_)
if redis:get(KING.."anti-flood:" .. msg.chat_id_) and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
redis:setex(KING..pm, TIME_CHECK, msgs + 1)
end
---------------------rem cam filters---------------------------------------------------------------------
if redis:get(KING.."Filtering:" .. msg.sender_user_id_) then
local chat = redis:get(KING.."Filtering:" .. msg.sender_user_id_)
local name = string.sub(msg.content_.text_, 1, 50)
local hash = "bot:filters:" .. chat
if msg.content_.text_:match("^الغاء$") then
send(msg.chat_id_, msg.id_, 1, "☑- تم الغاء الامر بنجاح  ", 1, "md")
redis:del(KING.."Filtering:" .. msg.sender_user_id_, 10, chat)
elseif msg.content_.text_:match("^/[Cc]ancel$") then
send(msg.chat_id_, msg.id_, 1, "تم الغاء الامر 🏌️", 1, "md")
redis:del(KING.."Filtering:" .. msg.sender_user_id_, 10, chat)
elseif filter_ok(name) then
redis:hset(KING..hash, name, "newword")
send(msg.chat_id_, msg.id_, 1, "● ◄  الكلمه ( [ " .. name .. " ] ) تم منعها \n- للخروج من الامر ارسل\n  الغاء  ",  1, "md")
redis:setex(KING.."Filtering:" .. msg.sender_user_id_, 10, chat)
else
send(msg.chat_id_, msg.id_, 1, "● ◄  الكلمه  [ " .. name .. " ] لا استطيع منعها", 1, "md")
redis:setex(KING.."Filtering:" .. msg.sender_user_id_, 10, chat)
return
end
end
---------------save name bot-----------------------------
if redis:get(KING..'botts:namess'..msg.sender_user_id_) then
redis:del(KING..'botts:namess'..msg.sender_user_id_)
local NAME_BOT = msg.content_.text_:match("(.*)")
redis:set(KING..'Kingnams',NAME_BOT)
send(msg.chat_id_, msg.id_, 1, "☑┇ تم وضع اسم البوت ",1, 'html')
return false
end
------------------------save cam link-----------------------------------
if redis:get(KING.."bot:group:link" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) and (msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")) then
local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
local hash = "bot:group:link" .. msg.chat_id_
redis:set(KING..hash, glink)
send(msg.chat_id_, msg.id_, 1, "☑┇ تـــم  حفــــظ الرابط ", 1, "md")
redis:del(KING.."bot:group:link" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
--------------------------------------------------------------------------
if redis:get(KING.."gettextsec" .. msg.sender_user_id_) then
local clerktext = msg.content_.text_
redis:set(KING.."textsec", clerktext)
send(msg.chat_id_, msg.id_, 1, "☑┇  تم حفظ الكليشه ", 1, "md")
redis:del(KING.."gettextsec" .. msg.sender_user_id_)
end
---------------------save com rules-----------------------------------------------------------------------------
if redis:get(KING.."rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local rules = msg.content_.text_
redis:set(KING.."bot:rules" .. msg.chat_id_, rules)
send(msg.chat_id_, msg.id_, 1, "☑┇  تـــم حفــــظ القوانين ",  1, "md")
redis:del(KING.."rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
-----------ch join------------------------------------------------------
if redis:get(KING..'Kpch'..msg.sender_user_id_) then
redis:del(KING..'Kpch'..msg.sender_user_id_)
local url , res = https.request('https://api.telegram.org/bot'..KING_TOKEN..'/getChatAdministrators?chat_id='..msg.content_.text_..'')
local data = KPJS:decode(url)
if res == 400 then
if data.description == "Bad Request: supergroup members are unavailable" then --التحقق من البوت ادمن حسب الرابط اعلاه 
send(msg.chat_id_, msg.id_, 1, "👤┇ عذرا يجب عليك رفع\n📡┇ البوت ادمــــن في القنـاة اولا\n✓",  1, "md")
return false 
elseif data.description == "Bad Request: chat not found" then -- التحقق من المعرف (@kpchh)
send(msg.chat_id_, msg.id_, 1, "🚫┇ خطـأ هذا ليس معرف قناة",  1, "md")
return false
end end 
if not msg.content_.text_ then
send(msg.chat_id_, msg.id_, 1, "🚫┇ خطـأ هذا ليس معرف قناة",  1, "md")
return false
end
local CH_BOT = msg.content_.text_:match("(.*)")
redis:set(KING..'Kpch1',CH_BOT)
send(msg.chat_id_, msg.id_, 1, "📡┇ تم وضــــع معرف القناة ❗️\n☑┇ الان قم بتفعيل الاشتراك\n✓‏",1, 'html')
return false
end
---------------------rem cam broadcast--------------------------------------------------------------------
if redis:get(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then
send(msg.chat_id_, msg.id_, 1, "☑- تم الغاء الامر بنجاح ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
else
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local id = msg.id_
local msgs = {
[0] = id
}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه ", 1, "md")
redis:del(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
end
--------------------rem  cam broadcast2--------------------------------------------------------------------------
if redis:get(KING.."broadcast2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then
send(msg.chat_id_, msg.id_, 1, "☑- تم الغاء الامر بنجاح ", 1, "md")
redis:del(KING.."broadcast2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
else
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local msgs = {
[0] = id
}
for i = 1, #gpss do
send(gpss[i], 0, 1, text, 1, "md")
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم نشر رسالتك  في\n` " .. gps .. "` مجموعــه  ", 1, "md")
redis:del(KING.."broadcast2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end
end
if redis:get(KING.."bot:joinbylink:" .. msg.sender_user_id_) and (msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")) then
else
end
--------------------set cam sudo  ------------------------------------------
if redis:get(KING.."bot:King_dev" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
redis:del(KING.."bot:King_dev" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local King_dev = msg.content_.text_:match("(.*)")
redis:set(KING.."King_dev", King_dev)
send(msg.chat_id_, msg.id_, 1, "☑┇ تم وضــع كليشه المطور 🎗", 1, "md")
end
--------------------check_filter_words---------------------------------------------------------
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
check_filter_words(msg, text)
if msg.content_.text_:match("@") or msg.content_.text_:match("#") then
if string.len(msg.content_.text_) > senspost.textpostwithtag then
local post = msg.content_.text_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
elseif string.len(msg.content_.text_) > senspost.textpostwithtag then
local post = msg.content_.text_
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
if redis:sismember(KING.."Gp:Post" .. msg.chat_id_, post) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Duplicate] [Post]")
else
redis:sadd(KING.."Gp:Post" .. msg.chat_id_, post)
end
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
 }
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Post]")
end
end
if msg.forward_info_ and redis:get(KING.."bot:forward:mute" .. msg.chat_id_) and (msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost") then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Fwd] [Text]")
end
if (text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]")) and redis:get(KING.."bot:links:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Link] [Text]")
if redis:get(KING.."bot:strict" .. msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
end
if redis:get(KING.."bot:text:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Text]")
end
if msg.content_.text_:match("@") then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Text]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMention" and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Tag] [Text]")
end
if msg.content_.text_:match("#") then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Text]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityHashtag" and redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Hashtag] [Text]")
end
--«««««««««««««««««««««««« Welcome to Source KING »»»»»»»»»»»»»»»»»»»»»»»»»»»--
if msg.content_.text_:match("[Hh][Tt][Tt][Pp][Ss]:[//]") or msg.content_.text_:match("[Hh][Tt][Tt][Pp]:[//]") or msg.content_.text_:match("[Ww][Ww][Ww]") or msg.content_.text_:match(".[Cc][Oo]") or msg.content_.text_:match(".[Ii][Rr]") or msg.content_.text_:match(".[Oo][Rr][Gg]") then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Text]")
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Web] [Text]")
end
if msg.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if msg.content_.text_:match("[\216-\219][\121-\191]") and redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [arabic] [Text]")
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, "%c", "")
local _nl, real_digits = string.gsub(text, "%d", "")
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
local hash = "bot:sens:spam" .. msg.chat_id_
if not redis:get(KING..hash) then
sens = 400
else
sens = tonumber(redis:get(KING..hash))
end
if redis:get(KING.."bot:spam:mute" .. msg.chat_id_) and string.len(msg.content_.text_) > sens or ctrl_chars > sens or real_digits > sens then
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [Spam] ")
end
end
if (msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]")) and redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
print_del_msg("Deleted Because [Lock] [English] [Text]")
end
end
if msg.date_ < os.time() - 10 then
print("\01[" .. color.white[1] .. ";" .. color.magenta[2] .. "m>>> OLD MSG Pattern <<<\01[00m")
return false
end
if redis:get(KING.."bot:cmds" .. msg.chat_id_) and not is_momod(msg.sender_user_id_, msg.chat_id_) then
print("\01[" .. color.white[1] .. ";" .. color.magenta[2] .. "m>>> Lock Cmd Is Active In This Group <<<\01[00m")
return false
end
end
if is_owner(msg.sender_user_id_, msg.chat_id_) and not Kp_JoinCh(msg) or is_monshi(msg.sender_user_id_, msg.chat_id_) and not Kp_JoinCh(msg) or is_sudo(msg) and not Kp_JoinCh(msg) then
return false
end
-------------------------------leave groups----------------------------------------------------------------------
if is_sudo(msg) and idf:match("-100(%d+)") and (text:match('^'..(redis:get(KING..'Kingnams') or 'الملك')..' غادر$')) then
send(msg.chat_id_, msg.id_, 1, "✺┇ تم مغادره المجموعــه ♩",  1, "md")
redis:srem(KING.."bot:groups", msg.chat_id_)
chat_leave(msg.chat_id_, bot_id)
end
--------------------------------------------
if text == 'تفعيل رفع الادمن' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل خاصية رفع الادمن\n", 1, 'md')
redis:del(KING.."lock_addd"..msg.chat_id_)
end
if text == 'تعطيل رفع الادمن' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل خاصية رفع الادمن\n", 1, 'md')
redis:set(KING.."lock_addd"..msg.chat_id_, true)
end
-------------------------------------------------
if text == 'تفعيل رفع المميز' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل خاصية رفع المميز\n", 1, 'md')
redis:del(KING.."lock_adddvip"..msg.chat_id_)
end
if text == 'تعطيل رفع المميز' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل خاصية رفع المميز\n", 1, 'md')
redis:set(KING.."lock_adddvip"..msg.chat_id_, true)
end
--------------------------------------------------------------------
if is_owner(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^رفع ادمن بالتفاعل (%d+)$")  then
local uuuu = { string.match(text, "^(رفع ادمن بالتفاعل) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, "🔢┇ تم حفظ العدد *"..uuuu[2].."*\n👤┇ سيتم رفع المستخدم ادمن\n🤹‍♂️┇اذا اثبت تفاعله\n",1, 'md')
redis:set(KING.."KING_O" .. msg.chat_id_, uuuu[2])
end
local msgs = tonumber(redis:get(KING.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_))
local get_King = tonumber(redis:get(KING.."KING_O" .. msg.chat_id_)) 
if msgs == get_King and not redis:get(KING.."lock_addd"..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ هذا المستخدم اثبت تفاعله\n☑┇تم رفعه ادمن في المجموعهہ‌‏\n✓",  1, "md")
redis:sadd(KING..'bot:momod:'..msg.chat_id_, msg.sender_user_id_)
end
--------------------------------------------------------------------
if is_owner(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^رفع مميز بالتفاعل (%d+)$")  then
local uuuu = { string.match(text, "^(رفع مميز بالتفاعل) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, "☑┇ تم حفظ العدد *"..uuuu[2].."*\n👤┇ سيتم رفع المستخدم مميز\n🚫┇اذا اثبت تفاعله\n",1, 'md')
redis:set(KING.."KING_OO" .. msg.chat_id_, uuuu[2])
end
local msgs = tonumber(redis:get(KING.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_))
local get_King = tonumber(redis:get(KING.."KING_OO" .. msg.chat_id_)) 
if msgs == get_King and not redis:get(KING.."lock_adddvip"..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📌┇ هذا المستخدم اثبت تفاعله\n☑┇تم رفعه عضو مميز في المجموعهہ‌‏\n",  1, "md")
redis:sadd(KING..'bot:vipmem:'..msg.chat_id_, msg.sender_user_id_)
end
------------------------------ADD vipmems BY Reply------------------------------------------------------------------
if text:match('^رفع مميز عام$') and is_devzain(msg) and msg.reply_to_message_id_ ~= 0  then
function promote_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:vipmems:'
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ مرفوع مميز عام بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مميز عام\n', 1, 'md')
end end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
---------------------------ADD vipmems BY USER--------------------------------------------------------------------
if text:match('^رفع مميز عام @(%S+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(رفع مميز عام) @(%S+)$')}
function promote_by_username(extra, result, success)
local hash = 'bot:vipmems:'
if result.id_ then
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ مرفوع مميز عام بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه مميز عام\n', 1, 'md')
end end end
resolve_username(ap[2],promote_by_username)
end
---------------------------ADD vipmems BY ID--------------------------------------------------------------------
if text:match('^رفع مميز عام (%d+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(رفع مميز عام) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:vipmems:'
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ مرفوع مميز عام بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مميز عام\n', 1, 'md')
end end end
----------------------DEL vipmems BY REPLY-------------------------------------------------------------------------
if text:match('^تنزيل مميز عام$') and is_devzain(msg) and msg.reply_to_message_id_ ~= 0 then
function demote_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:vipmems:'
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مميز عام بالتأكيدً\n‏', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حذفه من مميزين العام \n', 1, 'md')
end end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
------------------------DEL vipmems BY USER-----------------------------------------------------------------------
if text:match('^تنزيل مميز عام @(%S+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(تنزيل مميز عام) @(%S+)$')}
function demote_by_username(extra, result, success)
local hash = 'bot:vipmems:'
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله مميز عام بالتأكيد\n‏', 1, 'md')
else
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله من مميزين العام \n', 1, 'md')
end end end
resolve_username(ap[2],demote_by_username)
end
--------------------------DEL vipmems BY ID---------------------------------------------------------------------
if text:match('^تنزيل مميز عام (%d+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(تنزيل مميز عام) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:vipmems:'
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مميز عتم بالتأكيد\n‏', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حذفه من مميزين العام \n', 1, 'md')
end end
end
-----------------------------promote_by_reply-------------------------------------------------------
if text:match('^رفع ادمن$') and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0  then
function promote_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:momod:'..msg.chat_id_
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه ادمن بالتأكيد \n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه ادمن \n', 1, 'md')
redis:sadd(KING..hash, result.sender_user_id_)
end
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
-----------------------------promote_by_username-------------------------------------------------
if text:match('^رفع ادمن @(%S+)$') and is_owner(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع ادمن) @(%S+)$')}
local hash = 'bot:momod:'..msg.chat_id_
function promote_by_username(extra, result, success)
if result.id_ then
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه ادمن بالتأكيد \n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه ادمن \n', 1, 'md')
redis:sadd(KING..hash, result.id_)
end
end 
end
resolve_username(ap[2],promote_by_username)
end
------------------------------promote_by_ID-----------------------------------------------------------------
if text:match('^رفع ادمن (%d+)$') and is_owner(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع ادمن) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:momod:'..msg.chat_id_
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه ادمن بالتأكيد \n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه ادمن \n', 1, 'md')
redis:sadd(KING..hash, ap[2])
end
end 
end
-------------------------------demote_by_reply----------------------------------------------------------------------
if text:match('^تنزيل ادمن$') and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
function demote_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:momod:'..msg.chat_id_
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله ادمن بالتأكيد \n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله ادمن \n', 1, 'md')
redis:srem(KING..hash, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
-------------------------demote_by_username----------------------------------------------------------------------
if text:match('^تنزيل ادمن @(%S+)$') and is_owner(msg.sender_user_id_, msg.chat_id_) then
local hash = 'bot:momod:'..msg.chat_id_
local ap = {string.match(text, '^(تنزيل ادمن) @(%S+)$')}
function demote_by_username(extra, result, success)
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله ادمن بالتأكيد \n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله ادمن \n', 1, 'md')
redis:srem(KING..hash, result.id_)
end
end
end
resolve_username(ap[2],demote_by_username)
end
-----------------------------demote_by_ID------------------------------------------------------------------
if text:match('^تنزيل ادمن (%d+)$') and is_owner(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(تنزيل ادمن) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:momod:'..msg.chat_id_
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله ادمن بالتأكيد \n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله ادمن \n', 1, 'md')
redis:srem(KING..hash, ap[2])
end
end
end
------------------------set vip BY REBLY-------------------------------------------------------------------------
if text:match('^رفع مميز$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0  then
function promote_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:vipmem:'..msg.chat_id_
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ مرفوع مميز بالتأكيد\n✓', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه عضو مميز\n', 1, 'md')
end end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
--------------------------set vip by user---------------------------------------------------------------------
if text:match('^رفع مميز @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع مميز) @(%S+)$')}
function promote_by_username(extra, result, success)
if result.id_ then
if redis:sismember(KING..'bot:vipmem:'..msg.chat_id_, result.id_) then
texts = '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ مرفوع مميز بالتأكيد\n✓'
else
redis:sadd(KING..'bot:vipmem:'..msg.chat_id_, result.id_)
texts = '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه عضو مميز\n✓'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
end
resolve_username(ap[2],promote_by_username)
end
------------------------------SET VIP BY ID-----------------------------------------------------------------
if text:match('^رفع مميز (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع مميز) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..'bot:vipmem:'..msg.chat_id_, ap[2]) then
texts = '👤┇ المستخدم » (['..UserKing..'])\n☑┇ مرفوع مميز بالتأكيد\n✓'
else
redis:sadd(KING..'bot:vipmem:'..msg.chat_id_, ap[2])
texts = '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه عضو مميز\n✓'
end end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
-----------------------------delvipmem_by_reply------------------------------------------------------------------
if text:match('^تنزيل مميز$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
function delvipmem_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:vipmem:'..msg.chat_id_
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مميز بالتأكيد \n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من المميزين \n', 1, 'md')
end
end 
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,delvipmem_by_reply)
end
----------------------delvipmem_by_username-------------------------------------------------------------------------
if text:match('^تنزيل مميز @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local hash = 'bot:vipmem:'..msg.chat_id_
local ap = {string.match(text, '^(تنزيل مميز) @(%S+)$')}
function delvipmem_by_username(extra, result, success)
if result.id_ then
if not redis:sismember(KING..hash,  result.id_) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله مميز بالتأكيد \n', 1, 'md')
else
redis:srem(KING..hash,  result.id_)
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله من المميزين \n', 1, 'md')
end
end 
end
resolve_username(ap[2],delvipmem_by_username)
end
-------------------------delvipmem_by_id----------------------------------------------------------------------
if text:match('^تنزيل مميز (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local hash = 'bot:vipmem:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:vipmem:'..msg.chat_id_
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مميز بالتأكيد \n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1,'👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من المميزين \n', 1, 'md')
end
end 
end
--------------------------ban_by_reply-------------------------------------------------------------
if text:match('^حظر$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:banned:'..msg.chat_id_
if is_momod(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ محضور بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حظره بنجاح \n', 1, 'md')
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^حظر @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(حظر) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:banned:'..msg.chat_id_
if result.id_ then
if is_momod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ محضور بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم حظره بنجاح \n', 1, 'md')
chat_kick(msg.chat_id_, result.id_)
end
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^حظر (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(حظر) (%d+)$')}
local hash = 'bot:banned:'..msg.chat_id_
if is_momod(ap[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ محضور بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حظره بنجاح \n', 1, 'md')
chat_kick(msg.chat_id_, ap[2])
end
end
end
end
--------------------------gban_by_reply---------------------------------------------------------------------
if text:match('^حظر عام$') and is_devzain(msg) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:gban:'
if is_momod(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ محضور عام بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حظره عام بنجاح \n', 1, 'md')
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^حظر عام @(%S+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(حظر عام) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:gban:'
if result.id_ then
if is_momod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ محضور عام بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم حظره عام بنجاح \n', 1, 'md')
chat_kick(msg.chat_id_, result.id_)
end
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^حظر عام (%d+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(حظر عام) (%d+)$')}
local hash = 'bot:gban:'
if is_momod(ap[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ محضور عام بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حظره عام بنجاح \n', 1, 'md')
chat_kick(msg.chat_id_, ap[2])
end
end
end
end
-----------------------ungban_by_reply------------------------------------------------------------------------
if text:match('^الغاء العام$') and is_devzain(msg) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:gban:'
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير محضور عام \n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء حظره عام  \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^الغاء العام @(%S+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(الغاء العام) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:gban:'
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ غير محضور عام \n', 1, 'md')
else
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم الغاء حظره عام  \n', 1, 'md')
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^الغاء العام (%d+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(الغاء العام) (%d+)$')}
local hash = 'bot:gban:'
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير محضور عام\n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء حظره عام\n', 1, 'md')
end
end
end
----------------------------unban_by_reply-------------------------------------------------------------------
if text:match('^الغاء حظر$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:banned:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير محظور بالتأكيد \n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء حظره   \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^الغاء حظر @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(الغاء حظر) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:banned:'..msg.chat_id_
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ غير محظور بالتأكيد \n', 1, 'md')
else
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم الغاء حظره   \n', 1, 'md')
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^الغاء حظر (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(الغاء حظر) (%d+)$')}
local hash = 'bot:banned:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير محظور بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء حظره \n', 1, 'md')
end
end
end
-----------------------mute_by_reply---------------------------------------------------------------------
if text:match('^كتم$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:muted:'..msg.chat_id_
if is_momod(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ مكتوم بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم كتمــــه بنجاح \n', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^كتم @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(كتم) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:muted:'..msg.chat_id_
if result.id_ then
if is_momod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ مكتوم بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم كتمــــه بنجاح \n', 1, 'md')
end
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^كتم (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(كتم) (%d+)$')}
local hash = 'bot:muted:'..msg.chat_id_
if is_momod(ap[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ مكتوم بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم كتمــــه بنجاح \n', 1, 'md')
end
end
end
end
---------------------------keed_by_reply--------------------------------------------------------------
if text:match('^تقييد$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:keed:'..msg.chat_id_
if is_momod(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (تقييد)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ مقيــد بالتأكيد\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..result.sender_user_id_..'')
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تقييده بنجاح \n', 1, 'md')
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^تقييد @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(تقييد) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:keed:'..msg.chat_id_
if result.id_ then
if is_momod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (تقييد)المدراء والادمنيه ❗️', 1, 'md')
else
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ مقيــد بالتأكيد\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..result.id_..'')
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تقييده بنجاح \n', 1, 'md')
end
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^تقييد (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(تقييد) (%d+)$')}
local hash = 'bot:keed:'..msg.chat_id_
if is_momod(ap[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (تقييد)المدراء والادمنيه ❗️', 1, 'md')
else
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ مقيــد بالتأكيد\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..ap[2]..'')
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تقييده بنجاح \n', 1, 'md')
end
end
end
end
----------------------unkeed_by_reply-----------------------------------------------------------------------------
if text:match('^فك التقييد$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:keed:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير مقيــد بالتأكيد\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..result.sender_user_id_..'&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True')
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء تقييده بنجاح \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^فك التقييد @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(فك التقييد) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:keed:'..msg.chat_id_
if result.id_ then
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ غير مقيــد بالتأكيد\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..result.id_..'&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True')
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم الغاء تقييده بنجاح \n', 1, 'md')
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^فك التقييد (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(فك التقييد) (%d+)$')}
local hash = 'bot:keed:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير مقيــد بالتأكيد\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..ap[2]..'&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True')
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء تقييده بنجاح \n', 1, 'md')
end
end
end
--------------------------unmute_by_reply-----------------------------------------------------------
if text:match('^الغاء كتم$') and is_momod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function ban_by_reply(extra, result, success)
local hash = 'bot:muted:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير مكتوم بالتأكيد \n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء كتمه   \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
--------------------------ban_by_username---------------------------------------------------------------------
if text:match('^الغاء كتم @(%S+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(الغاء كتم) @(%S+)$')}
function ban_by_username(extra, result, success)
local hash = 'bot:muted:'..msg.chat_id_
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ غير مكتوم بالتأكيد \n', 1, 'md')
else
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم الغاء كتمه   \n', 1, 'md')
end
end
end
resolve_username(ap[2],ban_by_username)
end
------------------------ban_by_id-----------------------------------------------------------------------
if text:match('^الغاء كتم (%d+)$') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(الغاء كتم) (%d+)$')}
local hash = 'bot:muted:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ غير مكتوم بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم الغاء كتمه \n', 1, 'md')
end
end
end
---------------------------setowner_by_reply----------------------------------------------------------------
if text:match('^رفع مدير$') and is_monshi(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function setowner_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:owners:'..msg.chat_id_
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مدير بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مدير \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setowner_by_reply)
end
------------------------setowner_by_username-----------------------------------------------------------------------
if text:match('^رفع مدير @(%S+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع مدير) @(%S+)$')}
function setowner_by_username(extra, result, success)
local hash = 'bot:owners:'..msg.chat_id_
if result.id_ then
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه مدير بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه مدير \n', 1, 'md')
end
end
end
resolve_username(ap[2],setowner_by_username)
end
-------------------------setowner_by_ID----------------------------------------------------------------------
if text:match('^رفع مدير (%d+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع مدير) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:owners:'..msg.chat_id_
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مدير بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مدير \n', 1, 'md')
end
end
end
------------------------deowner_by_reply-----------------------------------------------------------------------
if text:match('^تنزيل مدير$') and is_monshi(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function deowner_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:owners:'..msg.chat_id_
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مدير بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من الاداره \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
end
--------------------------remowner_by_username---------------------------------------------------------------------
if text:match('^تنزيل مدير @(%S+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local hash = 'bot:owners:'..msg.chat_id_
local ap = {string.match(text, '^(تنزيل مدير) @(%S+)$')}
function remowner_by_username(extra, result, success)
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله مدير بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله من الاداره \n', 1, 'md')
end
end
end
resolve_username(ap[2],remowner_by_username)
end
----------------------remowner_by_ID-------------------------------------------------------------------------
if text:match('^تنزيل مدير (%d+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local hash = 'bot:owners:'..msg.chat_id_
local ap = {string.match(text, '^(تنزيل مدير) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مدير بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من الاداره \n', 1, 'md')
end
end
end
----------------------setmonshi_by_reply-------------------------------------------------------------------------
if text:match('^رفع منشئ$') and is_sudo(msg) and msg.reply_to_message_id_ then
function setmonshi_by_reply(extra, result, success)
local hash = 'bot:monshis:'..msg.chat_id_
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه منشئ بالتأكيد \n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه منشئ المجموعه \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setmonshi_by_reply)
end
-----------------------setmonshi_by_username--------------------------------------------------------------------
if text:match('^رفع منشئ @(%S+)$') and is_sudo(msg) then
local ap = {string.match(text, '^(رفع منشئ) @(%S+)$')}
function setmonshi_by_username(extra, result, success)
if result.id_ then
local hash = 'bot:monshis:'..msg.chat_id_
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه منشئ بالتأكيد \n', 1, 'md')
else
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه منشئ المجموعه \n', 1, 'md')
end
end
end
resolve_username(ap[2],setmonshi_by_username)
end
---------------------setmonshi_by_ID--------------------------------------------------------------------------
if text:match('^رفع منشئ (%d+)$') and is_sudo(msg) then
local ap = {string.match(text, '^(رفع منشئ) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:monshis:'..msg.chat_id_
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه منشئ بالتأكيد \n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه منشئ المجموعه \n', 1, 'md')
end
end
end
-------------demonshi_by_reply----------------------------------------------------------------------------------
if text:match('^تنزيل منشئ$') and is_sudo(msg) and msg.reply_to_message_id_ then
function demonshi_by_reply(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local hash = 'bot:monshis:'..msg.chat_id_
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله منشئ بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من المنشئين \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demonshi_by_reply)
end
----------------demonshi_by_username-------------------------------------------------------------------------------
if text:match('^تنزيل منشئ @(%S+)$') and is_sudo(msg) then
local hash = 'bot:monshis:'..msg.chat_id_
local ap = {string.match(text, '^(تنزيل منشئ) @(%S+)$')}
function demonshi_by_username(extra, result, success)
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله منشئ بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله من المنشئين \n', 1, 'md')
end
end
end
resolve_username(ap[2],demonshi_by_username)
end
-----------------demonshi_by_ID------------------------------------------------------------------------------
if text:match('^تنزيل منشئ (%d+)$') and is_sudo(msg) then
local ap = {string.match(text, '^(تنزيل منشئ) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
local hash = 'bot:monshis:'..msg.chat_id_
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله منشئ بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من المنشئين \n', 1, 'md')
end
end
end
-------------ADD ADMIN FROM BOT----------------------------------------------------------------------------------
if text:match('^اضف ادمن$') and is_sudo(msg) and msg.reply_to_message_id_ then
function addadmin_by_reply(extra, result, success)
local hash = 'bot:admins:'
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم اضافه ادمن في البوت \n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم اضافه ادمن في البوت \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,addadmin_by_reply)
end
-------------ADD ADMIN FROM BOT----------------------------------------------------------------------------------
if text:match('^اضف ادمن @(%S+)$') and is_sudo(msg) then
local ap = {string.match(text, '^(اضف ادمن) @(%S+)$')}
function addadmin_by_username(extra, result, success)
if result.id_ then
redis:sadd(KING..'bot:admins:', result.id_)
texts = '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم اضافه ادمن في البوت \n'
else
texts = '☑┇ لا يوجد عضو بهذا المعرف '
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],addadmin_by_username)
end
-------------ADD ADMIN FROM BOT----------------------------------------------------------------------------------
if text:match('^اضف ادمن (%d+)$') and is_sudo(msg) then
local ap = {string.match(text, '^(اضف ادمن) (%d+)$')}
local hash = 'bot:admins:'
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم اضافه ادمن في البوت \n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم اضافه ادمن في البوت \n', 1, 'md')
end
end
end
-------------DEL ADMIN FROM BOT----------------------------------------------------------------------------------
if text:match('^حذف ادمن$') and is_sudo(msg) and msg.reply_to_message_id_ then
function deadmin_by_reply(extra, result, success)
local hash = 'bot:admins:'
local user_info_ = redis:get(KING..'user:Name' .. result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حذفه من ادمنيه البوت \n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حذفه من ادمنيه البوت \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deadmin_by_reply)
end
-------------DEL ADMIN FROM BOT----------------------------------------------------------------------------------
if text:match('^حذف ادمن @(%S+)$') and is_sudo(msg) then
local hash = 'bot:admins:'
local ap = {string.match(text, '^(حذف ادمن) @(%S+)$')}
function remadmin_by_username(extra, result, success)
if result.id_ then
redis:srem(KING..hash, result.id_)
texts = '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم حذفه من ادمنيه البوت \n'
else
texts = '☑┇ لا يوجد عضو بهذا المعرف '
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(ap[2],remadmin_by_username)
end
-------------DEL ADMIN FROM BOT----------------------------------------------------------------------------------
if text:match('^حذف ادمن (%d+)$') and is_sudo(msg) then
local ap = {string.match(text, '^(حذف ادمن) (%d+)$')}
local hash = 'bot:admins:'
local user_info_ = redis:get(KING..'user:Name' .. ap[2])
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حذفه من ادمنيه البوت \n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم حذفه من ادمنيه البوت \n', 1, 'md')
end
end
end
-------------kick_reply----------------------------------------------------------------------------------
if text:match('^طرد$') and msg.reply_to_message_id_ and is_momod(msg.sender_user_id_, msg.chat_id_) then
function kick_reply(extra, result, success)
if is_momod(result.sender_user_id_, result.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذراً لا استطيع (حظر،طرد،كتم)المدراء والادمنيه ❗️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ('..result.sender_user_id_..')\n🚫┇ تم طره من المجموعه \n', 1, 'html')
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
end
--------------DEL MSG BOT --------------------------------------------------------------------------------------
if text:match('^مسح رسائل البوت$') and is_sudo(msg) then
redis:del(KING..'bot:allmsgs')
send(msg.chat_id_, msg.id_, 1, '☑┇ تم حذف رسائل البوت في المجموعهہ‌‏', 1, 'md')
end
-------------ADD KING_SUDO----------------------------------------------------------------------------------
if is_devzain(msg) and text:match('^رفع مطور$') and msg.reply_to_message_id_ then
function promoteSudo_by_reply(extra, result, success)
local hash = 'Bot:KpSudos'
local user_info_ = redis:get(KING..'user:Name' ..result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مطور بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مطور في البوت \n', 1, 'md')
table.insert(_config.Sudo_Users, tonumber(result.sender_user_id_))
save_on_config()
load_config()
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_, promoteSudo_by_reply)
end
-------------ADD KING_SUDO----------------------------------------------------------------------------------
if text:match('^رفع مطور @(%S+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(رفع مطور) @(%S+)$')}
function promoteSudo_by_username(extra, result, success)
local hash = 'Bot:KpSudos'
if result.id_ then
if redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه مطور بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n☑┇ تم رفعه مطور في البوت \n', 1, 'md')
table.insert(_config.Sudo_Users, tonumber(result.id_))
save_on_config()
load_config()
end
end 
end
resolve_username(ap[2],promoteSudo_by_username)
end
-------------ADD KING_SUDO----------------------------------------------------------------------------------
if text:match('^رفع مطور (%d+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(رفع مطور) (%d+)$')}
local hash = 'Bot:KpSudos'
local user_info_ = redis:get(KING..'user:Name' ..ap[2])
local UserKing = user_info_
if user_info_ then
if redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مطور بالتأكيد\n', 1, 'md')
else
redis:sadd(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفعه مطور في البوت \n', 1, 'md')
table.insert(_config.Sudo_Users, tonumber(ap[2]))
save_on_config()
load_config()
end
end
end
--------------REM KING_SUDO---------------------------------------------------------------------------------
if is_devzain(msg) and text:match('^تنزيل مطور$') and msg.reply_to_message_id_ then
function demoteSudo_by_reply(extra, result, success)
local hash = 'Bot:KpSudos'
local user_info_ = redis:get(KING..'user:Name' ..result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مطور بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من المطورين \n', 1, 'md')
table.remove(_config.Sudo_Users, getindex(_config.Sudo_Users, tonumber(result.sender_user_id_)))
save_on_config()
load_config()
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_, demoteSudo_by_reply)
end
--------------REM KING_SUDO---------------------------------------------------------------------------------
if text:match('^تنزيل مطور @(%S+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(تنزيل مطور) @(%S+)$')}
function demoteSudo_by_username(extra, result, success)
local hash = 'Bot:KpSudos'
if result.id_ then
if not redis:sismember(KING..hash, result.id_) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله مطور بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيله من المطورين \n', 1, 'md')
table.remove(_config.Sudo_Users, getindex(_config.Sudo_Users, tonumber(result.id_)))
save_on_config()
load_config()
end
end
end
resolve_username(ap[2],demoteSudo_by_username)
end
--------------REM KING_SUDO---------------------------------------------------------------------------------
if text:match('^تنزيل مطور (%d+)$') and is_devzain(msg) then
local ap = {string.match(text, '^(تنزيل مطور) (%d+)$')}
local hash = 'Bot:KpSudos'
local zaeony = tonumber(ap[2])
local user_info_ = redis:get(KING..'user:Name' ..ap[2])
local UserKing = user_info_
if user_info_ then
if not redis:sismember(KING..hash, ap[2]) then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله مطور بالتأكيد\n', 1, 'md')
else
redis:srem(KING..hash, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيله من المطورين \n', 1, 'md')
table.remove(_config.Sudo_Users, getindex(_config.Sudo_Users, zaeony))
save_on_config()
load_config()
end
end
end
-------------------------------------------------------------
if text:match('^تنزيل الكل$') and is_monshi(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function delallrtb(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' ..result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local k1 = not redis:sismember(KING..'bot:owners:'..msg.chat_id_, result.sender_user_id_)
local k2 = not redis:sismember(KING..'bot:momod:'..msg.chat_id_, result.sender_user_id_)
local k3 = not redis:sismember(KING..'bot:vipmem:'..msg.chat_id_, result.sender_user_id_)
if k1 and k2 and k3 then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ لا توجد لديه رتبه\n', 1, 'md')
else
redis:srem(KING..'bot:owners:'..msg.chat_id_, result.sender_user_id_)
redis:srem(KING..'bot:momod:'..msg.chat_id_, result.sender_user_id_)
redis:srem(KING..'bot:vipmem:'..msg.chat_id_, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيل الكل عنه \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,delallrtb)
end
------------------------------------------------------------------------
if text:match('^تنزيل الكل @(%S+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(تنزيل الكل) @(%S+)$')}
function delallrtb(extra, result, success)
if result.id_ then
local k1 = not redis:sismember(KING..'bot:owners:'..msg.chat_id_, result.id_)
local k2 = not redis:sismember(KING..'bot:momod:'..msg.chat_id_, result.id_)
local k3 = not redis:sismember(KING..'bot:vipmem:'..msg.chat_id_, result.id_)
if k1 and k2 and k3 then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ لا توجد لديه رتبه\n', 1, 'md')
else
redis:srem(KING..'bot:owners:'..msg.chat_id_, result.id_)
redis:srem(KING..'bot:momod:'..msg.chat_id_, result.id_)
redis:srem(KING..'bot:vipmem:'..msg.chat_id_, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم تنزيل الكل عنه \n', 1, 'md')
end
end
end
resolve_username(ap[2],delallrtb)
end
--------------------------------------------------------------------
if text:match('^تنزيل الكل (%d+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(تنزيل الكل) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' ..ap[2])
local UserKing = user_info_
if user_info_ then
local k1 = not redis:sismember(KING..'bot:owners:'..msg.chat_id_, ap[2])
local k2 = not redis:sismember(KING..'bot:momod:'..msg.chat_id_, ap[2])
local k3 = not redis:sismember(KING..'bot:vipmem:'..msg.chat_id_, ap[2])
if k1 and k2 and k3 then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ لا توجد لديه رتبه\n', 1, 'md')
else
redis:srem(KING..'bot:owners:'..msg.chat_id_, ap[2])
redis:srem(KING..'bot:momod:'..msg.chat_id_, ap[2])
redis:srem(KING..'bot:vipmem:'..msg.chat_id_, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم تنزيل الكل عنه \n', 1, 'md')
end
end
end
------------------------------------------------------------------
if text:match('^رفع القيود$') and is_monshi(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
function delallrtb(extra, result, success)
local user_info_ = redis:get(KING..'user:Name' ..result.sender_user_id_)
local UserKing = user_info_
if user_info_ then
local k1 = not redis:sismember(KING..'bot:keed:'..msg.chat_id_, result.sender_user_id_)
local k2 = not redis:sismember(KING..'bot:muted:'..msg.chat_id_, result.sender_user_id_)
local k3 = not redis:sismember(KING..'bot:banned:'..msg.chat_id_, result.sender_user_id_)
if k1 and k2 and k3 then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ لا توجد لديه قيـــــــود\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..result.sender_user_id_..'&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True')
redis:srem(KING..'bot:keed:'..msg.chat_id_, result.sender_user_id_)
redis:srem(KING..'bot:muted:'..msg.chat_id_, result.sender_user_id_)
redis:srem(KING..'bot:banned:'..msg.chat_id_, result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ تم رفع الالقيود عنه \n', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,delallrtb)
end
------------------------------------------------------------------------
if text:match('^رفع القيود @(%S+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع القيود) @(%S+)$')}
function delallrtb(extra, result, success)
if result.id_ then
local k1 = not redis:sismember(KING..'bot:keed:'..msg.chat_id_, result.id_)
local k2 = not redis:sismember(KING..'bot:muted:'..msg.chat_id_, result.id_)
local k3 = not redis:sismember(KING..'bot:banned:'..msg.chat_id_, result.id_)
if k1 and k2 and k3 then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ لا توجد لديه قيـــــــود\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..result.id_..'&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True')
redis:srem(KING..'bot:keed:'..msg.chat_id_, result.id_)
redis:srem(KING..'bot:muted:'..msg.chat_id_, result.id_)
redis:srem(KING..'bot:banned:'..msg.chat_id_, result.id_)
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » ([@'..ap[2]..'])\n🚫┇ تم رفع الالقيود عنه \n', 1, 'md')
end
end
end
resolve_username(ap[2],delallrtb)
end
--------------------------------------------------------------------
if text:match('^رفع القيود (%d+)$') and is_monshi(msg.sender_user_id_, msg.chat_id_) then
local ap = {string.match(text, '^(رفع القيود) (%d+)$')}
local user_info_ = redis:get(KING..'user:Name' ..ap[2])
local UserKing = user_info_
if user_info_ then
local k1 = not redis:sismember(KING..'bot:keed:'..msg.chat_id_, ap[2])
local k2 = not redis:sismember(KING..'bot:muted:'..msg.chat_id_, ap[2])
local k3 = not redis:sismember(KING..'bot:banned:'..msg.chat_id_, ap[2])
if k1 and k2 and k3 then
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n🚫┇ لا توجد لديه قيـــــــود\n', 1, 'md')
else
HTTPS.request('https://api.telegram.org/bot'..KING_TOKEN..'/restrictChatMember?chat_id=' ..msg.chat_id_.. '&user_id=' ..ap[2]..'&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True')
redis:srem(KING..'bot:keed:'..msg.chat_id_, ap[2])
redis:srem(KING..'bot:muted:'..msg.chat_id_, ap[2])
redis:srem(KING..'bot:banned:'..msg.chat_id_, ap[2])
send(msg.chat_id_, msg.id_, 1, '👤┇ المستخدم » (['..UserKing..'])\n☑┇ تم رفع الالقيود عنه \n', 1, 'md')
end
end
end
----------------id gP-----------------------------------------
if text:match("^ايدي المجموعه$") and idf:match("-100(%d+)") then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🎫┇ ايدي المجموعه : \n (`" .. msg.chat_id_ .. "`)", 1, "html")
end end
--------------del msgs-----------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^مسح$") or text:match("^حذف$") and msg.reply_to_message_id_ ~= 0) then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local id = msg.id_
local msgs = {
[0] = id
}
delete_msg(msg.chat_id_, {
[0] = msg.reply_to_message_id_
})
delete_msg(msg.chat_id_, msgs)
end end
---------------------play--------------
if text == 'سمايلات' and redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
redis:del('KING:'..bot_id..'l:ids'..msg.chat_id_)
katu = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','💥','🥐','🍞','💥','💥','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','💥','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌','📍','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = katu[math.random(#katu)]
redis:set('KING:'..bot_id..'klmos'..msg.chat_id_,name)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'💥','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','💥')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'💥','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🎲','🎲')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🎟','🎟')
name = string.gsub(name,'🎫','🎫')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔','⚔')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'📌','📌')
name = string.gsub(name,'📍','📍')
name = string.gsub(name,'📓','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📂','🗂')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
zain = '🚀┇اسرع واحد يدز » {`'..name..'`}'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end
if text == ''..(redis:get('KING:'..bot_id..'klmos'..msg.chat_id_) or 'لفاتع')..'' and not redis:get('KING:'..bot_id..'l:ids'..msg.chat_id_) then
if not redis:get('KING:'..bot_id..'l:ids'..msg.chat_id_) then 
zain = '*🏆| مبروك لقد فزت ,\n👨🏽‍💻| لعب مره اخره ارسل سمايلات ,*'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    

end
redis:set('KING:'..bot_id..'l:ids'..msg.chat_id_,true)
end 
if text == 'الاسرع' and redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
redis:del('KING:'..bot_id..'l:id'..msg.chat_id_)
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
redis:set('KING:'..bot_id..'klmo'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
zain = '🚀┇اسرع واحد يرتبها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end
if text == ''..(redis:get('KING:'..bot_id..'klmo'..msg.chat_id_) or 'لفاتع')..'' and not redis:get('KING:'..bot_id..'l:id'..msg.chat_id_) then
if not redis:get('KING:'..bot_id..'l:id'..msg.chat_id_) then 
zain = '*💥| مبروك لقد فزت ,\n👨🏽‍💥| لعب مره اخره ارسل الاسرع ,*'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1) 
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    

end
redis:set('KING:'..bot_id..'l:id'..msg.chat_id_,true)
end 
if text == 'حزوره' and redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
redis:del('KING:'..bot_id..'l:id1'..msg.chat_id_)
katu = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = katu[math.random(#katu)]
redis:set('KING:'..bot_id..'klmoa'..msg.chat_id_,name)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
zain = '🕐┇اسرع واحد يحلها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end
if text == ''..(redis:get('KING:'..bot_id..'klmoa'..msg.chat_id_) or 'لفاتع')..'' and not redis:get('KING:'..bot_id..'l:id1'..msg.chat_id_) then
if not redis:get('KING:'..bot_id..'l:id1'..msg.chat_id_) then 
zain = '*🏆| مبروك لقد فزت ,\n👨🏽‍💻| لعب مره اخره ارسل حزوره ,*'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
redis:set('KING:'..bot_id..'l:id1'..msg.chat_id_,true)
end 
if text == 'معاني' and redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
redis:del('KING:'..bot_id..'l:id2'..msg.chat_id_)
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
redis:set('KING:'..bot_id..'means'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
zain = '🔵┇اول واحد يكتب معنئ السمايل » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end
if text == ''..(redis:get('KING:'..bot_id..'means'..msg.chat_id_) or 'لفاتع')..'' and not redis:get('KING:'..bot_id..'l:id2'..msg.chat_id_) then
if not redis:get('KING:'..bot_id..'l:id2'..msg.chat_id_) then 
zain = '*🏆| مبروك لقد فزت ,\n👨🏽‍💻| لعب مره اخره ارسل معاني ,*'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
redis:set('KING:'..bot_id..'l:id2'..msg.chat_id_,true)
end 
if text == 'العكس' and redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
redis:del('KING:'..bot_id..'l:id3'..msg.chat_id_)
katu = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = katu[math.random(#katu)]
redis:set('KING:'..bot_id..'aks'..msg.chat_id_,name)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'موحلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'عدل','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
zain = '✖️┇عكس كلمه » {'..name..'} ⚜️'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end
if text == ''..(redis:get('KING:'..bot_id..'aks'..msg.chat_id_) or 'لفاتع')..'' and not redis:get('KING:'..bot_id..'l:id3'..msg.chat_id_) then
if not redis:get('KING:'..bot_id..'l:id3'..msg.chat_id_) then 
zain = '*🏆| مبروك لقد فزت ,\n👨🏽‍💻| لعب مره اخره ارسل العكس ,*'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
redis:set('KING:'..bot_id..'l:id3'..msg.chat_id_,true)
end 

if redis:get('KING:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
zain = "*📬┇ عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 } *\n"
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
return false  end 
local GETNUM = redis:get('KING:'..bot_id.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del('KING:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del('KING:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 5)  
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 5)    
zain = '*🔖┇ مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸┇ تم اضافة { 5 } من النقاط *\n'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:incrby('KING:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(redis:get('KING:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
redis:del('KING:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del('KING:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
zain = '\n*📮┇ اوبس لقد خسرت في الالعاب \n💥┇ حظآ اوفر في المره القادمه \n🔰┇ كان الرقم الذي تم تخمينه { '..GETNUM..' }\n*'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
else
zain = '\n*📛┇ اوبس تخمينك غلط \n📌┇ ارسل رقم تخمنه مره اخره \n*'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end
end
end
end

if redis:get('KING:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
zain = "*📬┇ عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخره*\n"
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
return false  end 
local GETNUM = redis:get('KING:'..bot_id.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del('KING:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
zain = '*📮┇ مبروك فزت وطلعت المحيبس بل ايد رقم { '..NUM..' }\n🎊┇ لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل *'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 3)  
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 3)    
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:del('KING:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
zain = '\n*📮┇ للاسف لقد خسرت \n📬┇ المحيبس بل ايد رقم { '..GETNUM..' }\n💥┇ حاول مره اخرى للعثور على المحيبس *'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end
end
end
if text == redis:get('KING:'..bot_id..':Set_alii:'..msg.chat_id_) then -- // المختلف
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
redis:del('KING:'..bot_id..':Set_alii:'..msg.chat_id_)
zain = '*  🎁  احسنت اجابتك صحيحه   \n* '
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end

if text == redis:get('KING:'..bot_id..':Set_Amthlh:'..msg.chat_id_) then -- // امثله
redis:incrby('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
redis:incrby('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
redis:del('KING:'..bot_id..':Set_Amthlh:'..msg.chat_id_)
zain = '*  🎁  احسنت اجابتك صحيحه   \n* '
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
end

if text == 'المختلف' and redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
redis:set('KING:'..bot_id..':Set_alii:'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑💥')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍💥')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻💥‍💻💥‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂','🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙍‍♂🙎‍♂💥‍♂🙎‍♂')
name = string.gsub(name,'🧖‍♂','🧖‍♀🧖‍♀🧖‍♀🧖‍♀💥‍♀🧖‍♂🧖‍♀🧖‍♀🧖‍♀🧖‍♀')
name = string.gsub(name,'👬','👭👭👭👭👭👬??👭👭')
name = string.gsub(name,'👨‍💥‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍💥👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
TEST = '  اول واحد يطلع المختلف » {* '..name..' * } ' 
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
end

if text == 'امثله' and redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
katu = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = katu[math.random(#katu)]
redis:set('KING:'..bot_id..':Set_Amthlh:'..msg.chat_id_,name)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يكول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
TEST = 'اكمل المثل التالي {* '..name..' *}'
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
end
if text == 'محيبس' or text == 'بات' then
if redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then   
Num = math.random(1,6)
redis:set('KING:'..bot_id.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
📮┇ اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
🎁┇ الفائز يحصل على { 3 } من النقاط *
]]
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
redis:setex('KING:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
if text == 'خمن' or text == 'تخمين' then   
if redis:get('KING:'..bot_id..'lock_geam'..msg.chat_id_) then
Num = math.random(1,20)
redis:set('KING:'..bot_id.."GAMES:NUM"..msg.chat_id_,Num) 
TEST = '*\n💥┇ اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'⚠┇ ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'🔖┇ سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ \n💥*'
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
redis:setex('KING:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end



if text =='نقاطي' then 
if tonumber((redis:get('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
zain = '*🤹‍♂️┇ ليس لديك نقاط \n📬┇ للحصول على نقاط ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
else
zain = '*🤹‍♂️┇ عدد نقاطك الحاليه  ('..(redis:get('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_))..')*'
zain1 = '*🤹‍♂️┇ مجموع نقاطك  ('..(redis:get('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_))..')*'

send(msg.chat_id_, msg.id_, 1,''..zain..'\n'..zain1..'', 1, 'md')
end
end
if text:match('^رسائل النقاط (%d+)$') and (is_creator(msg) or is_creatorbasic(msg)) then
local kara = {string.match(text, "^(رسائل النقاط) (%d+)$")}
if tonumber(kara[2]) > 500 or tonumber(kara[2]) < 1 then
msgg = '🤹‍♂️┇لا تستطيع وضع اكثر من 500 رساله ❌ '
send(msg.chat_id_, msg.id_, 1, msgg, 1, 'html')
else
redis:set('KING:'..bot_id..'gamepoint' .. msg.chat_id_, kara[2] or 50)
send(msg.chat_id_, msg.id_, 1,'🤹‍♂️┇تم اضافه عدد الرسائل المطلوب ✅  ', 1, 'md')
end
end
if text == 'بيع نقاطي' then
if tonumber((redis:get('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
zain = '*💠┇ ليس لديك نقاط \n📬┇ للحصول على نقاط ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
else
zain = (redis:get('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) * tonumber(redis:get('KING:'..bot_id..'gamepoint' .. msg.chat_id_)or 50))
redis:incrby('KING:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_,zain)  
redis:del('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_)
zain = tonumber((redis:get('KING:'..bot_id..'gamepoint' .. msg.chat_id_) or 50))
send(msg.chat_id_, msg.id_, 1,'🤹‍♂️┇ تم بيع نقاطك كل نقطه تساوي '..zain..' رساله', 'md')
end
end
if text == 'حذف نقاطي' then
redis:del('KING:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_)  
redis:del('KING:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_)  
send(msg.chat_id_, msg.id_, 1, "تم حذف جميع نقاطك", 1, "md") 
end
if text == 'حذف رسائلي' then
redis:del('KING:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_)
redis:del('KING:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑 ┇ تم حذف رسائلك  ", 1, "md") 
end
---------------------------------------------------------------------------
if text == 'تفعيل الالعاب' and is_momod(msg.sender_user_id_, msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,[[*
🧙🏻‍♀️| تم تفعيل الالعاب بنجاح  ✓
📬| ارسل الالعاب لعرض قائمة الالعاب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
Ch : ➥ 📡 *[@KING]
]], 1, 'md')
redis:set('KING:'..bot_id..'lock_geam'..msg.chat_id_,true)  
end
if text == 'الالعاب' and is_momod(msg.sender_user_id_, msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,[[*
📬| قائمه الالعاب لديك ↓
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
🌀|↫ ❨ترتيب❩ لترتيب الكلمات
⛹️‍♂️|↫ ❨الاسرع❩ لاسرع اجابه
🎰|↫ ❨حزوره❩ لتحزر الجمله
🎯|↫ ❨معاني❩ لمعنا السمايلات
✖️|↫ ❨العكس❩ عكس الكلام 
💍|↫ ❨بات❩ لعبه البات او محيبس
🎨|↫ ❨خمن❩ تخمين الكلمه
💭|↫ ❨امثله❩ لعبه الامثله 
🗽|↫ ❨المختلف❩ لعبه المختلفات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
Ch : ➥ 📡 *[@KING]
]], 1, 'md')
end

if text == 'تعطيل الالعاب' and is_momod(msg.sender_user_id_, msg.chat_id_) then
zain = '🚫┇ تم تعطيل الالعاب  ' 
send(msg.chat_id_, msg.id_, 1,zain, 1, 'md')
redis:del('KING:'..bot_id..'lock_geam'..msg.chat_id_) 
end
------------------------------------------------------------------------------
if text == 'تفعيل الملصقات' and is_momod(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل ردود الملصقات\n ✓ ", 1, 'md')
redis:del(KING.."lock_STCK"..msg.chat_id_)
end
if text == 'تعطيل الملصقات' and is_momod(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل ردود الملصقات\n ✓ ", 1, 'md')
redis:set(KING.."lock_STCK"..msg.chat_id_, true)
end 
-------------------welcome on---------------------------------------------------------
if text:match("^تفعيل الترحيب$") and is_momod(msg.sender_user_id_, msg.chat_id_) then
redis:set(KING..'status:welcome:'..msg.chat_id_,'enable')
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل الترحيب\n ✓ ", 1, 'md')
return false 
end
-------------------of welcome-------------------------------------------------------------
if text:match("^تعطيل الترحيب$") and is_momod(msg.sender_user_id_, msg.chat_id_) then
redis:set(KING..'status:welcome:'..msg.chat_id_,'disable')
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل الترحيب\n ✓ ", 1, 'md')
return false 
end
---------------------set kick me-----------------------------------
if text == 'تفعيل اطردني' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل امر اطردني\n ✓ ", 1, 'md')
redis:set(KING.."lock_kickme"..msg.chat_id_, true)
return false 
end
if text == 'تعطيل اطردني' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل امر اطردني\n ✓ ", 1, 'md')
redis:del(KING.."lock_kickme"..msg.chat_id_)
return false 
end
-------------------add ch --------------------------
if text == "تعين قناة الاشتراك" or text == "تغيير قناة الاشتراك" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
redis:setex(KING..'Kpch'..msg.sender_user_id_,300,true)
send(msg.chat_id_, msg.id_, 1, "📡┇ ارسل لـي معرف قناتك 🔘\n",1, 'html')
end end

-----------------ADD Join------------------------------
if text == 'تفعيل الاشتراك الاجباري' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
if not redis:get(KING..'Kpch1') then
send(msg.chat_id_, msg.id_, 1, '™️┇ لم يتم وضع القناة\n🔘┇ لتعين  القناة ارسل .....\n☑┇ `تعين قناة الاشتراك `\n➖', 1, 'md')
return false 
end
if redis:get(KING..'Kpch1') then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تفعيل الاشتراك الاجباري\n ✓ ", 1, 'md')
redis:set(KING.."Kpjoin1", true)
return false end end end
if text == 'تعطيل الاشتراك الاجباري' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل الاشتراك الاجباري\n ✓ ", 1, 'md')
redis:del(KING.."Kpjoin1")
return false 
end end
------------------ADD REPLY IN GP------------------------------------------
if text == 'تفعيل الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل الردود\n ✓ ", 1, 'md')
redis:del(KING.."lock_reeeep"..msg.chat_id_)
end
if text == 'تعطيل الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل الردود\n ✓ ", 1, 'md')
redis:set(KING.."lock_reeeep"..msg.chat_id_, true)
end
---------------ADD PIN----------------------------------------------------
if text == 'تفعيل التثبيت' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل التثبيت\n ✓ ", 1, 'md')
redis:set(KING.."lock_pinn"..msg.chat_id_, true)
return false
end
if text == 'تعطيل التثبيت' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل التثبيت\n ✓ ", 1, 'md')
redis:del(KING.."lock_pinn"..msg.chat_id_)
return false
end
--------------REM DEL MSG--------------------------------------------
if text == 'تعطيل مسح الرسائل' or text == 'تعطيل تنضيف الرسائل' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل مسح الرسائل\n ✓ ", 1, 'md')
redis:del(KING.."dellmssg"..msg.chat_id_)
end
----------------ADD DEL MSG------------------------------------------------------------
if text == 'تفعيل مسح الرسائل' or text == 'تفعيل تنضيف الرسائل' and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل مسح الرسائل\n ✓ ", 1, 'md')
redis:set(KING.."dellmssg"..msg.chat_id_, true)
end
----------add - rem bot free----------------------------------
if text == 'تفعيل البوت خدمي' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل البوت خدمي\n ✓ ", 1, 'md')
redis:set(KING.."bot:free", true)
end end
if text == 'تعطيل البوت خدمي' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تعطيل البوت خدمي\n ✓ ", 1, 'md')
redis:del(KING.."bot:free")
end end


if text and text == "تاك للكل" and is_momod(msg.sender_user_id_, msg.chat_id_) then
local text = "👥 ┇ قائمه الاعضاء   ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
function tag_all(t1, t2)
for k, v in pairs(t2.members_) do
local user_info = redis:get(KING.."user:Name" ..v.user_id_)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v.user_id_ .. ")\n"
end 
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, tag_all, nil)
end
----------start--------------------------------------------------------------
local id = tostring(msg.chat_id_)
if chat_type == 'user' and id:match("^(%d+)") then
if text == '/start' then 
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
local taha = '📮┇ اهلا بك عزيزي المطور 🛠'..
'\n👤┇ هذه اوامر الكيبورد خاصه بك'
local keyboard = {
{'توجيه خاص 📲','توجيه 🚸'},
{'اذاعه 📣','اذاعه خاص 📡'},
{'وضع اسم البوت ✏','تحديث ♻','تحديث السورس 📟'},
{'حذف كليشه ستارت 🗑','المجموعات 📇','وضع كليشه ستارت 📝'},
{'تفعيل البوت خدمي ☑','تعطيل البوت خدمي 🚫'},
{'الغاء ✖'}
}
send_inline_key(msg.chat_id_,taha,keyboard)
return false
else
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
local start = redis:get(KING.."startbot")
if start then
keep = [[
[]]..start..[[]
]]
send(msg.chat_id_, msg.id_, 1, keep, 1, 'md')
else
King = [[

🙋‍♂️┇مرحبا انا بوت اسمي *(]]..(redis:get(KING..'Kingnams') or 'الملك')..[[)*
🤖┇آنا آختصاصي حمايهہ‌‏ المجموعات ،
🚸┇يمڪنني حمايه مجموعتڬ،
🌟┇ارفعني ڪمشرف في المجموعهہ‌‏
🎖┇ۅمن ثم بعدها ارسل تفعيل ،
🗯┇ويتم رفع المدراء والادمنيهہ‌‏ تلقائيا

⚖️┇ *مطور البوت*← ( []] .. UserKing .. [[] )‏
‏
‏]]
send(msg.chat_id_, msg.id_, 1, King, 1, 'md')
end end end
end
if text == 'توجيه خاص 📲' then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
redis:setex(KING.."broadcastpv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
send(msg.chat_id_, msg.id_, 1, "☑┇  ارسل لي الرساله الان📲\n🚫┇ للخروج ارسل لي الغاء  ", 1, "md")
end
return false
end
if redis:get(KING.."broadcastpv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء ✖$") then
send(msg.chat_id_, msg.id_, 1, "☑- تم الغاء الامر بنجاح ", 1, "md")
redis:del(KING.."broadcastpv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false
end
if msg.forward_info_ then
local gps = redis:scard(KING.."bot:userss") or 0
local gpss = redis:smembers(KING.."bot:userss") or 0
local id = msg.id_
local msgs = {[0] = id}
for i = 1, #gpss do
Forward(gpss[i], msg.chat_id_, msgs)
end
send(msg.chat_id_, msg.id_, 1, "◯↲  تم توجيه رسالتك الى\n` " .. gps .. "` مجموعــه",  1, "md")
redis:del(KING.."broadcastpv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false
end
end
if text == 'اذاعه خاص 📡'  then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
redis:setex(KING.."broadcastpv2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
send(msg.chat_id_, msg.id_, 1, "☑┇  ارسل لي الرساله الان📲\n🚫┇ للخروج ارسل لي الغاء  ", 1, "md")
end
return false
end
if redis:get(KING.."broadcastpv2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء ✖$") then
send(msg.chat_id_, msg.id_, 1, "☑- تم الغاء الامر بنجاح ", 1, "md")
redis:del(KING.."broadcastpv2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false
end
if text then
local gps = redis:scard(KING.."bot:userss") or 0
local gpss = redis:smembers(KING.."bot:userss") or 0
local msgs = {[0] = id}
for i = 1, #gpss do
send(gpss[i], 0, 1, text, 1, "md")
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم نشر رسالتك  في\n` " .. gps .. "` مجموعــه  ", 1, "md")
redis:del(KING.."broadcastpv2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false
end
end
if text == "وضع اسم البوت ✏" then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
redis:setex(KING..'botts:namess'..msg.sender_user_id_,698,true)
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسل الاسم الان عزيزي 😇",1, 'html')
end end

if text == "تحديث السورس 📟" then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
os.execute('rm -rf KING.lua') 
os.execute('wget https://raw.githubusercontent.com/DIVIY/KING/master/KING.lua') 
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تحديث السورس \n ✓ ", 1, 'md')
dofile('KING.lua')  
end
end
if text == "تحديث ♻" then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🗂┇ تم تحديث ملفات البوت\n ✓ ", 1, 'md')
dofile('KING.lua')  
end
end
if text:match("^توجيه 🚸$") then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
redis:setex(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسل لي الرساله الان📲\n🚫┇ للخروج ارسل لي الغاء  ", 1, "md")
end end 
if text:match("^اذاعه 📣$") then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
redis:setex(KING.."broadcast2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
send(msg.chat_id_, msg.id_, 1, "☑┇  ارسل لي الرساله الان📲\n🚫┇ للخروج ارسل لي الغاء  ", 1, "md")
end end 
if text:match("^المجموعات 📇$") and tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
local gps = redis:scard(KING.."bot:groups")
local users = redis:scard(KING.."bot:userss")
send(msg.chat_id_, msg.id_, 1, "👥┇ عدد الكروبات المفعله» *"..gps.."*\n👤┇ عدد المشتركين » *"..users.."* في البوت\n", 1, 'md')
end
if text == "وضع كليشه ستارت 📝" then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
send(msg.chat_id_, msg.id_, 1, '☑┇ ارسال الان الكليشه ليتم حفظها', 1, 'md')
redis:set(KING.."addstart1"..msg.sender_user_id_, "theaddstarts")
return false
end end
if text then
local theaddstart = redis:get(KING.."addstart1"..msg.sender_user_id_)
if theaddstart == 'theaddstarts' then
send(msg.chat_id_, msg.id_, 1, "☑┇ تم حفظ الكليشه ", 1, 'md')
redis:del(KING.."addstart1"..msg.sender_user_id_)
redis:set(KING.."startbot", text)
return false
end end
if text == "حذف كليشه ستارت 🗑" then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
redis:del(KING.."startbot")
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم مسح كليشه start\n ✓ ", 1, 'md')
end end
if text == 'تفعيل البوت خدمي ☑' then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل البوت خدمي\n ✓ ", 1, 'md')
redis:set(KING.."bot:free", true)
end end
if text == 'تعطيل البوت خدمي 🚫' then
if tonumber(msg.sender_user_id_) == tonumber(Kp_Owner) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تعطيل البوت خدمي\n ✓ ", 1, 'md')
redis:del(KING.."bot:free")
end end

end

-----------------------get start------------------------------------------------------------------------
if text == 'جلب كليشه ستارت' or text == 'جلب start'  or text == 'جلب ستارت' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local start = redis:get(KING.."startbot")
if start then
send(msg.chat_id_, msg.id_, 1, '*« هاي الكليشه عزيزي »👇🏿*\n\n['..start..']', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '❌┇ لا توجد كليشه عزيزي', 1, 'md')
end end end
----------------------get ch join -------------------------------------------------------
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local Kpch2 = redis:get(KING.."Kpch1")
if Kpch2 then
send(msg.chat_id_, msg.id_, 1, '📡┇ *قناة الاشتراك* : ['..Kpch2..']', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚫┇ لا توجد قناة', 1, 'md')
end end end
--------------------list momod------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^الادمنيه$"))  then
local hash = "bot:momod:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
text = "👥┇ قائمة الادمنيه : \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{لا يوجد ادمنيه  } "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
-------------------list vipmem -----------------------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^الاعضاء المميزين$"))  then
local hash = "bot:vipmem:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
text = "👥┇  قائمه الاعضاء المميزين :\n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{لا يوجد اعضاء مميزين 🚀 } "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
-----------------list keed---------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^المقيدين$"))  then
local hash = "bot:keed:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
text = "👥┇  قائمه الاعضاء المقيدين :\n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{ لا يوجد اعضاء مقيدين 🚀 } "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
---------------------list vipmems---------------------------------------------------------------------------------------------------
if text:match("^قائمه المميزين العام$") then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local hash = "bot:vipmems:"
local list = redis:smembers(KING..hash)
text = "👥┇  قائمه مميزين العام :\n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{لا يوجد اعضاء مميزين عام 🚀 } "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
-------------------list mutes-----------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^المكتومين$"))  then
local hash = "bot:muted:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
text = "👥┇  قائمه المكتومين : \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{ لا يوجد مكتومين  }  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
-----------------list owners-------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^المدراء$"))  then
local hash = "bot:owners:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
text = "👥┇ قائمة المدراء : \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{ لا يوجد مدراء } "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--------------------list BAN-----------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^المحظورين$"))  then
local hash = "bot:banned:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
text = "👥┇  قائمه المحظورين : \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{لا يوجد محضورين  } "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
-----------------list GBAN----------------------------------------------------------------------
if text:match("^قائمه العام$") then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local hash = "bot:gban:"
local list = redis:smembers(KING..hash)
text = "👥┇  المحضورين عام : \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{لا يوجد محضورين عام 🚀 } "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
---------------list MONSHIS---------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^المنشئين$"))  then
local hash = "bot:monshis:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
text = "👥┇ قائمة المشئين : \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "]\n"
else
text = text .. k .. "» (" .. v .. ")\n"
end end
if #list == 0 then
text = "{ لا يوجد منشئين ✔} "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
------------------list Admins BOT--------------------------------------------------------------------------
if text:match("^ادمنيه البوت$") then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local hash = "Bot:Admins"
local list = redis:smembers(KING..hash)
text = "👥┇  ادمنيه البوت :\n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
if redis:get(KING.."SudoNumberGp" .. v) then
gps = tonumber(redis:get(KING.."SudoNumberGp" .. v))
else
gps = 0
end
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "] »(" .. gps .. ")\n"
else
text = text .. k .. "» (" .. v .. ") »(" .. gps .. ")\n"
end  end
if #list == 0 then
text = "{لا يوجد ادمنيه في البوت } "
end
send(msg.chat_id_, msg.id_, 1, text, "md")
end end
------------list KING_SUDO-----------------------------------------------------------------
if text:match("^المطورين$") then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local hash = "Bot:KpSudos"
local list = redis:smembers(KING..hash)
text = "👥┇  مطورين البوت :\n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k, v in pairs(list) do
if redis:get(KING.."SudoNumberGp" .. v) then
gps = tonumber(redis:get(KING.."SudoNumberGp" .. v))
else
gps = 0
end
local user_info = redis:get(KING.."user:Name" .. v)
if user_info then
local username = user_info
text = text .. k .. "» [" .. username .. "] »(" .. gps .. ")\n"
else
text = text .. k .. "» (" .. v .. ") »(" .. gps .. ")\n"
end end
if #list == 0 then
text = "{لا يوجد مطورين في البوت  } "
end
send(msg.chat_id_, msg.id_, 1, text, "md")
end end
------------------charge-----------------------------------------------------
if text:match("^الشحن (%d+)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
local a = {string.match(text, "^(الشحن) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, '🚫┇ تم شحن المجموعه *( '..a[2]..')* يوم', 1, 'md')
local time = a[2] * day
redis:setex(KING.."bot:charge:"..msg.chat_id_,time,true)
redis:set(KING.."bot:enable:"..msg.chat_id_,true)
end
------------------charge-----------------------------------------------------------------------------
if text:match("^فحص الشحن") and is_momod(msg.sender_user_id_, msg.chat_id_) then
local ex = redis:ttl(KING.."bot:charge:"..msg.chat_id_)
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🚫┇ المده غير محدوده', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "🚫┇ المجموعه لديها *"..d.."* يوم  ", 1, 'md')
end
end
----------------charge-------------------------------------------------------------------------------
if text:match("^فحص الشحن (%d+)") and is_admin(msg.sender_user_id_, msg.chat_id_) then
local txt = {string.match(text, "^(فحص الشحن) (%d+)$")}
local ex = redis:ttl(KING.."bot:charge:"..txt[2])
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🚫┇ المجموعه بلا حدود', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "🚫┇ المجموعه لديها *"..d.."* يوم", 1, 'md')
end
end
-----------------ADD FREE BOT IN GP----------------------------------------        ----------
if idf:match("-100(%d+)") and text:match("^تفعيل$") and not is_sudo(msg)  then
local add1ing = function(extra, result)
function ddd( arg,data )
local txt = { string.match(text, "^(تفعيل)$")}
if not redis:get(KING.."bot:free") and not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '🚫┇* للمطوريـــن فقـــط* ❗️', 1, 'md')
return false end
local function promote_admin(extra, result, success)
local admins = result.members_
for i=0 , #admins do
redis:sadd(KING..'bot:momod:'..msg.chat_id_,admins[i].user_id_)
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
redis:sadd(KING.."bot:owners:"..msg.chat_id_,owner_id)
end
end
end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
redis:set(KING.."test:group"..msg.chat_id_,'zain')
if redis:get(KING.."bot:enable:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🚫┇ المجموعه  مفعله بالتأكيد ❗️\n‏\n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚫┇ تم تفعيل المجموعه\n🔱┇ وتم رفع المدراء والادمنيهہ‌‏ ❗️\n‏\n', 1, 'md')
end
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local username = "@" .. result.username_ or "---"
local list = redis:smembers(KING.."bot:owners:" .. msg.chat_id_)
if list[1] or list[2] or list[3] or list[4] then
user_info = redis:get(KING.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then
owner = user_info
else
owner = "لا يوجد "
end
if not redis:get(KING.."bot:group:link"..msg.chat_id_) then
local getlink = 'https://api.telegram.org/bot'..KING_TOKEN..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = KPJS:decode(req)
if link.ok == true then 
redis:set(KING.."bot:group:link"..msg.chat_id_,link.result)
end
end
local lik_1 = redis:get(KING.."bot:group:link"..msg.chat_id_)
if lik_1 then
link = lik_1 
else
link = link.result
end
send(Kp_Owner,0, 1,"- *تم اضافه مجموعه* »\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n‏🔱┇ المدير ← [" .. owner .. "]\n🔰┇ ["..title_name(msg.chat_id_).."]("..(link or "t.me/King")..")\n🚫┇ *ايدي المجموعه* »\n📉┇ "..msg.chat_id_.."\n*«معلومات عن المطور»*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n☑┇ ايديه ← (" .. msg.sender_user_id_ .. ")\n🚫┇ اسمه ← " ..result.first_name_.. "\n️⚠️┇ معرفه ← [" .. username .. "]\n✓", 1, "md")
redis:set(KING.."bot:enable:" .. msg.chat_id_, true)
redis:setex(KING.."bot:charge:" .. msg.chat_id_, 9999 * day, true)
redis:sadd(KING.."sudo:data:" .. msg.sender_user_id_, msg.chat_id_)
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, ddd, nil)
end
getUser(msg.sender_user_id_, add1ing)
end
-------------------charge----------------------------------------------------------------------------
if is_sudo(msg) then
if text:match('^شحن 30 (-%d+)') and is_admin(msg.sender_user_id_, msg.chat_id_) then
local txt = {string.match(text, "^(شحن 30) (-%d+)$")}
local timeplan1 = 2592000
redis:setex(KING.."bot:charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '🚫┇ المجموعه `'..txt[2]..'`\nتم شحنها 30 يوم', 1, 'md')
redis:set(KING.."bot:enable:"..txt[2],true)
end
------------------charge-----------------------------------------------------------------------------
if text:match('^شحن 90 (-%d+)') and is_admin(msg.sender_user_id_, msg.chat_id_) then
local txt = {string.match(text, "^(شحن 90) (-%d+)$")}
local timeplan2 = 7776000
redis:setex(KING.."bot:charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '🚫┇ المجموعه `'..txt[2]..'`\nتم شحنها 90 يوم', 1, 'md')
redis:set(KING.."bot:enable:"..txt[2],true)
end
------------------------charge-----------------------------------------------------------------------
if text:match('^شحن مفتوح (-%d+)') and is_admin(msg.sender_user_id_, msg.chat_id_) then
local txt = {string.match(text, "^(شحن مفتوح) (-%d+)$")}
redis:set(KING.."bot:charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '🚫┇المجموعه `'..txt[2]..'`\n تم شحنها بلا حدود', 1, 'md')
redis:set(KING.."bot:enable:"..txt[2],true)
end
--------------------ADD GP---------------------------------------------------------------------------
if idf:match("-100(%d+)") and text:match("^تفعيل$") and is_sudo(msg) then
local adding = function(extra, result)
function add_gp( arg,data )
local txt = { string.match(text, "^(تفعيل)$")}
redis:del(KING..'lock:add'..msg.chat_id_)
local function promote_admin(extra, result, success)
local admins = result.members_
for i=0 , #admins do
redis:sadd(KING..'bot:momod:'..msg.chat_id_,admins[i].user_id_)
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
redis:sadd(KING.."bot:owners:"..msg.chat_id_,owner_id)
end
end
end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
redis:set(KING.."test:group"..msg.chat_id_,'zain')
if redis:get(KING.."bot:enable:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '📮┇ المجموعه  مفعله بالتأكيد ☑\n‏\n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇ تم تفعيل المجموعه\n👥┇ وتم رفع المدراء والادمنيهہ‌‏ ❗️\n‏\n', 1, 'md')
end
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local username = "@" .. result.username_ or "---"
local list = redis:smembers(KING.."bot:owners:" .. msg.chat_id_)
if list[1] or list[2] or list[3] or list[4] then
user_info = redis:get(KING.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then
owner = user_info
else
owner = "لا يوجد "
end
if not redis:get(KING.."bot:group:link"..msg.chat_id_) then
local getlink = 'https://api.telegram.org/bot'..KING_TOKEN..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = KPJS:decode(req)
if link.ok == true then 
redis:set(KING.."bot:group:link"..msg.chat_id_,link.result)
end
end
local lik_1 = redis:get(KING.."bot:group:link"..msg.chat_id_)
if lik_1 then
link = lik_1 
else
link = link.result
end
send(Kp_Owner,0, 1,"- *تم اضافه مجموعه* »\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n‏🔱┇ المدير ← [" .. owner .. "]\n🔰┇ ["..title_name(msg.chat_id_).."]("..(link or "t.me/King")..")\n🎫┇ *ايدي المجموعه* »\n👥┇ "..msg.chat_id_.."\n*«معلومات عن المطور»*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n🎟┇ ايديه ← (" .. msg.sender_user_id_ .. ")\n👤┇ اسمه ← " ..result.first_name_.. "\n️🎭┇ معرفه ← [" .. username .. "]\n✓", 1, "md")
redis:set(KING.."bot:enable:" .. msg.chat_id_, true)
redis:setex(KING.."bot:charge:" .. msg.chat_id_, 9999 * day, true)
redis:sadd(KING.."sudo:data:" .. msg.sender_user_id_, msg.chat_id_)
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, add_gp, nil)
end
getUser(msg.sender_user_id_, adding)
end
-------------------------------------------------------------------
if text:match("^تعطيل$") then
local txt = { string.match(text, "^(تعطيل)$") }
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
redis:set(KING..'lock:add'..msg.chat_id_,true)
if not redis:get(KING.."bot:enable:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🚫┇المجموعهہ‌‏ معطلهہ‌‏ بالتأكيدً\n', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚫┇ تم تعطيل المجموعهہ‌‏\n', 1, 'md')
end
redis:del(KING.."bot:enable:" .. msg.chat_id_)
redis:srem(KING.."bot:groups", msg.chat_id_)
redis:del(KING.."test:group"..msg.chat_id_)
redis:srem(KING.."sudo:data:" .. msg.sender_user_id_, msg.chat_id_)
local send_to_bot_owner = function(extra, result)
local v = tonumber(Kp_Owner)
local fname = result.first_name_ or ""
local lname = result.last_name_ or ""
local username = "@" .. result.username_ or "لا يوجد"
local list = redis:smembers(KING.."bot:owners:" .. msg.chat_id_)
if list[1] or list[2] or list[3] or list[4] then
user_info = redis:get(KING.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then
owner = user_info
else
owner = "لا يوجد "
end
send(v,0, 1,"- *تم تعطيل مجموعه* »\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n‏🔱┇ المدير ← " .. owner .. "\n📎┇ الرابط ← [اضغـط هنـا](" .. (redis:get(KING.."bot:group:link"..msg.chat_id_) or "https://t.me/King") .. ")\n🔅┇* اسم المجموعه* »\n👨🏼┇ "..title_name(msg.chat_id_).."\n🚫┇ *ايدي المجموعه* »\n📉┇ "..msg.chat_id_.."\n*«معلومات عن المطور»*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n☑┇ ايديه ← (" .. msg.sender_user_id_ .. ")\n🚫┇ اسمه ← " .. fname .. " " .. lname .. "\n️⚠️┇ معرفه ← [" .. username .. "]\n‏", 1, "md")
end
getUser(msg.sender_user_id_, send_to_bot_owner)
end end
-------------------ADDD----------------------------------------------------------------------------
if text:match('^تفعيل (%d+) (-%d+)') and is_sudo(msg) then
local txt = {string.match(text, "^(تفعيل) (%d+) (-%d+)$")}
local sudo = txt[2]
local gp = txt[3]
send(msg.chat_id_, msg.id_, 1, "☑┇ تم تفعيل المجموعه \n(*"..txt[2].."*) يوم ", 1, 'html')
redis:sadd(KING..'sudo:data:'..sudo, gp)
end
-------------------REEM----------------------------------------------------------------------------
if text:match('^تعطيل (%d+) (-%d+)') and is_sudo(msg) then
local txt = {string.match(text, "^(تعطيل) (%d+) (-%d+)$")}
local hash = 'sudo:data:'..txt[2]
local gp = txt[3]
send(msg.chat_id_, msg.id_, 1, "☑┇ سيتم تعطيل المجموعه بعد \n(*"..txt[2].."*) يوم ", 1, 'html')
redis:srem(KING..hash, gp)
end
end
---------------------REM GP BY ID-------------------------------------------------------------------------
if is_sudo(msg) and idf:match("-100(%d+)") and text:match("^تعطيل (-%d+)$") then
do
local gp = { string.match(text, "^(تعطيل) (-%d+)$") }
local send_to_bot_owner = function(extra, result)
redis:del(KING.."bot:enable:" .. gp[2])
redis:del(KING.."bot:charge:" .. gp[2])
local v = tonumber(Kp_Owner)
local fname = result.first_name_ or ""
local lname = result.last_name_ or ""
local username = "@" .. result.username_ or ""
send(msg.chat_id_, msg.id_, 1, "📮⇣ المجموعه " .. gp[2] .. "\nتم تعطيلها ", 1, "md")
send(v, 0, 1, "☑┇ تم ازالة المجموعه\n👨‍🔧┇ الاسم : " .. fname .. "\n👨‍🔧┇ المعرف : [" .. username .. "]\n🎫┇ ايدي المجموعه : " .. gp[2] .. "", 1, "md")
redis:srem(KING.."sudo:data:" .. msg.sender_user_id_, gp[2])
redis:srem(KING.."bot:groups", gp[2])
end
getUser(msg.sender_user_id_, send_to_bot_owner)
end
else
end
---------------------ID-----------------------------------------------------
if idf:match("-100(%d+)") and (text:match("^الايدي$") and msg.reply_to_message_id_ ~= 0)  then
local getid_by_reply = function(extra, result)
send(msg.chat_id_, msg.id_, 1, "🎫┇  الايدي : " .. result.sender_user_id_, 1, "md")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_, getid_by_reply)
end
----------------ID BY User--------------------------------------------------------------------
if text:match("^ايدي @(%S+)$") then
do
local ap = {string.match(text, "^(ايدي) @(%S+)$") }
local id_by_username = function(extra, result)
local num_zain = (tonumber(redis:get(KING.."incr_msg"..result.id_..""..msg.chat_id_.."") or 0 ))
local msgs = (tonumber(redis:get(KING.."msgs:"..result.id_..":"..msg.chat_id_) or  0))
local Kpcontact = (tonumber(redis:get(KING.."kpaddcon"..msg.chat_id_..":"..result.id_) or 0))
if result.id_ then
if tonumber(result.id_) == tonumber(Kp_Owner) then
t = "مطور اساسي 👨‍🔧"
elseif is_sudoid(result.id_) then
t = "المطور 👨‍💻"
elseif is_admin(result.id_) then
t = "ادمن في البوت 🕵️‍♂️"
elseif is_vipmems(result.id_) then
t = "مميز عام 👨‍🚒"
elseif is_monshi(result.id_, msg.chat_id_) then
t = "المنشئ 👨‍✈️"
elseif is_owner(result.id_, msg.chat_id_) then
t = "مدير  في البوت 👮‍♂️"
elseif is_momod(result.id_, msg.chat_id_) then
t = "ادمن المجموعه 👨‍🎤"
elseif is_vipmem(result.id_, msg.chat_id_) then
t = "عضو مميز 🧛‍♂️"
else
t = "عضو فقط 🤵"
end end
local gpid = tostring(result.id_)
if gpid:match("^(%d+)") then
King_info2 = "🎟┇ ايديه  » `" .. result.id_ .. "`\n©️┇ معرفه »  [@" .. ap[2] .. "]\n📞┇ جهاته  »   "..Kpcontact.."\n🤹‍♂️┇ نقاطه  »   "..num_zain.."\n🎲┇ تفاعله »  " .. KP_TM_NM(msgs) .. "\n💌┇ رسائله » " .. msgs .. "\n📌┇ موقعه » " .. t .. "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
elseif not result.id_ then
King_info2 = "🚫┇ لا يوجد عضو بهذا المعرف"
end
send(msg.chat_id_, msg.id_, 1, King_info2, 1, "md")
end
resolve_username(ap[2], id_by_username)
end else end 
----------------- RTBA BY USER-----------------------------------------------------------------
if text:match("^الرتبه @(%S+)$")  then
do
local ap = {string.match(text, "^(الرتبه) @(%S+)$") }
local rtba_by_username = function(extra, result)
if result.id_ then
if tonumber(result.id_) == tonumber(Kp_Owner) then
t = "مطور الاساسـي 👨‍🔧"
elseif is_sudoid(result.id_) then
t = "المطور 👨‍💻"
elseif is_admin(result.id_) then
t = "ادمن في البوت 🕵️‍♂️"
elseif is_vipmems(result.id_) then
t = "مميز عام 👨‍🚒"
elseif is_monshi(result.id_, msg.chat_id_) then
t = "منشئ الكروب 👨‍✈️"
elseif is_owner(result.id_, msg.chat_id_) then
t = "مدير في البوت 👮‍♂️"
elseif is_momod(result.id_, msg.chat_id_) then
t = "ادمن 👨‍🎤"
elseif is_vipmem(result.id_, msg.chat_id_) then
t = "عضو مميز 🧛‍♂️"
else
t = "عضو 🤵"
end end
local gpid = tostring(result.id_)
if gpid:match("^(%d+)") then
text = "🎫┇ الايدي » *(" .. result.id_ .. ")*\n👨‍✈️┇ الرتبه » *" .. t .. "*\n✓"
elseif not result.id_ then
text = "🚫┇ المعرف غير صحيح   "
end
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
resolve_username(ap[2], rtba_by_username)
end
else end
-------------------filters--------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^قائمه المنع"))  then
local hash = "bot:filters:" .. msg.chat_id_
local names = redis:hkeys(KING..hash)
texti = "🚫┇ الكلمات الممنوعه : \n"
local b = 1
for i = 1, #names do
texti = texti .. b .. ". " .. names[i] .. "\n"
b = b + 1
end
if #names == 0 then
texti = "{لا توجد كلمات ممنوعه  } "
end
if text:match("^قائمه المنع$") then
send(msg.chat_id_, msg.id_, 1, texti, 1, "md")
elseif (text:match("المنع خاص$")) and is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.sender_user_id_, 0, 1, texti, 1, "md")
text = "●◄ تم ارسال القائمه خاص "
send(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--------------------YOUR Name------------------------------------------
if idf:match("-100(%d+)") and text:match("^اسمي$") and msg.reply_to_message_id_ == 0  then
local get_me = function(extra, result)
local fname = result.first_name_ or ""
local lname = result.last_name_ or ""
local name = fname .. " " .. lname
local _nl, ctrl_chars = string.gsub(text, "%c", "")
if string.len(name) > 88899 or ctrl_chars > 7767667 then
end
send(msg.chat_id_, msg.id_, 1, "👤┇ اســمك »\n `" .. name .. "`" , 1, "md")
end
getUser(msg.sender_user_id_, get_me)
end
-------------------------------------------------
if  text:match("^ايديي$") or  text:match("^[Ii]d$") then
local user_info_ = redis:get(KING.."user:Name" .. msg.sender_user_id_)
local UserKing = user_info_
if user_info_ then
send(msg.chat_id_, msg.id_, 1, "🙋‍♂️┇اهلا عزيزي  ["..UserKing.."]\n🎟┇ايديك  (`"..msg.sender_user_id_.."`)\n✓", 1, "html")
return false end end
-------------------RETBA-------------------------
if idf:match("-100(%d+)") and text:match("^رتبتي$") and msg.reply_to_message_id_ == 0   then
local get_me = function(extra, result)
if is_KpiD(result.id_) then
tar = "مطور اساسي 👨‍🔧"
elseif is_sudoid(result.id_) then
tar = "مطور 👨‍💻"
elseif is_vipmems(result.id_) then
tar = "مميز عام 🕵️‍♂️"
elseif is_admin(result.id_) then
tar = "ادمن في البوت 👨‍🚒"
elseif is_monshi(result.id_, msg.chat_id_) then
tar = "منشئ 👨‍✈️"
elseif is_owner(result.id_, msg.chat_id_) then
tar = "المدير 👮‍♂️"
elseif is_momod(result.id_, msg.chat_id_) then
tar = "ادمن المجموعه 👨‍🎤"
elseif is_vipmem(result.id_, msg.chat_id_) then
tar = "عضو مميز 🧛‍♂️"
else
tar = "عـضـو 🤵"
end
if result.first_name_ then
if #result.first_name_ < 35 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
send(msg.chat_id_, msg.id_, 1, "👤┇ اســمك » " .. result.first_name_ .. "\n👨‍🔧┇ رتبتـك » " ..tar.. "\n✓" , 1, "html")
end
getUser(msg.sender_user_id_, get_me)
end
-------------------------Invite-----------------------------------------------
local text = msg.content_.text_:gsub("اضافه", "Invite")
if is_admin(msg.sender_user_id_) and idf:match("-100(%d+)") and text:match("^[Ii]nvite$") and msg.reply_to_message_id_ ~= 0 then
local inv_reply = function(extra, result)
add_user(result.chat_id_, result.sender_user_id_, 5)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_, inv_reply)
end
-------------------YOUR ID----------------------------------------------------------------
if idf:match("-100(%d+)") then
text = text:gsub("ايدي","ايدي")
if text:match("^ايدي$") and msg.reply_to_message_id_ == 0  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local num_zain = tonumber(redis:get(KING..'incr_msg'..msg.sender_user_id_..''..msg.chat_id_..'') or 0 )
local msgs = tonumber(redis:get(KING.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_))
local Kpcontact = (tonumber(redis:get(KING.."kpaddcon"..msg.chat_id_..":"..msg.sender_user_id_) or 0))
local getnameEN = function(extra, result)
if is_KpiD(result.id_) then
tar = "مطور اساسي 👨‍🔧"
elseif is_sudoid(result.id_) then
tar = "المطور 👨‍💻"
elseif is_vipmems(result.id_) then
tar = "مميز عام 🕵️‍♂️"
elseif is_admin(result.id_) then
tar = "ادمن في البوت 👨‍🚒"
elseif is_monshi(result.id_, msg.chat_id_) then
tar = "المنشئ 👨‍✈️"
elseif is_owner(result.id_, msg.chat_id_) then
tar = "المدير 👮‍♂️"
elseif is_momod(result.id_, msg.chat_id_) then
tar = "ادمن المجموعه 👨‍🎤"
elseif is_vipmem(result.id_, msg.chat_id_) then
tar = "عضو مميز 🧛‍♂️"
else
tar = "عضو فقط 🤵"
end
if result.username_ then
username = "@" .. result.username_
else
username = "Not Found"
end
end
getUser(msg.sender_user_id_, getnameEN)
local getprofa = function(extra, result)
local King_info = "🎟┇ ايديك  ↫ " .. msg.sender_user_id_ .. "\n©️┇ معرفك ↫  " .. username .. "\n👤┇ جهاتك  ↫   "..Kpcontact.."\n🖼┇ صورك  ↫   "..result.total_count_.."\n🤹‍♂️┇ نقاطك  ↫   "..num_zain.."\n🎲┇ تفاعلك ↫  " .. KP_TM_NM(msgs) .. "\n💌┇ رسائلك ↫ " .. msgs .. "\n📌┇ موقعك ↫ " .. tar .. "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
local King_info2 = "🎟┇ ايديك  ↫ `" .. msg.sender_user_id_ .. "`\n©️┇ معرفك ↫  [" .. username .. "]\n👤┇ جهاتك  ↫   "..Kpcontact.."\n🖼┇ صورك  ↫   "..result.total_count_.."\n🤹‍♂️┇ نقاطك  ↫   "..num_zain.."\n🎲┇ تفاعلك ↫  " .. KP_TM_NM(msgs) .. "\n💌┇ رسائلك ↫ " .. msgs .. "\n📌┇ موقعك ↫ " .. tar .. "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"

if redis:get(KING.."getidstatus" .. msg.chat_id_) == "Photo" then
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_, King_info)
else
send(msg.chat_id_, msg.id_, 1, "انت لا تمتلك صوره لحسابك‏\n"..King_info2.."", 1, "md")
end
end
if redis:get(KING.."getidstatus" .. msg.chat_id_) == "Simple" then
send(msg.chat_id_, msg.id_, 1, King_info2, 1, "html")
end
if not redis:get(KING.."getidstatus" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, King_info2, 1, "html")
 end 
 end
tdcli_function({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getprofa, nil)
end end 
-------------------KP_TM_NM----------------------------------------
if text:match("^تفاعلي$") or text:match("^شنو تفاعلي$")  then
local msgs = tonumber(redis:get(KING.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_))
if not redis:get(KING..'lock:add'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "⏱┇ تفاعلك : ( *"..KP_TM_NM(msgs).."* ) 🤹‍♂️", 1, 'md')
end
end
--------------------Kp concat add----------------------------------------
if text == 'جهاتي' then
send(msg.chat_id_, msg.id_, 1, '📞┇ عدد جهاتك ← * '..(tonumber(redis:get(KING..'kpaddcon'..msg.chat_id_..':'..msg.sender_user_id_) or 0))..' *',1,'md')
end
--------------------ID BY REPLY------------------------------------------
if text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
function iD_reP(extra, result, success)
local num_zain = (tonumber(redis:get(KING.."incr_msg"..result.sender_user_id_..""..msg.chat_id_.."") or 0 ))
local msgs = (tonumber(redis:get(KING.."msgs:"..result.sender_user_id_..":"..msg.chat_id_) or 0 ))
local Kpcontact = (tonumber(redis:get(KING.."kpaddcon"..msg.chat_id_..":"..result.sender_user_id_) or 0))
if result.id_ then
if tonumber(result.sender_user_id_) == tonumber(Kp_Owner) then
King3 = "مطور الاساسـي 👨‍🔧"
elseif is_sudoid(result.sender_user_id_) then
King3 = "المطور 👨‍💻"
elseif is_admin(result.sender_user_id_) then
King3 = "ادمن في البوت 🕵️‍♂️"
elseif is_vipmems(result.sender_user_id_) then
King3 = "مميز عام 👨‍🚒"
elseif is_monshi(result.sender_user_id_, msg.chat_id_) then
King3 = "منشئ الكروب 👨‍✈️"
elseif is_owner(result.sender_user_id_, msg.chat_id_) then
King3 = "المدير 👮‍♂️"
elseif is_momod(result.sender_user_id_, msg.chat_id_) then
King3 = "ادمن المجموعه 👨‍🎤"
elseif is_vipmem(result.sender_user_id_, msg.chat_id_) then
King3 = "عضو مميز 🧛‍♂️"
else
King3 = "عـضـو 🤵"
end
end
local King_info = "🎟┇ ايديه  » `" .. result.sender_user_id_ .. "`\n📞┇ جهاته  »   "..Kpcontact.."\n🤹‍♂️┇ نقاطه  »   "..num_zain.."\n🎲┇ تفاعله »  " .. KP_TM_NM(msgs) .. "\n💌┇ رسائله » " .. msgs .. "\n📌┇ موقعه » " .. King3 .. "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
send(msg.chat_id_, result.id_, 1, King_info, 1, "md")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,iD_reP)
end
-----------------SET BOT Name--------------------------------------------
if text == "وضع اسم البوت" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
redis:setex(KING..'botts:namess'..msg.sender_user_id_,698,true)
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسل الاسم الان عزيزي 😇",1, 'html')
end end
----------------------------Showprofilestatus----------------------------
if is_sudo(msg) and idf:match("-100(%d+)") and text:match("^تفعيل (.*)$")  then
local status = {string.match(text, "^(تفعيل) (.*)$")}
if status[2] == "active" or status[2] == "جلب الصور" then
if redis:get(KING.."getpro:" .. msg.chat_id_) == "Active" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل جلب الصور\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل جلب الصور\n ✓ ", 1, 'md')
redis:set(KING.."getpro:" .. msg.chat_id_, "Active")
end end end
if is_sudo(msg) and idf:match("-100(%d+)") and text:match("^تعطيل (.*)$")  then
local status = {string.match(text, "^(تعطيل) (.*)$")}
if status[2] == "جلب الصور" then
if redis:get(KING.."getpro:" .. msg.chat_id_) == "Deactive" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل جلب الصور\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل جلب الصور\n ✓ ", 1, 'md')
redis:set(KING.."getpro:" .. msg.chat_id_, "Deactive")
end end end
---------------------------------------------------------------------
if text:match("^مسح الصوره") and is_momod(msg.sender_user_id_, msg.chat_id_)  then
https.request('https://api.telegram.org/bot'..KING_TOKEN..'/deleteChatPhoto?chat_id='..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم مسح صوره المجموعه\n ✓ ", 1, 'md')
end
if text:match("^ضع وصف (.*)$") and is_momod(msg.sender_user_id_, msg.chat_id_)  then
local text = {string.match(text, "^(ضع وصف) (.*)$")}
changeChannelAbout(msg.chat_id_,text[2])
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع وصف للمجموعه\n ✓ ", 1, 'md')
end 
---------------------floodstatus------------------------------------------------------------------
if text:match("^ضع تكرار (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local floodt = {string.match(text, "^(ضع تكرار) (%d+)$")}
if tonumber(floodt[2]) < 1 then
send(msg.chat_id_, msg.id_, 1, '☑┇ ضع عدد م [1] الى [200] ', 1, 'md')
else
redis:set(KING..'flood:time:'..msg.chat_id_,floodt[2])
send(msg.chat_id_, msg.id_, 1, '☑┇ تــم وضـع  التكرار : '..floodt[2]..'', 1, 'md')
end end
----------------------floodstatus----------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^ضع تكرار (.*)$")  then
local status = { string.match(text, "^(ضع تكرار) (.*)$") }
if status[2] == "بالطرد" then
if redis:get(KING.."floodstatus" .. msg.chat_id_) == "Kicked" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التكرار بالطرد\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التكرار بالطرد\n ✓ ", 1, 'md')
redis:set(KING.."floodstatus" .. msg.chat_id_, "Kicked")
end
end
if status[2] == "بالمسح" then
if redis:get(KING.."floodstatus" .. msg.chat_id_) == "DelMsg" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التكرار بالمسح\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التكرار بالمسح\n ✓ ", 1, 'md')
redis:set(KING.."floodstatus" .. msg.chat_id_, "DelMsg")
end
end
end
-------------------SET warn-----------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^ضع تحذير (%d+)$")  then
local warnmax = { string.match(text, "^(ضع تحذير) (%d+)$")}
if 2 > tonumber(warnmax[2]) or tonumber(warnmax[2]) > 30 then
send(msg.chat_id_, msg.id_, 1, "☑┇ يمكنك وضع تحذير من (2-30) 🔱", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "☑┇ تم وضع التحذير : " .. warnmax[2] .. " 📮 ", 1, "md")
redis:set(KING.."warn:max:" .. msg.chat_id_, warnmax[2])
end
end
---------------------warnstatus----------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^ضع تحذير (.*)$")  then
local status = { string.match(text, "^(ضع تحذير) (.*)$") }
if status[2] == "بالكتم" then
if redis:get(KING.."warnstatus" .. msg.chat_id_) == "Muteuser" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التحذير بالكتم\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التحذير بالكتم\n ✓ ", 1, 'md')
redis:set(KING.."warnstatus" .. msg.chat_id_, "Muteuser")
end   end
if status[2] == "بالطرد" then
if redis:get(KING.."warnstatus" .. msg.chat_id_) == "Remove" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التحذير بالطرد\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم وضع التحذير بالطرد\n ✓ ", 1, 'md')
redis:set(KING.."warnstatus" .. msg.chat_id_, "Remove")
end end end
-----------------------getidstatus-----------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^تفعيل (.*)$")  then
local status = { string.match(text, "^(تفعيل) (.*)$")}
if status[2] == "الايدي بالصوره" then
if redis:get(KING.."getidstatus" .. msg.chat_id_) == "Photo" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل الايدي بالصوره\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل الايدي بالصوره\n ✓ ", 1, 'md')
redis:set(KING.."getidstatus" .. msg.chat_id_, "Photo")
end end  end
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^تعطيل (.*)$")  then
local status = {string.match(text, "^(تعطيل) (.*)$")}
if status[2] == "الايدي بالصوره" then
if redis:get(KING.."getidstatus" .. msg.chat_id_) == "Simple" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل الايدي بالصوره\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل الايدي بالصوره\n ✓ ", 1, 'md')
redis:set(KING.."getidstatus" .. msg.chat_id_, "Simple")
end end end
-------------------autoleave-----------------------------------------------------------------------
if is_sudo(msg) and text:match("^تفعيل (.*)$") then
local status = {string.match(text, "^(تفعيل) (.*)$")}
if status[2] == "الخروج التلقائي" then
if redis:get(KING.."autoleave") == "On" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل الخروج التلقائي\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تفعيل الخروج التلقائي\n ✓ ", 1, 'md')
redis:set(KING.."autoleave", "On")
end end end
if is_sudo(msg) and text:match("^تعطيل (.*)$") then
local status = { string.match(text, "^(تعطيل) (.*)$")}
if status[2] == "الخروج التلقائي" then
if redis:get(KING.."autoleave") == "Off" then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل الخروج التلقائي\n ✓ ", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🚫┇ تم تعطيل الخروج التلقائي\n ✓ ", 1, 'md')
redis:set(KING.."autoleave", "Off")
end   end  end
-----------------------
if text == "تنظيف المجموعات" and is_devzain(msg) then
local group = redis:smembers(KING..'bot:groups')   
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
redis:srem(KING.."bot:groups", group[i])
changeChatMemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
redis:srem(KING.."bot:groups", group[i])
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
redis:srem(KING.."bot:groups", group[i])
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
redis:srem(KING.."bot:groups", group[i])
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_, 1,'📮┇ لا يوجد مجموعات وهميه في البوت \n✓', 1, 'md')   
else
local zain = (w + q)
local sendok = #group - zain
if q == 0 then
zain = ''
else
zain = '\n🚸┇ تم ازالة ↫ ❪ '..q..' ❫ مجموعات من البوت'
end
if w == 0 then
King = ''
else
King = '\n📬┇ تم ازالة ↫ ❪'..w..'❫ مجموعه لان البوت عضو'
end
send(msg.chat_id_, msg.id_, 1,'📮┇ عدد المجموعات الان ↫ ❪ '..#group..' ❫'..King..''..zain..'\n📡┇ الان عدد المجموعات الحقيقي ↫ ❪ '..sendok..' ❫ مجموعات\n✓', 1, 'md')   
end
end
end,nil)
end
return false
end
if text == "تنظيف المشتركين" and is_devzain(msg) then
local pv = redis:smembers(KING..'bot:userss')   
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
redis:srem(KING.."bot:userss",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_, 1,'📮┇لا يوجد مشتركين وهميين في البوت \n✓ ', 1, 'md')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_, 1,'📮┇عدد المشتركين الان ↫ ❪ '..#pv..' ❫\n📬┇تم ازالة ↫ ❪ '..sendok..' ❫ من المشتركين\n📡┇الان عدد المشتركين الحقيقي ↫ ❪ '..ok..' ❫ مشترك\n✓', 1, 'md')   
end
end
end,nil)
end,nil)
end
return false
end
------------------SET KING_SUDO-----------------------------------------
if text:match("^ضع كليشه المطور$") then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇ ارســل لــي كليــشه المطــور الان 🎗", 1, "md")
redis:setex(KING.."bot:King_dev" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 370, true)
end end

if text:match("^المطور$") then
local get_me = function(extra, result)
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if result.first_name_ then
if #result.first_name_ < 35 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local King_dev = redis:get(KING.."King_dev")
if King_dev then
send(msg.chat_id_, msg.id_, 1, "["..King_dev.."]", 1, "md")
else
local zaeony = [[

🙋‍♂️» اهلا عزيزي » *]]..result.first_name_..[[*

🙋🏼‍♂┇مرحبا صديقي انا بوت حمايه ،
🚸┇يمڪنني حمايه مجموعتڬ،
🌟┇ارفعني ڪمشرف في المجموعهہ‌‏
🎖┇ۅمن ثم بعدها ارسل تفعيل ،
🗯┇ويتم رفع المدراء والادمنيهہ‌‏ تلقائيا

👨‍🔧» مطور البوت » []]..UserKing..[[]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
]]
send(msg.chat_id_, msg.id_, 1, zaeony, 1, "md") 
end
end
end
getUser(msg.sender_user_id_, get_me)
end
-----------------------------------------
if text == 'حذف كليشه المطور' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
redis:del(KING.."King_dev")
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم حذف كليشه المطور\n ✓ ", 1, 'md')
end
end
-------------------------SET LINK---------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^ضع رابط$"))  then
send(msg.chat_id_, msg.id_, 1, "☑┇ ارســــل لي الرابط الان ", 1, "html")
redis:setex(KING.."bot:group:link" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 1200, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^حذف الرابط$"))  then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم حذف الرابط بنجاح\n ✓ ", 1, 'html')
redis:del(KING.."bot:group:link" .. msg.chat_id_)
end
if text:match("^الرابط$") then
local link = redis:get(KING.."bot:group:link" .. msg.chat_id_)
if link then
send(msg.chat_id_, msg.id_, 1, "📬┇ رابـــط المجموعــه :\n" .. link .. "", 1, "html")
else
send(msg.chat_id_, msg.id_, 1, "📬┇ لم يتم وضع الرابط \n ارسل ضع رابط الان♩",  1, "html")
end end
-----------------GET LINK BY ID GP-----------------------------------------------------------
if is_admin(msg.sender_user_id_) then
if text:match("^جلب رابط (-%d+)$") then
local ap = {string.match(text, "^(جلب رابط) (-%d+)$")}
local tp = tostring(ap[2])
getGroupLink(msg, tp)
end end
if is_sudo(msg) and text:match("^[Aa]ction (.*)$") then
local lockpt = {string.match(text, "^([Aa]ction) (.*)$")}
if lockpt[2] == "text" then
sendaction(msg.chat_id_, "Typing")
end
if lockpt[2] == "video" then
sendaction(msg.chat_id_, "RecordVideo")
end
if lockpt[2] == "voice" then
sendaction(msg.chat_id_, "RecordVoice")
end
if lockpt[2] == "photo" then
sendaction(msg.chat_id_, "UploadPhoto")
end
end
-----------------------filters-------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^منع (.*)$")  then
local filterss = { string.match(text, "^(منع) (.*)$") }
local name = string.sub(filterss[2], 1, 50)
local hash = "bot:filters:" .. msg.chat_id_
if filter_ok(name) then
redis:hset(KING..hash, name, "newword")
send(msg.chat_id_, msg.id_, 1, "☑┇  الكلمه{  " .. name .. "  }\n👥┇ تم  منعها ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "☑┇  الكلمه [ " .. name .. " ] \n لا استطيع منعها❌", 1, "md")
end
end
---------------------filters------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^منع$")  then
send(msg.chat_id_, msg.id_, 1, "☑┇  ارسل لي الكلمات التي \nتريد منعها بشكل فردي \n لٱلغاء الامر ارسل الغاء ", 1, "md")
redis:setex(KING.."Filtering:" .. msg.sender_user_id_, 80, msg.chat_id_)
end
----------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^الغاء منع (.*)$")  then
local rwss = { string.match(text, "^(الغاء منع) (.*)$")}
local name = string.sub(rwss[2], 1, 50)
local cti = msg.chat_id_
local hash = "bot:filters:" .. msg.chat_id_
if not redis:hget(KING..hash, name) then
send(msg.chat_id_, msg.id_, 1, "☑┇  الكلمه{  " .. name .. "  }\n👥┇  تم الغاء منعها", 1, "md")
redis:hdel(KING..hash, name)
end end
-------------------USERS----------------------------------------------------
if text == 'المشتركين' or text == 'عدد المشتركين' and is_devzain(msg) then
local users = redis:scard(KING.."bot:userss")
local botnamess = redis:get(KING.."Kingnams") or "الملك"
send(msg.chat_id_, msg.id_, 1, "*- عدد المشتركين في الخاص»* 👇🏾\n🤖┇ اسم البوت » *" .. botnamess .. "*\n🚫┇ عدد المشتركين » *("..users..")* مشترك\n‏", 1,"md")
end
----------------------------------------------------------------------------
if text == 'روابط الكروبات' or text == 'روابط المجموعات' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local get_me = function(extra, result)
local num = (redis:scard(KING.."bot:groups"))
local list = redis:smembers(KING.."bot:groups")
local text = "~ All_Groups_Bots \n\n"
for k,v in pairs(list) do
local GroupsOwner = redis:scard(KING.."bot:owners:"..v) or 0
local GroupsMod = redis:scard(KING.."bot:momod:"..v) or 0
local Groupslink = redis:get(KING.."bot:group:link" ..v)
if result.first_name_ then
if #result.first_name_ < 35 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
text = text..k.."\n📌» Group ID  : [ "..v.." ]\n🔱» Group Link : [ "..(Groupslink or "Not Found").." ]\n🗯» Group Owners  : [ "..GroupsOwner.." ]\n🎟» Group Momods : [ "..GroupsMod.." ] \n---------------------------------------------------\n"
end
local file = io.open('Groups_Bot.txt', 'w')
file:write(text)
file:close()
local token_files = 'https://api.telegram.org/bot' .. KING_TOKEN .. '/sendDocument'
local token_filess = 'curl "' .. token_files .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'Groups_Bot.txt' .. '"'
io.popen(token_filess)
send(msg.chat_id_, msg.id_, 1, '🔚┇ اهلا » *'..result.first_name_..'*\n🔰┇ جاري ارسال نسخه للمجموعات \n☑┇ تحتوي على *('..num..')* مجموعه\n‏┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉', 1, 'md')
sleep(1.5)
send(msg.chat_id_, msg.id_, 1, token_filess, 1, 'md')
end
getUser(msg.sender_user_id_, get_me)
end
end
-----------------------------------------------------------------------------------
if text == "فحص" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local botnamess = redis:get(KING.."Kingnams") or "الملك"
local kpSudos1 = redis:scard(KING.."Bot:KpSudos") or "0"
local kpAdmins = redis:scard(KING.."Bot:Admins") or "0"
local kpgban = redis:scard(KING.."bot:gban:") or "0"
local kpvipmems = redis:scard(KING.."bot:vipmems:") or "0"
local kpgps = redis:scard(KING.."bot:groups") or "0"
local kpusers = redis:scard(KING.."bot:userss") or "0"
send(msg.chat_id_, msg.id_, 1, "*- احصائيات البـــــوت ←*\n* -------------------»*\n🤖┇اسم البوت ← *" .. botnamess .. "*\n🔘┇عدد المطورين ← *"..kpSudos1.."*\n🔘┇عدد الادمنيه ← *"..kpAdmins.."*\n🔘┇عدد الكروبات ← * "..kpgps.."*\n🔘┇عدد المشتركين خاص ← *" .. kpusers .. "*\n🔘┇عدد المحظورين عام ← *"..kpgban.."*\n🔘┇عدد المميزين عام ← * "..kpvipmems.."*\n📡┇قناة السورس ← [King](t.me/King)\n✓", 1,"md")
end
end
------------------GPS AND USERS-------------------------------------------
if text:match("^المجموعات$") or text:match("^الاحصائيات$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
local gps = redis:scard(KING.."bot:groups")
local users = redis:scard(KING.."bot:userss")
send(msg.chat_id_, msg.id_, 1, "الاحصائيات :📈 \n\n👥┇ عدد الكروبات المفعله : *"..gps.."*\n👤┇ عدد المشتركين : *"..users.."* في البوت\n", 1, 'md')
end
-----------------------bc--------------------------------------------------------
if text == 'اذاعه بالرد' and tonumber(msg.reply_to_message_id_) > 0 then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
function cb(a,b,c)
local text = b.content_.text_
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
local msgs = {
[0] = id
}
for i = 1, #gpss do
send(gpss[i], 0, 1, text, 1, "md")
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم نشر رسالتك  في\n` " .. gps .. "` مجموعــه  ", 1, "md")
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
end
end
------------------------fwd --------------------------------------------------------
if text == 'توجيه بالرد' and tonumber(msg.reply_to_message_id_) > 0 then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
function cb(a,b,c)
local gps = redis:scard(KING.."bot:groups") or 0
local gpss = redis:smembers(KING.."bot:groups") or 0
for k,v in pairs(gpss) do
forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم نشر رسالتك  في\n` " .. gps .. "` مجموعــه  ", 1, "md")
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
end
end
-----------------------bc user-------------------------------------------------------
if text == 'اذاعه خاص' and tonumber(msg.reply_to_message_id_) > 0 then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
function cb(a,b,c)
local text = b.content_.text_
local users = redis:scard(KING.."bot:userss") or 0
local userss = redis:smembers(KING.."bot:userss") or 0
local msgs = {
[0] = id
}
for i = 1, #userss do
send(userss[i], 0, 1, text, 1, "md")
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم ارسال الرساله الى\n*(" .. users .. ")* مشترك   ", 1, "md")
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
end
end
------------------------fwd  user--------------------------------------------------------
if text == 'توجيه خاص' and tonumber(msg.reply_to_message_id_) > 0 then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
function cb(a,b,c)
local users = redis:scard(KING.."bot:userss") or 0
local userss = redis:smembers(KING.."bot:userss") or 0
for k,v in pairs(userss) do
forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم توجيه الرساله الى\n*(" .. users .. ")* مشترك   ", 1, "md")
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
end
end
----------------LOCK FOSHN--------------------------------------------------
if text:match("كس") or text:match("طيز") or text:match("ديس") or text:match("زب") or text:match("انيجمك") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("اخ الكحبه") or text:match("اخو الكحبه") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("عير بطيزك") or text:match("كس امك") or text:match("امك الكحبه") or text:match("عيرك") or text:match("عير بيك") or text:match("صرمك") and is_momod(msg.sender_user_id_, msg.chat_id_) then
if redis:get(KING.."ffosh"..msg.chat_id_) and not is_momod(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end end
--------------RETBA----------------------------------------------------
if text == "الرتبه" and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
if result.id_ then
if tonumber(result.sender_user_id_) == tonumber(Kp_Owner) then
King3 = "مطور الاساسـي 👨‍🔧"
elseif is_sudoid(result.sender_user_id_) then
King3 = "المطور 👨‍💻"
elseif is_admin(result.sender_user_id_) then
King3 = "ادمن في البوت 🕵️‍♂️"
elseif is_vipmems(result.sender_user_id_) then
King3 = "مميز عام 👨‍🚒"
elseif is_monshi(result.sender_user_id_, msg.chat_id_) then
King3 = "منشئ الكروب 👨‍✈️"
elseif is_owner(result.sender_user_id_, msg.chat_id_) then
King3 = "المدير 👮‍♂️"
elseif is_momod(result.sender_user_id_, msg.chat_id_) then
King3 = "ادمن المجموعه 👨‍🎤"
elseif is_vipmem(result.sender_user_id_, msg.chat_id_) then
King3 = "عضو مميز 🧛‍♂️"
else
King3 = "عـضـو 🤵"
end
end
send(msg.chat_id_, msg.id_, 1, "👨‍✈️┇ الرتبهہ‌‏ » (*"..King3.."*) \n‏" , 1, "md")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
end
----------------LINK DELETE---------------------------------------------------
if text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^اريد رابط الحذف$") or  text:match("^رايد احذف حسابي$") or text:match("^اريد رابط حذف$") then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local text =  [[
╗ » رابط الحذف 🔎
╣ » فكر قبل كولشي❗️
╝ » [هذا الرابط...](https://telegram.org/deactivate)
‏
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end
------------------SOURCE KING---------------------------------------------------
if text:match("^سورس$") or text:match("^السورس$") or text:match("^مطور السورس$") or text:match("^ياسورس$") or  text:match("^سورس الملك$") or text:match("^اريد سورس$") then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local text =  [[
📮┊ا𝗛𝗶 𝘁𝗵𝗲𝗿𝗲 ♾
𝗧𝗵𝗶𝘀 𝘀𝗼𝘂𝗿𝗰𝗲 𝗶𝘀 𝗻𝗼𝘁 𝗽𝗼𝘀𝘀𝗶𝗯𝗹𝗲 𝗳𝗼𝗿 𝗮𝗻𝘆 𝗽𝗲𝗿𝘀𝗼𝗻 𝘆𝗼𝘂 𝗰𝗮𝗻 𝗰𝗼𝗻𝘁𝗮𝗰𝘁 𝘄𝗶𝘁𝗵 𝘂𝘀 
𝗕𝘆 :

 👨🏻‍💻 [BESO](https://telegram.me/@Jll_Il) 

 📡  [BESO CH](https://telegram.me/BS100K) 

]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end
-------------helps--------------------------------------------------------------------------
if text:match("^الاوامر$")  then
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👥┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local text = [[
📌┇*هناكـ {6} اوامر لعرضها*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔐┇م1  ← آوآمر آلحمايه 

📍┇م2 ← آوآمر المدراء

📝┇م3 ← آوآمر آلآدمنيه

🔘┇م4 ← آوآمر ثانويه

🔧┇م5 ← اوآمر مطور اساسي

🔰┇م6 ← آوآمر بالتقييد 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍💻┇*مطور البوت* : []] .. UserKing .. [[] ‌‏]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end end end
---------------------------------------------------------------------------------------
if text:match("^م1$")  then
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👥┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local text = [[
👨‍🔧┇ *آوامر حمايهہ‌‏ المجموعهہ‌‏*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
🔒 - *استخدم ( قفل + الامر )*
🔓 - *استخدم ( فتح + الامر )*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
🔐┇الروابط             
🔐┇الدردشه
🔐┇الصور               
🔐┇الفيديو
🔐┇المتحركه          
🔐┇التعديل 
🔐┇الاوامر              
🔐┇المواقع
🔐┇البوتات             
🔐┇التثبيت
🔐┇التوجيه           
🔐┇العربيه
🔐┇التكرار              
🔐┇الانكليزيه
🔐┇المعرف             
🔐┇الاشعارات 
🔐┇الصوت              
🔐┇الاغاني
🔐┇الاتصال             
🔐┇السلفي
🔐┇الفشار               
🔐┇الويب
🔐┇البوتات بالطرد
🔐┇الانضمام
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍💻┇*مطور البوت* : []] .. UserKing .. [[] ‌‏]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end  end end end
if text:match("^م2$")  then
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👥┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local text = [[
📍┇*اوامر المنشئين والمدراء*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
📌┇تفعيل / تعطيل
♦️┇اسم البوت + غادر
♦️┇رفع منشئ / تنزيل منشئ
♦️┇رفع ادمن  / تنزيل ادمن
👥┇المنشئين 

♦️┇الردود 
♦️┇اضف رد
♦️┇مسح رد 
♦️┇قائمه المنع

🗑┇مسح المنشئين 
🗑┇مسح الادمنيه
🗑┇مسح المكتومين
🗑┇مسح المحظورين
🗑┇مسح المميزين 
🗑┇مسح قائمه العام

🖼┇تفعيل الايدي بالصوره
🚸┇تعطيل الايدي بالصوره

⚙┇تفعيل  / تعطيل الملصقات
⚙┇تفعيل  / تعطيل التثبيت
⚙┇تفعيل / تعطيل الردود 
⚙┇تفعيل / تعطيل اطردني

📮┇رفع ادمن بالتفاعل + العدد 
📮┇رفع مميز بالتفاعل + العدد 

📮┇تفعيل / تعطيل رفع الادمن
📮┇تفعيل / تعطيل رفع المميز
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍💻┇*مطور البوت* : []] .. UserKing .. [[] ‌‏]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end end end
if text:match("^م3$")  then
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👥┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local text = [[
📮┇ *آوآمر آلادمنيهہ‌‏*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚫┇كتم  رد , معرف ، ايدي 
🚫┇حظر  رد , معرف ، ايدي 
🚫┇تقييد  رد , معرف ، ايدي 

⛔️┇الغاء كتم  رد , معرف ، ايدي 
⛔️┇الغاء حظر  رد , معرف ، ايدي 
⛔️┇الغاء تقييد  رد , معرف ، ايدي 

📍┇المقيدين 
📍┇المكتومين  
📍┇المحظورين 
📍┇الردود 

🗑┇مسح المكتومين  
🗑┇مسح المحظورين 
🗑┇مسح المقيدين 
🗑┇مسح البوتات 

📜┇اضف رد + الكلمه 
🗑┇حذف رد + الكلمه 


📃┇الاعدادات 
🗒┇اعدادات التقييد

🔏┇منع كلمه / الغاء منع الكلمه 

📮┇تعطيل / تفعيل الردود 
📮┇تعطيل / تفعيل التقييد 

📝┇وضع رابط / الرابط 
📝┇حذف الرابط 
📝┇مسح الصورة

🗑┇حذف / مسح بالرد
🚸┇رفع القيود (ايدي،معرف،رد)

♦️┇ضع ترحيب + نص 
♦️┇ضع قوانين / القوانين

♦️┇ضع تكرار بالطرد / بالمسح
♦️┇ضع تحذير بالكتم / بالطرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍💻┇*مطور البوت* : []] .. UserKing .. [[] ‌‏]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end end end
if text:match("^م4$")  then
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👥┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local text = [[
🔘┇*آوامر الأعضاء*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🌄┇ صوره + العدد

📚┇موقعي

💌┇رسائلي
📞┇جهاتي
🔊┇تفاعلي
🚷┇اطردني

♦️┇ايدي ( رد , ايدي , معرف )
♦️┇الرتبه ( رد , ايدي , معرف )

📌┇كول + الكلمه 
📌┇الرابط / المطور
📌┇اسم البوت + هينه / رزله
📌┇اسم البوت + بوسه / مصه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍💻┇*مطور البوت* : []] .. UserKing .. [[] ‌‏]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end end end
if text:match("^م5$")  then
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_devzain(msg)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local text = [[
🛠┇*اوامر المطور الاساسي*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📟 ┇تحديث السورس 
🗂 ┇تحديث / لتحديث الملفات

🔝┇تفعيل / تعطيل البوت خدمي 
🔘┇تفعيل / تعطيل الاشتراك الاجباري 
📡┇تعين قناة الاشتراك 

📢┇*آوامر الاذاعة*

♦️┇آذاعه (اذاعة للكل) 
♦️┇توجيه او توجيه بالرد
♦️┇اذاعه خاص + النص 
♦️┇وضع اسم البوت

🗑┇تنظيف المجموعات
🗑┇تنظيف المشتركين

📎┇ضع كليشه ستارت
📝┇ضع كليشه المطور
📉┇الاحصائيات
👥┇المشتركين

👨‍🔧┇رفع مطور / تنزيل مطور
👩‍🚒┇رفع مميز عام / تنزيل مميز عام
👨‍💻┇المطورين 
🗑┇مسح المطورين 

🚫┇حظر / الغاء حظر
🚫┇حظر عام / الغاء حظر عام
📛┇المحظورين عام 
🗑┇مسح المحظورين عام
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍💻┇*مطور البوت* : []] .. UserKing .. [[] ‌‏]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end end end
if text:match("^م6$")  then
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👥┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local text = [[
📖┇*اوامر الحماية بالتقييد*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔘 - *قفل + الامر بالتقييد*
🔘 - *فتح + الامر بالتقييد*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔰┇الروابط             
🔰┇البوتات
🔰┇الفيديو             
🔰┇الجهات
🔰┇الصور               
🔰┇الهاشتاك
🔰┇الفايلات             
🔰┇الدردشه
🔰┇المتحركه            
🔰┇العربيه 
🔰┇الصوت               
🔰┇الانكليزيه
🔰┇الفشار                
🔰┇الملصقات 
🔰┇الاغاني               
🔰┇التوجيه 
🔰┇الماركدون           
🔰┇المعرف 
🔰┇الكل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
👨‍💻┇*مطور البوت* : []] .. UserKing .. [[] ‌‏]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end  end end end
-------------------set welcome-------------------------------------------------------------
if text:match('^وضع ترحيب (.*)') and is_momod(msg.sender_user_id_, msg.chat_id_) then
local welcome = text:match('^وضع ترحيب (.*)')
redis:set(KING..'welcome:'..msg.chat_id_,welcome)
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم وضع الترحيب\n ✓ ", 1, 'md')
end
-----------------welcome------------------------------------------
if text:match("^الترحيب$") and is_momod(msg.sender_user_id_, msg.chat_id_) then
local wel = redis:get(KING..'welcome:'..msg.chat_id_)
if wel then
send(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚫┇ لم يتم وضع الترحيب ❗️', 1, 'md')
end end
-----------------broadcast1 or broadcast2------------------------------------------------------------------------------------------
if text:match("^توجيه$") then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
redis:setex(KING.."broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسل لي الرساله الان📲\n🚫┇ للخروج ارسل لي الغاء  ", 1, "md")
end end end
if text:match("^اذاعه$") then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
redis:setex(KING.."broadcast2" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
send(msg.chat_id_, msg.id_, 1, "☑┇  ارسل لي الرساله الان📲\n🚫┇ للخروج ارسل لي الغاء  ", 1, "md")
end end end
----------------- info bot --------------------------------------------------------------
if is_sudo(msg) and (text:match("^اعدادات البوت$") or text:match("^معلومات البوت$")) then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local gps = redis:scard(KING.."bot:groups")
local users = redis:scard(KING.."bot:userss")
local allmgs = redis:get(KING.."bot:allmsgs")
if redis:get(KING.."autoleave") == "On" then
autoleaveAR = "مفعل"
elseif redis:get(KING.."autoleave") == "Off" then
autoleaveAR = "معطل"
elseif not redis:get(KING.."autoleave") then
autoleaveAR = "معطل"
end
if redis:get(KING.."joinbylink") == "On" then
joinbylinkAR = "مفعل"
elseif redis:get(KING.."joinbylink") == "Off" then
joinbylinkAR = "معطل"
elseif not redis:get(KING.."joinbylink") then
joinbylinkAR = "معطل"
end
local cm = io.popen("uptime -p"):read("*all")
local ResultUptimeServer = GetUptimeServer(cm, lang)
if 4 > string.len(ResultUptimeServer) then
if lang == "Ar" then
ResultUptimeServer = "تم التحديث ☑"
end
end
Uptime_1 = redis:get(KING.."bot:Uptime")
local osTime = os.time()
Uptime_ = osTime - tonumber(Uptime_1)
Uptime = getTimeUptime(Uptime_, lang)
usersv = io.popen("whoami"):read("*all")
usersv = usersv:match("%S+")
send(msg.chat_id_, msg.id_, 1, "*- معلومات حول البوت 👇🏾*\n⚙️┇ المجموعات ← *" .. gps .. "*\n📨┇ رسائل البوت  ← *" .. allmgs .. "*\n👥┇ عدد المشتركين ← *"..users.."*\n📎┇  الانضمام عبر الرابط ← " .. joinbylinkAR .. "\n*☜معلومات السيرفر☞ ←*\n🎟┇ اليوزر ← *" .. usersv .. "*\n⏰┇ وقت التشغيل ← 👇🏻\n←←← *" .. ResultUptimeServer .. "* ❗️\n‏\n" , 1, "md")
end end
--------------------------------------------------------------------------------------------------------------
if text == 'السيرفر' and is_devzain(msg) then
local cm = io.popen("uptime -p"):read("*all")
local ResultUptimeServer = GetUptimeServer(cm, lang)
if 4 > string.len(ResultUptimeServer) then
if lang == "Ar" then
ResultUptimeServer = "تم التحديث ☑"
end
end
Uptime_1 = redis:get(KING.."bot:Uptime")
local osTime = os.time()
Uptime_ = osTime - tonumber(Uptime_1)
Uptime = getTimeUptime(Uptime_, lang)
usersv = io.popen("whoami"):read("*all")
usersv = usersv:match("%S+")
send(msg.chat_id_, msg.id_, 1, "*وقت تشغيل البوت ←*\n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n©┇ اليوزر ← *" .. usersv .. "*\n⏰┇ وقت التشغيل ← 👇\n🔑┇←←← *" .. ResultUptimeServer .. "*\n‏" , 1, "md")
end
----------------LOCK HELPS-----------------------------------------------------------------------------------------------
if text:match("^قفل (.*)$")  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local lockKing = {string.match(text, "^(قفل) (.*)$")}
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
if lockKing[2] == "التعديل" then
if not redis:get(KING.."editmsg" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "✏┇ تم قفل التعديل \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "✏┇ التعديل مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING..'editmsg'..msg.chat_id_,'delmsg')
end
if lockKing[2] == "الاوامر" then
if not redis:get(KING.."bot:cmds" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📮┇ تم قفل الاوامر \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📮┇ الاوامر مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:cmds" .. msg.chat_id_, true)
end
if lockKing[2] == "البوتات" then
if not redis:get(KING.."bot:bots:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🤖┇ تم قفل البوتات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🤖┇ البوتات مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:bots:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "البوتات بالطرد" then
if not redis:get(KING.."bot:botskick" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🧟‍♂️┇ تم قفل البوتات بالطرد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🧟‍♂️┇البوتات بالطرد مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:botskick" .. msg.chat_id_, true)
end
if lockKing[2] == "التكرار" then
if not redis:get(KING.."anti-flood:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم قفل التكرار \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔖┇ التكرار مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."anti-flood:" .. msg.chat_id_, true)
end
if lockKing[2] == "التثبيت" then
if not redis:get(KING.."bot:pin:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📌┇ تم قفل التثبيت \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📌┇ التثبيت مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:pin:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الكل" then
if not redis:get(KING.."bot:muteall" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "⏳┇ تم قفل الكل \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "⏳┇ الكل مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:bots:mute" .. msg.chat_id_, true)
redis:set(KING.."anti-flood:" .. msg.chat_id_, true)
redis:set(KING.."bot:photo:mute" .. msg.chat_id_, true)
redis:set(KING.."bot:video:mute" .. msg.chat_id_, true)
redis:set(KING.."bot:selfvideo:mute" .. msg.chat_id_, true)
redis:set(KING.."bot:document:mute" .. msg.chat_id_, true)
redis:set(KING.."markdown:lock" .. msg.chat_id_, true)
redis:set(KING.."bot:gifs:mute" .. msg.chat_id_, true)
redis:set(KING.."bot:music:mute" .. msg.chat_id_, true)
redis:set(KING.."bot:voice:mute" .. msg.chat_id_, true)
redis:set(KING.."tags:lock" .. msg.chat_id_, true)
redis:set(KING.."bot:contact:mute" .. msg.chat_id_, true)
redis:set(KING.."bot:tgservice:mute" .. msg.chat_id_, true)
redis:set(KING.."bot:forward:mute" .. msg.chat_id_, true)
redis:set(KING.."ffosh"..msg.chat_id_, true)
end
if lockKing[2] == "الدردشه" then
if not redis:get(KING.."bot:text:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "⌨┇ تم قفل الدردشه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "⌨┇ الدردشه مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:text:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الصور" then
if not redis:get(KING.."bot:photo:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🖼┇ تم قفل الصور \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🖼┇ الصور مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:photo:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "المشاركه" then
if not redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🚸┇ تم قفل المشاركه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🚸┇ المشاركه مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:duplipost:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الكلايش" then
if not redis:get(KING.."bot:spam:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "📑┇ تم قفل الكلايش \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "📑┇ الكلايش مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:spam:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الفيديو" then
if not redis:get(KING.."bot:video:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🎥┇ تم قفل الفيديو \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🎥┇ الفيديو مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:video:mute" .. msg.chat_id_, true)
end

if lockKing[2] == "السيلفي" then
if not redis:get(KING.."bot:selfvideo:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📸┇ تم قفل السيلفي \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📸┇ السيلفي مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:selfvideo:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الملفات" then
if not redis:get(KING.."bot:document:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗂┇ تم قفل الملفات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗂┇ الملفات مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:document:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الانلاين" then
if not redis:get(KING.."bot:inline:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🛰┇ تم قفل الانلاين \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🛰┇ الانلاين مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:inline:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "البوست" then
if not redis:get(KING.."post:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📋┇ تم قفل البوست \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📋┇ البوست مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."post:lock" .. msg.chat_id_, true)
end
if lockKing[2] == "الماركدون" then
if not redis:get(KING.."markdown:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📍┇ تم قفل الماركدون \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📍┇ الماركدون مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."markdown:lock" .. msg.chat_id_, true)
end
if lockKing[2] == "المتحركه" then
if not redis:get(KING.."bot:gifs:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🖥┇ تم قفل المتحركه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🖥┇ المتحركه مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:gifs:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الاغاني" then
if not redis:get(KING.."bot:music:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🎵┇ تم قفل الاغاني \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🎵┇ الاغاني مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:music:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الصوت" then
if not redis:get(KING.."bot:voice:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔊┇ تم قفل الصوت \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔊┇ الصوت مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:voice:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الروابط" then
if not redis:get(KING.."bot:links:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📎┇ تم قفل الروابط \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📎┇ الروابط مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:links:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "المواقع" then
if not redis:get(KING.."bot:location:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🌏┇ تم قفل المواقع \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🌏┇ المواقع مقفوله بالتأكيد \n💥┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:location:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "التاك" then
if not redis:get(KING.."tags:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "♾┇ تم قفل التاك \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "♾┇ التاك مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."tags:lock" .. msg.chat_id_, true)
end
if lockKing[2] == "المعرف" then
if not redis:get(KING.."tags:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "©┇ تم قفل المعرف \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "©┇ المعرف مقفول بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."tags:lock" .. msg.chat_id_, true)
end
if lockKing[2] == "الهاشتاك" then
if not redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "⛓┇ تم قفل الهاشتاك \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "⛓┇ الهاشتاك مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:hashtag:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الجهات" then
if not redis:get(KING.."bot:contact:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📞┇ تم قفل الجهات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📞┇ الجهات مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:contact:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الويب" then
if not redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🌐┇ تم قفل الويب \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🌐┇ الويب مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:webpage:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "العربيه" then
if not redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗓┇ تم قفل العربيه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗓┇ العربيه مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:arabic:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الانضمام" then
if not redis:get(KING.."bot:member:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📥┇ تم قفل الانضمام \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📥┇ الانضمام مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:member:lock" .. msg.chat_id_, true)
end
if lockKing[2] == "الانكليزيه" then
if not redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔠┇ تم قفل الانكليزي \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔠┇ الانكليزيه مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:english:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الاشعارات" then
if not redis:get(KING.."bot:tgservice:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔆┇ تم قفل الاشعارات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔆┇ الاشعارات مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:tgservice:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "الملصقات" then
if not redis:get(KING.."bot:sticker:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗺┇ تم قفل الملصقات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗺┇ الملصقات مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:sticker:mute" .. msg.chat_id_, true)
end
if lockKing[2] == "التوجيه" then
if not redis:get(KING.."bot:forward:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "↪┇ تم قفل التوجيه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "↪┇ التوجيه مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."bot:forward:mute" .. msg.chat_id_, true)
end 
if lockKing[2] == "الفشار" then
if not redis:get(KING.."ffosh" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔞┇ تم قفل الفشار \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔞┇ الفشار مقفوله بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."ffosh"..msg.chat_id_, true)
end 
end
end 
end
-----------UN LOCK HELPS--------------------------------------------------------------------------------------------------------------
if text:match("^فتح (.*)$")  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local UNKing = { string.match(text, "^(فتح) (.*)$") }
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
if UNKing[2] == "التعديل" then
if redis:get(KING.."editmsg" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "✏┇ تم فتح التعديل \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
redis:del(KING.."editmsg" .. msg.chat_id_)
else
send(msg.chat_id_, msg.id_, 1, "✏┇ التعديل مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
end
if UNKing[2] == "الاوامر" then
if redis:get(KING.."bot:cmds" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📮┇ تم فتح الاوامر \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📮┇ الاوامر مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:cmds" .. msg.chat_id_)
end
if UNKing[2] == "البوتات" then
if redis:get(KING.."bot:bots:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🤖┇ تم فتح البوتات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🤖┇ البوتات مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:bots:mute" .. msg.chat_id_)
end
if UNKing[2] == "البوتات بالطرد" then
if redis:get(KING.."bot:botskick" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🧟‍♂️┇ تم فتح البوتات بالطرد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🧟‍♂️┇ البوتات بالطرد مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:botskick" .. msg.chat_id_)
end
if UNKing[2] == "التكرار" then
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم فتح التكرار \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔖┇ التكرار مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."anti-flood:" .. msg.chat_id_)
end
if UNKing[2] == "التثبيت" then
if redis:get(KING.."bot:pin:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📌┇ تم فتح التثبيت \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📌┇ التثبيت مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:pin:mute" .. msg.chat_id_)
end
if UNKing[2] == "الكل" then
if redis:get(KING.."bot:muteall" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "⏳┇ تم فتح الكل \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "⏳┇ الكل مفتوحه بالتأكيد\n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:bots:mute" .. msg.chat_id_)
redis:del(KING.."anti-flood:" .. msg.chat_id_)
redis:del(KING.."bot:photo:mute" .. msg.chat_id_)
redis:del(KING.."bot:video:mute" .. msg.chat_id_)
redis:del(KING.."bot:selfvideo:mute" .. msg.chat_id_)
redis:del(KING.."bot:document:mute" .. msg.chat_id_)
redis:del(KING.."markdown:lock" .. msg.chat_id_)
redis:del(KING.."bot:gifs:mute" .. msg.chat_id_)
redis:del(KING.."bot:music:mute" .. msg.chat_id_)
redis:del(KING.."bot:voice:mute" .. msg.chat_id_)
redis:del(KING.."tags:lock" .. msg.chat_id_)
redis:del(KING.."bot:contact:mute" .. msg.chat_id_)
redis:del(KING.."bot:tgservice:mute" .. msg.chat_id_)
redis:del(KING.."bot:forward:mute" .. msg.chat_id_)
redis:del(KING.."ffosh"..msg.chat_id_)
end
if UNKing[2] == "الدردشه" then
if redis:get(KING.."bot:text:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "⌨┇ تم فتح الدردشه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "⌨┇ الدردشه مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:text:mute" .. msg.chat_id_)
end
if UNKing[2] == "الصور" then
if redis:get(KING.."bot:photo:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🖼┇ تم فتح الصور \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🖼┇ الصور مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:photo:mute" .. msg.chat_id_)
end
if UNKing[2] == "المشاركه" then
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🚸┇ تم فتح المشاركه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🚸┇ المشاركه مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:duplipost:mute" .. msg.chat_id_)
end
if UNKing[2] == "الكلايش" then
if redis:get(KING.."bot:spam:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "📑┇ تم فتح الكلايش \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "📑┇ الكلايش مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:spam:mute" .. msg.chat_id_)
end
if UNKing[2] == "الفيديو" then
if redis:get(KING.."bot:video:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🎥┇ تم فتح الفيديو \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🎥┇ الفيديو مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:video:mute" .. msg.chat_id_)
end
if UNKing[2] == "السيلفي" then
if redis:get(KING.."bot:selfvideo:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📸┇ تم فتح السيلفي \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📸┇ السيلفي مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:selfvideo:mute" .. msg.chat_id_)
end
if UNKing[2] == "الملفات" then
if redis:get(KING.."bot:document:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗂┇ تم فتح الملفات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗂┇ الملفات مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:document:mute" .. msg.chat_id_)
end
if UNKing[2] == "الانلاين" then
if redis:get(KING.."bot:inline:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🛰┇ تم فتح الانلاين \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🛰┇ الانلاين مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:inline:mute" .. msg.chat_id_)
end
if UNKing[2] == "البوست" then
if redis:get(KING.."post:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📋┇ تم فتح البوست \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")            
else
send(msg.chat_id_, msg.id_, 1, "📋┇ البوست مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."post:lock" .. msg.chat_id_)
end
if UNKing[2] == "الماركدون" then
if redis:get(KING.."markdown:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📍┇ تم فتح الماركدون \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📍┇ الماركدون مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."markdown:lock" .. msg.chat_id_)
end
if UNKing[2] == "المتحركه" then
if redis:get(KING.."bot:gifs:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🖥┇ تم فتح المتحركه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🖥┇ المتحركه مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:gifs:mute" .. msg.chat_id_)
end
if UNKing[2] == "الاغاني" then
if redis:get(KING.."bot:music:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🎵┇ تم فتح الاغاني \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🎵┇ الاغاني مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:music:mute" .. msg.chat_id_)
end
if UNKing[2] == "الصوت" then
if redis:get(KING.."bot:voice:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔊┇ تم فتح الصوت \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔊┇ الصوت مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:voice:mute" .. msg.chat_id_)
end
if UNKing[2] == "الروابط" then
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📎┇ تم فتح الروابط \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📎┇ الروابط مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:links:mute" .. msg.chat_id_)
end
if UNKing[2] == "المواقع" then
if redis:get(KING.."bot:location:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🌏┇ تم فتح المواقع \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🌏┇ المواقع مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:location:mute" .. msg.chat_id_)
end
if UNKing[2] == "التاك" then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "♾┇ تم فتح التاك \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "♾┇ التاك مفتوح بالتأكيد\n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."tags:lock" .. msg.chat_id_)
end
if UNKing[2] == "المعرف" then
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "©┇ تم فتح المعرف \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "©┇ المعرف مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."tags:lock" .. msg.chat_id_)
end
if UNKing[2] == "الهاشتاك" then
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "⛓┇ تم فتح الهاشتاك \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "⛓┇ الهاشتاك مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:hashtag:mute" .. msg.chat_id_)
end
if UNKing[2] == "الجهات" then
if redis:get(KING.."bot:contact:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📞┇ تم فتح الجهات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📞┇ لجهات مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:contact:mute" .. msg.chat_id_)
end
if UNKing[2] == "الويب" then
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🌐┇ تم فتح الويب \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🌐┇ الويب مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:webpage:mute" .. msg.chat_id_)
end
if UNKing[2] == "العربيه" then
if redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📝┇ تم فتح العربيه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📝┇ العربيه مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:arabic:mute" .. msg.chat_id_)
end
if UNKing[2] == "الانضمام" then
if redis:get(KING.."bot:member:lock" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📥┇ تم فتح الانضمام \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📥┇ الانضمام مفتوح بالتأكيد\n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:member:lock" .. msg.chat_id_)
end
if UNKing[2] == "الانكليزيه" then
if redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔠┇ تم فتح الانكليزي \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔠┇ الانكليزيه مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:english:mute" .. msg.chat_id_)
end
if UNKing[2] == "الاشعارات" then
if redis:get(KING.."bot:tgservice:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔆┇ تم فتح الاشعارات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔆┇ الاشعارات مفتوحه بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
redis:del(KING.."bot:tgservice:mute" .. msg.chat_id_)
end end
if UNKing[2] == "الملصقات" then
if redis:get(KING.."bot:sticker:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "💥┇ تم فتح الملصقات \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🎭┇ الملصقات مفتوحه بالتأكيد\n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:sticker:mute" .. msg.chat_id_)
end
if UNKing[2] == "التوجيه" then
if redis:get(KING.."bot:forward:mute" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "↪┇ تم فتح التوجيه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "↪┇ التوجيه مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."bot:forward:mute" .. msg.chat_id_)
end 
if UNKing[2] == "الفشار" then
if redis:get(KING.."ffosh"..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔞┇ تم فتح الفشار \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔞┇ الفشار مفتوح بالتأكيد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."ffosh"..msg.chat_id_)
end
end 
end 
end
--------------------------------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الدردشه بالتقييد" then
if not redis:get(KING.."keed_text" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "⌨┇ تم قفل الدردشه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "⌨┇ الدردشه بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_text" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الصور بالتقييد" then
if not redis:get(KING.."keed_photo" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🖼┇ تم قفل الصور بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🖼┇ الصور بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_photo" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الفيديو بالتقييد" then
if not redis:get(KING.."keed_video" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🎥┇ تم قفل الفيديو بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🎥┇ الفيديو بالتقييد مقفول \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_video" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الملفات بالتقييد" then
if not redis:get(KING.."keed_Document" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗂┇ تم قفل الملفات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗂┇ الملفات بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_Document" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الماركدون بالتقييد" then
if not redis:get(KING.."keed_markdon" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "┇ تم قفل الماركدون بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "┇ الماركدون بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_markdon" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل المتحركه بالتقييد" then
if not redis:get(KING.."keed_gif" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🖥┇ تم قفل المتحركه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🖥┇ المتحركه بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_gif" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الاغاني بالتقييد" then
if not redis:get(KING.."keed_audio" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🎵┇ تم قفل الاغاني بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "💥┇ الاغاني بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_audio" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الصوت بالتقييد" then
if not redis:get(KING.."keed_voice" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔊┇ تم قفل الصوت بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔊┇ الصوت بالتقييد مقفول \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_voice" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الروابط بالتقييد" then
if not redis:get(KING.."keed_link" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📎┇ تم قفل الروابط بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📎┇ الروابط بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_link" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل التاك بالتقييد" then
if not redis:get(KING.."keed_user" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "♾┇ تم قفل التاك بالتقييد \n🎟┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "♾┇ التاك بالتقييد مقفول \n🎟┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_user" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل المعرف بالتقييد" then
if not redis:get(KING.."keed_user" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "©┇ تم قفل المعرف بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "©┇ المعرف بالتقييد مقفول \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_user" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الهاشتاك بالتقييد" then
if not redis:get(KING.."keed_hashtag" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "⛓┇ تم قفل الهاشتاك بالتقييد \n💥┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "⛓┇ الهاشتاك بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_hashtag" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الجهات بالتقييد" then
if not redis:get(KING.."keed_contect" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📞┇ تم قفل الجهات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📞┇ الجهات بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_contect" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل العربيه بالتقييد" then
if not redis:get(KING.."keed_arbic" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📝┇ تم قفل العربيه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📝┇العربيه بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_arbic" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الانكليزيه بالتقييد" then
if not redis:get(KING.."keed_english" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔠┇ تم قفل الانكليزي بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔠┇ الانكليزي بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_english" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الملصقات بالتقييد" then
if not redis:get(KING.."keed_stecker" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗺┇ تم قفل الملصقات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗺┇ الملصقات بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."lock_stecker" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل التوجيه بالتقييد" then
if not redis:get(KING.."keed_fwd" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "↪┇ تم قفل التوجيه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "↪┇ التوجيه بالتقييد مقفول \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_fwd" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل البوتات بالتقييد" then
if not redis:get(KING.."keed_bots" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🤖┇ تم قفل البوتات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🤖┇ البوتات بالتقييد مقفوله \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_bots" .. msg.chat_id_, true)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "قفل الفشار بالتقييد" then
if not redis:get(KING.."keed_fosh" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔞┇ تم قفل الفشار بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔞┇ الفشار بالتقييد مقفول \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:set(KING.."keed_fosh" .. msg.chat_id_, true) 
end 
----------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الدردشه بالتقييد" then
if redis:get(KING.."keed_text" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "⌨┇ تم فتح الدردشه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "⌨┇ الدردشه بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_text" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الصور بالتقييد" then
if redis:get(KING.."keed_photo" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🖼┇ تم فتح الصور بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🖼┇ الصور بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_photo" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الفيديو بالتقييد" then
if redis:get(KING.."keed_video" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🎥┇ تم فتح الفيديو بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🎥┇ الفيديو بالتقييد مفتوح \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_video" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الملفات بالتقييد" then
if redis:get(KING.."keed_Document" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗂┇ تم فتح الملفات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗂┇ الملفات بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_Document" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الماركدون بالتقييد" then
if redis:get(KING.."keed_markdon" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📍┇ تم فتح الماركدون بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📍┇ الماركدون بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_markdon" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح المتحركه بالتقييد" then
if redis:get(KING.."keed_gif" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🖥┇ تم فتح المتحركه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🖥┇ المتحركه بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_gif" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الاغاني بالتقييد" then
if redis:get(KING.."keed_audio" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🎵┇ تم فتح الاغاني بالتقييد \n💥┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🎵┇ الاغاني بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_audio" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الصوت بالتقييد" then
if redis:get(KING.."keed_voice" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔊┇ تم فتح الصوت بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔊┇ الصوت بالتقييد مفتوح \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_voice" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الروابط بالتقييد" then
if redis:get(KING.."keed_link" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📎┇ تم فتح الروابط بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📎┇ الروابط بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_link" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح التاك بالتقييد" then
if redis:get(KING.."keed_user" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "♾┇ تم فتح التاك بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "♾┇ التاك بالتقييد مفتوح \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_user" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح المعرف بالتقييد" then
if redis:get(KING.."keed_user" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "©┇ تم فتح المعرف بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "©┇ المعرف بالتقييد مفتوح \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_user" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الهاشتاك بالتقييد" then
if redis:get(KING.."keed_hashtag" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "⛓┇ تم فتح الهاشتاك بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "⛓┇ الهاشتاك بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_hashtag" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الجهات بالتقييد" then
if redis:get(KING.."keed_contect" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📞┇ تم فتح الجهات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "📞┇ الجهات بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_contect" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح العربيه بالتقييد" then
if redis:get(KING.."keed_arbic" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ تم فتح العربيه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "👤┇ العربيه بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_arbic" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الانكليزيه بالتقييد" then
if redis:get(KING.."keed_english" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔠┇ تم فتح الانكليزي بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔠┇ الانكليزي بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_english" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الملصقات بالتقييد" then
if redis:get(KING.."lock_stecker" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🗺┇ تم فتح الملصقات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🗺┇ الملصقات بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."lock_stecker" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح التوجيه بالتقييد" then
if redis:get(KING.."keed_fwd" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "↪┇ تم فتح التوجيه بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "↪┇ التوجيه بالتقييد مفتوح\n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_fwd" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح البوتات بالتقييد" then
if redis:get(KING.."keed_bots" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1,  "🤖┇ تم فتح البوتات بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1,  "🤖┇ البوتات بالتقييد مفتوحه \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_bots" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and text == "فتح الفشار بالتقييد" then
if redis:get(KING.."keed_fosh" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "🔞┇ تم فتح الفشار بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔞┇ الفشار بالتقييد مفتوح \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
redis:del(KING.."keed_fosh" .. msg.chat_id_)
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^قفل الكل بالتقييد"))  then
redis:set(KING.."keed_bots" .. msg.chat_id_,true)
redis:set(KING.."keed_fosh" .. msg.chat_id_, true)
redis:set(KING.."keed_fwd" .. msg.chat_id_,true)
redis:set(KING.."lock_stecker" .. msg.chat_id_,true)
redis:set(KING.."keed_english" .. msg.chat_id_,true)
redis:set(KING.."keed_arbic" .. msg.chat_id_,true)
redis:set(KING.."keed_contect" .. msg.chat_id_,true)
redis:set(KING.."keed_hashtag" .. msg.chat_id_,true)
redis:set(KING.."keed_link" .. msg.chat_id_,true)
redis:set(KING.."keed_voice" .. msg.chat_id_,true)
redis:set(KING.."keed_audio" .. msg.chat_id_,true)
redis:set(KING.."keed_gif" .. msg.chat_id_,true)
redis:set(KING.."keed_markdon" .. msg.chat_id_,true)
redis:set(KING.."keed_Document" .. msg.chat_id_,true)
redis:set(KING.."keed_video" .. msg.chat_id_,true)
redis:set(KING.."keed_photo" .. msg.chat_id_,true)
redis:set(KING.."keed_user" .. msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, "⏳┇ تم قفل الكل بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^فتح الكل بالتقييد"))  then
redis:del(KING.."keed_bots" .. msg.chat_id_)
redis:del(KING.."keed_fosh" .. msg.chat_id_)
redis:del(KING.."keed_fwd" .. msg.chat_id_)
redis:del(KING.."lock_stecker" .. msg.chat_id_)
redis:del(KING.."keed_english" .. msg.chat_id_)
redis:del(KING.."keed_arbic" .. msg.chat_id_)
redis:del(KING.."keed_contect" .. msg.chat_id_)
redis:del(KING.."keed_hashtag" .. msg.chat_id_)
redis:del(KING.."keed_link" .. msg.chat_id_)
redis:del(KING.."keed_voice" .. msg.chat_id_)
redis:del(KING.."keed_audio" .. msg.chat_id_)
redis:del(KING.."keed_gif" .. msg.chat_id_)
redis:del(KING.."keed_markdon" .. msg.chat_id_)
redis:del(KING.."keed_Document" .. msg.chat_id_)
redis:del(KING.."keed_video" .. msg.chat_id_)
redis:del(KING.."keed_photo" .. msg.chat_id_)
redis:del(KING.."keed_user" .. msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "⏳┇ تم فتح الكل بالتقييد \n👤┇ الأمر بواسطه » "..tmKing(msg).."\n ‏ ", 1, "md")
end
----------------------sitting keeds----------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^اعدادات التقييد"))  then
if redis:get(KING.."keed_bots" .. msg.chat_id_) then
keed_bots = "✔"
else
keed_bots = "✖️"
end
if redis:get(KING.."keed_fosh" .. msg.chat_id_) then
keed_fosh = "✔"
else
keed_fosh = "✖️"
end
if redis:get(KING.."keed_fwd" .. msg.chat_id_) then
keed_fwd = "✔"
else
keed_fwd = "✖️"
end
if redis:get(KING.."lock_stecker" .. msg.chat_id_) then
lock_stecker = "✔"
else
lock_stecker = "✖️"
end
if redis:get(KING.."keed_user" .. msg.chat_id_) then
keed_user = "✔"
else
keed_user = "✖️"
end
if redis:get(KING.."keed_english" .. msg.chat_id_) then
keed_english = "✔"
else
keed_english = "✖️"
end
if redis:get(KING.."keed_arbic" .. msg.chat_id_) then
keed_arbic = "✔"
else
keed_arbic = "✖️"
end
if redis:get(KING.."keed_contect" .. msg.chat_id_) then
keed_contect = "✔"
else
keed_contect = "✖️"
end
if redis:get(KING.."keed_hashtag" .. msg.chat_id_) then
keed_hashtag = "✔"
else
keed_hashtag = "✖️"
end
if redis:get(KING.."keed_link" .. msg.chat_id_) then
keed_link = "✔"
else
keed_link = "✖️"
end
if redis:get(KING.."keed_voice" .. msg.chat_id_) then
keed_voice = "✔"
else
keed_voice = "✖️"
end
if redis:get(KING.."keed_audio" .. msg.chat_id_) then
keed_audio = "✔"
else
keed_audio = "✖️"
end
if redis:get(KING.."keed_gif" .. msg.chat_id_) then
keed_gif = "✔"
else
keed_gif = "✖️"
end
if redis:get(KING.."keed_markdon" .. msg.chat_id_) then
keed_markdon = "✔"
else
keed_markdon = "✖️"
end
if redis:get(KING.."keed_Document" .. msg.chat_id_) then
keed_Document = "✔"
else
keed_Document = "✖️"
end
if redis:get(KING.."keed_video" .. msg.chat_id_) then
keed_video = "✔"
else
keed_video = "✖️"
end
if redis:get(KING.."keed_photo" .. msg.chat_id_) then
keed_photo = "✔"
else
keed_photo = "✖️"
end
if redis:get(KING.."keed_text" .. msg.chat_id_) then
keed_text = "✔"
else
keed_text = "✖️"
end
local keed_helps = "- *اعدادات التقييد في المجموعهہ‌‏←*\n\n🔰┇ الروابط بالتقييد     ← "..keed_link.."\n🔰┇ الدردشه بالتقييد   ← "..keed_text.."\n🔰┇ الصور بالتقييد      ← "..keed_photo.."\n🔰┇ الملصقات بالتقييد ← "..lock_stecker.."\n🔰┇ المتحركه بالتقييد  ← "..keed_gif.."\n🔰┇ الفشار بالتقييد     ← "..keed_fosh.."\n🔰┇ الاغاني بالتقييد     ← "..keed_audio.."\n🔰┇ الصوت بالتقييد    ← "..keed_voice.."\n🔰┇ المعرف بالتقييد    ← "..keed_user.."\n🔰┇ الهاشتاك بالتقييد  ← "..keed_hashtag.."\n🔰┇ البوتات بالتقييد     ← "..keed_bots.."\n🔰┇ التوجيه بالتقييد     ← "..keed_fwd.."\n🔰┇ الملفات بالتقييد    ← "..keed_Document.."\n🔰┇ الاتصال بالتقييد     ← "..keed_contect.."\n🔰┇ العربيه بالتقييد      ← "..keed_arbic.."\n🔰┇ الانكليزيه بالتقييد   ← "..keed_english.."\n🔰┇ الفيديو بالتقييد     ← "..keed_video.."\n🔰┇ الماركدون بالتقييد ← "..keed_markdon.."\n\n📡┇ قناة السورس ← [@King]\n ‌‏"
send(msg.chat_id_, msg.id_, 1, keed_helps, 1, "md")
end
----------------------------------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^ضع عدد احرف (%d+)$") then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local sensspam = { string.match(text, "^(ضع عدد احرف) (%d+)$") }
if 40 > tonumber(sensspam[2]) then
send(msg.chat_id_, msg.id_, 1, "◽️┇ قم بوضع عدد من (100-40)❗️ ", 1, "md")
else
redis:set(KING.."bot:sens:spam" .. msg.chat_id_, sensspam[2])
send(msg.chat_id_, msg.id_, 1, "▫️┇ تم وضع عدد احرف الكلايش \n " .. sensspam[2] .. " حـــرف ", 1, "md")
end end end
--------------------------------------------------------------------------------------------------------------
if text:match("^مسح (.*)$")   then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local txts = {string.match(text, "^(مسح) (.*)$")}
if txts[2] == "المحظورين" and idf:match("-100(%d+)") then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local kpbanned = redis:scard(KING.."bot:banned:" .. msg.chat_id_) or "0"
redis:del(KING.."bot:banned:" .. msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المحضورين ← *"..kpbanned.."*\n☑┇تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
end end
----------------------------------------
if txts[2] == "قائمه العام" then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local kpgban = redis:scard(KING.."bot:gban:") or "0"
redis:del(KING.."bot:gban:")
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المحضورين عام ← *"..kpgban.."*\n☑┇تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
end end
----------------------------------------
if txts[2] == "الحسابات المحذوفه" and idf:match("-100(%d+)") then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local deletedlist = function(extra, result)
local list = result.members_
for i = 0, #list do
local cleandeleted = function(extra, result)
if not result.first_name_ and not result.last_name_ then
chat_kick(msg.chat_id_, result.id_)
end end
getUser(list[i].user_id_, cleandeleted)
end end
local d = 0
for i = 1, NumberReturn do
getChannelMembers(msg.chat_id_, d, "Recent", 200, deletedlist)
d = d + 200
end
send(msg.chat_id_, msg.id_, 1, "☑┇ تم √ طرد جميع الحسابات المحذوفه ", 1, "md")
end end
-----------------------------------------------
if txts[2] == "حظر المجموعه" and idf:match("-100(%d+)") then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👥┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇ اهــــــــلاً عزيزي ...؟🕵🏻\n🚸┇  اذا اردت مسحهم\n👷┇ ارسل لي رقم (1) \n🔍┇ او ارسل (2) لأضافتهم.️\n‏",  1, "md")
redis:setex(KING.."CleanBlockList" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 35, true)
end end
----------------------------------------------
if txts[2] == "البوتات" and idf:match("-100(%d+)") then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local botslist = function(extra, result)
local list = result.members_
for i = 0, #list do
if tonumber(list[i].user_id_) ~= tonumber(_redis.Bot_ID)  then
chat_kick(msg.chat_id_, list[i].user_id_)
end end end
send(msg.chat_id_, msg.id_, 1, "🔖┇ تـــم ✔️ مسح البوتات ", 1, "md")
getChannelMembers(msg.chat_id_, 0, "Bots", 100, botslist)
end end
---------------------------------------------
if txts[2] == "الادمنيه" and idf:match("-100(%d+)") then
if not is_owner(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمــــــدراء فقــــــــط', 1, 'md')
else
local kpmomod = redis:scard(KING.."bot:momod:" .. msg.chat_id_) or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد الأدمنيهہ‌‏ ← *"..kpmomod.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
redis:del(KING.."bot:momod:" .. msg.chat_id_)
end end
-----------------------------------------------
if txts[2] == "المدراء" and idf:match("-100(%d+)") then
if not is_monshi(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمنشئيـــــن فقــــــــط', 1, 'md')
else
local kpowners = redis:scard(KING.."bot:owners:" .. msg.chat_id_) or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المدراء ← *"..kpowners.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
redis:del(KING.."bot:owners:" .. msg.chat_id_)
end end
-----------------------------------------------
if txts[2] == "المنشئين" and idf:match("-100(%d+)") then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local kpmonshis = redis:scard(KING.."bot:monshis:" .. msg.chat_id_) or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المنشئين ← *"..kpmonshis.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
redis:del(KING.."bot:monshis:" .. msg.chat_id_)
end end
--------DEL KING_SUDO-----------------------------------------
if txts[2] == "المطورين" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local kpSudos1 = redis:scard(KING.."Bot:KpSudos") or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المطورين ← *"..kpSudos1.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
local hash = "Bot:KpSudos"
local list = redis:smembers(KING..hash)
for k, v in pairs(list) do
local t = tonumber(v)
table.remove(_config.Sudo_Users, getindex(_config.Sudo_Users, t))
save_on_config()
end
redis:del(KING.."Bot:KpSudos")
end end
--------------DEL Admins------------------------------------
if txts[2] == "ادمنيه البوت" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local kpAdmins = redis:scard(KING.."Bot:Admins") or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد ادمنيه البوت ← *"..kpAdmins.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
redis:del(KING.."Bot:Admins")
end end
-----------DEL vipmem-----------------------------------------------
if txts[2] == "المميزين" and idf:match("-100(%d+)") then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local kpvipmem = redis:scard(KING.."bot:vipmem:" .. msg.chat_id_) or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المميزين ← *"..kpvipmem.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
redis:del(KING.."bot:vipmem:" .. msg.chat_id_)
end  end
---------------keeed del --------------------------------------------
if txts[2] == "المقيدين" and idf:match("-100(%d+)") then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local kpkeed = redis:scard(KING.."bot:keed:" .. msg.chat_id_) or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المقيدين ← *"..kpkeed.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
local hash = "bot:keed:" .. msg.chat_id_
local list = redis:smembers(KING..hash)
for k, v in pairs(list) do
redis:del(KING.."bot:keed:" .. msg.chat_id_)
HTTPS.request("https://api.telegram.org/bot"..KING_TOKEN.."/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
end end end
------------DEL vipmems-------------------------------------------
if txts[2] == "المميزين عام" and idf:match("-100(%d+)") then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local kpvipmems = redis:scard(KING.."bot:vipmems:") or "0"
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المميزين عام ← *"..kpvipmems.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
redis:del(KING.."bot:vipmems:")
end end
------------DEL filters-----------------------------------------
if txts[2] == "قائمه المنع" and idf:match("-100(%d+)") then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local hash = "bot:filters:" .. msg.chat_id_
redis:del(KING..hash)
send(msg.chat_id_, msg.id_, 1, "☑┇ تم ✔ مسح قائمة المنع ", 1, "md")
end end
-------------DEL MUTE----------------------------------------
if txts[2] == "المكتومين" and idf:match("-100(%d+)") then
if not is_momod(msg.sender_user_id_, msg.chat_id_)then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للأدمنيـــــــه فقــــــــط', 1, 'md')
else
local kpmuted = redis:scard(KING.."bot:muted:" .. msg.chat_id_) or "0"
redis:del(KING.."bot:muted:" .. msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "📉┇عدد المكتومين ← *"..kpmuted.."*\n☑┇ تـم مسحهم بنجـــــــــــاح ✓\n‏", 1, "md")
end end end
-------------------kickedlist--------------------------------------------
local kickedlist = function(extra, result)
local list = result.members_
for i = 0, #list do
chat_leave(msg.chat_id_, list[i].user_id_)
end
end
local kickedlist2 = function(extra, result)
local list = result.members_
for i = 0, #list do
add_user(msg.chat_id_, list[i].user_id_, 5)
end
end
if redis:get(KING.."CleanBlockList" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
local d = 0
if text:match("^1$") then
redis:del(KING.."CleanBlockList" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
for i = 1, NumberReturn do
getChannelMembers(msg.chat_id_, d, "Kicked", 200, kickedlist)
d = d + 200
end
if redis:get(KING.."lang:gp:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "☑┇ تم  مسح الاعظاء المحضورين في المجموعهہ‌‏ ", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "☑┇ تم  مسح الاعظاء المحضورين في المجموعهہ‌‏ ", 1, "md")
end
elseif text:match("^2$") then
redis:del(KING.."CleanBlockList" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
for i = 1, NumberReturn do
getChannelMembers(msg.chat_id_, d, "Kicked", 200, kickedlist2)
d = d + 200
end
if redis:get(KING.."lang:gp:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "☑┇ تم  اضافه المحظورين الى المجموعهہ‌‏", 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "☑┇ تم  اضافه المحظورين الى المجموعهہ‌‏ ", 1, "md")
end end end end
------------------------kick member not action---------------
if text:match("^طرد الحسابات المتروكه$") then
local txt = {string.match(text, "^(طرد الحسابات المتروكه)$")}
if not is_monshi(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمنشئيـــن فقــــــــط', 1, 'md')
else
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_deactive(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if data.type_.ID == "UserTypeGeneral" then
if data.status_.ID == "UserStatusEmpty" then
changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end end end
getUser(v.user_id_, clean_cb)
end
send(msg.chat_id_, msg.id_, 1, '🚫┇تم طرد الحسابات غير متفاعله✓\n🔰┇التي*اخر ظهور  منذ زمن طويل*\n', 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
end end
----------------SETING-----------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^الاعدادات"))  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if redis:get(KING.."bot:muteall" .. msg.chat_id_) then
mute_all = "✔"
else
mute_all = "✖️"
end
if redis:get(KING.."bot:text:mute" .. msg.chat_id_) then
mute_text = "✔"
else
mute_text = "✖️"
end
if redis:get(KING.."bot:photo:mute" .. msg.chat_id_) then
mute_photo = "✔"
else
mute_photo = "✖️"
end
if redis:get(KING.."bot:video:mute" .. msg.chat_id_) then
mute_video = "✔"
else
mute_video = "✖️"
end
if redis:get(KING.."bot:selfvideo:mute" .. msg.chat_id_) then
mute_selfvideo = "✔"
else
mute_selfvideo = "✖️"
end
if redis:get(KING.."bot:gifs:mute" .. msg.chat_id_) then
mute_gifs = "✔"
else
mute_gifs = "✖️"
end
if redis:get(KING.."anti-flood:" .. msg.chat_id_) then
mute_flood = "✔"
else
mute_flood = "✖️"
end
if redis:get(KING.."bot:muteall:Time" .. msg.chat_id_) then
auto_lock = "✔"
else
auto_lock = "✖️"
end
if not redis:get(KING.."flood:max:" .. msg.chat_id_) then
flood_m = 5
else
flood_m = redis:get(KING.."flood:max:" .. msg.chat_id_)
end
if not redis:get(KING.."bot:sens:spam" .. msg.chat_id_) then
spam_c = 400
else
spam_c = redis:get(KING.."bot:sens:spam" .. msg.chat_id_)
end
if redis:get(KING.."warn:max:" .. msg.chat_id_) then
sencwarn = tonumber(redis:get(KING.."warn:max:" .. msg.chat_id_))
else
sencwarn = 4
end
if redis:get(KING.."floodstatus" .. msg.chat_id_) == "DelMsg" then
floodstatus = "المسح"
elseif redis:get(KING.."floodstatus" .. msg.chat_id_) == "Kicked" then
floodstatus = "الطرد"
elseif not redis:get(KING.."floodstatus" .. msg.chat_id_) then
floodstatus = "الطرد"
end
if redis:get(KING.."warnstatus" .. msg.chat_id_) == "Muteuser" then
warnstatus = "الكتم"
elseif redis:get(KING.."warnstatus" .. msg.chat_id_) == "Remove" then
warnstatus = "الطرد"
elseif not redis:get(KING.."warnstatus" .. msg.chat_id_) then
warnstatus = "الكتم"
end
if redis:get(KING.."bot:music:mute" .. msg.chat_id_) then
mute_music = "✔"
else
mute_music = "✖️"
end
if redis:get(KING.."bot:bots:mute" .. msg.chat_id_) then
mute_bots = "✔"
else
mute_bots = "✖️"
end
if redis:get(KING.."bot:duplipost:mute" .. msg.chat_id_) then
duplipost = "✔"
else
duplipost = "✖️"
end
if redis:get(KING.."bot:member:lock" .. msg.chat_id_) then
member = "✔"
else
member = "✖️"
end
if redis:get(KING.."bot:inline:mute" .. msg.chat_id_) then
mute_in = "✔"
else
mute_in = "✖️"
end
if redis:get(KING.."bot:cmds" .. msg.chat_id_) then
mute_cmd = "✔"
else
mute_cmd = "✖️"
end
if redis:get(KING.."bot:voice:mute" .. msg.chat_id_) then
mute_voice = "✔"
else
mute_voice = "✖️"
end
if redis:get(KING.."editmsg" .. msg.chat_id_) then
mute_edit = "✔"
else
mute_edit = "✖️"
end
if redis:get(KING.."bot:links:mute" .. msg.chat_id_) then
mute_links = "✔"
else
mute_links = "✖️"
end
if redis:get(KING.."bot:pin:mute" .. msg.chat_id_) then
lock_pin = "✔"
else
lock_pin = "✖️"
end
if redis:get(KING.."bot:sticker:mute" .. msg.chat_id_) then
lock_sticker = "✔"
else
lock_sticker = "✖️"
end
if redis:get(KING.."bot:tgservice:mute" .. msg.chat_id_) then
lock_tgservice = "✔"
else
lock_tgservice = "✖️"
end
if redis:get(KING.."bot:webpage:mute" .. msg.chat_id_) then
lock_wp = "✔"
else
lock_wp = "✖️"
end
if redis:get(KING.."bot:strict" .. msg.chat_id_) then
strict = "✔"
else
strict = "✖️"
end
if redis:get(KING.."bot:hashtag:mute" .. msg.chat_id_) then
lock_htag = "✔"
else
lock_htag = "✖️"
end
if redis:get(KING.."tags:lock" .. msg.chat_id_) then
lock_tag = "✔"
else
lock_tag = "✖️"
end
if redis:get(KING.."bot:location:mute" .. msg.chat_id_) then
lock_location = "✔"
else
lock_location = "✖️"
end
if redis:get(KING.."bot:contact:mute" .. msg.chat_id_) then
lock_contact = "✔"
else
lock_contact = "✖️"
end
if redis:get(KING.."bot:english:mute" .. msg.chat_id_) then
lock_english = "✔"
else
lock_english = "✖️"
end
if redis:get(KING.."bot:arabic:mute" .. msg.chat_id_) then
lock_arabic = "✔"
else
lock_arabic = "✖️"
end
if redis:get(KING.."bot:forward:mute" .. msg.chat_id_) then
lock_forward = "✔"
else
lock_forward = "✖️"
end
if redis:get(KING.."bot:document:mute" .. msg.chat_id_) then
lock_file = "✔"
else
lock_file = "✖️"
end
if redis:get(KING.."markdown:lock" .. msg.chat_id_) then
markdown = "✔"
else
markdown = "✖️"
end
if redis:get(KING.."Game:lock" .. msg.chat_id_) then
game = "✔"
else
game = "✖️"
end
if redis:get(KING.."bot:spam:mute" .. msg.chat_id_) then
lock_spam = "✔"
else
lock_spam = "✖️"
end
if redis:get(KING.."post:lock" .. msg.chat_id_) then
post = "✔"
else
post = "✖️"
end
if redis:get(KING.."bot:welcome" .. msg.chat_id_) then
send_welcome = "✔"
else
send_welcome = "✖️"
end
local settingkp = "*اعدادات المجموعــه* :\n🔘┇ قفل الكلايش  ← " .. lock_spam .. "\n🔘┇  قفل الروابط  ← " .. mute_links .. "\n🔘┇  قفل الويب ← " .. lock_wp .. "\n🔘┇  قفل التاك (@) ← " .. lock_tag .. "\n??┇  قفل الهاشتاك (#) ← " .. lock_htag .. "\n🔘┇  قفل التوجيه ← " .. lock_forward .. "\n🔘┇  قفل المشاركه ← " .. duplipost .. "\n🔘┇  قفل البوتات ← " .. mute_bots .. "\n🔘┇  قفل التعديل ← " .. mute_edit .. "\n🔘┇  قفل التثبيت ← " .. lock_pin .. "\n🔘┇  قفل الانلاين ← " .. mute_in .. "\n🔘┇  قفل العربيه ←  " .. lock_arabic .. "\n🔘┇  قفل الانكليزيه ← " .. lock_english .. "\n🔘┇  قفل الماركدون ← " .. markdown .. "\n🔘┇  قفل البوست ← " .. post .. "\n🔘┇  قفل التكرار ← " .. mute_flood .. "\n🔘┇  وضع التكرار ← " .. floodstatus .. "\n🔘┇ وضع التحذير ← " .. warnstatus .. "\n🔘┇ عدد التحذير ← [ " .. sencwarn .. " ]\n‏┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n📡┇  *قناة السورس * : [@King]\n"
if text:match("^الاعدادات$") then
send(msg.chat_id_, msg.id_, 1, settingkp, 1, "md")
end end end
---------------------------------------------------------
if text:match("^كول (.*)$") then
local txt = {string.match(text, "^(كول) (.*)$")}
send(msg.chat_id_, 0, 1, txt[2], 1, "md")
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
-----------------------------------------------------------------
if text == "تحديث السورس" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
os.execute('rm -rf KING.lua') 
os.execute('wget https://raw.githubusercontent.com/DIVIY/KING/master/KING.lua') 
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم تحديث السورس \n ✓ ", 1, 'md')
dofile('KING.lua')  
io.popen("rm -rf ~/.telegram-cli/data/audio/*") 
io.popen("rm -rf ~/.telegram-cli/data/document/*") 
io.popen("rm -rf ~/.telegram-cli/data/photo/*") 
io.popen("rm -rf ~/.telegram-cli/data/sticker/*") 
io.popen("rm -rf ~/.telegram-cli/data/temp/*") 
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*") 
io.popen("rm -rf ~/.telegram-cli/data/voice/*") 
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*")
end end
---------load_config------------------------------------------------------------
if is_sudo(msg) and (text:match("^رست$")) then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
load_config()
setnumbergp()
send(msg.chat_id_, msg.id_, 1, "☑┇ تــــم تنشيط البوت ", 1, "md")
end end
----------SET rules-------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") then
if (text:match("^ضع قوانين$"))  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
redis:setex(KING.."rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
send(msg.chat_id_, msg.id_, 1, "☑┇  ارســـل القوانين الان 📤", 1, "md")
end end
----------DEL rules -----------------------------------------------------------------------------
if (text:match("^مسح القوانين$"))  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم مسح القوانين\n ✓ ", 1, 'md')
end
redis:del(KING.."bot:rules" .. msg.chat_id_)
end end
--------------rules--------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^القوانين$")) then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local rules = redis:get(KING.."bot:rules" .. msg.chat_id_)
if rules then
send(msg.chat_id_, msg.id_, 1, rules, 1, nil)
else
send(msg.chat_id_, msg.id_, 1, "🚫┇ لا توجــــد قوانين ",  1, "md")
end end end
------------------------------------------------------------------------------------
if text:match("^ضع صوره") and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
redis:set(KING..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '☑┇ قم بارسال صوره الان 🖼', 1, 'md')
end end
-----------------SET NAME MSG---------------------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match("^ضع اسم (.*)$")  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم تغييــر اسم المجموعــه\n ✓ ", 1, 'md')

end end
----------------LEAVE GP------------------------------------------------------------------------------
if text:match("^غادر (-%d+)$")  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local txt = { string.match(text, "^(غادر) (-%d+)$")}
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local OwnerKP_ = redis:get(KING.."Bot:KpOwnerBot")
local user_info_ = redis:get(KING.."user:Name" .. OwnerKP_)
local UserKing = user_info_
if user_info_ then
local leavegp = function(extra, result)
if result.id_ then
send(msg.chat_id_, msg.id_, 1, "🚺  المجموعــهہ‌‏ : \n- " .. result.title_ .. "\n📛 تم اخراج البوت منها💯", 1, "md")
if redis:get(KING.."lang:gp:" .. result.id_) then
send(result.id_, 0, 1, "☑┇  تم اخراج البوت \n🔱┇ راسل المطور للتفعيل 📮\n👨‍💻┇ *المطور* : [" .. UserKing .. "]\n‏", 1, "md")
else
send(result.id_, 0, 1, "☑┇  تم اخراج البوت \n🔱┇ راسل المطور للتفعيل 📮\n👨‍💻┇ *المطور* : [" .. UserKing .. "]\n‏", 1, "md")
end
chat_leave(result.id_, bot_id)
redis:srem(KING.."bot:groups", result.id_)
else
send(msg.chat_id_, msg.id_, 1, "🔹 لا توجد مجموعه مفعله ❗️", 1, "md")
end  end
getChat(txt[2], leavegp)
end end end end
----------INFO BY ID-----------------------------------------------------------------------------------------
if text:match("^معلومات المطور (%d+)") then
local txt = {string.match(text, "^(معلومات المطور) (%d+)$")}
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local get_data = function(extra, result)
if result.id_ then
if is_admin(result.id_) then
local hash = "sudo:data:" .. result.id_
local list = redis:smembers(KING..hash)
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end
end end
local susername = "@" .. result.username_ or ""
local text = "*« معلومات المطور »*\n-----------------------\n©️┇ معرفهہ‌‏ : [" .. susername .. "]\n🎟┇ ايديه : "..result.id_.."\n👤┇ اسمه : "..result.first_name_.."\n-----------------------\n✔️┇ *المجموعات التي ضافها *:\n"
for k, v in pairs(list) do
text = text .. k .. " » `(" .. v .. ")`\n"
end
if #list == 0 then
text = "*« معلومات المطور »*\n\n©️┇ معرفهہ‌‏ : [" .. susername .. "]\n🎟┇ ايديه : "..result.id_.."\n👤┇ اسمه : "..result.first_name_.."\n※ لا توجد مجموعات مضافه⚜️ "
end
send_large_msg(msg.chat_id_, msg.id_, 1, text, 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🔎┇ المستخدم ليس من المطورين ", 1, "md")
end
else
send(msg.chat_id_, msg.id_, 1, "🔎┇ المستخدم ليس من المطورين ", 1, "md")
end
end
if redis:get(KING.."bot:reloadingtime") then
send(msg.chat_id_, msg.id_, 1, "☑┇  تم تحديث البوت  ", 1, "md")
else
getUser(txt[2], get_data)
end end end
----------INFO KING_SUDO BY REPLY----------------------------------------------------------------------------------------------------
if text:match("^معلوماتي$")  and msg.reply_to_message_id_ == 0 then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local get_data = function(extra, result)
local hash = "sudo:data:" .. msg.sender_user_id_
local list = redis:smembers(KING..hash)
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local susername = "@" .. result.username_ or ""
local text = "*« معلوماتك هيـــه »*\n-----------------------\n©️┇ معرفك : [" .. susername .. "]\n🎟┇ ايديك : "..msg.sender_user_id_.."\n👤┇ اسمك : "..result.first_name_.."\n-----------------------\n✔️┇ *المجموعات التي ضافها *:\n"
for k, v in pairs(list) do
text = text .. k .. " » `(" .. v .. ")`\n"
end
if #list == 0 then
local text = "*« معلوماتك هيـــه »*\n-----------------------\n©️┇ معرفك : [" .. susername .. "]\n🎟┇ ايديك : "..msg.sender_user_id_.."\n👤┇ اسمك : "..result.first_name_.."\n-----------------------\n✔️┇ *لا توجد مجموعات مضافه *"
end
send_large_msg(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
if redis:get(KING.."bot:reloadingtime") then
send(msg.chat_id_, msg.id_, 1, "☑┇  تم تحديث البوت  ", 1, "md")
else
getUser(msg.sender_user_id_, get_data)
end end end end
--------- INFO KING_SUDO---------------------------------------------------------------------------------------------------------
if text:match("^معلومات المطور$")  and msg.reply_to_message_id_ ~= 0 then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
do
local data_by_reply = function(extra, result)
if is_admin(result.id_) then
local hash = "sudo:data:" .. result.id_
local list = redis:smembers(KING..hash)
local fname = result.first_name_ or ""
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local susername = "@" .. result.username_ or ""
local text = "*« معلومات المطور »*\n-----------------------\n©️┇ معرفهہ‌‏ : [" .. susername .. "]\n🎟┇ ايديه : "..result.id_.."\n👤┇ اسمه : "..result.first_name_.."\n-----------------------\n✔️┇ *المجموعات التي ضافها *:\n"
for k, v in pairs(list) do
text = text .. k .. " » `(" .. v .. ")`\n"
end
if #list == 0 then
text = "*« معلومات المطور »*\n\n©️┇ معرفهہ‌‏ : [" .. susername .. "]\n🎟┇ ايديه : "..result.id_.."\n👤┇ اسمه : "..result.first_name_.."\n※ لا توجد مجموعات مضافه⚜️ "
end
send_large_msg(msg.chat_id_, msg.id_, 1, text, 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "☑┇ المستخدم ليس من المطورين ", 1, "md")
end end
local start_get_data = function(extra, result)
getUser(result.sender_user_id_, data_by_reply)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_, start_get_data)
end
end
end
------------INFO KING_SUDO BY USERNAME--------------------------------------------------------------------------------------
if text:match("^معلومات المطور @(%S+)$") then
do
local aps = {string.match(text, "^(معلومات المطور) @(%S+)$")}
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
local data_by_username = function(extra, result)
if is_admin(result.id_) then
local hash = "sudo:data:" .. result.id_
local list = redis:smembers(KING..hash)
local fname = result.first_name_ or ""
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local susername = "@" .. result.username_ or ""
local text = "*« معلومات المطور »*\n-----------------------\n©️┇ معرفهہ‌‏ : [" .. susername .. "]\n🎟┇ ايديه : "..result.id_.."\n👤┇ اسمه : "..result.first_name_.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n✔️┇ *المجموعات التي ضافها *:\n"
for k, v in pairs(list) do
text = text .. k .. " » `(" .. v .. ")`\n"
end
if #list == 0 then
text = "*« معلومات المطور »*\n\n©️┇ معرفهہ‌‏ : [" .. susername .. "]\n🎟┇ ايديه : "..result.id_.."\n👤┇ اسمه : "..result.first_name_.."\n※ لا توجد مجموعات مضافه🚫 "
end
send_large_msg(msg.chat_id_, msg.id_, 1, text, 1, "md")
else
send(msg.chat_id_, msg.id_, 1, "🚫┇  المستخدم ليس من المطورين ", 1, "md")
end end
local data_start_username = function(extra, result)
if result.id_ then
getUser(result.id_, data_by_username)
else
send(msg.chat_id_, msg.id_, 1, "🚫┇  المستخدم ليس من المطورين ", 1, "md")
end
end
if redis:get(KING.."bot:reloadingtime") then
send(msg.chat_id_, msg.id_, 1, "☑┇  تم تحديث البوت  ", 1, "md")
else
resolve_username(aps[2], data_start_username)
end
end
end
end
--------------SEND ALL GP----------------------------------------------------------------
if text:match("^اذاعه خاص (.*)") then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local tmzain =  text:match("^اذاعه خاص (.*)")
local tmzain2 = "☑┇ تم ارسال الاذاعه الى:\n( * GP * ) من الاعضاء\n‏"
local gp = tonumber(redis:scard(KING.."bot:userss"))
gps = redis:smembers(KING.."bot:userss")
text = tmzain2:gsub('GP',gp)
for k,v in pairs(gps) do
send(v, 0, 1,tmzain, 1, 'md')
end
send(msg.chat_id_, msg.id_, 1,text, 1, 'md')
end end end
----------------promote_admin------------------
if (idf:match("-100(%d+)") or is_owner(msg.sender_user_id_, msg.chat_id_)) and text == 'رفع الادمنيه'  then
local function promote_admin(extra, result, success)
local admins = result.members_
for i=0 , #admins do
redis:sadd(KING..'bot:momod:'..msg.chat_id_,admins[i].user_id_)
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
redis:sadd(KING.."bot:owners:"..msg.chat_id_,owner_id)
end
end
local kpmomod = redis:scard(KING.."bot:momod:" .. msg.chat_id_) or "0"
send(msg.chat_id_, msg.id_, 1, "👥┇عدد الأدمنيهہ‌‏ ← *"..kpmomod.."*\n☑┇ تـم رفعـهم بنجـــــــــــاح ✓\n‏", 1, "md")
end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
end
-------CLEN MSG---------------------------
if text and text:match('^تنظيف (%d+)$')  and is_momod(msg.sender_user_id_, msg.chat_id_) then
local num = tonumber(text:match('^تنظيف (%d+)$')) 
if num > 1000 then 
send(msg.chat_id_, msg.id_, 1, ' تستطيع المسح فقط (1000) رساله \n', 1, 'md') 
return false  
end  
local msgm = msg.id_
for i=1,tonumber(num) do
delete_msg(msg.chat_id_, {[0] = msgm})
msgm = msgm - 1048576
end
send(msg.chat_id_, msg.id_, 1,'🗑┇ تم تنظيف {'..num..'} رساله من الكروب \n', 1, 'md')  
end
---------------------MY-----------------------
if text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
if text:match("^معلومات (.*)$") then
local memb = {string.match(text, "^(معلومات) (.*)$")}
function whois(extra,result,success)
if result.username_ then
result.username_ = '@'..result.username_
else
result.username_ = 'لا يوجد معرف'
end
send(msg.chat_id_, msg.id_, 1, '©️┇معرف ↬ ('..(result.username_..')\n👤┇الاسم ↬ ('..result.first_name_ or "KING")..')', 1, 'md')
end
getUser(memb[2],whois)
end
--------------PIN----------------------------------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and msg.reply_to_message_id_ ~= 0 and (text:match("^تثبيت$"))  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
if not redis:get(KING.."lock_pinn"..msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "☑┇ التثبيت مقفول من قبل المدير ", 1, "md")
return false
end
local id = msg.id_
local msgs = { [0] = id }
pinmsg(msg.chat_id_, msg.reply_to_message_id_, 0)
redis:set(KING.."pinnedmsg" .. msg.chat_id_, msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم  تثبيــت الرسالــهہ‌‏\n ✓ ", 1, 'md')
end end
----------info gp --------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and text:match('احصائيات المجموعه')  then
function gp_King_info(arg,data)
local list = redis:smembers(KING.."bot:owners:" .. msg.chat_id_)
if list[1] or list[2] or list[3] or list[4] then
user_info = redis:get(KING.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then
owner = user_info
else
owner = "No Found"
end
local User = who_add(msg.chat_id_)
if User then
sudo = User
else
sudo = "No Found"
end
local bot_id = redis:get(KING.."Bot:KpBotAccount") or tonumber(_redis.Bot_ID)
local allmgs = redis:get(KING.."bot:allmsgs")
local kpmonshis = redis:scard(KING.."bot:monshis:" .. msg.chat_id_) or "0"
local kpbanned = redis:scard(KING.."bot:banned:" .. msg.chat_id_) or "0"
local kpowners = redis:scard(KING.."bot:owners:" .. msg.chat_id_) or "0"
local kpmuted = redis:scard(KING.."bot:muted:" .. msg.chat_id_) or "0"
local kpkeed = redis:scard(KING.."bot:keed:" .. msg.chat_id_) or "0"
local kpmomod = redis:scard(KING.."bot:momod:" .. msg.chat_id_) or "0"
local kpvipmem = redis:scard(KING.."bot:vipmem:" .. msg.chat_id_) or "0"
send(msg.chat_id_, msg.id_, 1, "*- احصائيات في المجموعهہ‌‏ »*\n📌┇ المدير » [" .. owner .. "]\n🌋┇ عدد الاعضاء » `"..data.member_count_.."`\n🌋┇عدد الادمنيه » `"..data.administrator_count_.."`\n🌋┇عدد المحضورين » `"..data.kicked_count_.."`\n📌┇ المطور » [" .. sudo .. "]\n\n*- احصائيات في البــــوت » *\n📌┇ عدد المنشئين » *"..kpmonshis.."*\n🗯┇ عدد المحضورين » *"..kpbanned.."*\n🗯┇ عدد المــدراء » * "..kpowners.."*\n🗯┇ عدد المكتومين » * "..kpmuted.."*\n🗯┇ عدد المقيدين » *"..kpkeed.."*\n🗯┇ عدد الادمنيه » * "..kpmomod.."*\n📌┇ عدد المميزين » *"..kpvipmem.."*\n📌┇ اسم البوت » *"..(redis:get(KING.."Kingnams") or "الملك").."*\n💠┇ الايدي » (`"..bot_id.."`)\n💠┇ ايدي المجموعه » 👇🏾\n💠┇ (`" .. msg.chat_id_ .. "`)\n💠┇ اسم المجموعه » 👇🏾\n📌┇  ("..title_name(msg.chat_id_)..")\n‏\n", 1,"md")
end
getChannelFull(msg.chat_id_, gp_King_info, nil)
end
---------------------add reply in group-------------------------------------
text = msg.content_.text_
if msg.content_.text_ == 'مسح رد' and  is_owner(msg.sender_user_id_, msg.chat_id_) then
redis:set(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','del_repgp1')
send(msg.chat_id_, msg.id_, 1, '📌┇ ارسل لي كلمه الرد لمسحها ❗️\n',1, 'md')
return false
end
if msg.content_.text_ then
local content_text = redis:get(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'del_repgp1' then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم مسح الرد بنجاح\n ✓ ", 1, 'md')
redis:del(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
redis:del(KING..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'')
redis:del(KING..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')
redis:del(KING..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'')
redis:del(KING..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'')
redis:del(KING..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'')
redis:del(KING..'rep_owner'..msg.content_.text_..''..msg.chat_id_..'')
return false
end
end
--------------------------------------------------------------------------
if msg.content_.text_ == 'اضف رد' and is_owner(msg.sender_user_id_, msg.chat_id_)  then
redis:set(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','set_repgp')
send(msg.chat_id_, msg.id_, 1, '📌┇ ارسل لي كلمه الرد الان ❗️\n',1, 'md')
return false    end
if msg.content_.text_ then
local content_zain = redis:get(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_zain == 'set_repgp' then
send(msg.chat_id_, msg.id_, 1, '📌┇ ارسل جواب الرد قد يكون\n🗯┇ {نص-ملصق-بصمه...} ❗️\n' ,  1, 'md')
redis:set(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','save_repgp')
redis:set(KING..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'',msg.content_.text_)
redis:sadd(KING..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
-------------------------------------------------------------------------
if  msg.content_.text_ == 'الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) then
local redod = redis:smembers(KING..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
send(msg.chat_id_, msg.id_, 1,'📌┇ لا توجد ردود في المجموعهہ‌‏ ❗️\n' ,1, 'md')
else
msg_rep = '📌┇ ردود المجموعـــه »\n'
for k,v in pairs(redod) do
msg_rep = msg_rep ..k..' - *⁽ '..v..' ₎* \n'
end
send(msg.chat_id_, msg.id_, 1, msg_rep,1, 'md')
end
return false
end
-------------------------------------------------------------------------------
if msg.content_.text_ == 'مسح الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) then
local redod = redis:smembers(KING..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
send(msg.chat_id_, msg.id_, 1,'❌┇ لا توجد ردود في المجموعهہ‌‏ ❗️\n' ,1, 'md')
else
for k,v in pairs(redod) do
redis:del(KING..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
redis:del(KING..'gif_repgp'..v..msg.chat_id_)
redis:del(KING..'voice_repgp'..v..msg.chat_id_)
redis:del(KING..'stecker_repgp'..v..msg.chat_id_)
redis:del(KING..'video_repgp'..v..msg.chat_id_)
redis:del(KING..'text_repgp'..v..msg.chat_id_)
redis:del(KING..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
end
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🗑┇ تم مسح جميع الردود\n ✓ ", 1, 'md')
return false
end
end
----------------------------------------------------------------------------
text = msg.content_.text_
if msg.content_.text_ == 'مسح رد عام' and  is_sudo(msg) then
redis:set(KING.."add:repallt"..msg.sender_user_id_,'del_rep1')
send(msg.chat_id_, msg.id_, 1, "📌┇ ارسل لي كلمه الرد لمسحها ❗️\n",1, "md")
return false
end
if msg.content_.text_ then
local content_text = redis:get(KING.."add:repallt"..msg.sender_user_id_)
if content_text == 'del_rep1' then
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🗑┇ تم مسح الرد للكل\n ✓ ", 1, 'md')
redis:del(KING.."add:repallt"..msg.sender_user_id_)
redis:del(KING.."gif_repall"..msg.content_.text_)
redis:del(KING.."voice_repall"..msg.content_.text_)
redis:del(KING.."stecker_repall"..msg.content_.text_)
redis:del(KING.."video_repall"..msg.content_.text_)
redis:del(KING.."text_repall"..msg.content_.text_)
redis:del(KING.."rep_sudo",msg.content_.text_)
return false
end
end
--------------------------------------------------------------------------
if msg.content_.text_ == 'اضف رد عام' and is_sudo(msg)  then
redis:set(KING.."add:repallt"..msg.sender_user_id_,'set_rep')
send(msg.chat_id_, msg.id_, 1, "📌┇ ارسل لي كلمه الرد ❗️\n",1, "md")
return false    end
if msg.content_.text_ then
local content_zain = redis:get(KING.."add:repallt"..msg.sender_user_id_)
if content_zain == 'set_rep' then
send(msg.chat_id_, msg.id_, 1, "📌┇ ارسل جواب الرد قد يكون\n🗯┇ {نص-ملصق-بصمه...} ❗️\n" ,  1, "md")
redis:set(KING.."add:repallt"..msg.sender_user_id_,'save_rep')
redis:set(KING.."addreply2:"..msg.sender_user_id_, msg.content_.text_)
redis:sadd(KING.."rep_sudo",msg.content_.text_)
return false
end    end
------------------------------------------------------------------------------------
if  msg.content_.text_ == "ردود المطور" and is_sudo(msg) then
local redod = redis:smembers(KING.."rep_sudo")
if #redod == 0 then
send(msg.chat_id_, msg.id_, 1,"📌┇ لا توجد ردود مضافه للمطور ❗️\n" ,1, "md")
else
local i = 1
msg_rep = "📌┇ ردود المطــــور »\n"
for k,v in pairs(redod) do
msg_rep = msg_rep ..k.." ═ *⁽ "..v.." ₎* \n"
end
send(msg.chat_id_, msg.id_, 1, msg_rep,1, "md")
end
return false
end
-------------------------------------------------------------------------------
if msg.content_.text_ == "مسح ردود المطور" and is_sudo(msg) then
local redod = redis:smembers(KING.."rep_sudo")
if #redod == 0 then
send(msg.chat_id_, msg.id_, 1,"📌┇ لا توجد ردود مضافه للمطور ❗️\n" ,1, "md")
else
for k,v in pairs(redod) do
redis:del(KING.."add:repallt"..v)
redis:del(KING.."gif_repall"..v)
redis:del(KING.."voice_repall"..v)
redis:del(KING.."stecker_repall"..v)
redis:del(KING.."video_repall"..v)
redis:del(KING.."text_repall"..v)
redis:del(KING.."rep_sudo",msg.content_.text_)
end
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🗑┇ تم مسح ردود المطور\n ✓ ", 1, 'md')
return false
end
end
--------GET INFO GP by id--------------------------------------------------------
if text:match('^كشف (-%d+)') then
local chattid = text:match('كشف (-%d+)')
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
function gp_King_info(arg,data)
function add_gps( arg,data )
local list = redis:smembers(KING.."bot:owners:" .. chattid)
if list[1] or list[2] or list[3] or list[4] then
user_info = redis:get(KING.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then
owner = user_info
else
owner = "لا يوجد"
end
local User = who_add(chattid)
if User then
sudo = User
else
sudo = "لا يوجد"
end
local kpmonshis = redis:scard(KING.."bot:monshis:" .. chattid) or "0"
local kpbanned = redis:scard(KING.."bot:banned:" .. chattid) or "0"
local kpowners = redis:scard(KING.."bot:owners:" .. chattid) or "0"
local kpmuted = redis:scard(KING.."bot:muted:" .. chattid) or "0"
local kpkeed = redis:scard(KING.."bot:keed:" .. chattid) or "0"
local kpmomod = redis:scard(KING.."bot:momod:" .. chattid) or "0"
local kpvipmem = redis:scard(KING.."bot:vipmem:" .. chattid) or "0"
if not redis:get(KING.."bot:group:link"..chattid) then
local getlink = 'https://api.telegram.org/bot'..KING_TOKEN..'/exportChatInviteLink?chat_id='..chattid
local req = https.request(getlink)
local link = KPJS:decode(req)
if link.ok == true then 
redis:set(KING.."bot:group:link"..chattid,link.result)
end
end
local lik_1 = redis:get(KING.."bot:group:link"..chattid)
if lik_1 then
link = lik_1 
else
link = link.result
end
send(msg.chat_id_, msg.id_, 1, "👮‍♂️┇ المدير » ["..owner.."]\n🔘┇ ["..title_name(chattid).."]("..(link or "t.me/King")..")\n🔘┇ عدد المــــدراء   » *"..kpowners.."*\n🔘┇ عدد المنشئين   » *"..kpmonshis.."*\n🔘┇ عدد الادمنيـــه   » *"..kpmomod.."*\n🔘┇ عدد المكتومين  » *"..kpmuted.."*\n🔘┇ عدد المحظورين » *"..kpbanned.."*\n🔘┇ عدد المقيديــن   » *"..kpkeed.."*\n🔘┇ عدد المميزيـــن  » *"..kpvipmem.."*\n🔘┇ `"..chattid.."`\n👨‍💻┇ المطور » ["..sudo.."]\n✓", 1,"md")
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(chattid).ID
}, add_gps, nil)
end
getChannelFull(chattid, gp_King_info, nil)
end 
end
------------UNPIN-----------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^الغاء تثبيت$"))  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n☑┇ تم الغاء تثبيــت الرسالــهہ‌‏\n ✓ ", 1, 'md')
end   end
------------SEND FILE------------------------------------------
if text == 'ارسال نسخه' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
if not redis:get(KING..'lock:add'..msg.chat_id_) then
tdcli.sendDocument(KING_SUDO, 0, 0, 1, nil, './KING.lua', dl_cb, nil)
send(msg.chat_id_, msg.id_, 1, '☑┇ تم ارسال نسخه الى خاص البوت ✔️', 1, 'md')
end end end
-----------REE FILS----------------------------------------------------
if text == 'تحديث' then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
if not redis:get(KING..'lock:add'..msg.chat_id_) then
dofile('KING.lua')
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*") 
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*") 
io.popen("rm -rf ~/.telegram-cli/data/temp/*") 
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*") 
io.popen("rm -rf ~/.telegram-cli/data/voice/*") 
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*")
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🗂┇ تم تحديث ملفات البوت\n ✓ ", 1, 'md')
end end end
-------------CHAT NAME--------------------------------------------------------------
if text == 'اسم المجموعه' then
send(msg.chat_id_, msg.id_, 1, "🎫┇ الاسم : 👇🏾\n👥┇ ("..title_name(msg.chat_id_)..")", 1, 'md')
end
------------REE PIN----------------------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^اعادة تثبيت$"))  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local pin_id = redis:get(KING.."pinnedmsg" .. msg.chat_id_)
if pin_id then
send(msg.chat_id_, msg.id_, 1, "☑┇  تم √ اعاده تثبــيت الرسالــهہ‌‏ ", 1, "md")
end
pinmsg(msg.chat_id_, pin_id, 0)
elseif redis:get(KING.."lang:gp:" .. msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "☑┇  لا ✘ توجد رسالهہ‌‏ مثبته 📬", 1, "md")
end
end
------------ME-----------------------------------------------------------------------------
if text:match("^موقعي$")  then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local get_me = function(extra, result)
local msgs = tonumber(redis:get(KING.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_))
if is_KpiD(result.id_) then
King3 = "مطور الاساسـي 👨‍🔧"
elseif is_sudoid(result.id_) then
King3 = "مطور البوت 👨‍💻"
elseif is_admin(result.id_) then
King3 = "ادمن في البوت 🕵️‍♂️"
elseif is_vipmems(result.id_) then
King3 = "مميز عام 👨‍🚒"
elseif is_monshi(result.id_, msg.chat_id_) then
King3 = "منشئ الكروب 👨‍✈️"
elseif is_owner(result.id_, msg.chat_id_) then
King3 = "المدير 👮‍♂️"
elseif is_momod(result.id_, msg.chat_id_) then
King3 = "ادمن في البوت 👨‍🎤"
elseif is_vipmem(result.id_, msg.chat_id_) then
King3 = "عضو مميز 🧛‍♂️"
else
King3 = "عـضـــو 🤵"
end
local susername = "@" .. result.username_ or "---"
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local list = redis:smembers(KING.."bot:owners:" .. msg.chat_id_)
if list[1] or list[2] or list[3] or list[4] then
user_info = redis:get(KING.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then
owner = user_info
else
owner = "لا يوجد"
end
local User = who_add(msg.chat_id_)
if User then
sudo = User
else
sudo = "لا يوجد"
end
send(msg.chat_id_, msg.id_, 1, "*- موقعك ومعلوماتك الخاصهہ‌‏ بك : »*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n©️┇ معرفك ← [" .. susername .. "]\n🎟┇ ايديك ← "..result.id_.."\n👤┇ اسمك ← "..result.first_name_.."\n💌┇ رسائلك ← ( " .. msgs .. " ) رساله\n🎲┇ تفاعلك ← " .. KP_TM_NM(msgs) .. "\n👨‍✈️┇الرتبهہ‌‏ ← " .. King3 .. "\n\n‏ - *معلومات المجموعه* »\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n👮‍♂️┇ المدير ← [" .. owner .. "]\n👨‍💻┇ المطور ← [" .. sudo .. "]\n👤┇ الاسم ← 👇🏾\n✔️┇ ("..title_name(msg.chat_id_)..")\n‏" , 1, "html")
end
getUser(msg.sender_user_id_, get_me)
end end
-------------------kick me-----------------------
if text:match("^اطردني$") then
if not redis:get(KING.."lock_kickme"..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "☑┇ امر اطردني معطل ", 1, "md")
return false
end
redis:set(KING.."kick_me"..msg.sender_user_id_..""..msg.chat_id_.."","kick_mee")
redis:set(KING.."unkick_me"..msg.sender_user_id_..""..msg.chat_id_.."","kick_no")
send(msg.chat_id_, msg.id_, 1, "🔰┇ ارسل *{ نعم }* لطردك\n🚫┇ ارسل *{ لا } *لالغاء طردك", 1, "md")
end
local Kpkick = redis:get(KING.."kick_me"..msg.sender_user_id_..""..msg.chat_id_.."")
if Kpkick == "kick_mee" then
if text:match("^نعم$") then
if is_vipmem(msg.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ عذرا لا استطيع (حظر،طرد،كتم)المدراء والادمنيه والاعضاء المميزين ❗️', 1, 'md')
else
local Kpkick = redis:get(KING.."kick_me"..msg.sender_user_id_..""..msg.chat_id_.."")
if Kpkick == "kick_mee" then
chat_kick(msg.chat_id_, msg.sender_user_id_)
redis:del(KING.."kick_me"..msg.sender_user_id_..""..msg.chat_id_.."","kick_mee")
redis:del(KING.."unkick_me"..msg.sender_user_id_..""..msg.chat_id_.."","kick_no")
send(msg.chat_id_, msg.id_, 1, "🔰┇ تم طردتك حياتي", 1, "md")
end 
end
end
if text:match("^لا$") then
local Kpunkick = redis:get(KING.."unkick_me"..msg.sender_user_id_..""..msg.chat_id_.."")
if Kpunkick == "kick_no" then
redis:del(KING.."kick_me"..msg.sender_user_id_..""..msg.chat_id_.."","kick_mee")
redis:del(KING.."unkick_me"..msg.sender_user_id_..""..msg.chat_id_.."","kick_no")
send(msg.chat_id_, msg.id_, 1, "🔰┇ تم الغاء طردك", 1, "md")
end
end
end
---------------------SEE viewget----------------------------------------
if is_momod(msg.sender_user_id_, msg.chat_id_) and  (text:match("^عدد المشاهدات$")) then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
redis:set(KING.."bot:viewget" .. msg.sender_user_id_, true)
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسل لي توجيــهہ‌‏  للمنشــور : ", 1, "md")
end end
------------------------------ID CHATS----------------------------
if text:match("^ايدي المجموعات$") then
if not is_sudo(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطوريـــــــن فقــــــــط', 1, 'md')
else
local list = redis:smembers(KING.."bot:groups")
local t = '☑┇ ايديات المجموعات \n'
for k,v in pairs(list) do
t = t..k.." » `"..v.."`\n"  end
t = t..''
if #list == 0 then
t = '☑┇ لا توجد مجموعات مفعله' end
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') end end
-------------- start bot-----------------------------
if text == "وضع كليشه start" or text == "وضع كليشه ستارت" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍🔧┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇ ارسال الان الكليشه ليتم حفظها', 1, 'md')
redis:set(KING.."addstart1"..msg.sender_user_id_, "theaddstarts")
return false
end end
if text then
local theaddstart = redis:get(KING.."addstart1"..msg.sender_user_id_)
if theaddstart == 'theaddstarts' then
send(msg.chat_id_, msg.id_, 1, "☑┇ تم حفظ الكليشه ", 1, 'md')
redis:del(KING.."addstart1"..msg.sender_user_id_)
redis:set(KING.."startbot", text)
return false
end end
if text == "حذف كليشه ستارت" or text == "مسح كليشه ستارت" then
if not is_devzain(msg) then
send(msg.chat_id_, msg.id_, 1, '👨‍??┇ للمطور الاساسي فقــــــــط', 1, 'md')
else
redis:del(KING.."startbot")
send(msg.chat_id_, msg.id_, 1, "👤┇ بواسطه » "..tmKing(msg).."\n🎟┇ تم مسح كليشه start\n ✓ ", 1, 'md')
end end
------------------------------- cod msgs ----------------------------
if text:match("^رسائلي$") or text:match("^رسايلي$") then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local get_me = function(extra, result)
local msgs = (tonumber(redis:get(KING.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_)) or "0" )
local kptext = (tonumber(redis:get(KING.."text:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local kpsticker = (tonumber(redis:get(KING.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local pkPhoto = (tonumber(redis:get(KING.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local kpVoice = (tonumber(redis:get(KING.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local kpGif = (tonumber(redis:get(KING.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local kpVideo = (tonumber(redis:get(KING.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local kpSelfVideo = (tonumber(redis:get(KING.."SelfVideo:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local kpcon = (tonumber(redis:get(KING.."kpaddcon"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
if result.first_name_ then
if #result.first_name_ < 25 then
else
for yybyy in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = yybyy
break
end end end
local kpmsgsss = [[

🙋‍♂┋ اهلا عزيزي  *]]..result.first_name_..[[*
💌┋ لقد قمت بآرســـــال
📝┇نص* ⁽ ]]..kptext..[[ ₎*
📷┇صور* ⁽ ]]..pkPhoto..[[ ₎*
🎙┇صوت* ⁽ ]]..kpVoice..[[ ₎*
🎥┇ فيديــو* ⁽ ]]..kpVideo..[[ ₎*
📲┇جهات* ⁽ ]]..kpcon..[[ ₎*
🗺┇ملصقات* ⁽ ]]..kpsticker..[[ ₎*
📽┇سيلفي* ⁽ ]]..kpSelfVideo..[[ ₎*
🖥┇صور متحركـه* ⁽ ]]..kpGif..[[ ₎*

📩┋العدد الكلي للرسائل : *(]]..msgs..[[)*

]]
send(msg.chat_id_, msg.id_, 1, kpmsgsss, 1, 'md')
end
getUser(msg.sender_user_id_, get_me)
end end
-------------------------------------
if text == ''..(redis:get(KING..'Kingnams') or 'الملك')..' هينه' or text == ''..(redis:get(KING..'Kingnams') or 'الملك')..' رزله' then
function reep22(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(KING_SUDO) then
send(msg.chat_id_, msg.id_, 1, 'انجب لك هذا مطوري العشق 😌💋', 1, 'md')
return false  end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, 'لك مگدر اهين نفسي 😞😂', 1, 'md')
return false  end
local KING = { "لك دايح ، احترم نفسك لا بال 👠😠","ها مصراع تراچي ، اگعد راحه تره روحي طالعه 😐","ها ابن الحنينه، ليش متسكت وتنجب 🌚"}
send(msg.chat_id_, result.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),reep22)
end end
-------------------------------------
if text == ''..(redis:get(KING..'Kingnams') or 'الملك')..' بوسه' or text == ''..(redis:get(KING..'Kingnams') or 'الملك')..' مصه' then
function reep22(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(KING_SUDO) then
send(msg.chat_id_, msg.id_, 1, 'موووووووووووواح 🌚💋', 1, 'md')
return false  end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, 'جيبلي صورتي حتى ابوسها ☹️😹', 1, 'md')
return false  end
local KING = { "اععع 🤢خده بي حب شباب الوصخ😹😹","موااح 💋 مواااح  حياتي💋😌","💋😞نسخ لصق ع الشفه 👄"}
send(msg.chat_id_, result.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),reep22)
end end
------------------------------------- rdood bot -------------------------------------
if not redis:get(KING.."lock_reeeep"..msg.chat_id_) then
if text == "السلام عليكم" or text == "سلام عليكم" or text == "سلام" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"وعليكم السلام والرحمه⇣😻","يمه هلا بالغالي 😻","وعليكم السلام حبيبي ☺️","كافي بس تسلمون 🌝💔" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "بوت" or text == "بوتت" or text == "البوت" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {'اسمي '..(redis:get(KING..'Kingnams') or 'الملك')..' 😌👌','تره اسمي '..(redis:get(KING..'Kingnams') or 'الملك')..' يالجريذي ☹️💥'  }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == ''..(redis:get(KING..'Kingnams') or 'الملك')..'' then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {'اي نعم اني '..(redis:get(KING..'Kingnams') or 'الملك')..' 😐','اهو اجوي الملطلطين 😹😪','كافي تره كرهت اسمي 💔😠'}
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "هلو" or text == "هاي" or text == "هلاو" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"هلووووات  ⁽🙆♂✨₎ֆ","يمه هلا بالعافيه 😻","لا هلا ولا مرحبه شلونك مشتاقين 😻😂","اخلاً وصخلا 😌😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "شلونك" or text == "شلونكم" or text == "شلونج" or text == "شونج" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"تمام وانت/ي 😘","شعليك انت 🧐😂","بخير انت/ي شلونك/ج ☺️","تمام وانت/ي ‏ ᵛ͢ᵎᵖ💛﴾" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "شنو هذا بوت" or text == "هذا بوت" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"عـٰٰـٰود لوتُٰي 🙀 يـٰگول بُِوت عبالـٰه طافٰـُٰي💔 ويضِٰل يمٰـٓسلت وينشٰٰر روابـٰٓط 😳","اي بوت شتريد 😤" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "غني" or text == "غنيلي" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"شكلولك عليه كاولي 😶😂","صوتي محلو للاسف 😌💔","اشعجـب كاطع بيه ياراحتي النفسيه 😂💔","حرام  الغنا 😐" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "باي" or text == "رايح" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"بايات 💛","گلعه 😶💔","الله الله الله وياك 😻😂","ثيمالا 🌝✋🏾" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "جاو" or text == "ججاو" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"منو ال أجوو👀😹","جااااوات  ₎✿💥😈 ❥" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "نورت" or text == "منور" or text == "منوره" or text == "نورتي" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"نورك/ج هذا ورده 🌝","بوجودك/غلا تسلم 😻✨","انت/ي اصل النور 😋","عماني نورك 😣😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "بوسني" or text == "بوسه" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then local KING = {"مووووووووواححح💋??","مابوس ولي😌😹","خدك/ج نضيف 😂","البوسه بالف حمبي 🌝💋" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "امك" or text == "امج" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"عيـــب 🙀😹","شبيه امك حمبي😋" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "خالتك" or text == "خالتج" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"شبيه الشكره ام الوصخ 🤭😹","حبيته فدوووه??","شرايد من خالته 🤭😂","خالته تفلش 😶😹" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "تف" or text == "تفف" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"تف عليك ادبسزز 😒😹","لا تتفل على وجهك 😻😹","ما اسمحلك هيلگ 😡😹","بدون تفال رجائاً 😹😹" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "😂" or text == "😂😂" or text == "😂😂😂😂" or text == "😂😂😂" or text == "😹😹" or text == "😹😹😹" or text == "😹" or text == "😹😹😹😹" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"كافـي ضحــك 😐","لتضحك هواي وتصير فاول 🌝😹","هذ شبي يضحك 🙀😳","اضحك هيه الدنيا خربانه 😂😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "😡" or text == "😡😡" or text == "😡😡😡" or text == "😡😡😡😡" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"لصير عصبي يرتفع ضغطـك 😌😂","صار وجه احمر مثل الطماطه 🙊😹","اوف شحلاتك وانت ضايج 😻","شبي هذا الله يستر 😼😹" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "😒" or text == "😒😒" or text == "😒😒😒" or text == "😒😒😒😒" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"لضوج متسوووه 🤭😹","يمه زعلان الحلو ما يكلي مرحبا 😻😹","اعدل وجهك لا اعدله الك/ج 😼👊🏼" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "🌝" or text == "🌝🌝" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"يمه الگمر عذبني حبه 🙊😻","عو نضيف الوصخ 😹😹","طفي ضواك عميتني 😼😹" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "💋" or text == "💋💋" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"كبر 🙀 جان استحيتو 😹😹","عســـل 😋🙊" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "💔" or text == "💔💔" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"شبي مكسور 😔💔","موجوع كلبي والتعب بيه 😔😹","اكل بصل وانسه الحصل 😻😹" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "😻" or text == "😻😻" or text == "😍😍" or text == "😍" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"شوفو الحب صاعد فول 😻😹","ها ناوي تزحف 😹😹","فدوووه لهاي العيون 🙊😻" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "😐" or text == "🙂" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"شبيك حبيبي 😂💔","منور محمد الاعمى 😐😹" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "جوعان" or text == "جوعانه" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"شطبخلك/ج  🙊😋" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "ههه" or text == "هههه" or text == "ههههه" or text == "هههههه" or text == "ههههههه" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"دووم الضحكه 🙊","دوم الضحكه ℡̮⇣┆👑😻⇣ۦ ٰ" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "اكلك" or text == "اكلج" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"اي غرد/ي دا اسمع 👂🏽😹","كول😹 (كول لو هدف)😔😹","ها حياتي 🙊" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "شبيك" or text == "شبيك انت" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"انت/ي شبيك/ج😣","مابيه شي تسلم 💋😹" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "🌚💔" or text == "💔" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"هم اجانه محترك وجه😂♥️","هاي منو كاسر كلبك😡","اهو هم اجانه صخام🐸👌" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "فديتك" or text == "فديتج" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"ها بدت حبجيه ✨😂","لتلح عود يعني احبج🙈😹","كافي درينه مشتاقله 😒" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "😢" or text == "😢😢" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"يبجي دلوع😜😹","هاي عود انت جبير كاعد تبجي😑💔","لتلح درينه تبجي😒"}
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "ميتين" or text == "اصنام" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"علساس انت متفاعل😒😒","اي عندك اعتراض🤔","اني معليه احرسكم😎" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "☺️" or text == "☺☺" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"عود اني حباب ونت شيطان يتعلم منك🙈😂😂","وجهك ميساعد🤢😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "اجه" or text == "اجت" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"اهو لا هلا بيه ✨😂","خي ولي مزاعله ✨😂","اهلا بيه بس اطرده اذا اجه😒😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "الخميس" or text == "خميس" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"وخرو وخرو🤓 هلا بلخميس تيرارا وياي يلا😍😹","هلا بلخميس عطله وكذا ركصو يلا😍😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "🙊" or text == "🙈" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"اول مره اشوف قرد يستحي🤔😂","ما مرجيه منك هايه صاير تستحي انته هوايه 😍😂😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
-------------------------------------
if text == "ممكن نزوج" or text == "ممكن نرتبط" then
if not redis:get(KING..'lock:add'..msg.chat_id_) then
local KING = {"ها ها يمعودين احنه هنا😒😹","اعتقد اكو خاص وخطبو وهنا زفه بسيارتي🚗😂" }
send(msg.chat_id_, msg.id_, 1,''..KING[math.random(#KING)]..'', 1, 'md')
end
end
end
--«««««««««««««««««««««««« Welcome to Source KING »»»»»»»»»»»»»»»»»»»»»»»»»»»--
elseif data.ID == "UpdateChat" then
chat = data.chat_
chats[chat.id_] = chat
elseif data.ID == "UpdateUserAction" then
local chat = data.chat_id_
local user = data.user_id_
local idf = tostring(chat)
if idf:match("-100(%d+)") and not redis:get(KING.."bot:muted:Time" .. chat .. ":" .. user) and redis:sismember(KING.."bot:muted:" .. chat, user) then
redis:srem(KING.."bot:muted:" .. chat, user)
end
elseif data.ID == "UpdateMessageEdited" then
local msg = data
local get_msg_contact = function(extra, result)
local text = result.content_.text_ or result.content_.caption_
if tonumber(msg.sender_user_id_) == tonumber(api_id) then
print("\027[" .. color.white[1] .. ";" .. color.magenta[2] .. "m>>> Edit From Api Bot <<<\027[00m")
return false
end
if tonumber(result.sender_user_id_) == tonumber(our_id) then
print("\027[" .. color.white[1] .. ";" .. color.magenta[2] .. "m>>> Edit From Bot <<<\027[00m")
return false
end
if not is_vipmem(result.sender_user_id_, result.chat_id_) then
check_filter_words(result, text)
if redis:get(KING.."editmsg" .. msg.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if (text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]")) and redis:get(KING.."bot:links:mute" .. result.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if result.content_.entities_ and result.content_.entities_[0] and (result.content_.entities_[0].ID == "MessageEntityTextUrl" or result.content_.entities_[0].ID == "MessageEntityUrl") and redis:get(KING.."bot:webpage:mute" .. result.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if result.content_.web_page_ and redis:get(KING.."bot:webpage:mute" .. result.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if (text:match("[Hh][Tt][Tt][Pp]") or text:match("[Ww][Ww][Ww]") or text:match(".[Cc][Oo]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Rr]")) and redis:get(KING.."bot:webpage:mute" .. result.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if text:match("@") and redis:get(KING.."tags:lock" .. msg.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if text:match("#") and redis:get(KING.."bot:hashtag:mute" .. result.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if text:match("[\216-\219][\128-\191]") and redis:get(KING.."bot:arabic:mute" .. result.chat_id_) then
local msgs = {
[0] = data.message_id_
}
delete_msg(msg.chat_id_, msgs)
end
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if redis:get(KING..'bot:english:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end
end
if redis:get(KING..'editmsg'..msg.chat_id_) == 'delmsg' then
local id = msg.message_id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
elseif redis:get(KING..'editmsg'..msg.chat_id_) == 'didam' then
if redis:get(KING..'bot:editid'..msg.message_id_) then
local old_text = redis:get(KING..'bot:editid'..msg.message_id_)
send(msg.chat_id_, msg.message_id_, 1, '🚫 ممنوع التعديل رسالتك المعدله :\n*'..old_text..'*', 1, 'md')
end end end end
getMessage(msg.chat_id_, msg.message_id_, get_msg_contact)
elseif data.ID == "UpdateMessageSendSucceeded" then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
local text = msg.content_.text_
redis:sadd(KING.."groups:users" .. msg.chat_id_, msg.sender_user_id_)
if text then
if text:match("📮┇  راجع مطور البوت  لتفعيله في مجموعتك🏌️") then
pinmsg(msg.chat_id_, msg.id_, 0)
end
end
elseif data.ID == "UpdateOption" and data.name_ == "my_id" then
tdcli_function({
ID = "GetChats",
offset_order_ = "9223372036854775807",
offset_chat_id_ = 0,
limit_ = 30
}, dl_cb, nil)
if data.value_.value_ then
redis:set(KING.."Bot:KpBotAccount", data.value_.value_)
end end end end  end
----- End Source By zaeony King »»»»»»»»»»»»»»»»»»»
