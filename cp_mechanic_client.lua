-- Based on es_carwash by 'EssentialMode 5 CarWash by TheSpartaPT.' --
-- Modified a bit by Calm Producions
-- RECOMMEND-THAT-YOU-DO-NOT-EDIT-BELLOW-THIS-LINE--

Key = 201 -- ENTER

vehicleRepairStation = {
	{-337.0, -135.0, 39.0}, -- LSC Burton mechanic
	{538.0, -183.0, 54.0}, -- Mechanic Hawic
	{1143.0, -775.0, 57.0}, -- Mechanic Mirror Park
	{-31.3, -1090.2, 25.7}, -- Simeons PDM
	{734.0, -1085.0, 22.0}, -- LSC La Mesa airport mechanic
	{476.8, -1282.5, 28.8}, -- Auto Re-Perez Little Bighorn
	{250.0, -1804.8, 26.5}, -- Hayes Auto Shop, Davis
	{-222.0, -1329.7, 30.0}, -- Bennys
	{-1155.0, -2007.0, 13.0}, -- LSC by airport mechanic
	{-445.26, -2177.76, 10.0}, -- Otto's Auto, LSI Elysin Island
	{110.6, 6626.6, 31.0}, -- LSC Paleto Bay mechanic
	{-232.1, 6256.1, 31.0}, -- Helmut's Auto
	{2508.0, 4103.0, 37.0}, -- Mechanic East Joshua Rd.
	{2005.0, 3797.9, 31.5}, -- Mechanic Sandy Shores gas station
	{434.5, 3577.1, 32.5}, -- Auto Shop, Grand Senora Desert
	{1775.7, 3333.8, 40.5}, -- Mechanic Sandy Shores Airfield
	{258.6, 2590.0, 44.2}, -- 68 Mechanic Harmony Gas Station
	{1175.0, 2640.0, 37.0} -- 68 Harmony airport mechanic
}

Citizen.CreateThread(function ()
	Citizen.Wait(0)
	for i = 1, #vehicleRepairStation do
		garageCoords = vehicleRepairStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 402) -- 402 radar_repair blip
		SetBlipColour(stationBlip, 1) -- 0 White, 1 Red, 2 Green, 3 Blue etc.
		SetBlipAsShortRange(stationBlip, true)
		SetBlipDisplay(stationBlip, 2) -- 0 Doesn't showup ever. 
										--1 Doesn't showup ever anywhere. 
										--2 Shows on both main map and minimap 
										--3&4 Main map only 
										--5 shows on minimap only 
										--6 shows on both 
										--7 Doesn't showup 
										--8 both not selectable
										--9 minimap only 
										--10 both not selectable
										--Rockstar seem to only use 0, 2, 3, 4, 5 and 8 in the decompiled scripts.
	end
    return
end)

function cp_mechanic_DrawSubtitleTimed(m_text, showtime)
	SetTextEntry_2('STRING')
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function cp_mechanic_DrawNotification(m_text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(m_text)
	DrawNotification(true, false)
end

Citizen.CreateThread(function ()

	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(PlayerPedId()) then 
			for i = 1, #vehicleRepairStation do
				garageCoords2 = vehicleRepairStation[i]
				if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 20 then
					DrawMarker(1, garageCoords2[1], garageCoords2[2], garageCoords2[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 158, 0, 0, 155, 0, 0, 2, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
						cp_mechanic_DrawSubtitleTimed("Press [~g~ENTER~s~] to repair your vehicle!")
						if IsControlJustPressed(1, Key) then
							TriggerServerEvent('cp_mechanic:checkmoney')
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('cp_mechanic:success')
AddEventHandler('cp_mechanic:success', function (price)
	player = PlayerPedId()
	playerVehicle = GetVehiclePedIsUsing(player)
	SetVehicleEngineHealth(playerVehicle, 1000.0)
--	SetVehicleBodyHealth(playerVehicle, 1000.0)
--	SetVehicleWheelHealth(playerVehicle, 1000.0)
--	SetVehiclePetrolTankHealth(playerVehicle, 1000.0)
--	SetVehicleUndriveable(playerVehicle, false)
--	SetVehicleFixed(playerVehicle)
	Citizen.Wait(1000)
	cp_mechanic_DrawNotification("Your vehicle's engine was ~y~repaired~s~! ~g~-$" .. price .. "~s~!")
end)

RegisterNetEvent('cp_mechanic:notenoughmoney')
AddEventHandler('cp_mechanic:notenoughmoney', function (moneyleft)
	cp_mechanic_DrawNotification("~h~~r~You don't have enough money! $" .. moneyleft .. " left!")
end)

RegisterNetEvent('cp_mechanic:free')
AddEventHandler('cp_mechanic:free', function ()
	player = PlayerPedId()
	playerVehicle = GetVehiclePedIsUsing(player)
	SetVehicleEngineHealth(playerVehicle, 1000.0)
--	SetVehicleBodyHealth(playerVehicle, 1000.0)
--	SetVehicleWheelHealth(playerVehicle, 1000.0)
--	SetVehiclePetrolTankHealth(playerVehicle, 1000.0)
--	SetVehicleUndriveable(playerVehicle, false)
--	SetVehicleFixed(playerVehicle)
	Citizen.Wait(1000)
	cp_mechanic_DrawNotification("Your vehicle's engine was ~y~repaired~s~ for free!")
end)
