counters = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

threads = 5.times.map do
  Thread.new do
    100000.times do
      counters.map! { |counter| counter + 1 }
    end
  end
end
threads.each(&:join)

puts counters.to_s
