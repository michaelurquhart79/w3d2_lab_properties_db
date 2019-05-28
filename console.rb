require('pry-byebug')
require_relative('models/property.rb')


property1 = Property.new({
  'address' => '45 Brock Street',
  'value' => '140000',
  'year_built' => '1960',
  'build' => 'flat'
  })




  property1.save()

  property1.value = 130000
  binding.pry
  nil
