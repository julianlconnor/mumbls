# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :payment do |f|
  f.amount 1.5
  f.transaction_id "MyString"
end
