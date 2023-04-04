# frozen_string_literal: true

class Grid
  attr_reader :grid_array

  def initialize
    @grid_array = Array.new(3) { Array.new(3) { ' ' } }
  end

  def mark(row, col, player)
    @grid_array[row][col] = player
  end

  def occupied?(row, col)
    @grid_array[row][col] == ' '
  end

  def filled?
    !@grid_array.flatten.uniq.include?(' ')
  end

  def check_win?(player, row, col)
    return true if @grid_array[row].uniq == [player] # Row check
    return true if @grid_array.map { |r| r[col] }.uniq == [player] # Column check
    return true if @grid_array.each_with_index.map { |r, i| r[i] }.uniq == [player] # Top-left diagonal
    return true if @grid_array.each_with_index.map { |r, i| r[-i - 1] }.uniq == [player] # Bottom-left diagonal

    false
  end

  def display
    puts <<-BOARD
         1   2   3
        
      1  #{display_row(@grid_array[0])}
         —————————
      2  #{display_row(@grid_array[1])}
         —————————
      3  #{display_row(@grid_array[2])}

    BOARD
  end

  def display_row(row)
    "#{row[0]} | #{row[1]} | #{row[2]}"
  end
end
