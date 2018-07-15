# require modules here
require "yaml"
#emoticons = YAML.load_file('emoticons.yml')

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  puts "emoticons = #{emoticons}"
  #the keys 'get_meaning' and 'get_emoticon' point to the inner hashes
  get_emoticon = {}
  #get_emoticon["get_emoticon"]  #keys inside 'get_emoticon' hash are the English emoticons
  #get_emoticon["get_meaning"] = #keys inside get_meaning hash are the Japanese emoticons
  
  #puts "{emoticons}"
  
  get_emoticon[:get_emoticon] = {}
  get_emoticon[:get_meaning] = {}
  
  emoticons.each do |meaning, data|
    #puts "meaning = #{meaning}"
    #puts "data = #{data}"
    count = 0
    data.each do |language|
      #puts "language = #{language}"
        #puts "language = #{language}"
         if count == 0
          get_emoticon[:get_emoticon][language] = meaning
          count+=1
         else
          get_emoticon[:get_meaning][language] = meaning
         end
    end #data.each
  end #emoticons.each
  puts "get_emoticon = #{get_emoticon}"
  get_emoticon
end #load_library

def get_japanese_emoticon(path, emoticon)
  #Returns Japanese equivalent of an English emoticon
  found = 0
  symbol_meaning = ""
  get_symbols = load_library(path)
  get_symbols.each do |key_data, key_get|
    key_get.each do |inner_key, inner_value|
      if  inner_key == emoticon
        symbol_meaning = get_symbols[:get_meaning][emoticon]
        found = 1
        #if  == emoticon
      end  
    end #key_get
  end # get_symbols
  if found == 0
    puts "Sorry, that emoticon was not found"
  end
  symbol_meaning
end

def get_english_meaning(path, emoticon)
  #Returns English equivalent of a Japanese emoticon
  symbols = load_library(path)
  # code goes here
end