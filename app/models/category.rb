class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '漫画' },
    { id: 3, name: '映画' },
    { id: 4, name: 'アニメ' },
    { id: 5, name: 'ドラマ' },
    { id: 6, name: '小説'},
    { id: 7, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :seichis
end
