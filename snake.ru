require 'gosu'

class SnakeGame < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = "Snake Game"
    @snake = Snake.new
    @food = Food.new
  end

  def update
    @snake.move
    if @snake.collides_with?(@food)
      @snake.grow
      @food.respawn
    end
    close if @snake.collides_with_self?

    sleep(0.08) # Add a delay of 0.1 seconds
  end

  def draw
    @snake.draw
    @food.draw
  end

  def button_down(id)
    case id
    when Gosu::KB_UP
      @snake.change_direction(:up)
    when Gosu::KB_DOWN
      @snake.change_direction(:down)
    when Gosu::KB_LEFT
      @snake.change_direction(:left)
    when Gosu::KB_RIGHT
      @snake.change_direction(:right)
    end
  end
end

class Snake
  def initialize
    @segments = [Segment.new(320, 240)]
    @direction = :right
  end

  def move
    new_x = @segments.first.x
    new_y = @segments.first.y

    case @direction
    when :up
      new_y -= Segment::SIZE
    when :down
      new_y += Segment::SIZE
    when :left
      new_x -= Segment::SIZE
    when :right
      new_x += Segment::SIZE
    end

    @segments.pop
    @segments.unshift(Segment.new(new_x, new_y))
  end

  def draw
    @segments.each(&:draw)
  end

  def change_direction(direction)
    @direction = direction unless opposite_direction?(direction)
  end

  def grow
    last_segment = @segments.last
    new_x = last_segment.x
    new_y = last_segment.y

    case @direction
    when :up
      new_y += Segment::SIZE
    when :down
      new_y -= Segment::SIZE
    when :left
      new_x += Segment::SIZE
    when :right
      new_x -= Segment::SIZE
    end

    @segments.push(Segment.new(new_x, new_y))
  end

  def collides_with?(object)
    @segments.first.collides_with?(object)
  end

  def collides_with_self?
    head = @segments.first
    @segments[1..-1].any? { |segment| segment.collides_with?(head) }
  end

  private

  def opposite_direction?(direction)
    case @direction
    when :up
      direction == :down
    when :down
      direction == :up
    when :left
      direction == :right
    when :right
      direction == :left
    end
  end
end

class Segment
  SIZE = 20

  def initialize(x, y)
    @x = x
    @y = y
  end

  def draw
    Gosu.draw_rect(@x, @y, SIZE, SIZE, Gosu::Color::WHITE)
  end

  def collides_with?(object)
    object.x == @x && object.y == @y
  end

  attr_reader :x, :y
end

class Food
  def initialize
    @x = rand(32) * Segment::SIZE
    @y = rand(24) * Segment::SIZE
  end

  def draw
    Gosu.draw_rect(@x, @y, Segment::SIZE, Segment::SIZE, Gosu::Color::RED)
  end

  def respawn
    @x = rand(32) * Segment::SIZE
    @y = rand(24) * Segment::SIZE
  end

  attr_reader :x, :y
end

SnakeGame.new.show
