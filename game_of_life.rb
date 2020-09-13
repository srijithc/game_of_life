# Conway's Game of Life
# Supported types: [:block, :toad, :blinker, :random]
#
class GameOfLife
  @@x = 6;
  @@y = 6;
  @@oscillator_count = 50

  attr_accessor :type

  #
  # initialize
  #
  def initialize
  end

  #
  # oscillate
  #
  def oscillate
    construct_array_with_default_live_cells
    next_array = @start_array
    (1..@@oscillator_count).to_a.each do |i|
      p "----------#{i}-----------"
      next_array = apply_rule(next_array)
      print_array next_array
    end
  end

  private

  #
  # construct_array_with_default_live_cells
  #
  def construct_array_with_default_live_cells
    @start_array = construct_array

    case @type
    when :blinker
      @start_array[1][2] = 1
      @start_array[2][2] = 1
      @start_array[3][2] = 1
    when :block
      @start_array[1][1] = 1
      @start_array[1][2] = 1
      @start_array[2][1] = 1
    when :toad
      @start_array[2][2] = 1
      @start_array[2][3] = 1
      @start_array[2][4] = 1
      @start_array[3][1] = 1
      @start_array[3][2] = 1
      @start_array[3][3] = 1
    else
      @start_array = construct_array(:random)
    end
    @start_array
  end

  #
  # print_array
  # @param {Array} array
  #
  def print_array(array)
    array.each do |value|
      p value.join("").gsub("0", ".")
    end
  end

  #
  # construct_array
  # @param {Symbol} type (optional)
  #
  def construct_array(type=nil)
    start_array = []
    (0..@@x - 1).each do |x|
      a = []
      (0..@@y - 1).each do |y|
        if type == :random
          a << rand(2)
        else
          a << 0
        end

      end
      start_array << a
    end
    start_array
  end

  #
  # border?
  # @param {Integer} x
  # @param {Integer} y
  #
  def border?(x, y)
    return true if (x-1).negative? || (y-1).negative?
    return true if (x+1) == @@x || (y+1) == @@y
  end

  #
  # apply_rule
  #
  def apply_rule(prev_array)

    next_array = construct_array

    (0..@@x-1).each do |x|
      (0..@@y-1).each do |y|
        next if border?(x, y)

        neighbours = get_neighbours(prev_array, x, y)
        if prev_array[x][y] == 1
          if [2, 3].include? neighbours # Any live cell with two or three live neighbours survives
            next_array[x][y] = 1
          elsif neighbours > 3 # Any live cell with more than three live neighbours dies, as if by overpopulation
            next_array[x][y] = 0
          else # Any live cell with fewer than two live neighbours dies, as if by underpopulation
            next_array[x][y] = 0
          end
        else
          if neighbours == 3 #Any dead cell with three live neighbours becomes a live cell
            next_array[x][y] = 1
          else
            next
          end
        end
      end
    end

    next_array
  end

  #
  # get_neighbours
  # @param {integer} x
  # @param {integer} y
  # @param {Array} array
  #
  def get_neighbours(array, x, y)
    sum = 0
    return sum if border?(x, y)

    [0, -1, +1].each do |px|
      [0, -1, +1].each do |py|
        next if px == 0 && py == 0
        sum += array[x + (px)][y + (py)]
      end
    end

    sum
  end
end

game_of_life = GameOfLife.new
if ARGV[0].nil?
  p "Considering default type :blinker"
  game_of_life.type = :blinker
else
  game_of_life.type = ARGV[0].to_sym
end

game_of_life.oscillate