require 'watir'

puts "WELCOME TO AUTOMATIC WHATSAPP MESSAGE SENDING PORTAL"

puts "Enter WhatsApp Contact Name : "
contactName = gets.chomp

puts "Enter Message : "
message = gets.chomp

browser = Watir::Browser.new :chrome 
browser.goto "https://web.whatsapp.com/"
#until browser.text_field(:title => "Search or start new chat")
#	sleep 100
#end
browser.text_field(:title => "Search or start new chat").set "#{contactName}"
#browser.text_field(:title => "Search or start new chat").set "Nishank NSIT"

browser.send_keys :enter

element = browser.div(:class => "input")
script = "return arguments[0].innerHTML = '#{message}' "

#script = "return arguments[0].innerHTML = 'Script testing !!!' "

for i in 0..100

	browser.execute_script(script,element)

	browser.send_keys [:control,'a']
	browser.send_keys [:control, 'x']
	browser.send_keys [:control, 'v']
	browser.send_keys :enter
	sleep 5
end
