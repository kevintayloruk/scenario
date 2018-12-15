--- Adds a jail function to the admin set, require ExpGamingRole to work.
-- @module ExpGamingAdmin.Jail@4.0.0
-- @author Cooldude2606
-- @license https://github.com/explosivegaming/scenario/blob/master/LICENSE
-- @alais ThisModule 

-- Module Require
local Admin = require('ExpGamingAdmin.AdminLib')
local AdminGui = require('ExpGamingAdmin.Gui')
local Server = require('ExpGamingCore.Server')
local Role = require('ExpGamingCore.Role')
local Game = require('FactorioStdLib.Game')
local Color -- FactorioStdLib.Color@^0.8.0
local Sync -- ExpGamingCore.Sync@^4.0.0

-- Module Define
local module_verbose = false
local ThisModule = {
    on_init=function()
        if loaded_modules['ExpGamingCore.Sync'] then Sync = require('ExpGamingCore.Sync') end
        if loaded_modules['FactorioStdLib.Color'] then Color = require('FactorioStdLib.Color') end
    end
}

-- Function Define
AdminGui.add_button('jail','utility/clock',{'ExpGamingAdmin.tooltip-jail'},function(player,byPlayer)
    Admin.open(byPlayer,player,'Jail')
end)

function Admin.jail(player,by_player,reason)
    local player, by_player = Admin.valid_players(player,by_player)
    if not player then return end
    local reason = Admin.create_reason(reason,by_player.name)
    Admin.set_banned(player,'jail')
    if Sync then Sync.emit_embeded{
        title='Player Jail',
        color=Color.to_hex(defines.textcolor.med),
        description='There was a player jailed.',
        ['Player:']='<<inline>>'..player.name,
        ['By:']='<<inline>>'..by_player.name,
        ['Reason:']=reason
    } end
    Role.meta.last_jail = player.name
    Server.interface(Role.assign,true,player,'Jail',by_player.name)
    Server.interface(Role.unassign,true,player,Role.get(player),by_player.name)
end

Admin.add_action('Jail',Admin.jail)

-- Module Return
return ThisModule 