---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by fire9.
--- DateTime: 29/09/2021 17:19
---

Citizen.CreateThread(function()
    TriggerServerEvent('getPnj')
    RegisterNetEvent('regenPnj')
    AddEventHandler('regenPnj', function(gangPnjs)
        for index,data in pairs(gangPnjs) do
            local hash = GetHashKey( data.model )
            while not HasModelLoaded( hash ) do
                RequestModel( hash )
                Wait(20)
            end

            local pnj = CreatePed(9, hash, data.pos_x, data.pos_y, data.pos_z, data.heading, false, false)
            SetEntityInvincible(pnj, true)
            Wait(1000)
            FreezeEntityPosition(pnj, true)
        end
    end)
end)