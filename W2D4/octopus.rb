def sluggish_octopus(arr_fish)
  arr_fish.each_with_index do |fish, i|
    #use boolean to compare fish length to others in the arr
    longest = true
    arr_fish.each_with_index do |fish2, j|
      next if i == j
      longest = false if fish2.length > fish.length
    end
    return fish if longest == true
  end
end

class Array
 
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    midpoint = self.length / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end
end

def dominant_octopus(arr_fish)
  prc = Proc.new { |x, y| y.length <=> x.length }
  arr_fish.merge_sort(&prc).first
end

def clever_octopus(arr_fish)
  biggest_fish = arr_fish.first
  arr_fish.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end
  biggest_fish
end


tiles_array = ["up", "right-up", "right", "right-down", "down",
    "left-down", "left", "left-up"]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == direction
  end
end


tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance!(direction, tiles_hash)
  tiles_hash[direction]
end