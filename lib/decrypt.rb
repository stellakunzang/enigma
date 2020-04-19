require "./lib/enigma"

enigma = Enigma.new

text = File.open(ARGV[0], "r")

if !ARGV[3]
  enigma.decrypt(text.read, ARGV[2])
else
  enigma.decrypt(text.read, ARGV[2], ARGV[3])
end

text.close
decrypted_text = enigma.message

decrypted = File.open(ARGV[1], "w")
decrypted.write(decrypted_text)
decrypted.close

puts "Created #{ARGV[1]} with the key #{enigma.key} and the date #{enigma.date}"
