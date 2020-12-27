class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: '家電＆カメラ' },
    { id: 5, name: 'ホーム＆家電' },
    { id: 6, name: 'ペット用品' },
    { id: 7, name: 'おもちゃ＆ホビー' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: '楽器' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :items
end
