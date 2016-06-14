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
        "\e[#{value}m" + self.to_s + "\e[0m"
      end
      }
  end

end
