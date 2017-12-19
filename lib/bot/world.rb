module Bot
  class World
    WIDTH = 5
    HEIGHT = 5

    def initialize
      @robots = {}
    end

    def to_s
      (0..HEIGHT).map do |y|
        (0..WIDTH).map do |x|
          robot = @robots.values.find { |state| state.x == x && state.y == y }
          robot ? robot.to_s : "."
        end.join
      end.join "\n"
    end

    def process event
      p 10
      e = event["event"]
      robot_name = event["robot"]
      case event["type"]
      when "place"
        p 11
        p e
        p 12
        p({x: e["x"], y: e["y"], direction: e["direction"]})
        p 13
        state = Bot::State.new(x: e["x"], y: e["y"], direction: e["direction"])
        p 14
        p state
        p 15
        p @robots[robot_name]
        p 16
        @robots[robot_name] = state
        p 17
      when "left", "right", "move"
        @robots[robot_name] = @robots[robot_name].send event["type"]
      end
      p 13
    end
  end
end
