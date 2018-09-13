
total = 10
count = 1

until count>total
  print "\rRecord #{count} of #{total} processed"
  count += 1
  sleep 0.25
end
