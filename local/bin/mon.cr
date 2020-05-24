require "colorize"
# Date
date = Time.local.to_s("%a %d %b") # => "Sat 23 May"

# Brightness
brightness = File.read("/sys/class/backlight/intel_backlight/brightness").chomp.chomp("000")
max_brightness = File.read("/sys/class/backlight/intel_backlight/max_brightness").chomp.chomp("000")

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

# Battery
battery = File.read("/sys/class/power_supply/BAT0/capacity").chomp

# Wifi
wifi_output = `nmcli general status`
wifi_status = wifi_output.split(/\n/)[1].split[5]

if wifi_status == "enabled"
  wifi_net_output = `nmcli connection show --active`
  wifi_net = wifi_net_output.split(/\n/)[1].split[0]
end

# Print laptop details
puts " ----------------------"
puts "| ॐ  राम नारायण  ☥"
puts "|----------------------"
puts "| #{date.colorize.cyan}"
puts "|----------------------"
puts "| #{"Brightness:".colorize.blue} #{brightness.colorize.magenta}/#{max_brightness.colorize.magenta}"
puts "| #{"Battery:".colorize.blue} #{battery.colorize.magenta}#{"%".colorize.magenta}"
if wifi_net
  puts "| #{"Wifi:".colorize.blue} #{wifi_status.colorize.light_green} - #{wifi_net.colorize.magenta}"
else
  puts "| #{"Wifi:".colorize.blue} #{wifi_status.colorize.red}"
end
puts "| #{"Bluetooth:".colorize.blue} #{bt_status.colorize.magenta}"
puts "|------------------------------------------------"
puts "| #{"CPU Temp\t HDD Avail\t HDD Used".colorize.blue}"
puts "| #{temp.colorize.magenta}\t #{hdd_avail.colorize.magenta}\t\t #{hdd_percent.colorize.magenta}"
puts " ------------------------------------------------"
puts " ------------------------------------------------"
