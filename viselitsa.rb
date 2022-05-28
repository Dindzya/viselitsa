if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require "./game.rb"
require "./result_printer.rb"

printer = ResultPrinter.new

slovo = ARGV[0]

game  = Game.new(slovo)

while game.status == 0
  game.ask_next_letter
  printer.print_status(game)

end
