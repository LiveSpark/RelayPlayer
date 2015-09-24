require 'pi_piper'

$pins = [9,10,11]
$relays = []

def setup
  $pins.each { |pin|
      $relays.push PiPiper::Pin.new(:pin => pin, :direction => :out)
  }
end

def flash(relay, delay)
    relay.on
    sleep delay
    relay.off
end

def flash_forward(delay)
  $relays.each {|relay|
    flash(relay, delay)
  }
end

def flash_reverse(delay)
  $relays.reverse_each {|relay|
    flash(relay, delay)
  }
end
setup

n=1
while n < 10
  (1..20).each{|d| flash_forward 0.1*(1/d.to_f) }
  (1..20).reverse_each{|d| flash_forward 0.1*(1/d.to_f) }
  n=n+1
end

puts "Program complete."
