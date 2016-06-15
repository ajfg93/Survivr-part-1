class String
  @@Colorizr_colors = {
    :red => 31,
    :green => 32,
    :yello => 33,
    :blue => 34,
    :pink => 35,
    :light_blue => 94,
    :white => 97,
    :light_grey => 37,
    :black => 30
  }

  def self.create_colors
    @@Colorizr_colors.each { |key,value|
      send(:define_method, "#{key}") do
        "\e[#{value}m" + self + "\e[0m" #self.to_s
      end
      }
  end

  def self.colors
      @@Colorizr_colors.map {|key, value| key}
  end

  def self.sample_colors
      color_collection = colors #self.color
      color_collection.each do |color| #color.to_s
        # "This is #{color}"."#{color}", won't work
        # things inside "" will be considered as String literal
        sample = "This is #{color}"
        puts sample.send(:"#{color}")

      end

  end

end

String.create_colors
# String.colors
# String.sample_colors
