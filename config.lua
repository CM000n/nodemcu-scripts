--
-- Basic configuration
--
-- This should be the same for all my apps. Secrets are stored in secrets.lua
--
local module = {}

-- identify NodeMCU by chipid
local nodenames = {}
nodenames[10702156] = "balcony"
nodenames[944910] = "nodedev"
module.SELF = nodenames[node.chipid()]
if module.SELF == nil then
  module.SELF = node.chipid()
  print("FAILED TO IDENTIFY NODEMCU CHIP")
end

-- configure wifi
module.WIFI = {}
module.WIFI.ssid = G.secrets.WIFISSID
module.WIFI.pwd = G.secrets.WIFIPASS

-- configure MQTT
module.MQTT = {}
module.MQTT.host = G.secrets.MQTTHOST
module.MQTT.port = G.secrets.MQTTPORT
module.MQTT.user = G.secrets.MQTTUSER
module.MQTT.pass = G.secrets.MQTTPASS
module.MQTT.endpoint = "/home-assistant/" .. module.SELF .. "/"

return module
