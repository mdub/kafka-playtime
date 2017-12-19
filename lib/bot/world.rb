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
      e = event["event"]
      robot_name = event["robot"]
      case event["type"]
      when "place"
        p({x: e["x"], y: e["y"], direction: e["direction"]})
        state = Bot::State.new(x: e["x"], y: e["y"], direction: e["direction"])
        @robots[robot_name] = state
      when "left", "right", "move"
        @robots[robot_name] = @robots[robot_name].send event["type"]
      end
    end
  end
end
