--- This contains a list of all files that will be loaded and the order they are loaded in
-- to stop a file from loading add "--" in front of it, remove the "--" to have the file be loaded
-- config files should be loaded after all modules are loaded
-- core files should be required by modules and not be present in this list
return {
    --'example.file_not_loaded',
    'modules.factorio-control', -- base factorio free play scenario
    -- Game Commands
    'modules.commands.me',
    'modules.commands.kill',
    'modules.commands.admin-chat',
    'modules.commands.tag',
    'modules.commands.teleport',
    'modules.commands.cheat-mode',
    'modules.commands.interface',
    'modules.commands.help',
    -- QoL Addons
    'modules.addons.chat-popups',
    'modules.addons.damage-popups',
    'modules.addons.death-markers',
    -- Config Files
    'config.command_auth_admin', -- commands tagged with admin_only are blocked for non admins
    'config.command_auth_runtime_disable', -- allows commands to be enabled and disabled during runtime
    'config.permission_groups', -- loads some predefined permission groups
}