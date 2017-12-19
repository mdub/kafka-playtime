require "matrix"

module Bot

  class State

    DIRECTIONS       = %w(n e s w)
    DIRECTIONS_ASCII = %w(^ > v <)

    DELTAS = {
      "n" => Vector[0,-1],
      "e" => Vector[1,0],
      "s" => Vector[0,1],
      "w" => Vector[-1,0]
    }

    attr_accessor :x, :y, :direction

    def initialize(x:, y:, direction:)
      @x = x
      @y = y
      @direction = direction
    end

    def left
      rotate(way: -1)
    end

    def right
      rotate(way: 1)
    end

    def move
      pos = Vector[x,y]
      new_pos = pos + DELTAS.fetch(direction)
      State.new(x: new_pos[0], y: new_pos[1], direction: direction)
    end

    def to_s
      DIRECTIONS_ASCII[DIRECTIONS.index(direction)]
    end

    private

    def rotate(way:)
      new_direction_index = (DIRECTIONS.index(direction) + way) % 4
      State.new(x: x, y: y, direction: DIRECTIONS[new_direction_index])
    end

  end

end