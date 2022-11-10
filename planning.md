# Enigma

# Classes:
1. Runner
2. Enigma
  1. has an encrypt method that takes txt/key/date with defaults and returns a hash with those, but encrypted
  2. has a decrypt method that takes cipher/key/date with defaults and returns a hash with those, but decrypted
  3. has an alphabet state
3. Shift subclass
  1. creates keys and offsets, combines to give the 4 different shifts
4. Rotation subclass
  1. takes the shifts created in Shift and applies them to alphabet


# Modules
1. Alphabet

# Runners
1. encrypt.rb that takes two CL arguments, one takes in a .txt file, and encrypts it
  then it returns the file name, the key, and the date used
2. decrypt.rb does the opposite^ 

  IE: $ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818