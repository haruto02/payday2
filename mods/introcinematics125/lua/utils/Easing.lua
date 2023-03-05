Easing = {
    -- no easing, no acceleration
    linear = function(t) return t end,
    -- accelerating from zero velocity
    easeInQuad = function(t) return t*t end,
    -- decelerating to zero velocity
    easeOutQuad = function(t) return t*(2-t) end,
    -- acceleration until halfway, then deceleration
    easeInOutQuad = function(t) return t < 0.5 and 2*t*t or -1+(4-2*t)*t end,
    -- accelerating from zero velocity 
    easeInCubic = function(t) return t*t*t end,
    -- decelerating to zero velocity 
    easeOutCubic = function(t) return (t-1)*t*t+1 end,
    -- acceleration until halfway, then deceleration 
    easeInOutCubic = function(t) return t < 0.5 and 4*t*t*t or (t-1)*(2*t-2)*(2*t-2)+1 end,
    -- accelerating from zero velocity 
    easeInQuart =  function(t) return t*t*t*t end,
    -- decelerating to zero velocity 
    easeOutQuart = function(t) return 1-(t-1)*t*t*t end,
    -- acceleration until halfway, then deceleration
    easeInOutQuart = function(t) return t < 0.5 and 8*t*t*t*t or 1-8*(t-1)*t*t*t end,
    -- accelerating from zero velocity
    easeInQuint = function(t) return t*t*t*t*t end,
    -- decelerating to zero velocity
    easeOutQuint = function(t) return 1+(t-1)*t*t*t*t end,
    -- acceleration until halfway, then deceleration 
    easeInOutQuint = function(t) return t < 0.5 and 16*t*t*t*t*t or 1+16*(t-1)*t*t*t*t end
}