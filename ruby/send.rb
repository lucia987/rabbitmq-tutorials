#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new(:automatically_recover => false, :hostname => "10.205.20.175")
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

ch.default_exchange.publish("Hello World!", :persistent => false, :routing_key => q.name)
puts " [x] Sent 'Hello World!'"

conn.close
