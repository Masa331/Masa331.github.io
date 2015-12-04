require 'benchmark'

Benchmark.bmbm do |x|
   x.report { 10000.times { 'donat@gmail.com'.tr('@.', '') } }
   x.report { 10000.times { 'donat@gmail.com'.delete('@.') } }
   x.report { 10000.times { 'donat@gmail.com'.gsub('@', '').gsub('.', '') } }
end
