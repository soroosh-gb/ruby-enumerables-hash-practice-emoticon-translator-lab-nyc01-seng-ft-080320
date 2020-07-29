require 'yaml'
require 'pry'

def load_library(file)
  data = YAML.load_file(file)
  result = {}
  data.each do |emoti_name, emoti_trans|
    english = emoti_trans[0]
    japanese = emoti_trans[1]
    result[emoti_name] = {
        :english => english,
        :japanese => japanese
    }
  end
  result
end


def get_japanese_emoticon(file , western_emoticon)
  result = "Sorry, that emoticon was not found"
  data = load_library(file)
  data.each do |emoti_name , emoti_trans|
    if emoti_trans[:english] == western_emoticon
      result = emoti_trans[:japanese]
    end
  end
  result 
end


def get_english_meaning(file, japanese_emoticon)
  result = "Sorry, that emoticon was not found"
  data = load_library(file)
  data.each do |emoti_name , emoti_trans|
    if emoti_trans[:japanese] == japanese_emoticon
      result = emoti_name
    end
  end
  result
end

