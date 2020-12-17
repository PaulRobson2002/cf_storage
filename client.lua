local CF = nil

local locationss = {
    {
    x = -40.67,
    y = -620.37,
    z = 35.06,
    name = "Storage Facility "
    },
    {
    x = -39.82,
    y = -617.89,
    z = 35.11,
    name = "Storage Facility "
    },
    {
    x = -38.58,
    y = -615.33,
    z = 35.12,
    name = "Storage Facility "
    },
    {
    x = -37.54,
    y = -612.72,
    z = 35.08,
    name = "Storage Facility "
    },
    {
    x = -33.96,
    y = -614.04,
    z = 35.09,
    name = "Storage Facility "
    },
    {
    x = -438.08,
    y = 6145.17,
    z = 31.48,
    name = "Storage Facility "
    },
    {
    x = -435.89,
    y = 6142.51,
    z = 31.48,
    name = "Storage Facility "
    },
    {
    x = -440.72,
    y = 6147.82,
    z = 31.48,
    name = "Storage Facility "
    },
    {
    x = -432.72,
    y = 6139.56,
    z = 31.48,
    name = "Storage Facility "
    },
    {
    x = -429.2,
    y = 6136.32,
    z = 31.48,
    name = "Storage Facility "
    },
    {
    x = 581.62,
    y = 2782.98,
    z = 43.49,
    name = "Storage Facility "
    },
    {
    x = 585.69,
    y = 2783.73,
    z = 43.49,
    name = "Storage Facility "
    },
    {
    x = 589.03,
    y = 2783.73,
    z = 43.49,
    name = "Storage Facility "
    },
    {
    x = 593.55,
    y = 2784.42,
    z = 43.49,
    name = "Storage Facility "
    },
    {
    x = 596.58,
    y = 2784.53,
    z = 43.49,
    name = "Storage Facility "
    },
    {
      x = 1729.05,
      y = 4775.3,
      z = 41.83,
    name = "Storage Facility "
    },
    {
      x = 1729.13,
      y = 4771.75,
      z = 41.83,
    name = "Storage Facility "
    },
    {
      x = 1728.99,
      y = 4768.5,
      z = 41.83,
    name = "Storage Facility "
    },
    {
      x = 1729.24,
      y = 4780.73,
      z = 41.9,
    name = "Storage Facility "
    },
    {
      x = 1729.37,
      y = 4763.79,
      z = 41.87,
    name = "Storage Facility "
    },
    {
      x = -874.65,
      y = -2734.86,
      z = 13.89,
      name = "Storage Facility "
    },
    {
      x = -876.27,
      y = -2738.02,
      z = 13.9,
      name = "Storage Facility "
    },
    {
      x = -872.38,
      y = -2731.43,
      z = 13.9,
      name = "Storage Facility "
    },
    {
      x = 919.45,
      y = -1268.75,
      z = 25.55,
      name = "Storage Facility "
    },
    {
      x = 923.46,
      y = -1266.16,
      z = 25.52,
      name = "Storage Facility "
    },
    {
      x = 915.98,
      y = -1271.55,
      z = 25.57,
      name = "Storage Facility "
    },
    {
      x = 912.15,
      y = -1269.08,
      z = 25.58,
      name = "Storage Facility "
    },
    {
      x = 4449.66,
      y = -4464.09,
      z = 4.33,
      name = "Storage Facility "
    },
    {
      x = 4451.47,
      y = -4467.93,
      z = 4.33,
      name = "Storage Facility "
    },
    {
      x = 4452.77,
      y = -4471.65,
      z = 4.33,
      name = "Storage Facility "
    },
    {
      x = 4447.98,
      y = -4460.56,
      z = 4.33,
      name = "Storage Facility "
    },
  }

local blipinfo = {
  {
    x = -40.67,
    y = -620.37,
    z = 35.06,
  },
  {
    x = -438.08,
    y = 6145.17,
    z = 31.48,
  },
  {
    x = 581.62,
    y = 2782.98,
    z = 43.48,
  },
  {
    x = 1729.05,
    y = 4775.3,
    z = 41.83,
  },
  {
    x = -874.65,
    y = -2734.86,
    z = 13.89,
  },
  {
    x = 919.6,
    y = -1264.61,
    z = 25.55,
  },
  {
    x = 4453.17,
    y = -4466.6,
    z = 4.33,
  }
}



Citizen.CreateThread(function()
	while CF == nil do 
      Citizen.Wait(0)
      TriggerEvent('cf:getSharedObject', function(obj) CF = obj end)
    end
end)

Citizen.CreateThread(function()
	while true do
    Citizen.Wait(0)
    for k,v in ipairs(locationss) do
      local coords = GetEntityCoords(GetPlayerPed(-1), true)
                local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, locationss[k].x, locationss[k].y, locationss[k].z, true)
				if distance < 1.0 then
					--print(locationss[i])
					Draw3DText( locationss[k].x, locationss[k].y, locationss[k].z -1.75, ('Press ~r~E ~w~to view ' .. locationss[k].name), 4, 0.1, 0.1)
					DrawMarker(27, locationss[k].x, locationss[k].y, locationss[k].z-1, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 1.50, 1.50, 1.50, 0, 100, 255, 150, false, true, 2, false, false, false, false)
          if IsControlJustReleased(1,  38) then
            TriggerServerEvent("cf:OpenStorage", locationss[k].name)
          end
        elseif distance < 30.0 then
          DrawMarker(27, locationss[k].x, locationss[k].y, locationss[k].z-1, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 1.50, 1.50, 1.50, 0, 100, 255, 150, false, true, 2, false, false, false, false)
        end
		end
	end
end)



function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
  local scale = (1/dist)*20
  local fov = (1/GetGameplayCamFov())*100 
  SetTextScale(0.35, 0.35)
  SetTextFont(fontId)
  SetTextProportional(0)
  SetTextColour(255, 255, 255, 215)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(textInput)
  SetDrawOrigin(x,y,z+2, 0)
  DrawText(0.0, 0.0)
  ClearDrawOrigin()   
end

Citizen.CreateThread(function()
  for _, info in pairs(blipinfo) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, 50)
    SetBlipDisplay(info.blip, 4)
    SetBlipColour(info.blip, 81)
    SetBlipScale(info, 0.9)
    SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Storage Facility')
    EndTextCommandSetBlipName(info.blip)
  end
end)