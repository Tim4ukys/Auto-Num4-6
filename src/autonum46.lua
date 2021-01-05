script_name 'Auto num 6 num 4'
script_author("Tim4ukys")
script_description("Авто нажатие на num4 и num6")
script_url("https://vk.com/petrov_team")
script_version_number(03122020)
script_version('1.00')

local memory = require 'memory'

function main()
	while true do
        wait(0)
        local num_state = memory.getint8(0xC7176C, true) -- home
        local num_rub_state = memory.getint8(0xC7182C, true) -- fish
        if num_state == 52 or num_rub_state == 52 then 
            goKeyPressed(100)
            printStringNow('Num 4', 2000)
        elseif num_state == 54 or num_rub_state == 54 then 
            goKeyPressed(102) 
            printStringNow('Num 6', 2000)
        end

        -- if num_rub_state == 52 then 
        --     goKeyPressed(100)
        --     printStringNow('Num 4', 2000)
        -- elseif num_rub_state == 54 then 
        --     goKeyPressed(102) 
        --     printStringNow('Num 6', 2000)
        -- end
        wait(500)
	end
end

function goKeyPressed(keyID)
    lua_thread.create(function()
       setVirtualKeyDown(keyID, true)
       wait(100)
       setVirtualKeyDown(keyID, false)
    end)
end
