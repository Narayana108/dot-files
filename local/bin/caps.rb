#!/usr/bin/env ruby

# Get first user arguement
caps_mode = ARGV.first

case caps_mode
  when "off"  
    begin
      system 'xmodmap -e "clear lock"'
      system 'xmodmap -e "keycode 0x42 = Escape"'
      puts "Capslock is now escape"
    rescue
      puts("Error running xmodmap command")
    end

  when "on"  
    begin
      system 'xmodmap -e "keycode 0x42 = Caps_Lock"'
      system 'xmodmap -e "add lock = Caps_Lock"'
      puts "Capslock is now capslock"
    rescue
      puts("Error running xmodmap command")
    end

  else  
    puts "Usage: ./caps on/off"
end
