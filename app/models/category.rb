class Category < ActiveHash::Base
    extend ActiveHash::Associations::ActiveRecordExtensions
    self.data = [
        {id: 1, name: 'スポーツ'}, {id: 2, name: '旅行・観光'}, {id: 3, name: '雑談'},
        {id: 4, name: 'ファッション'}, {id: 5, name: 'エンターテイメント'}, {id: 6, name: '生活・文化'},
        {id: 7, name: '恋愛・結婚'}, {id: 8, name: 'グルメ'}, {id: 9, name: '趣味・ホビー'},
        {id: 10, name: 'ゲーム'}
    ]
  end