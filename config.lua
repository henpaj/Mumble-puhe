mumbleConfig = {
    voiceModes = {
        {2.5, "Kuiskaa"},
        {8, "Normaali"},
        {20, "Huuda"},
    },
    speakerRange = 1.5,
    callSpeakerEnabled = true,
    radioSpeakerEnabled = true,
    radioEnabled = true,
    micClicks = true,
    micClickOn = true,
    micClickOff = true,
    micClickVolume = 0.1,
    radioClickMaxChannel = 100,
    controls = {
        proximity = {
            key = 20, -- Z
        },
        radio = {
            pressed = false,
            key = 137,
        },
        speaker = {
            key = 20, -- Z
            secondary = 21,
        }
    },
    radioChannelNames = {
        [1] = "Poliisiradio 1",
        [2] = "Poliisiradio 2",
        [3] = "Ensihoitoradio 1",
        [4] = "Ensihoitoradio 2",
        [500] = "Tulliradio 1",
    }
}

function SetMumbleProperty(key, value)
	if mumbleConfig[key] ~= nil and mumbleConfig[key] ~= "controls" and mumbleConfig[key] ~= "radioChannelNames" then
		mumbleConfig[key] = value
	end
end

function AddRadioChannelName(channel, name)
    local channel = tonumber(channel)

    if channel ~= nil and name ~= nil and name ~= "" then
        if not mumbleConfig.radioChannelNames[channel] then
            mumbleConfig.radioChannelNames[channel] = tostring(name)
        end
    end
end

-- Make exports available on first tick
exports("SetMumbleProperty", SetMumbleProperty)
exports("SetTokoProperty", SetMumbleProperty)
exports("AddRadioChannelName", AddRadioChannelName)
