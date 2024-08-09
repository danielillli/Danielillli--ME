

-- Client-side event to display the message
RegisterNetEvent('me:displayMessage')
AddEventHandler('me:displayMessage', function(message, duration)
    -- Display the message to the client
    TriggerEvent('chat:addMessage', {
        args = { message },
        color = { 255, 0, 0 }
    })

    -- Remove the message after the duration (placeholder, needs custom implementation)
    Citizen.Wait(duration)
    TriggerEvent('chat:removeMessage', message)
end)

-- Client-side event to remove the message (optional, needs custom implementation)
RegisterNetEvent('chat:removeMessage')
AddEventHandler('chat:removeMessage', function(message)
    -- Placeholder for message removal
    -- Actual removal would require custom chat management
end)
