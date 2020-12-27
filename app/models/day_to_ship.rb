class DayToShip < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１〜２日で発送' },
    { id: 3, name: '３〜５日で発送' },
    { id: 4, name: '６〜７日で発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end
