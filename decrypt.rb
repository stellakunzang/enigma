require "./lib/enigma"
require "pry"

enigma = Enigma.new

text = File.open(ARGV[0], "r")

enigma.decrypt(text.read, ARGV[2], ARGV[3])

text.close
decrypted_text = enigma.message

decrypted = File.open(ARGV[1], "w")
decrypted.write(decrypted_text)
decrypted.close

puts "Created #{ARGV[1]} with the key #{enigma.key} and the date #{enigma.date}"
