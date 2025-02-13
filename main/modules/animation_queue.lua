Object = require("main.class")

Animation_queue = Object:extend()

Animation_queue.start_animation = function ()
    local min_priority = Animation_queue.animations[1].priority
    for _, value in ipairs(Animation_queue.animations) do
        if value.priority == min_priority and 
            coroutine.status(value.animation) == "suspended" then
                coroutine.resume(value.animation)
        end
    end
end

Animation_queue.on_animation_complete = function ()
    table.remove(Animation_queue.animations, 1)
    if #Animation_queue.animations == 0 then return end
    Animation_queue.start_animation()
end

Animation_queue.comparable = function (el1, el2)
    return el1.priority < el2.priority
end

function Animation_queue:new()
    Animation_queue.animations = {}
end

---@param animation thread
---@param priority integer
function Animation_queue:add_animation(animation, priority)
    table.insert(self.animations,
        {
            animation = animation,
            priority = priority
        })
    table.sort(self.animations, self.comparable)
    self.start_animation()
end


---@return
---| '"running"'
---| '"dead"'      
function Animation_queue:get_status()
    if #self.animations > 0 then
        return "running"
    else
        return "dead"
    end
end

return Animation_queue