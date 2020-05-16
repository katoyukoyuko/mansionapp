class Questionnaire < ApplicationRecord
  belongs_to :user

  enum question1: { verybad:0,bad:1,neutral:2,good:3,verygood:4 }
  enum question2: { highrecommend:0,recommend:1,soso:2,not:3,verynot:4 }
  enum favorite: { select1:0,select2:1,select3:2,select3:4,select4:5 }
end
