['Matiss', 'John', 'Dan', 'Chris', 'Ann'].each do |employee|
  Employee.create!(name: employee)
end

(1..3).each do |number|
  Bike.create!(number: "bike_#{number}")
end
