local gumbo_parse = require("gumbo").parse

ngx.req.read_body()
local args = ngx.req.get_post_args()
local gx = args.gx or "mplibcode"
local gxn = require("resty.gxn."..gx)
local cmd = ""
if gx == "graphviz" then
   cmd = " cmd='"..args.cmd.."'"
end
local msg = string.format("<%s%s width='360' cache='no'>%s</%s>",
                          gx, cmd, args.msg, gx)

ngx.say(gxn:set_document(gumbo_parse(msg)):update_document():serialize())