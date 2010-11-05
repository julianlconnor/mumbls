# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :housing do |f|
  f.title "MyString"
  f.description "MyText"
  f.address "MyString"
  f.price 1
end
