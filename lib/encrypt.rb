require "./lib/enigma"

enigma = Enigma.new

text = File.open(ARGV[0], "r")

if ARGV[3]
  enigma.encrypt(text.read, ARGV[2], ARGV[3])
elsif ARGV[2]
  enigma.encrypt(text.read, ARGV[2])
else
  enigma.encrypt(text.read)
end

text.close
encrypted_text = enigma.message

encrypted = File.open(ARGV[1], "w")
encrypted.write(encrypted_text)
encrypted.close

puts "Created #{ARGV[1]} with the key #{enigma.key} and the date #{enigma.date}"
