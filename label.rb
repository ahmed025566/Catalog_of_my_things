require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def self.list_labels(labels)
    labels.each do |label|
      puts "Label ID: #{label.id}, Title: #{label.title}"
    end
  end
end
