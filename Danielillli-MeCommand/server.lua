

-- Register the /me command
RegisterCommand('me', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local prompt = table.concat(args, " ", 1, #args - 1)
    local duration = tonumber(args[#args]) or 5000 -- Default to 5000ms (5 seconds) if no duration is provided

    if prompt and prompt ~= "" then
        -- Format the message
        local formattedMessage = string.format("* %s %s *", playerName, prompt)

        -- Send the message and duration to all clients
        TriggerClientEvent('me:displayMessage', -1, formattedMessage, duration)
    else
        -- Send feedback if the prompt is missing
        TriggerClientEvent('chat:addMessage', source, {
            args = { "Usage: /me {Prompt} {Duration (optional, in ms)}" },
            color = { 255, 0, 0 }
        })
    end
end, false)

-- Suggest command usage in the chat
TriggerEvent('chat:addSuggestion', '/me', 'Displays a roleplay action', {
    { name = "Prompt", help = "The action to display" },
    { name = "Duration", help = "Duration in milliseconds (optional)" }
})
