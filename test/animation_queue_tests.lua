return function()
    local animations_queue = require("main.modules.animation_queue_module")

    local function test_function()
        animations_queue.animation_queue.on_animation_complete()
    end

    describe("Animation Queue Tests", function ()
            it("should added animation to queue and complete 1 (valid function added)", function ()
                animations_queue.animation_queue:add_animation(coroutine.create(function ()
                    test_function()
                    pprint("1")
                    assert_equal(#animations_queue.animation_queue.animations, 0)
                end), 1)
            end)
    
            it("should added animation to queue and complete 2 (valid function added)", function ()
                animations_queue.animation_queue:add_animation(coroutine.create(function ()
                    test_function()
                    pprint("2")
                    assert_equal(#animations_queue.animation_queue.animations, 0)
                end), 1)
        end)
    end)
end
