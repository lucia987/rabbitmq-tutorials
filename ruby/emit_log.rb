#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new(:automatically_recover => false, :hostname => "10.205.20.175")
conn.start

ch   = conn.create_channel
x    = ch.fanout("logs")

msg  = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

x.publish(msg)
puts " [x] Sent #{msg}"

conn.close
