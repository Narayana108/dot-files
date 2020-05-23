require "colorize"
# Date
date = Time.local.to_s("%a %d %b") # => "Sat 23 May"

# Brightness
brightness = `cat /sys/class/backlight/intel_backlight/brightness`.chomp.chomp("000")
max_brightness = `cat /sys/class/backlight/intel_backlight/max_brightness`.chomp.chomp("000")

# Disk space
partition = "/"
df_output = `df -BG #{partition}`
hdd_line = df_output.split(/\n/)[1] # Use second line of output
hdd_percent = hdd_line.split[4]     # Print 5th column
hdd_avail = hdd_line.split[3]       
hdd_total = hdd_line.split[1]      

# Tempreture
sensors_output = `sensors`
temp = ""
sensors_output.each_line do |line|    # Loop through string line for line
  if line.includes?("Package id 0")   # Find string in line
    temp = line.split[3].delete("+")  # Get value and store to var
  end
end

# Bluetooth
bt_output = `sudo systemctl status bluetooth.target`
bt_status = ""
bt_output.each_line do |line|
  if line.includes?("Active")
    bt_status = line.split[1]
  end
end

# Wifi
wifi_output = `nmcli general status`
wifi_status = wifi_output.split(/\n/)[1].split[5]

if wifi_status == "enabled"
  wifi_net_output = `nmcli connection show --active`
  wifi_net = wifi_net_output.split(/\n/)[1].split[0]
end

puts " ----------------------"
puts "| ॐ  राम नारायण  ☥".colorize.cyan
puts "|----------------------"
puts "| #{date.colorize.cyan}"
puts "|----------------------"
puts "| Brightness: #{brightness.colorize.magenta}/#{max_brightness.colorize.magenta}".colorize.blue
if wifi_net
  puts "| Wifi: #{wifi_status.colorize.light_green} - #{wifi_net.colorize.magenta}".colorize.blue
else
  puts "| Wifi: #{wifi_status.colorize.red}"
end
puts "| Bluetooth: #{bt_status.colorize.magenta}".colorize.blue
puts "|------------------------------------------------"
puts "| CPU Temp\t HDD Total\t HDD Avail".colorize.blue
puts "| #{temp}\t #{hdd_total}\t\t #{hdd_avail} (#{hdd_percent})".colorize.magenta
puts " ------------------------------------------------"
