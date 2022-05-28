#класс с основной логикой игры
class Game
  #поля класса
  def inititalize(slovo)
    @letters = get_letters(slovo)

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = 0
  end

  def get_letters(slovo)
    #проверка слова для игры
    if slovo == nil || slovo == ""
      abort "Вы не ввели слово для игры"
    end
      slovo.encode('UTF-8').split('')
  end
  #1. cпросить букву
  #2. проверить результат
  def ask_next_letter
    puts "/nВведите следующую букву"

    letter == ''
    while letter == ''
      letter = STDIN.gets.encode(UTF-8).chomp
    end
     next_step(letter)
  end
  #проверка закончена игра или нет
  #была ли буква введена или нет
  #распределение буква в зависимости от того подходит он или нет
  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end
    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end
    if @letters.include?(bukva)
      @good_letters << bukva
      if @good_letters.uniq.size == @letters.uniq.size
        @status = 1
      end
    else
      @bad_letters << bukva
      @errors += 1
      if @errors >= 7
        @status = -1
      end
    end
  end
  #пищем геттеры
  def letters
    @letters
  end
  def good_letters
    @good_letters
  end
  def bad_letters
    @bad_letters
  end
  def errors
    @errors
  end
  def status
    @status
  end

  end
